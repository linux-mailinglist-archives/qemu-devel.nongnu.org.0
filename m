Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47633336A4F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 04:03:03 +0100 (CET)
Received: from localhost ([::1]:37008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKBbK-0000pB-BA
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 22:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKBaD-0000Pr-TR
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:01:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKBa9-0003JJ-Ex
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615431706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPtwCSvQRP4Z3m/Pwfpjl0ExlguYaWDAADCB9x1ZFq0=;
 b=KZ9zE0/uQPR0x0iMjhbUDgnCOA/YJhCF/OelcASk0X+UZJXAEmFzye+p6dkmuK3eTTSu6E
 5ld2CuQo5uyOfvZXncv249Bux3Wy1K9eAcfNrNbBwpQJkzPrZVdsSnT3AqrKhZCrfRJM0+
 VZbgSgCSSSVayfEFMHg6cXOhbGjUiZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-HROqhCKdOwaAinXJbMlHbw-1; Wed, 10 Mar 2021 22:01:42 -0500
X-MC-Unique: HROqhCKdOwaAinXJbMlHbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F3166D4E1;
 Thu, 11 Mar 2021 03:01:41 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-9.pek2.redhat.com
 [10.72.13.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DDEF60CEE;
 Thu, 11 Mar 2021 03:01:34 +0000 (UTC)
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
 <CAFEAcA-REYy45Jmean0PhVerG9d_CpqgaFtxuWBMBrGDdyzvdA@mail.gmail.com>
 <edce617c-3591-a172-ad18-3bf138af26e0@redhat.com>
 <CAEUhbmU-KDUBADcX+bZHjH0thhddTSQ=Qtb56GztdRzPKE4Xhw@mail.gmail.com>
 <a26ef919-2e00-ae5b-c016-83e811ea5cdd@redhat.com>
 <CAEUhbmWdn8ZV1vNku_7dQfNg68xL6p3f-BCzq31jj5QAKmjj0w@mail.gmail.com>
 <CAEUhbmUY89OEpBpxCZzya=KKb1U5KBO=rPArn8yre7fmZe1q5A@mail.gmail.com>
 <CAFEAcA89xLMogR5-tUH-LW37Lr+py3LXQRgaO9_P8r8w-0gfzA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f682a3a0-cdb1-4746-ceed-c900c3f669ed@redhat.com>
Date: Thu, 11 Mar 2021 11:01:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA89xLMogR5-tUH-LW37Lr+py3LXQRgaO9_P8r8w-0gfzA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/9 6:13 下午, Peter Maydell wrote:
> On Tue, 9 Mar 2021 at 09:01, Bin Meng <bmeng.cn@gmail.com> wrote:
>> Hi Jason,
>>
>> On Tue, Mar 9, 2021 at 5:00 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>> Hi Jason,
>>>
>>> On Tue, Mar 9, 2021 at 4:57 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>
>>>> On 2021/3/9 4:35 下午, Bin Meng wrote:
>>>>> Hi Jason,
>>>>>
>>>>> On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> On 2021/3/8 6:22 下午, Peter Maydell wrote:
>>>>>>> I think the key thing we need to do here is make a decision
>>>>>>> and be clear about what we're doing. There are three options
>>>>>>> I can see:
>>>>>>>
>>>>>>> (1) we say that the net API demands that backends pad
>>>>>>> packets they emit to the minimum ethernet frame length
>>>>>>> unless they specifically are intending to emit a short frame,
>>>>>>> and we fix any backends that don't comply (or equivalently,
>>>>>>> add support in the core code for a backend to mark itself
>>>>>>> as "I don't pad; please do it for me").
>>>>>>>
>>>>>>> (2) we say that the networking subsystem doesn't support
>>>>>>> short packets, and just have the common code always enforce
>>>>>>> padding short frames to the minimum length somewhere between
>>>>>>> when it receives a packet from a backend and passes it to
>>>>>>> a NIC model.
>>>>>>>
>>>>>>> (3) we say that it's the job of the NIC models to pad
>>>>>>> short frames as they see them coming in.
>>>>>> I'm not sure how much value we can gain from (1). So (2) looks better to me.
>>>>>>
>>>>>> Bin or Philippe, want to send a new version?
>>>>>>
>>>>> I think this series does what (2) asks for. Or am I missing anything?
>>>>
>>>> It only did the padding for user/TAP.
>> (hit send too soon ...)
>>
>> Ah, so we want this:
>>
>> if (sender->info->type != NET_CLIENT_DRIVER_NIC)
>>
>> correct?
> No, option (2) is "always pad short packets regardless of
> sender->info->type". Even if a NIC driver sends out a short
> packet, we want to pad it, because we might be feeding it to
> something that assumes it does not see short packets.
>
> thanks
> -- PMM


So I'm not sure this is correct. There're NIC that has its own logic 
that choose whether to pad the frame during TX (e.g e1000).

And after a discussion 10 years ago [1]. Michael (cced) seems to want to 
keep the padding logic in the NIC itself (probably with a generic helper 
in the core). Since 1) the padding is only required for ethernet 2) 
virito-net doesn't need that (it can pass incomplete packet by design).

Thanks

[1] 
https://patchwork.ozlabs.org/project/qemu-devel/patch/1284842625-13920-1-git-send-email-stefanha@linux.vnet.ibm.com/


>


