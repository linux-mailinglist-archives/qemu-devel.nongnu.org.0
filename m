Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F1419BAC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:20:03 +0200 (CEST)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuIM-0003rZ-3I
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu22-0002hI-2K
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu20-000384-EK
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6rQjxAy72iJxoMGR7Rv5VxW4F4jqkPf51TKeKH4908=;
 b=XvX+CrLZxAS3LzD5pDCG50IzCHCrJLK1yssLMY48aKUDtuVjFMHgW+aP95mcpTF2/3S2At
 mR0Wksk10Qczud8lexUt72++PtdpM5FTsI0baR0JEH65iKvo99VkstOSfQcHRJ15nEm2OI
 rVRDLqM45sY10L/yo8CzJ27ZJ39+3Nc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-FIrY6AJsNky_6OGs08YpZA-1; Mon, 27 Sep 2021 13:03:06 -0400
X-MC-Unique: FIrY6AJsNky_6OGs08YpZA-1
Received: by mail-wr1-f72.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so14324883wrg.17
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B6rQjxAy72iJxoMGR7Rv5VxW4F4jqkPf51TKeKH4908=;
 b=cz2mWxYPhBUe0/uB+F/l+l0Ezczpm4DzSVFdIyPwHEqxv02UWwMjwEO1ZMFv+7wh1j
 m4BBcFmDst2uMNyGlJGGHA7/LsFQFPJBfKaO/CKP3FCEkOfwarP/llvFG2Q14NEL+cJ3
 S1Uuebh81a8b0X9U9KGJuSNBCEc5SWhqI4LiWHcrdnN+ZQx/kK+CT1v7iZE4ODJOEZuz
 nkaZ1f4aiPdNRQjp7DZQ/I2kwn/QvJhTI3VPH+6DRPE8CC+B0CqrL+hHgfkL3BHR39HR
 BmcN+y6uiWlNHTu5lTvQntvJRpHTKVVZJmQJW2gcUD16UH5T8iVBs8h1E3ULN62Uqh4C
 0/Ag==
X-Gm-Message-State: AOAM531LmDLvq1BxyaGMK4Dtz/JI0Ogr9m6LK9uaLW8Zhfdi6uEU3CWa
 Xhd6aJhK/QCaUAWuwdZn0PmCQQgEJdqC0zftFxhigW0wtU5LWuoLZcdzmkmaDmCiSWoQ9zKrcHg
 O5MZfpMCAmHlNObmkEIUnGNRliXjPanBbdB35PDm4fTtjK8ulEJM/5uPKbCaoRKV6
X-Received: by 2002:adf:e44f:: with SMTP id t15mr1121789wrm.394.1632762185219; 
 Mon, 27 Sep 2021 10:03:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiBnfSGm555uCL2xeYS1Qkl84z0Dqy/U9fLfxkFY2JBnKkwycNnO/7HXcMJxKTQ0jt5lgpxg==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr1121761wrm.394.1632762185061; 
 Mon, 27 Sep 2021 10:03:05 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z133sm64393wmc.45.2021.09.27.10.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/21] avocado_qemu: standardize super() call following PEP3135
Date: Mon, 27 Sep 2021 19:02:14 +0200
Message-Id: <20210927170227.2014482-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

PEP3135 states when calling super(), there is no need to use arguments.
This changes the calls on avocado_qemu to standardize according to
PEP3135 and avoid warnings from linters.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210920204932.94132-3-willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index d9e1b32aa16..d2077d63cda 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -282,7 +282,7 @@ def fetch_asset(self, name,
                     asset_hash=None, algorithm=None,
                     locations=None, expire=None,
                     find_only=False, cancel_on_missing=True):
-        return super(Test, self).fetch_asset(name,
+        return super().fetch_asset(name,
                         asset_hash=asset_hash,
                         algorithm=algorithm,
                         locations=locations,
@@ -470,7 +470,7 @@ def _set_distro(self):
             self.distro.checksum = distro_checksum
 
     def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
-        super(LinuxTest, self).setUp()
+        super().setUp()
         self._set_distro()
         self.vm.add_args('-smp', '2')
         self.vm.add_args('-m', '1024')
-- 
2.31.1


