Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51B33BE6CC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:01:20 +0200 (CEST)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15It-0002T1-SX
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m15Dq-00088f-A8
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:56:06 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m15Do-0002CP-EF
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:56:05 -0400
Received: by mail-ed1-x530.google.com with SMTP id h2so2831899edt.3
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 03:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x2xfU9jO8E1GjgBl47Ekpsb5ztShELAehOr420frCzE=;
 b=ZXIbIFi7nI+wL9eF/AZKhLqpJQ1CeA3if5EqCCUxK1FHgLMJkVQAmCcL5Il2kZ4ysV
 5HTt5vl1zEd3aQfdepxJQc72QzqlJY5bLcTRZCqlnblLbXhdNgQjnt9cect/ocQ4fgUq
 4mlR7L9kcs5JHpbueBff86L/m5hTACRGqKzSBrg3YCXCbypslZcSnx7uWSC7286bwVPt
 shDeYt0b9J2OZ4IOdKgk1sqJBB7I+2jDR+UbMf7g1sBqLQcjwNppE1zEk9nIsaQRc6xE
 UU0dD/SHazMahgXLfmB/BgU1Ofod5jYY/fTJQYfUjBY+52aPi1WAhl+ArvL9D3YYGFi+
 Ec/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=x2xfU9jO8E1GjgBl47Ekpsb5ztShELAehOr420frCzE=;
 b=K9jszSVHKZ6qoFQCv8fzzmGNMPZRToiCAYxJntN8WD+3xaMuGf9eNjppdMrIdHnKkg
 ga3+xAJvLQb1/w4d6MMLU8FHAQu6yTM63W+creO6y0BRFvtbOAklmrHnv39ZWMM0msJi
 dL2zreQ7VFtODVLtnkxqrZhx73zdUujUsvNG+jPBF6a2cHBFbbuIp5dO5dAe5NVhXeTj
 XPsKjqF6e+G7g/jpjMUcajyubixsrcOT4REd7pvpnOB434HF5lqIIdCmuuOatbUAkRuS
 fKitarguXZ4Eg4P+V3cTcjUknGkftjdGXmYWmqjNyLHYvuQNobU10NsRF1akw+u4CmL6
 IZLw==
X-Gm-Message-State: AOAM5335ATT1SOD/WA9Krk5wqRpQ4Gk4YlkZlFq5RwRJtmWaQ7hb1L0s
 bmIp/E9cDMFR/SxrNiM4TnzWvJcBj2I=
X-Google-Smtp-Source: ABdhPJziyYA4PWoK+tanQUyxLj+t26yFlft7aEcYIppFPP5Z//SJM818tu2zlCRgEOAHbtucpD5Obg==
X-Received: by 2002:a05:6402:14da:: with SMTP id
 f26mr17636875edx.335.1625655362258; 
 Wed, 07 Jul 2021 03:56:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id c15sm8467159eds.16.2021.07.07.03.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 03:56:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] osdep: fix HAVE_BROKEN_SIZE_MAX case
Date: Wed,  7 Jul 2021 12:56:00 +0200
Message-Id: <20210707105600.342309-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Frederic Bezies <fredbezies@gmail.com>, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While config-host.mak entries are expanded to "1" for compatibility with
create-config.sh, tests done directly in meson.build expand to the empty
string and cannot be placed to the right of the && operator.  Adjust
osdep.h after commit e46bd55d9c ("configure: convert HAVE_BROKEN_SIZE_MAX
to meson", 2021-07-06) changed the way HAVE_BROKEN_SIZE_MAX is defined.

Reported-by: Frederic Bezies <fredbezies@gmail.com>
Fixes: e46bd55d9c ("configure: convert HAVE_BROKEN_SIZE_MAX to meson", 2021-07-06)
Resolves: #463
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index c91a78b5e6..60718fc342 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -256,7 +256,7 @@ extern "C" {
 /* Mac OSX has a <stdint.h> bug that incorrectly defines SIZE_MAX with
  * the wrong type. Our replacement isn't usable in preprocessor
  * expressions, but it is sufficient for our needs. */
-#if defined(HAVE_BROKEN_SIZE_MAX) && HAVE_BROKEN_SIZE_MAX
+#ifdef HAVE_BROKEN_SIZE_MAX
 #undef SIZE_MAX
 #define SIZE_MAX ((size_t)-1)
 #endif
-- 
2.31.1


