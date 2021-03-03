Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CA632BA06
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:52:42 +0100 (CET)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWbx-00055v-HI
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWZ-00059M-KE
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:47:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWX-0007xm-JM
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NoCyAkDbqm7qqBRK5Dn5W3Vg1Q8erVg+5wGiFEk0raM=;
 b=D3s6mHAUjgBadNLU2l4IslPc6/7YM5GzEqLCaVG+8zJrlEGBSqM1lsG8WTK+1FpGZC5TvM
 KL/skJwaUtyPG91Q8oSQCkGd6lOxT4Jrw3bcq/X4Xb9JtbO5VLRxO6daxksdYsFfby6NJu
 +6PLxFKHvi4vf7BAImkzSEvsZIFX17k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-INFuYAjcNbiIrd0-UTYdsA-1; Wed, 03 Mar 2021 13:47:03 -0500
X-MC-Unique: INFuYAjcNbiIrd0-UTYdsA-1
Received: by mail-wm1-f70.google.com with SMTP id a65so2192899wmh.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NoCyAkDbqm7qqBRK5Dn5W3Vg1Q8erVg+5wGiFEk0raM=;
 b=HBHvJ5IGwiYFxfYvaSSTnSMh6H4ph6LJaPwWVBjkb8ER79+TmWaRL3vqYE4vonTUh5
 idhSD1XYSsAgzcWCiknrjRMDG+Y1bPWRaxNM9tx0MFMYCC4FxZR2Q/PXxIvG2a6Cyx1f
 3n5ug/XnTCp5sp8XecaQWhlRZo50UgGvfJN9LhfCCM1d214jywW28aetwLJouOU43XZk
 +LR1Djwd2H+GsOwB+zCpxiK5vyTk8ApZs4RDLzgaWfx6OTlCywm6f6Kq2YAvnQzNJmel
 CkfNkG6eQJWmxOuPoZzheOU87Tayj8mZGT507H+OBe17z7x3mvU/yjO3MvLEbunlYSKS
 /kMQ==
X-Gm-Message-State: AOAM533KzbuwY2c0wUTPkIZbtwNOPSXTd5ZJ8KHZAZ4aQ1I2mAnc0fqP
 xCbYgBsLZFoaFpfVkbtsrIbURGbfZht7lGGlk5NiFzLgHb83Fkhr47ca4+H699cN05+x7Z/rDLN
 ZPmq9oqEctQv20N5LlOcOKC4UxnTAc/Qi6Ylx4iJJ+GJO1RLdLIi00bZVWnsY4Qzi
X-Received: by 2002:adf:f292:: with SMTP id k18mr29025387wro.335.1614797221692; 
 Wed, 03 Mar 2021 10:47:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXNoAkTi1EjnqkFTfdC9dxH+7fkHpU2XpEtaWryEqqFaJWWzS4eXv81bSvplkiukPBV5j0sA==
X-Received: by 2002:adf:f292:: with SMTP id k18mr29025362wro.335.1614797221547; 
 Wed, 03 Mar 2021 10:47:01 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p17sm6248355wmq.47.2021.03.03.10.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:47:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] scripts/tracetool: Replace the word 'whitelist'
Date: Wed,  3 Mar 2021 19:46:41 +0100
Message-Id: <20210303184644.1639691-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303184644.1639691-1-philmd@redhat.com>
References: <20210303184644.1639691-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/tracetool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 96b1cd69a52..5bc94d95cfc 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -100,7 +100,7 @@ def validate_type(name):
         if bit == "const":
             continue
         if bit not in ALLOWED_TYPES:
-            raise ValueError("Argument type '%s' is not in whitelist. "
+            raise ValueError("Argument type '%s' is not allowed. "
                              "Only standard C types and fixed size integer "
                              "types should be used. struct, union, and "
                              "other complex pointer types should be "
-- 
2.26.2


