Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19083AB10D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:12:12 +0200 (CEST)
Received: from localhost ([::1]:43678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltp0N-00016H-RO
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNX-00030F-CD
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:03 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNV-0006Kl-Iu
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:03 -0400
Received: by mail-ed1-x534.google.com with SMTP id b11so3068120edy.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xuAPUpX6Hhq84IfvJMkUkq8FBAkzzJSj3GQD8rT6J7c=;
 b=O9QWht0Qxwq5SOK0LHLj5OP4Jn7vMReMCf+l0yuMZcpHOTofOEFAZ7NKYfhWFleobL
 /cqZSpv486qzqeasuJ6OCvAFnXDqDdxJVoaRn7iJkhM/OQkA82QB8TkJG0bygMgTvXOz
 jPDJEa+5i6W85M9VHgarMEc1KZe8hZ318PopDW/nhRFCyLPb9gP4uBcGMtP1VVMPM0iF
 mT9QLAvMGORj27ywzK4yIcJSUM7IZhEoEdXhsPTZO9p3+tcgFsczDeuv3k7aM6Z4Y/G6
 F/3NDNQUCtuug7hFwsYoBELUSIA6KSgeEEZedKAm4xXLguZ4CXFLR8pchF0ieXnMGhBt
 yBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xuAPUpX6Hhq84IfvJMkUkq8FBAkzzJSj3GQD8rT6J7c=;
 b=pDisY4yw3fDIFJxoB/lKJ6cYrsERGFvjl7EmBtWBhwMSzieQrVlNDr5kyISInbtr30
 vo8nWJ6g+pOkhCv9CIyGZXgs3UeIRYlDwojft2xsDwNpSOdcHyrC3wLz9JzFSb5LHzKm
 BrJaaeEjpWWWivj6JQqmyGDm3BxfGY4RyFl8GWAJHm26jmeHl4kxjIMXUMFde9EJLFI8
 AEUa5G85wd8GKYzL1QSYwME+e2UG3jNkqJAo/fxXTPtVYUvewNDQIgwmZ6LveN9pj5Ln
 jx/ItgM1fUKyhoUetsYxcS/c3DZs/6EyOv5s+1vTmetZRHs3v3unYa0n7VIR9zNnmMNW
 LaZQ==
X-Gm-Message-State: AOAM532JSWxd/SeILaSErSfpqPFddX5z9mbQoL1q/gcTkz+jTr0D2MJo
 wkJczx/QM/ApAPFSmb86mQcnOwbQaVs=
X-Google-Smtp-Source: ABdhPJyZYNcS22iDlW+KchgDwaXEiOQmgqrTnTbdJd1Q5SI4iNWFWkMm1eFK87/6WMd2A2/Aj+E5RQ==
X-Received: by 2002:aa7:d388:: with SMTP id x8mr5146214edq.338.1623922320324; 
 Thu, 17 Jun 2021 02:32:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/45] configure: map x32 to cpu_family x86_64 for meson
Date: Thu, 17 Jun 2021 11:31:22 +0200
Message-Id: <20210617093134.900014-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: David Michael <fedora.dm0@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Michael <fedora.dm0@gmail.com>

The meson.build file defines supported_cpus which does not contain
x32, and x32 is not one of meson's stable built-in values:
https://mesonbuild.com/Reference-tables.html#cpu-families

Signed-off-by: David Michael <fedora.dm0@gmail.com>
Message-Id: <878s3jrzm0.fsf@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 8dcb9965b2..4478f3889a 100755
--- a/configure
+++ b/configure
@@ -6384,7 +6384,7 @@ if test "$skip_meson" = no; then
         i386)
             echo "cpu_family = 'x86'" >> $cross
             ;;
-        x86_64)
+        x86_64|x32)
             echo "cpu_family = 'x86_64'" >> $cross
             ;;
         ppc64le)
-- 
2.31.1



