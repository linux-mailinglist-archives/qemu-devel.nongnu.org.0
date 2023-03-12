Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E895C6B6764
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 16:00:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbN9a-0006Sk-SY; Sun, 12 Mar 2023 10:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pbN9X-0006Sc-VI
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 10:58:28 -0400
Received: from mailout09.t-online.de ([194.25.134.84])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pbN9W-0003au-4w
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 10:58:27 -0400
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout09.t-online.de (Postfix) with SMTP id 6BE08F023;
 Sun, 12 Mar 2023 15:58:22 +0100 (CET)
Received: from [192.168.211.200] ([79.208.22.72]) by fwd87.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pbN9S-0Ifwwr0; Sun, 12 Mar 2023 15:58:22 +0100
Message-ID: <ad098507-98ff-3ffe-e5f3-2c508d911a67@t-online.de>
Date: Sun, 12 Mar 2023 15:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
Content-Language: en-US
To: Rene Engel <ReneEngel80@emailn.de>, BALATON Zoltan <balaton@eik.bme.hu>
Cc: kraxel@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <5207a2d9-e72b-3ce6-5b91-a9b187759b69@eik.bme.hu>
 <f6d1f455-97a3-f7ab-4101-8249148f0384@eik.bme.hu>
 <f3d99778-ec4b-ac34-91f6-25dd19d00254@eik.bme.hu>
 <efc13913-cf16-0323-403c-61b36139b4bc@t-online.de>
 <84a29575-d924-054e-565b-8cc14da7a8de@eik.bme.hu>
 <073253fedbbcc9467ca42ced0ef7f5e7@mail.emailn.de>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <073253fedbbcc9467ca42ced0ef7f5e7@mail.emailn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1678633102-9DA9D0AF-CC3E1191/0/0 CLEAN NORMAL
X-TOI-MSGID: 2bea39e3-28b8-4f47-bef6-4e3ce0860d5b
Received-SPF: none client-ip=194.25.134.84; envelope-from=vr_qemu@t-online.de;
 helo=mailout09.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.03.23 um 15:09 schrieb Rene Engel:
> Tested with -audiodev coreaudio,id=audio0,out.buffer-count=1 to 12
>
> 1 is too slow the rest up to 12 has no effect
>
> The sampling frequency of the via-ac97 driver is 48000 Hz under AmigaOs4.1
>
> Any other ideas?
>
>

In audio/audio_template.h in the AUD_open_ functions there is one

     ldebug ("open %s, freq %d, nchannels %d, fmt %d\n",
             name, as->freq, as->nchannels, as->fmt);

line. Please replace this line with

     fprintf(stderr, "open %s, freq %d, nchannels %d, fmt %d\n",
             name, as->freq, as->nchannels, as->fmt);

compile and start AmigaOS. Use the default out.buffer-count. I would 
like to know the via-ac97 drivers idea of the sampling frequency.

It would help if I could reproduce this issue on my computer.

With best regards,
Volker


