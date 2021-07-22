Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D943D26F6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:42:58 +0200 (CEST)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aqV-0006l6-7K
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akN-0000g7-Q3
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:28 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akL-0002nj-0d
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:26 -0400
Received: by mail-ej1-x635.google.com with SMTP id dt7so8958885ejc.12
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r16ePz42dOqHAxVE1WpwwDfKzU3eDPUzvyNj7r1Wfl4=;
 b=F9WFU8VCYSmIGqLQLDoHRX5e+0NHf2U+S9Bih3ATseOndy/rGFggovc93xDkJl/kVN
 RV/5+DAhtoe20ccSQogk/BewXsTMwbJKgbVOY5gEe5RRsNhdX2/MN2cWkQwmiZLWK9kZ
 R59EyRgGLTEqzChisqONaTFBnzd/jnds5ESX/BelMFt2LpKxflYthuwdDkFTqf35uiC1
 vbKax63y8CLFytVmwqu7B29VT+LOxZxWsB9RWmK8Nd8XttD7KY7yqMrT9jt8+pctuezK
 FjHMz5hweg/v8x+cSTcAZZATH+VcU3kyBkhYAHapW9ZhzOhHgXIbOaWI7bgLVVxYrLhC
 wWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r16ePz42dOqHAxVE1WpwwDfKzU3eDPUzvyNj7r1Wfl4=;
 b=UTZiRrnJLD7Y3MI5p/bO+8dkhltHGx6mZRDymiqay5F88bpGgHhwWXYwN0CHVxFASM
 TA1XSXRF2LGB0H06Gekrq0LD3jEdohs68seJNQiXFLvH/Vaxo4I6UfJ9o3wpGDH3B0rw
 7ym8RYRXv9EoaeyUIrcj/fhDcnZrl1d82rjPscTtUQ1K1FIxMjmZkPq0Y/M29FYN3BOf
 WP+8Y9gcOUICxV1L55shxHN7+knetMcW30/xyLDoiqTUSuRvK259Kcc5+9SUHNXSp+Ee
 ENvT3sIExGZgppLTT53R4xoS2YgKAmoy4ezbcY4XCxbE5Jt51lS6NnDpdp4xRdkSs/n4
 /MYw==
X-Gm-Message-State: AOAM532cltunQdLbhOU66AxSubxi72QSswwKazNQNSmYakjLKNUMfQD9
 uKZSFGodN6ctgoe6tWw3uFHclJyZckv/Rg==
X-Google-Smtp-Source: ABdhPJx7sZoj/1EWo0x2RpTXVYnpALhFGG1MT2Gps1mak5vSJLDZGu0g11Iec8/h3zXHo5lbBoBItw==
X-Received: by 2002:a17:906:9fc1:: with SMTP id
 hj1mr452851ejc.103.1626968183687; 
 Thu, 22 Jul 2021 08:36:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/15] configure: Fix the default setting of the "xen" feature
Date: Thu, 22 Jul 2021 17:36:11 +0200
Message-Id: <20210722153612.955537-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The "xen" variable should either contain "enabled", "disabled" or
nothing (for auto detection). But when the user currently runs the
configure script with --without-default-features, it gets set to
"no" instead. This does not work as expected, the feature will still
be enabled if the Xen headers are present. Thus set the variable
to "disabled" instead if default_feature switch has been set.

Reported-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210713093155.677589-4-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 468aac58e2..40fa8cc26e 100755
--- a/configure
+++ b/configure
@@ -311,7 +311,7 @@ vnc_sasl="auto"
 vnc_jpeg="auto"
 vnc_png="auto"
 xkbcommon="auto"
-xen="$default_feature"
+xen=${default_feature:+disabled}
 xen_ctrl_version="$default_feature"
 xen_pci_passthrough="auto"
 linux_aio="$default_feature"
-- 
2.31.1



