Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56C83E1CD0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:35:54 +0200 (CEST)
Received: from localhost ([::1]:54608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBj9l-0003bj-9I
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBj8Z-0001VY-IA
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBj8W-0001kz-Ts
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628192076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rW64RN+3v7vYNREDBF38Nc3fiBBqMvmXMHv32VMVsHY=;
 b=KF5B0w+mwUWxgV/YGEXu1TXnfF75LHghGjoxhmcC9PJYPooiVxAOFHMeZA+uOBiGnwVpJ1
 cU5jH8QQhZHzq32oxHL4rIDI2jgemV0sTih2hFxUFUpCf0J7dVaoi3k6k/KE1W+smTQpkB
 CC7sFeAF0zusdCZn2NCiSjEgWTnAUvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-MVAyW99lPF6PuTpfgiFDoQ-1; Thu, 05 Aug 2021 15:34:32 -0400
X-MC-Unique: MVAyW99lPF6PuTpfgiFDoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05030190D342
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 19:34:32 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C098F67899;
 Thu,  5 Aug 2021 19:34:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 0/6] qom: Fix broken OBJECT_CHECK usage
Date: Thu,  5 Aug 2021 15:34:25 -0400
Message-Id: <20210805193431.307761-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series removes some broken OBJECT_CHECK macros and fix cases=0D
where OBJECT_CHECK is being used directly in the code.=0D
=0D
Eduardo Habkost (6):=0D
  acpi: Delete broken ACPI_GED_X86 macro=0D
  sbsa_gwdt: Delete broken SBSA_*CLASS macros=0D
  s390-sclp-events-bus: Set instance_size=0D
  s390-sclp-events-bus: Use OBJECT_DECLARE_SIMPLE_TYPE=0D
  s390x: event-facility: Use SCLP_EVENT_BUS macro=0D
  Use PCI_HOST_BRIDGE macro=0D
=0D
 include/hw/acpi/generic_event_device.h | 2 --=0D
 include/hw/watchdog/sbsa_gwdt.h        | 4 ----=0D
 hw/i386/acpi-build.c                   | 8 ++------=0D
 hw/pci-host/i440fx.c                   | 4 +---=0D
 hw/s390x/event-facility.c              | 4 +++-=0D
 5 files changed, 6 insertions(+), 16 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


