Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42231723E2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 17:48:50 +0100 (CET)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7MLB-0008PU-Oq
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 11:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7MK9-0007Qp-6F
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:47:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7MK7-0002GK-Cw
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:47:44 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20535
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7MK5-0002Dq-TY
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582822061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LlPeDmKFkA2dxMrO69WSlBsUmcf6ugZCLYwYxBHJt/0=;
 b=iyG38PyMoPDCr6Gz3994FEL8a0yiInlZiQgvsGj3hDD9nRCMyIhvxAILw2HVOCcEqeNw+8
 BPFF6cpvz4Vi66I62LNgRRTVcnW18JFoov+zsTbn8bYCLhEzZWOWslMz7+BIQGuU3zBFIx
 0tu43KGuo2M+/nChpv+A0LY69V+cnLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-NwmfMzQsMh2bxQCcLJtXiQ-1; Thu, 27 Feb 2020 11:47:39 -0500
X-MC-Unique: NwmfMzQsMh2bxQCcLJtXiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A4E1800D48;
 Thu, 27 Feb 2020 16:47:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 173565C651;
 Thu, 27 Feb 2020 16:47:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] hw/arm/smmu-common: Avoid smmu_find_smmu_pcibus return
 dangling pointer
Date: Thu, 27 Feb 2020 17:47:26 +0100
Message-Id: <20200227164728.11635-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series include the previous patch from Eric, then a
code refactor to avoid similar mistakes in the future.

Eric Auger (1):
  hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus

Philippe Mathieu-Daud=C3=A9 (1):
  hw/arm/smmu-common: Simplify smmu_find_smmu_pcibus() logic

 hw/arm/smmu-common.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

--=20
2.21.1


