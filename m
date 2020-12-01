Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A45C2C9718
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 06:43:29 +0100 (CET)
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjyRk-0007U5-5x
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 00:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kjyQZ-000704-PQ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 00:42:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kjyQW-0003bJ-AS
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 00:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606801330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ia0tcH0nFs8YBFqo3fSuJh+vCbv3X4wqA3zqkK4QZAo=;
 b=A5B/OTcpyjjck7Ry5l99q+KfB+BUUUmL2H7fn9sCpIb5e1vS/Jl+j10KIavjiOPeTdnQOO
 zjydFjmEWtx/oDlbaLE4Xpay2fbxue0OY8eiIWiL6MskIgSYQb/Ak1KwSg2jlNa0PpCGE2
 QN82JuyApvlGQbu/8WtHv45cbQjucBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-kg4dzVHKOqy37IGb-TuvNw-1; Tue, 01 Dec 2020 00:42:06 -0500
X-MC-Unique: kg4dzVHKOqy37IGb-TuvNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B0DF8558E3;
 Tue,  1 Dec 2020 05:42:05 +0000 (UTC)
Received: from [10.72.13.167] (ovpn-13-167.pek2.redhat.com [10.72.13.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38AAA6086F;
 Tue,  1 Dec 2020 05:42:02 +0000 (UTC)
Subject: Re: [PATCH v2] net/e1000e_core: adjust count if RDH exceeds RDT in
 e1000e_ring_advance()
To: Mauro Matteo Cascella <mcascell@redhat.com>
References: <20201113103113.223239-1-mcascell@redhat.com>
 <f24438ed-ee77-0583-3570-b18514292404@redhat.com>
 <CAA8xKjX5a1cTY=Zr+XvHsixrSTiCw9FvGg1Z-=5Yw7pWV6xweA@mail.gmail.com>
 <aef28782-aa5b-ea53-e112-1e4bf4fbd722@redhat.com>
 <CAA8xKjUuxtGnGqgz+J=G0TZhvu-JfWjz-fjROMhYsZrBSmAGVQ@mail.gmail.com>
 <204556ad-c6ab-2caa-aee8-3e3f7e0f60c2@redhat.com>
 <CAA8xKjVjXeGp5irAjzT308LPq2iBeSFWPx90wVPByEZNsxaeTg@mail.gmail.com>
 <a7f3de56-94e1-831b-fd76-9f626e55e859@redhat.com>
 <CAA8xKjU-ewhPaea8fg7YKxGTo8Da4YK+GpxzDvJOsTWraT1Edw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <201732a8-3d1e-0553-4812-b8e8885b896f@redhat.com>
Date: Tue, 1 Dec 2020 13:42:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjU-ewhPaea8fg7YKxGTo8Da4YK+GpxzDvJOsTWraT1Edw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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


On 2020/11/30 下午10:12, Mauro Matteo Cascella wrote:
> On Mon, Nov 30, 2020 at 3:58 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2020/11/27 下午10:49, Mauro Matteo Cascella wrote:
>>> On Fri, Nov 27, 2020 at 6:21 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> On 2020/11/24 上午5:30, Mauro Matteo Cascella wrote:
>>>>> On Thu, Nov 19, 2020 at 6:57 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> On 2020/11/18 下午4:53, Mauro Matteo Cascella wrote:
>>>>>>> On Wed, Nov 18, 2020 at 4:56 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>>> On 2020/11/13 下午6:31, Mauro Matteo Cascella wrote:
>>>>>>>>> The e1000e_write_packet_to_guest() function iterates over a set of
>>>>>>>>> receive descriptors by advancing rx descriptor head register (RDH) from
>>>>>>>>> its initial value to rx descriptor tail register (RDT). The check in
>>>>>>>>> e1000e_ring_empty() is responsible for detecting whether RDH has reached
>>>>>>>>> RDT, terminating the loop if that's the case. Additional checks have
>>>>>>>>> been added in the past to deal with bogus values submitted by the guest
>>>>>>>>> to prevent possible infinite loop. This is done by "wrapping around" RDH
>>>>>>>>> at some point and detecting whether it assumes the original value during
>>>>>>>>> the loop.
>>>>>>>>>
>>>>>>>>> However, when e1000e is configured to use the packet split feature, RDH is
>>>>>>>>> incremented by two instead of one, as the packet split descriptors are
>>>>>>>>> 32 bytes while regular descriptors are 16 bytes. A malicious or buggy
>>>>>>>>> guest may set RDT to an odd value and transmit only null RX descriptors.
>>>>>>>>> This corner case would prevent RDH from ever matching RDT, leading to an
>>>>>>>>> infinite loop. This patch adds a check in e1000e_ring_advance() to make sure
>>>>>>>>> RDH does not exceed RDT in a single incremental step, adjusting the count
>>>>>>>>> value accordingly.
>>>>>>>> Can this patch solve this issue in another way?
>>>>>>>>
>>>>>>>> https://patchew.org/QEMU/20201111130636.2208620-1-ppandit@redhat.com/
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>>
>>>>>>> Yes, it does work nicely. Still, I think this patch is useful to avoid
>>>>>>> possible inconsistent state in e1000e_ring_advance() when count > 1.
>>>>>> So if RDT is odd, it looks to me the following codes in
>>>>>> e1000e_write_packet_to_guest() needs to be fixed as well.
>>>>>>
>>>>>>
>>>>>>             base = e1000e_ring_head_descr(core, rxi);
>>>>>>
>>>>>>             pci_dma_read(d, base, &desc, core->rx_desc_len);
>>>>>>
>>>>>> Otherwise e1000e may try to read out of descriptor ring.
>>>>> Sorry, I'm not sure I understand what you mean. Isn't the base address
>>>>> computed from RDH? How can e1000e read out of the descriptor ring if
>>>>> RDT is odd?
>>>>>
>>>>>> Thanks
>>>>> On Thu, Nov 19, 2020 at 6:57 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> On 2020/11/18 下午4:53, Mauro Matteo Cascella wrote:
>>>>>>> On Wed, Nov 18, 2020 at 4:56 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>>>> On 2020/11/13 下午6:31, Mauro Matteo Cascella wrote:
>>>>>>>>> The e1000e_write_packet_to_guest() function iterates over a set of
>>>>>>>>> receive descriptors by advancing rx descriptor head register (RDH) from
>>>>>>>>> its initial value to rx descriptor tail register (RDT). The check in
>>>>>>>>> e1000e_ring_empty() is responsible for detecting whether RDH has reached
>>>>>>>>> RDT, terminating the loop if that's the case. Additional checks have
>>>>>>>>> been added in the past to deal with bogus values submitted by the guest
>>>>>>>>> to prevent possible infinite loop. This is done by "wrapping around" RDH
>>>>>>>>> at some point and detecting whether it assumes the original value during
>>>>>>>>> the loop.
>>>>>>>>>
>>>>>>>>> However, when e1000e is configured to use the packet split feature, RDH is
>>>>>>>>> incremented by two instead of one, as the packet split descriptors are
>>>>>>>>> 32 bytes while regular descriptors are 16 bytes. A malicious or buggy
>>>>>>>>> guest may set RDT to an odd value and transmit only null RX descriptors.
>>>>>>>>> This corner case would prevent RDH from ever matching RDT, leading to an
>>>>>>>>> infinite loop. This patch adds a check in e1000e_ring_advance() to make sure
>>>>>>>>> RDH does not exceed RDT in a single incremental step, adjusting the count
>>>>>>>>> value accordingly.
>>>>>>>> Can this patch solve this issue in another way?
>>>>>>>>
>>>>>>>> https://patchew.org/QEMU/20201111130636.2208620-1-ppandit@redhat.com/
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>>
>>>>>>> Yes, it does work nicely. Still, I think this patch is useful to avoid
>>>>>>> possible inconsistent state in e1000e_ring_advance() when count > 1.
>>>>>> So if RDT is odd, it looks to me the following codes in
>>>>>> e1000e_write_packet_to_guest() needs to be fixed as well.
>>>>>>
>>>>>>
>>>>>>             base = e1000e_ring_head_descr(core, rxi);
>>>>>>
>>>>>>             pci_dma_read(d, base, &desc, core->rx_desc_len);
>>>>>>
>>>>>> Otherwise e1000e may try to read out of descriptor ring.
>>>>>>
>>>>>> Thanks
>>>> Sorry, I meant RDH actually, when packet split descriptor is used, it
>>>> doesn't check whether DH exceeds DLEN?
>>>>
>>> When the packet split feature is used (i.e., count > 1) this patch
>>> basically sets RDH=RDT in case the increment would exceed RDT.
>>
>> Can software set RDH to an odd value? If not, I think we are probably fine.
>>
>> Thanks
>>
> Honestly I don't know the answer to your question, my guess is that it
> may be possible for a malicious/bogus guest to set RDH the same way as
> RDT.
>
> Thank you,
> --
> Mauro Matteo Cascella
> Red Hat Product Security
> PGP-Key ID: BB3410B0
>
>

Then I think we should fix that.

Thanks


