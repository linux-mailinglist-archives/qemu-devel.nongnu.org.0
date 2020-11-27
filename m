Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531B2C68C1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:35:42 +0100 (CET)
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifmf-0007HP-23
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kifWy-0007FH-59
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:19:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kifWv-00063g-68
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606490363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVdp0FL4fThSSUUsvncsyvW/qGP3enbR/QPcKvJ95xs=;
 b=FU0vfJT7GQm5X0RuwtkXnQn41TxvAWDG8xWLrcYW1m3YyShrf/Qz+sUY06NJof70r5hGyg
 tOWiAOlrzb2l2HxbdNmDlCa7LaJ8wi5HkrW8Qf4gy8u2ovZO0s4ve+kka3k6Y7nhLeGIgg
 hbqlc6AIPlPMT6oOwqkNTC2Ouq2Tbxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-zFbzmezyMWChGJ70_45ueA-1; Fri, 27 Nov 2020 10:19:21 -0500
X-MC-Unique: zFbzmezyMWChGJ70_45ueA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C17C9805C04;
 Fri, 27 Nov 2020 15:19:20 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 053285D6D5;
 Fri, 27 Nov 2020 15:19:19 +0000 (UTC)
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Ankur Arora <ankur.a.arora@oracle.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201124122507.1014839-1-imammedo@redhat.com>
 <bf87cef4-cac9-1c1b-5bd4-c6bc97dff994@redhat.com>
 <20201126213807.3205f5db@redhat.com>
 <fc1431da-a600-ad4c-f718-7cf8f77dde3e@oracle.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a92b50df-f693-ebda-e549-7bc9e6d2d7a5@redhat.com>
Date: Fri, 27 Nov 2020 16:19:19 +0100
MIME-Version: 1.0
In-Reply-To: <fc1431da-a600-ad4c-f718-7cf8f77dde3e@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 11/27/20 05:10, Ankur Arora wrote:

> Yeah I was wondering what would happen for simultaneous hot add and remove.
> I guess we would always do remove first and then the add, unless we hit
> the break due to max_cpus_per_pass and switch to hot-add mode.

Considering the firmware only, I disagree with remove-then-add.

EFI_SMM_CPU_SERVICE_PROTOCOL.AddProcessor() and
EFI_SMM_CPU_SERVICE_PROTOCOL.RemoveProcessor() (implemented in
SmmAddProcessor() and SmmRemoveProcessor() in
"UefiCpuPkg/PiSmmCpuDxeSmm/CpuService.c", respectively) only mark the
processors for addition/removal. The actual processing is done only
later, in BSPHandler() --> SmmCpuUpdate(), when "all SMI handlers are
finished" (see the comment in SmmRemoveProcessor()).

Consequently, I would not suggest replacing a valid APIC ID in a
particular mCpuHotPlugData.ApicId[Index] slot with INVALID_APIC_ID
(corresponding to the unplug operation), and then possibly replacing
INVALID_APIC_ID in the *same slot* with the APIC ID of the newly plugged
CPU, in the exact same SMI invocation (= in the same execution of
CpuHotplugMmi()). That might cause some component in edk2 to see the
APIC ID in mCpuHotPlugData.ApicId[Index] to change from one valid ACPI
ID to another valid APIC ID, and I don't even want to think about what
kind of mess that could cause.

So no, please handle plugs first, for which unused slots in
mCpuHotPlugData.ApicId will be populated, and *then* handle removals (in
the same invocation of CpuHotplugMmi()).

By the way, for unplug, you will not have to re-set
mCpuHotPlugData.ApicId[Index] to INVALID_APIC_ID, as
SmmRemoveProcessor() does that internally. You just have to locate the
Index for the APIC ID being removed, for calling
EFI_SMM_CPU_SERVICE_PROTOCOL.RemoveProcessor().


Thanks
Laszlo


