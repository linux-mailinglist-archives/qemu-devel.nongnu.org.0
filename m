Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6450F1711CC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 08:52:34 +0100 (CET)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7DyD-0006G0-Fm
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 02:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54117)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7Dx8-0004xE-Dq
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:51:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7Dx7-00014W-AJ
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:51:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31484
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7Dx7-00012B-7K
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582789884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xaisT5NWegrec9bUQSlMMOsD0jkZMNdz4KCm6xNj9SY=;
 b=Qub9GRmPERVdEjpDQ8xFlo4hszdPns63pDW6mytFeByZ0aMC3iKjoXmPyvx/OGNkTM9Uk3
 0MIv9/LrbVX+TEJ6y3BkgpExGcFdWo0YsrPcmtTM+OoqOJInIk3g339mijhbgBlHqTtK58
 i7tLnHjYpMarLdmANY29PTg4FKQ7Ax8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-gTImNxz1OJ-3_tkYjz92dg-1; Thu, 27 Feb 2020 02:51:19 -0500
X-MC-Unique: gTImNxz1OJ-3_tkYjz92dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC5C818C43C0;
 Thu, 27 Feb 2020 07:51:17 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6825DA2C;
 Thu, 27 Feb 2020 07:51:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/arm/smmu-common: Avoid smmu_find_smmu_pcibus return
 dangling pointer
Date: Thu, 27 Feb 2020 08:51:09 +0100
Message-Id: <20200227075111.15275-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series include the previous patch from Eric, then a
code refactor to avoid similar mistakes in the future.

v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg683451.html
Supersedes: <20200226172628.17449-1-eric.auger@redhat.com>

Eric Auger (1):
  hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus

Philippe Mathieu-Daud=C3=A9 (1):
  hw/arm/smmu-common: Simplify smmu_find_smmu_pcibus() logic

 hw/arm/smmu-common.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

--=20
2.21.1


