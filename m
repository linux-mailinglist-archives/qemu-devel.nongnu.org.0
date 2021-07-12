Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170233C641B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:49:19 +0200 (CEST)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31vZ-0008CA-WA
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qa-0001e7-H4; Mon, 12 Jul 2021 15:44:08 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qY-0002gx-V1; Mon, 12 Jul 2021 15:44:08 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t9so19405609pgn.4;
 Mon, 12 Jul 2021 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJ4GKfLNXDxX0M/qFFoXuW2OTTNd91WHgyaBHr9mRvA=;
 b=gtCJk9483rtTRp6FOQzN/7G/DrtktZRc+zoM1Ls0C6Ki2yiQ75Am8r8pU2WJlOZuFp
 eQU+S23jHwgmjK5WM+uLESaq97KGftu9JWb5zl/G9gXGRdeE6ioo3p3lR34Ry7OLptfw
 XDOImrTtmpeJN2yePSgW+nOQ49zkd23j08IhWD7V3TsOvu/6tJAb9JG+YCUGOwC6dNpj
 xuGv8MI1SqRhFFDMu9llLPzSRv9+iKcbwZxAIiN+6Yu7j5jJh7Ugks3O1xlxjiFVewt2
 KPNZps5c6xwCiBk/kgNH7GlD6YHuVyb/MDEWHjly7qa3TcxqxkBQyLIKEFlv3EQEtVxQ
 hqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJ4GKfLNXDxX0M/qFFoXuW2OTTNd91WHgyaBHr9mRvA=;
 b=hrjhJGnl8o5WcLHycnB2EOecd59+iuOLE7Jk/UchGaeYcUilA5Ht9SMIT5Iw41Yp3s
 6OoV9TY4hQsN38PVkJgPrjvuv8H7uMe2KzVrmq6DxkxtkTjTJ72VuxLFMLmxulb8Awxn
 6AZEV9ZGEa89bjWkRQuESNfPYVNkgxAMjOnM3+9RpiQJMMVHb25GGBBT8Uofw6cHQ3xh
 e4cj1/3SnD25XlCLIqSlXsiwRpRKeNPVb84Fd7m+yEIufEBEJ3Mjt3Ajia9QK3x1Oy0Z
 uuNfaSnHdhBpxsgSKq3kEnpJ+rKaNWq/V4Kwzil27XEulh7pQRdqCHrHn5kInuD36WNh
 757A==
X-Gm-Message-State: AOAM533ecwCNbA2KXKbqD2R7C/6Kn50JldPXMJwMHmqbv1VRViKc9OTU
 dXp2Ta0GiVLU0OkAjg4ojHy6WeiORX0=
X-Google-Smtp-Source: ABdhPJz2oT5ZLsmGSguMnnQ0FO3D5+H91kz0XpLG4SmTC+IInVd1z4QeFdIThDiHsDmv9SUcplQOxQ==
X-Received: by 2002:a63:ff4b:: with SMTP id s11mr690610pgk.436.1626119045322; 
 Mon, 12 Jul 2021 12:44:05 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a7d9:90df:d3f0:78a8:2eb9])
 by smtp.gmail.com with ESMTPSA id e21sm17075088pfc.172.2021.07.12.12.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:44:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/7] qapi/qdev.json: fix DEVICE_DELETED parameters doc
Date: Mon, 12 Jul 2021 16:43:36 -0300
Message-Id: <20210712194339.813152-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712194339.813152-1-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=danielhb413@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, armbru@redhat.com,
 groug@kaod.org, qemu-ppc@nongnu.org, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clarify that @device is optional and that 'path' is the device
path from QOM.

This change follows Markus' suggestion verbatim, provided in full
context here:

https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01891.html

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 qapi/qdev.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..d1d3681a50 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -108,9 +108,9 @@
 # At this point, it's safe to reuse the specified device ID. Device removal can
 # be initiated by the guest or by HMP/QMP commands.
 #
-# @device: device name
+# @device: the device's ID if it has one
 #
-# @path: device path
+# @path: the device's path within the object model
 #
 # Since: 1.5
 #
-- 
2.31.1


