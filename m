Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B534C93D3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:02:01 +0100 (CET)
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP7l2-0007lO-7e
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:02:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nP7it-0006yI-3v
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:59:48 -0500
Received: from mailout11.t-online.de ([194.25.134.85]:41472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nP7iq-0007qY-9W
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:59:46 -0500
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout11.t-online.de (Postfix) with SMTP id 5EFAED4B2;
 Tue,  1 Mar 2022 19:59:40 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd82.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nP7il-3gC7Kj0; Tue, 1 Mar 2022 19:59:40 +0100
Message-ID: <172a39e8-7cac-15ff-8d6f-38d3f108bad4@t-online.de>
Date: Tue, 1 Mar 2022 19:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v2 01/15] audio: replace open-coded buffer arithmetic
To: Gerd Hoffmann <kraxel@redhat.com>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
 <20220122125745.5037-1-vr_qemu@t-online.de> <7976963.x2vcT3psHa@silver>
 <a9141436-adbb-e216-4131-157b0e634162@t-online.de>
 <20220126084825.uybvjg427lbjjc3y@sirius.home.kraxel.org>
Content-Language: en-US
In-Reply-To: <20220126084825.uybvjg427lbjjc3y@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1646161180-0000B8A1-7DFE2720/0/0 CLEAN NORMAL
X-TOI-MSGID: f8b059df-0960-472d-b0dd-169b51d53b72
Received-SPF: none client-ip=194.25.134.85; envelope-from=vr_qemu@t-online.de;
 helo=mailout11.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.01.22 um 09:48 schrieb Gerd Hoffmann:
>    Hi,
>
>>>> --- a/audio/audio_int.h
>>>> +++ b/audio/audio_int.h
>>>> @@ -266,6 +266,12 @@ static inline size_t audio_ring_dist(size_t dst, size_t src, size_t len)
>>>>        return (dst >= src) ? (dst - src) : (len - src + dst);
>>>>    }
>>> You haven't touched this function, but while I am looking at it, all function
>>> arguments are unsigned. So probably modulo operator might be used to get rid
>>> of a branch here.
>> That would be "return (len - dist + pos) % len;" but on my x86_64 system I
>> always prefer a conditional move instruction to a 64 bit integer division
>> instruction.
> Why?  Performance?
>
> Don't underestimate the optimizer of a modern compiler.  In many cases
> it simply isn't worth the effort.  Better optimize the code for humans,
> i.e. make it easy to read and understand.

I know this micro optimization is useless. I will not try to defend it 
because there are no good reasons for it. But I can't see that "return 
(len - dist + pos) % len;" is more readable than "return pos >= dist ? 
pos - dist : len - dist + pos;".

With best regards
Volker

> take care,
>    Gerd
>


