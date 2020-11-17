Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB62B6D9B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 19:42:37 +0100 (CET)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf5w3-0004lk-GU
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 13:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kf5tX-00042H-A9
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:40:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kf5t7-0004CD-Uu
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605638371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+cg76qzTgwmYK+bTUYM2LYoLa5fKwXJkQAHnfZIxgI=;
 b=h9kRZI0TfpeJX+vJkZl0yM2HFttZ1wBDNxpyBOapzIzckdWg0eTXI6OLSAKt2ab+StXBgX
 4svv2Bvm7zw+6e5NMbzZAdaYdiYQcy+SHPqDKwZMkITiF/WjoZjQyN1D22vDcReXTXp7aK
 +92Yfc6uqM+N1Fq/wEI0Uxx6YCjsMFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-yvgmu9s1PmuSABkXFThvZg-1; Tue, 17 Nov 2020 13:39:29 -0500
X-MC-Unique: yvgmu9s1PmuSABkXFThvZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC7FC903D41;
 Tue, 17 Nov 2020 18:39:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 423DB6B8E9;
 Tue, 17 Nov 2020 18:39:25 +0000 (UTC)
Subject: Re: [PATCH for-5.2] s390x/pci: fix endianness issues
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201117171340.1289659-1-cohuck@redhat.com>
 <ba7c8139-aa2b-1887-270f-834e47e6de10@redhat.com>
 <ea79f118-f3de-499d-ac85-58a3506a16d9@linux.ibm.com>
 <a5d77bd1-3468-1ffe-3134-5e5a4826f262@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4e2cfc7a-9307-6c2a-9237-4ba66eb85ad1@redhat.com>
Date: Tue, 17 Nov 2020 19:39:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a5d77bd1-3468-1ffe-3134-5e5a4826f262@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Pierre Morel <pmorel@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/2020 19.30, Philippe Mathieu-Daudé wrote:
> On 11/17/20 7:19 PM, Matthew Rosato wrote:
>> On 11/17/20 12:59 PM, Philippe Mathieu-Daudé wrote:
>>> On 11/17/20 6:13 PM, Cornelia Huck wrote:
>>>> zPCI control blocks are big endian, we need to take care that we
>>>> do proper accesses in order not to break tcg guests on little endian
>>>> hosts.
>>>>
>>>> Fixes: 28dc86a07299 ("s390x/pci: use a PCI Group structure")
>>>> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
>>>> Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
>>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>>> ---
>>>>
>>>> Works for me with virtio-pci devices for tcg on x86 and s390x, and
>>>> for kvm.
>>>> The vfio changes are not strictly needed; did not test them due to
>>>> lack of
>>>> hardware -- testing appreciated. >>
>>>> As this fixes a regression, I want this in 5.2.
>>>>
>>>> ---
>>>>   hw/s390x/s390-pci-bus.c  | 12 ++++++------
>>>>   hw/s390x/s390-pci-inst.c |  4 ++--
>>>>   hw/s390x/s390-pci-vfio.c |  8 ++++----
>>>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
>>>> index e0dc20ce4a56..17e64e0b1200 100644
>>>> --- a/hw/s390x/s390-pci-bus.c
>>>> +++ b/hw/s390x/s390-pci-bus.c
>>>> @@ -787,12 +787,12 @@ static void s390_pci_init_default_group(void)
>>>>     static void set_pbdev_info(S390PCIBusDevice *pbdev)
>>>>   {
>>>> -    pbdev->zpci_fn.sdma = ZPCI_SDMA_ADDR;
>>>> -    pbdev->zpci_fn.edma = ZPCI_EDMA_ADDR;
>>>> -    pbdev->zpci_fn.pchid = 0;
>>>> +    stq_p(&pbdev->zpci_fn.sdma, ZPCI_SDMA_ADDR);
>>>
>>> "zPCI control blocks are big endian" so don't we
>>> need the _be_ accessors? stq_be_p() etc...
>>>
>>
>> I don't think this is necessary.  This is only available for target
>> s390x, which is always big endian...  cpu-all.h should define stq_p as
>> stq_be_p for example inside the #if defined(TARGET_WORDS_BIGENDIAN).
> 
> But if you run on little-endian host, you need to byte-swap that,
> isn't it?

It's done by the macros. They depend on the target endianess. See cpu-all.h.

 Thomas


