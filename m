Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A435F1C10
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 14:11:28 +0200 (CEST)
Received: from localhost ([::1]:47594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oebL5-0004ti-KG
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 08:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oebIf-0002Iy-Bi
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 08:08:57 -0400
Received: from mailout11.t-online.de ([194.25.134.85]:52250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oebId-000278-F2
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 08:08:57 -0400
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout11.t-online.de (Postfix) with SMTP id 057BA1BA89;
 Sat,  1 Oct 2022 14:08:50 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.228.229]) by fwd79.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1oebIX-3TVOPR0; Sat, 1 Oct 2022 14:08:49 +0200
Message-ID: <52bc0473-ee76-f13a-4e01-5b5c9f2ec894@t-online.de>
Date: Sat, 1 Oct 2022 14:08:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 11/12] audio: fix sw->buf size for audio recording
Content-Language: de-DE
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
 <20220923183640.8314-11-vr_qemu@t-online.de>
 <CAJ+F1CLnjL80zO7_FHDQp-w2_rkXa2-U1pgVOTmAsJLP23DT1A@mail.gmail.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <CAJ+F1CLnjL80zO7_FHDQp-w2_rkXa2-U1pgVOTmAsJLP23DT1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1664626129-09691417-E7E6FE44/0/0 CLEAN NORMAL
X-TOI-MSGID: be67d7dd-59e1-4515-9ced-398151d9bf10
Received-SPF: none client-ip=194.25.134.85; envelope-from=vr_qemu@t-online.de;
 helo=mailout11.t-online.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.743, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.09.22 um 13:54 schrieb Marc-André Lureau:

>
> On Fri, Sep 23, 2022 at 10:48 PM Volker Rümelin <vr_qemu@t-online.de> 
> wrote:
>
>     The calculation of the buffer size needed to store audio samples
>     after resampling is wrong for audio recording. For audio recording
>     sw->ratio is calculated as
>
>     sw->ratio = frontend sample rate / backend sample rate.
>
>     >From this follows
>
>     frontend samples = frontend sample rate / backend sample rate
>      * backend samples
>     frontend samples = sw->ratio * backend samples
>
>     In 2 of 3 places in the audio recording code where sw->ratio
>     is used in a calculation to get the number of frontend frames,
>     the calculation is wrong. Fix this. The 3rd formula in
>     audio_pcm_sw_read() is correct.
>
>     Resolves: https://gitlab.com/qemu-project/qemu/-/issues/71
>     Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>
>
> Would you mind adding the test to qtest?
>
> lgtm
> Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>

Hi Marc-André,

I will give it a try. But it will be a separate patch, because the test 
from issue #71 now checks for the error at 
https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg02347.html 
and not the one from issue #71.

With best regards,
Volker

