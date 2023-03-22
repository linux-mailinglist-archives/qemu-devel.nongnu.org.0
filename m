Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DAC6C54D9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 20:23:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf42g-0006wu-0r; Wed, 22 Mar 2023 15:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pf42Q-0006wM-Sz
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 15:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pf42P-0006rY-A9
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 15:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679512940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A3E2mUqd3iJod1e51fNoLhOQwTXyNPIHRgjbTJuO1Dk=;
 b=T+s2mx1EQKgWkny1RsoEyNnifPb4UuJFxuYnVrvGx8ORMg8Ycensic+l39v6hucu2KNKaz
 SRrM4RIMGV6GI4FRpnUu/fjN6UvPuZHlC5LUb3yJK8g2qLWCc8AJSNYYIwOsH1F1XUVGI8
 Cvy5Z7lpaS7V/bSfrwxtHpS0BdF4qlc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-uCRCWYaWOK-CHrljeZYdPA-1; Wed, 22 Mar 2023 15:22:15 -0400
X-MC-Unique: uCRCWYaWOK-CHrljeZYdPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1C98857F81;
 Wed, 22 Mar 2023 19:22:14 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.224.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7C3040C20FA;
 Wed, 22 Mar 2023 19:22:13 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PULL 0/1] QGA warning fix
Date: Wed, 22 Mar 2023 21:22:10 +0200
Message-Id: <20230322192211.331226-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kostiantyn Kostiuk <kostyanf14@live.com>


The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:

  Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-pull-2023-03-22

for you to fetch changes up to 0fcd574b025fccdf14d5140687cafe2bc30b634f:

  qga/vss-win32: fix warning for clang++-15 (2023-03-22 21:02:09 +0200)

----------------------------------------------------------------
qga-pull-2023-03-22

----------------------------------------------------------------
Pierrick Bouvier (1):
      qga/vss-win32: fix warning for clang++-15

 qga/vss-win32/install.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


--
2.25.1


