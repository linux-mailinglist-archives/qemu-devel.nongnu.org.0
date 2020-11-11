Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B223D2AEC7F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 09:55:53 +0100 (CET)
Received: from localhost ([::1]:36580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcluy-0007LZ-PS
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 03:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcltq-0006SH-1F
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 03:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcltm-0004sT-2O
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 03:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605084876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cckyKckgoj/EA7ZhQK2oPX0BE2/Uar+Cc7I9jZ2Cu4=;
 b=AJ0cj2qq6agaNirXa5yarMy1HUi4sNI3LRXJEK43vnEtZUh5UhmJXl0/R9VjKOvHpLFzPF
 wd2UumpvIbBUOZO4d7FzjH/bDvZGh1cwChfB69sdv3kNTsk6/6R6KTqfbRq0Bw+ndLNUdY
 o7lvx/rg0GqKtBj54BPEaIT+9u2qBg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-bhq_zzkjNUeX4yFCzvd05A-1; Wed, 11 Nov 2020 03:54:32 -0500
X-MC-Unique: bhq_zzkjNUeX4yFCzvd05A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C6291084C83;
 Wed, 11 Nov 2020 08:54:31 +0000 (UTC)
Received: from [10.72.12.213] (ovpn-12-213.pek2.redhat.com [10.72.12.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E63915E1DD;
 Wed, 11 Nov 2020 08:54:28 +0000 (UTC)
Subject: Re: [PATCH] net/e1000e_core: make sure RDH never exceeds RDT in
 e1000e_ring_advance()
To: Mauro Matteo Cascella <mcascell@redhat.com>
References: <20201105105616.327593-1-mcascell@redhat.com>
 <b34f724a-b4fc-6dbd-b660-2dfc2b8e943f@redhat.com>
 <CAA8xKjUuM9XeBG920pRBmCWh_7DPdy3x=md=Q+JJ5+bQpn0=aw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bd944924-d227-a22c-c8e4-07dbf82312c5@redhat.com>
Date: Wed, 11 Nov 2020 16:54:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjUuM9XeBG920pRBmCWh_7DPdy3x=md=Q+JJ5+bQpn0=aw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: gaoning.pgn@antgroup.com, 330cjfdn@gmail.com,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/10 下午5:06, Mauro Matteo Cascella wrote:
> On Mon, Nov 9, 2020 at 3:38 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2020/11/5 下午6:56, Mauro Matteo Cascella wrote:
>>> The e1000e_write_packet_to_guest() function iterates over a set of
>>> receive descriptors by advancing rx descriptor head register (RDH) from
>>> its initial value to rx descriptor tail register (RDT). The check in
>>> e1000e_ring_empty() is responsible for detecting whether RDH has reached
>>> RDT, terminating the loop if that's the case. Additional checks have
>>> been added in the past to deal with bogus values submitted by the guest
>>> to prevent possible infinite loop. This is done by "wrapping around" RDH
>>> at some point and detecting whether it assumes the original value during
>>> the loop.
>>>
>>> However, when e1000e is configured to use the packet split feature, RDH is
>>> incremented by two instead of one, as the packet split descriptors are
>>> 32 bytes while regular descriptors are 16 bytes. A malicious or buggy
>>> guest may set RDT to an odd value and transmit only null RX descriptors.
>>> This corner case would prevent RDH from ever matching RDT, leading to an
>>> infinite loop. This patch adds a check in e1000e_ring_advance() to make
>>> sure RDH does never exceed RDT.
>>>
>>> This issue was independently reported by Gaoning Pan (Zhejiang University)
>>> and Cheolwoo Myung.
>>>
>>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>>> Reported-by: Gaoning Pan <gaoning.pgn@antgroup.com>
>>> Reported-by: Cheolwoo Myung <330cjfdn@gmail.com>
>>> ---
>>> References:
>>> https://git.qemu.org/?p=qemu.git;a=commit;h=dd793a74882477ca38d49e191110c17dfe
>>> https://git.qemu.org/?p=qemu.git;a=commit;h=4154c7e03fa55b4cf52509a83d50d6c09d743b7
>>> http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
>>>
>>>    hw/net/e1000e_core.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
>>> index bcd186cac5..4c4d14b6ed 100644
>>> --- a/hw/net/e1000e_core.c
>>> +++ b/hw/net/e1000e_core.c
>>> @@ -831,6 +831,10 @@ e1000e_ring_advance(E1000ECore *core, const E1000E_RingInfo *r, uint32_t count)
>>>    {
>>>        core->mac[r->dh] += count;
>>>
>>> +    if (core->mac[r->dh] > core->mac[r->dt]) {
>>> +        core->mac[r->dh] = core->mac[r->dt];
>>> +    }
>>> +
>>>        if (core->mac[r->dh] * E1000_RING_DESC_LEN >= core->mac[r->dlen]) {
>>>            core->mac[r->dh] = 0;
>>>        }
> Hi Jason,
>
>> A question here.
>>
>> When count > 1, is this correct to reset dh here?
>>
>> Thanks
>>
> My understanding is that wrapping at (or above) RDLEN is the correct
> behavior regardless of count. I don't see why count > 1 should modify
> this behavior. I'm not sure, though. Anyway, this patch fixes the
> above reproducer, so I'm adding a Tested-by line here.
>
> Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>
>
> Thank you,
> --
> Mauro Matteo Cascella
> Red Hat Product Security
> PGP-Key ID: BB3410B0
>

Right.

Applied.

Thanks


