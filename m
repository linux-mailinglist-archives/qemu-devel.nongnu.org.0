Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F4487782
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:13:34 +0100 (CET)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5o7i-0001Cl-0s
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:13:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n5o4T-0006iD-QT
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:10:13 -0500
Received: from mailout10.t-online.de ([194.25.134.21]:49068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n5o4R-0006z0-KJ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:10:13 -0500
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout10.t-online.de (Postfix) with SMTP id 15735E694;
 Fri,  7 Jan 2022 13:10:06 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5o4K-10qV170; Fri, 7 Jan 2022 13:10:05 +0100
Message-ID: <031a887e-9a5b-061f-4189-bae3fc330bf9@t-online.de>
Date: Fri, 7 Jan 2022 13:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 01/15] audio: replace open-coded buffer arithmetic
Content-Language: en-US
To: Thomas Huth <huth@tuxfamily.org>, qemu-devel@nongnu.org
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
 <20220106092332.7223-1-volker.ruemelin@t-online.de>
 <20220106111718.0ec25383@tuxfamily.org>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20220106111718.0ec25383@tuxfamily.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641557405-00010BFA-C01BF5EB/0/0 CLEAN NORMAL
X-TOI-MSGID: 5c39ef4b-7d02-4885-93b8-cf19c3be4f67
Received-SPF: none client-ip=194.25.134.21; envelope-from=vr_qemu@t-online.de;
 helo=mailout10.t-online.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Am Thu,  6 Jan 2022 10:23:18 +0100
> schrieb Volker Rümelin <volker.ruemelin@t-online.de>:
>
>> From: Volker Rümelin <vr_qemu@t-online.de>
>>
>> Replace open-coded buffer arithmetic with the available function
>> audio_ring_dist(). Because the name audio_ring_dist implies it
>> calculates the distance between two points, define the alias
>> function name audio_ring_posb. That's the position in backward
>> direction of a given point at a given distance.
>>
>> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>> ---
>>   audio/audio.c     | 25 +++++++------------------
>>   audio/audio_int.h |  2 ++
>>   audio/coreaudio.c | 10 ++++------
>>   audio/sdlaudio.c  | 11 +++++------
>>   4 files changed, 18 insertions(+), 30 deletions(-)
> [...]
>> diff --git a/audio/audio_int.h b/audio/audio_int.h
>> index 428a091d05..928d8e107e 100644
>> --- a/audio/audio_int.h
>> +++ b/audio/audio_int.h
>> @@ -266,6 +266,8 @@ static inline size_t audio_ring_dist(size_t dst,
>> size_t src, size_t len) return (dst >= src) ? (dst - src) : (len -
>> src + dst); }
>>   
>> +#define audio_ring_posb(pos, dist, len) audio_ring_dist(pos, dist,
>> len)
> I think this will be quite incomprehensible for people reading the
> source code later (without seeing your commit message above). Thus I'd
> prefer to directly use audio_ring_dist() everywhere instead. But in
> case you insist on this macro, please add at least a comment in front
> of it for explanation.
>
>   Thomas

Yes you are right. Renaming variables with a macro doesn't improve 
readability.

With best regards,
Volker

