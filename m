Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09583478549
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 07:52:27 +0100 (CET)
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my76P-0005yD-5a
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 01:52:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1my71k-0004ZM-29
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 01:47:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1my71g-0001fu-RV
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 01:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639723651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+8FkHRwLos3aQ8qw/NMmHbA+fYjbngDqslEr970JfM=;
 b=Ei0fJKFxS/cM0TQrAoJFo+60n6t/fYpnXgsvl6vTm4jsf5XP5De9/sAdCJ5orS/e2t3Hil
 rQSAMGmg3SVQCnYCPmqWIlAyGPgYa3hEpe6xn0WkdsaeUedrWHimdAxaHVtkH1tZAhQZjc
 rLAp2X8WmW8Rw22uo24HQ84rbU1KPrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-_vJf4O39NMiBXzsO3AbeYw-1; Fri, 17 Dec 2021 01:47:29 -0500
X-MC-Unique: _vJf4O39NMiBXzsO3AbeYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 098098042E0;
 Fri, 17 Dec 2021 06:47:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C38B41042AAC;
 Fri, 17 Dec 2021 06:47:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 08E671800097; Fri, 17 Dec 2021 07:47:26 +0100 (CET)
Date: Fri, 17 Dec 2021 07:47:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Annie.li" <annie.li@oracle.com>
Subject: Re: [PATCH 1/1] pcie: Do not set power state for some hot-plugged
 devices
Message-ID: <20211217064726.j2vygixj4yv3rrpn@sirius.home.kraxel.org>
References: <20211214215312.944-1-annie.li@oracle.com>
 <20211215060513.kugy3y32nj2te7ui@sirius.home.kraxel.org>
 <1f85fe9e-0753-c35a-668d-3b6779bc703b@oracle.com>
 <20211216061128.vtap3lunpuye36il@sirius.home.kraxel.org>
 <22554a74-3ac4-cce5-e082-d961ee922a1e@oracle.com>
MIME-Version: 1.0
In-Reply-To: <22554a74-3ac4-cce5-e082-d961ee922a1e@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 06:10:40PM -0500, Annie.li wrote:
> Hello Gerd,
> 
> On 12/16/2021 1:11 AM, Gerd Hoffmann wrote:
> > 
> > Looking again, the difference is probably the reset handling.
> > pcie_cap_slot_reset() will turn on power (via PCI_EXP_SLTCTL_PCC) in
> > case some device is plugged into the slot.
> If the VM is booting from the system disk in the qemu command line(no
> hot-plug),
> pcie_cap_slot_reset turns on the power for this device. And this happens
> before
> the VM runs into VM_STATE_PRELAUNCH state.(I add '-S' option in this case
> for comparison)
> > 
> > So I suspect when plugging devices during VM_STATE_PRELAUNCH they are
> > resetted individually (specifically before the device is plugged),
> When the device is hot-plugged in VM_STATE_PRELAUNCH state, there is no
> reset for the device during this state. Before entering this state,
> pcie_cap_slot_reset  does get called for the device(like general VM
> booting).
> However, it doesn't turn on the power. I think this is due to that the
> device isn't
> hot-plugged yet, and "populated" value is false.

Ok, so maybe we just need to move the device reset from "before
prelaunch" to "after prelaunch" ?

> > whereas otherwise they are resetted when all devices are plugged in.
> > 
> > Does resetting devices when leaving RUN_STATE_PRELAUNCH fix this?
> I suppose only calling pcie_cap_slot_reset  isn't sufficient? maybe
> rp_reset?

Well, the underlying problem I see here is that the setup workflow for
devices is different depending how they got added (cmd line vs.
prelauch).  This should not be the case.

I wouldn't be surprised if we find this causing similar issues in other
devices.

> Just thinking of the implementation, if the patch is deployed in this way,
> isn't the change is more complicated than the current one? :) Maybe I've
> missed something here.

I want the root cause be found and fixed, not band aid being applied ...

take care,
  Gerd


