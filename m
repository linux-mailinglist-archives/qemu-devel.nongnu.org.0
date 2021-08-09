Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A53E4DA0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 22:09:19 +0200 (CEST)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDBaI-0006Fo-0N
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 16:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDBYo-0004t7-5X
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDBYl-000051-7m
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628539662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m+XMD3VXLjetHOU5Jn9sr7243/PIapljWGm9MBPqjLs=;
 b=XCICYVekk9hkT5aIxZSoZD38A3O8LKaTFLEbBYEq+Un5ApiRnP1tehIJHRNB0byXm2TcCM
 PjuhpKymT6zC0OdoHilLlbPWVKujZkOf8ZaH/8vLr6q/axGQPO6KPr+yzY/8GEx9F98BRF
 H69BzQpFrPWcflliQlOI2adXQLEFRl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-bX7ArPLWPDWJTGB_oFtSUg-1; Mon, 09 Aug 2021 16:07:40 -0400
X-MC-Unique: bX7ArPLWPDWJTGB_oFtSUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9BA9190D340;
 Mon,  9 Aug 2021 20:07:39 +0000 (UTC)
Received: from localhost (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6A941036D05;
 Mon,  9 Aug 2021 20:07:39 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v3 0/2] qom: DECLARE_INTERFACE_CHECKER macro
Date: Mon,  9 Aug 2021 16:07:12 -0400
Message-Id: <20210809200714.887337-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an alternative to the series:=0D
  Subject: [PATCH 0/3] qom: Replace INTERFACE_CHECK with OBJECT_CHECK=0D
  https://lore.kernel.org/qemu-devel/20200916193101.511600-1-ehabkost@redha=
t.com/=0D
=0D
Instead of removing INTERFACE_CHECK completely, keep it but use a=0D
DECLARE_INTERFACE_CHECKER macro to define the type checking functions for=
=0D
interface types.=0D
=0D
Maybe one day INTERFACE_CHECK/DECLARE_INTERFACE_CHECKER will be=0D
completely replaced with OBJECT_CHECK/DECLARE_INSTANCE_CHECKER,=0D
but by now it might be useful to keep the distinction between=0D
regular objects and interface types.  See discussion at=0D
https://lore.kernel.org/qemu-devel/20200916221347.GL7594@habkost.net=0D
=0D
Based-on: <20210806211127.646908-1-ehabkost@redhat.com>=0D
=0D
Changes v2 -> v3:=0D
* Rebased on top of=0D
  Subject: [PATCH for-6.2 00/12] qom: Get rid of all manual usage of OBJECT=
_CHECK & friends=0D
  Date: Fri,  6 Aug 2021 17:11:15 -0400=0D
  Message-Id: <20210806211127.646908-1-ehabkost@redhat.com>=0D
  https://lore.kernel.org/qemu-devel/20210806211127.646908-1-ehabkost@redha=
t.com=0D
=0D
Changes v1 -> v2:=0D
* Move declaration after typedefs, so the code actually compiles=0D
=0D
Links to previous versions:=0D
v1: https://lore.kernel.org/qemu-devel/20200916223258.599367-1-ehabkost@red=
hat.com=0D
v2: https://lore.kernel.org/qemu-devel/20200917024947.707586-1-ehabkost@red=
hat.com=0D
=0D
Eduardo Habkost (2):=0D
  qom: DECLARE_INTERFACE_CHECKER macro=0D
  [autoamted] Use DECLARE_INTERFACE_CHECKER macro=0D
=0D
 include/hw/acpi/acpi_dev_interface.h |  5 ++---=0D
 include/hw/arm/linux-boot-if.h       |  4 ++--=0D
 include/hw/fw-path-provider.h        |  4 ++--=0D
 include/hw/hotplug.h                 |  4 ++--=0D
 include/hw/intc/intc.h               |  5 ++---=0D
 include/hw/ipmi/ipmi.h               |  4 ++--=0D
 include/hw/isa/isa.h                 |  4 ++--=0D
 include/hw/mem/memory-device.h       |  4 ++--=0D
 include/hw/nmi.h                     |  4 ++--=0D
 include/hw/ppc/pnv_xscom.h           |  4 ++--=0D
 include/hw/ppc/spapr_irq.h           |  4 ++--=0D
 include/hw/ppc/xics.h                |  4 ++--=0D
 include/hw/ppc/xive.h                | 12 ++++++------=0D
 include/hw/rdma/rdma.h               |  5 ++---=0D
 include/hw/rtc/m48t59.h              |  4 ++--=0D
 include/hw/stream.h                  |  4 ++--=0D
 include/hw/vmstate-if.h              |  4 ++--=0D
 include/qom/object.h                 | 14 ++++++++++++++=0D
 include/qom/object_interfaces.h      |  5 ++---=0D
 include/sysemu/tpm.h                 |  4 ++--=0D
 target/arm/idau.h                    |  4 ++--=0D
 tests/unit/check-qom-interface.c     |  4 ++--=0D
 22 files changed, 60 insertions(+), 50 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


