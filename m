Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947F2C8A62
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 18:04:56 +0100 (CET)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmbe-0000M8-Pk
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 12:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kjmYS-0006Jf-AE
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:01:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kjmYN-0006Fd-P0
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606755691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8GZZGZl+VUZ435FiJWGZ2WupjuHKhBOWydBFsLhsIo=;
 b=YTf4tRFQa9PYSEXJEU4U8pVBy1ugeY2djwqRNLLPFhk+7e3S+wxO6z2xK3OPotRbyP3sbW
 iFFsERX5PVTuM7PXmNpQsutiXgeNnhRCQaCS4hEgeXxOgMfGEBur25MrDdjX0iWqA78qMF
 veK1wnsDXsKw95lbNVJzy4n4EWbQZqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-ZeWYlCbmPpSFjEhEVhRZhw-1; Mon, 30 Nov 2020 12:01:28 -0500
X-MC-Unique: ZeWYlCbmPpSFjEhEVhRZhw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A3E31090853;
 Mon, 30 Nov 2020 17:00:47 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-120.ams2.redhat.com
 [10.36.112.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 301D65C5DF;
 Mon, 30 Nov 2020 17:00:31 +0000 (UTC)
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Ankur Arora <ankur.a.arora@oracle.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201124122507.1014839-1-imammedo@redhat.com>
 <bf87cef4-cac9-1c1b-5bd4-c6bc97dff994@redhat.com>
 <20201126213807.3205f5db@redhat.com>
 <fc1431da-a600-ad4c-f718-7cf8f77dde3e@oracle.com>
 <a92b50df-f693-ebda-e549-7bc9e6d2d7a5@redhat.com>
 <c197150c-7156-6f19-b36e-5199a5536fcd@oracle.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4f8a0505-23d5-6c87-d72d-e37e203d58a6@redhat.com>
Date: Mon, 30 Nov 2020 18:00:27 +0100
MIME-Version: 1.0
In-Reply-To: <c197150c-7156-6f19-b36e-5199a5536fcd@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/28/20 01:43, Ankur Arora wrote:
> On 2020-11-27 7:19 a.m., Laszlo Ersek wrote:
>> On 11/27/20 05:10, Ankur Arora wrote:
>>
>>> Yeah I was wondering what would happen for simultaneous hot add and
>>> remove.
>>> I guess we would always do remove first and then the add, unless we hit
>>> the break due to max_cpus_per_pass and switch to hot-add mode.
>>
>> Considering the firmware only, I disagree with remove-then-add.
>>
>> EFI_SMM_CPU_SERVICE_PROTOCOL.AddProcessor() and
>> EFI_SMM_CPU_SERVICE_PROTOCOL.RemoveProcessor() (implemented in
>> SmmAddProcessor() and SmmRemoveProcessor() in
>> "UefiCpuPkg/PiSmmCpuDxeSmm/CpuService.c", respectively) only mark the
>> processors for addition/removal. The actual processing is done only
>> later, in BSPHandler() --> SmmCpuUpdate(), when "all SMI handlers are
>> finished" (see the comment in SmmRemoveProcessor()).
>>
>> Consequently, I would not suggest replacing a valid APIC ID in a
>> particular mCpuHotPlugData.ApicId[Index] slot with INVALID_APIC_ID
>> (corresponding to the unplug operation), and then possibly replacing
>> INVALID_APIC_ID in the *same slot* with the APIC ID of the newly plugged
>> CPU, in the exact same SMI invocation (= in the same execution of
>> CpuHotplugMmi()). That might cause some component in edk2 to see the
>> APIC ID in mCpuHotPlugData.ApicId[Index] to change from one valid ACPI
>> ID to another valid APIC ID, and I don't even want to think about what
>> kind of mess that could cause.
> 
> Shudders.
> 
>>
>> So no, please handle plugs first, for which unused slots in
>> mCpuHotPlugData.ApicId will be populated, and *then* handle removals (in
>> the same invocation of CpuHotplugMmi()).
> 
> Yeah, that ordering makes complete sense.
> 
>>
>> By the way, for unplug, you will not have to re-set
>> mCpuHotPlugData.ApicId[Index] to INVALID_APIC_ID, as
>> SmmRemoveProcessor() does that internally. You just have to locate the
>> Index for the APIC ID being removed, for calling
>> EFI_SMM_CPU_SERVICE_PROTOCOL.RemoveProcessor().
> 
> Right. The hotplug is more involved (given the need to pen the new CPU)
> but for the unplug, AFAICS all the actual handling for removal is in
> .RemoveProcessor() and at SMI exit in SmmCpuUpdate().

Yes, I got the same impression (without having tried to implement it, of
course).

Laszlo


