Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708C66F8229
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 13:41:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1putnK-0003fH-83; Fri, 05 May 2023 07:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1putn4-0003dn-IL
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:40:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1putn1-0001Vh-Kw
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683286792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gopFybc2Ugvz1lG0ANMYXJ+KE5Wg8gjK4PzBgVaJ7FQ=;
 b=E8wrKJECWCrEbkDl9YW3ZQMiBtGdObYszEqR5+eVr65Y+RfPp38KYOVzutq2TRTI/NEzgg
 UO64Sub9ac7OElQMbcnzmQDQu2ir1ilMXFzifOFUD/8buVvG+uppO/XYbYhiaEfg0cZX+Z
 /+LDjVsH70FE6cFZ1Znu40SusQbJ/+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-oH6RSMgQOPyenIZOicpLyw-1; Fri, 05 May 2023 07:39:51 -0400
X-MC-Unique: oH6RSMgQOPyenIZOicpLyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5895485A5A3;
 Fri,  5 May 2023 11:39:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41F8240C2063;
 Fri,  5 May 2023 11:39:49 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 0/1] audio patch
Date: Fri,  5 May 2023 15:39:46 +0400
Message-Id: <20230505113947.3301944-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit f6b761bdbd8ba63cee7428d52fb6b46e4224ddab:

  Merge tag 'qga-pull-2023-05-04' of https://github.com/kostyanf14/qemu into staging (2023-05-04 12:08:00 +0100)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/pw-pull-request

for you to fetch changes up to c2d3d1c294151cea0e62d3ecca09837fc23ba4b3:

  audio/pwaudio.c: Add Pipewire audio backend for QEMU (2023-05-05 13:23:08 +0400)

----------------------------------------------------------------
Add PipeWire audio backend

----------------------------------------------------------------

Dorinda Bassey (1):
  audio/pwaudio.c: Add Pipewire audio backend for QEMU

 meson.build                   |   8 +
 qapi/audio.json               |  44 ++
 audio/audio_template.h        |   4 +
 audio/audio.c                 |   3 +
 audio/pwaudio.c               | 915 ++++++++++++++++++++++++++++++++++
 audio/meson.build             |   1 +
 audio/trace-events            |   8 +
 meson_options.txt             |   4 +-
 qemu-options.hx               |  21 +
 scripts/meson-buildoptions.sh |   8 +-
 10 files changed, 1013 insertions(+), 3 deletions(-)
 create mode 100644 audio/pwaudio.c

-- 
2.40.1


