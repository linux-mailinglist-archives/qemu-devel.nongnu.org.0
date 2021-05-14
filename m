Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ABA380F0D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:33:56 +0200 (CEST)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbhB-0005lv-Nz
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhbeg-0002qk-E8
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:31:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhbed-0007a0-KS
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621013474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4YfFD8bqvpc7grQPMC7yyUMi23B1Cr03Rw4owVZ694M=;
 b=aDDE5f7RkNdy4Grhva2m9nnOpdsc9t7VX1fT23Wn2MdZtePwi88k7UL9/gJ+w++SygQjI/
 S80cB2StM2He9ONcNt4OXvhq0Rmno+4DMUdPEHSDI7tzgJ1WJgZ171QmtufF9A/FNxQaVi
 dPPWGg3GgubUxYoNQDsOU/SXKP5T26w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-LBCNmeftMHq3X9ZBz5GdGA-1; Fri, 14 May 2021 13:31:12 -0400
X-MC-Unique: LBCNmeftMHq3X9ZBz5GdGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CECDC107ACCD
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 17:31:11 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB8C5C1C4;
 Fri, 14 May 2021 17:31:10 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] docs: add user facing docs for secret passing and
 authorization controls
Date: Fri, 14 May 2021 18:31:06 +0100
Message-Id: <20210514173110.1397741-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are an important of the overall QEMU network backend security=0D
controls but never previously documented aside from in blog posts.=0D
=0D
Daniel P. Berrang=C3=A9 (4):=0D
  docs: document how to pass secret data to QEMU=0D
  docs: document usage of the authorization framework=0D
  docs: recommend SCRAM-SHA-256 SASL mech instead of SHA-1 variant=0D
  sasl: remove comment about obsolete kerberos versions=0D
=0D
 docs/system/authz.rst        | 263 +++++++++++++++++++++++++++++++++++=0D
 docs/system/index.rst        |   2 +=0D
 docs/system/secrets.rst      | 162 +++++++++++++++++++++=0D
 docs/system/vnc-security.rst |   7 +-=0D
 qemu.sasl                    |  15 +-=0D
 5 files changed, 437 insertions(+), 12 deletions(-)=0D
 create mode 100644 docs/system/authz.rst=0D
 create mode 100644 docs/system/secrets.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


