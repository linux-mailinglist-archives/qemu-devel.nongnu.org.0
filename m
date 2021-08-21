Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE823F3A02
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 11:47:49 +0200 (CEST)
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHNbQ-00087G-EP
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 05:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.hauschild@fs.ei.tum.de>)
 id 1mHNZi-0006kK-MR
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 05:46:02 -0400
Received: from mail.fs.ei.tum.de ([129.187.54.7]:45290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.hauschild@fs.ei.tum.de>)
 id 1mHNZe-0002wj-Dl
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 05:46:02 -0400
Received: from Lucy.fritz.box (pc19f2504.dip0.t-ipconnect.de [193.159.37.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.fs.ei.tum.de (Postfix) with ESMTPSA id 0D32A118756A;
 Sat, 21 Aug 2021 11:45:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fs.ei.tum.de;
 s=default; t=1629539145;
 bh=5RLj7BbYrjm1J573Hbok+oGFgzHIf+0cM4JFAztH+Ks=;
 h=From:To:Cc:Subject:Date:From;
 b=LIAHc2saaWGb2W1zVKNXtuBzlGgip5SUcTQMXHWovx5WHHp+7x2ZJtjN+XSbCtDom
 tQ3sUwhl+T3oBwJPAwzJp4i1GZXLTgf1JKHi2GF6vd4y+Tuo9uiBPGjHdJmnqYKpvf
 SIflLVCFv8KnY3IC5JMNfysB5wuR0prp1cyvmKQg=
From: Florian Hauschild <florian.hauschild@fs.ei.tum.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Florian Hauschild <florian.hauschild@fs.ei.tum.de>
Subject: [RFC PATCH 0/1] QEMU TCG plugin interface extensions
Date: Sat, 21 Aug 2021 11:45:26 +0200
Message-Id: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=129.187.54.7;
 envelope-from=florian.hauschild@fs.ei.tum.de; helo=mail.fs.ei.tum.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi all,

I extended the plugin interface with additional functionalities.
I wrote the extensions for fault injection/exploration reasearch using
QEMU. The additional functionalities for a plugin are:
  * Read and write guest memory
  * Read and write guest registers
  * Allow plugin to force QEMU into single step mode
  * Flush TB cache from plugin

Currently the changes are stored inside its own c file.
Should it be moved into one of the other plugin files?
Should a new config option be added to only enable the additional
extensions if set?

Best regards,
Florian


Florian Hauschild (1):
  QEMU plugin interface extension

 include/qemu/qemu-plugin.h   |  35 ++++++++++++
 plugins/meson.build          |   1 +
 plugins/readwriteextension.c | 106 +++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 plugins/readwriteextension.c

-- 
2.25.1


