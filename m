Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D974C309DF4
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 18:14:44 +0100 (CET)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6GJ9-0000D7-GX
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 12:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1l6GHu-0008DB-Fs
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 12:13:26 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:44408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1l6GHs-0008Tz-HW
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 12:13:26 -0500
Received: from fwd09.aul.t-online.de (fwd09.aul.t-online.de [172.20.27.151])
 by mailout01.t-online.de (Postfix) with SMTP id 4E5B133147;
 Sun, 31 Jan 2021 18:13:19 +0100 (CET)
Received: from [192.168.211.200]
 (b7BabiZpZhTXd3Zdqg-v0rXoNzI-aHVNxj6-E2wuFj-pM-Y-xZiP6Pny2sgcnmxwU4@[93.236.159.226])
 by fwd09.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1l6GHm-1gHexU0; Sun, 31 Jan 2021 18:13:18 +0100
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 02/23] audio: fix bit-rotted code
To: Gerd Hoffmann <kraxel@redhat.com>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
 <20210110100239.27588-2-vr_qemu@t-online.de>
 <20210114143203.jcpbbiyjvmuvgudz@sirius.home.kraxel.org>
Message-ID: <16921baa-8978-c362-023d-ecf113653cf7@t-online.de>
Date: Sun, 31 Jan 2021 18:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210114143203.jcpbbiyjvmuvgudz@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: b7BabiZpZhTXd3Zdqg-v0rXoNzI-aHVNxj6-E2wuFj-pM-Y-xZiP6Pny2sgcnmxwU4
X-TOI-EXPURGATEID: 150726::1612113198-00010299-7EEAE7C5/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ed3f09b-b498-4930-8c4d-37b09090ae03
Received-SPF: none client-ip=194.25.134.80; envelope-from=vr_qemu@t-online.de;
 helo=mailout01.t-online.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>   #ifdef DEBUG
>> -    alsa_dump_info(req, obt, obtfmt, pdo);
>> +    alsa_dump_info(req, obt, obtfmt, apdo);
>>   #endif
> "if (DEBUG) { .... }" is a nice way to have this checked by the
> compiler.  With "#define DEBUG 0" the compiler will optimize away
> the dead code, so it isn't much different to #ifdef'ed code.

Hi,

I will amend this in my next patch series.

With best regards,
Volker

> take care,
>    Gerd
>

