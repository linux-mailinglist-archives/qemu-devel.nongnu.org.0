Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B532C8A56
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 18:03:19 +0100 (CET)
Received: from localhost ([::1]:56424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjma5-0006TL-MF
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 12:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kjmVt-0004Qr-CU
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:58:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kjmVr-0005f8-QR
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606755534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9d1sJUn5h75Cw6cUsxk+BCJ61xYwC0f6AT8DRj3T6t8=;
 b=gOthoqw0486RMUurZ9pbNE+79Jncvye3CbbdgJZaRz+zYZFttVQ6HCHDjbfZ7mkVx0M8GO
 fyehPMiui9o2JNvAnlL1/z+Uvji4UKCP0RJP9sG4DedrMn2HNtsBU1c2/0VUeGukRNRMPz
 n5kbkNd05DhApBjK73zs5VGUSLyUYB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-F40eym48OLOTrrnZiPdj9w-1; Mon, 30 Nov 2020 11:58:52 -0500
X-MC-Unique: F40eym48OLOTrrnZiPdj9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C0A6190B2AA;
 Mon, 30 Nov 2020 16:58:51 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-120.ams2.redhat.com
 [10.36.112.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A230F10016F6;
 Mon, 30 Nov 2020 16:58:50 +0000 (UTC)
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Ankur Arora <ankur.a.arora@oracle.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201124122507.1014839-1-imammedo@redhat.com>
 <20640581-e37d-8783-451c-22627aabb77f@oracle.com>
 <a5bb1550-6253-87eb-87a0-0532725d5d42@redhat.com>
 <c7f04e3a-e83a-cd23-aa9d-566ee3ca9f03@oracle.com>
 <20201127123356.7b1349d8@redhat.com>
 <3bad9b8e-6de1-37d4-8ac4-a8432885eb14@redhat.com>
 <8cc8c873-5057-29af-5c6e-ee43e5fa035c@oracle.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <caf7b59e-88e2-4153-1590-7a39e13346f1@redhat.com>
Date: Mon, 30 Nov 2020 17:58:49 +0100
MIME-Version: 1.0
In-Reply-To: <8cc8c873-5057-29af-5c6e-ee43e5fa035c@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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

On 11/28/20 00:48, Ankur Arora wrote:

> It is possible that there are CPUs with bits for both is_inserting and
> is_removing. In that case QemuCpuhpCollectApicIds() would put them in the
> PluggedApicIds array and the unplug eventually happens in the next
> firmware invocation.
> 
> If a CPU has both is_inserting and fw_remove set, the firmware processes
> the
> hotplug in that invocation and the unplug happens whenever the OSPM
> triggers
> the firmware next.

If these corner cases will actually work (I'm somewhat doubtful), that
will be really great.

Thanks!
Laszlo


