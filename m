Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C1A2ED156
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:05:30 +0100 (CET)
Received: from localhost ([::1]:57924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVur-0006tH-3A
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqQ-0003xD-AR
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:54 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqK-0006uu-JY
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:51 -0500
Received: by mail-ed1-x529.google.com with SMTP id y24so7798238edt.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HG328Qi5HtWYAOIyt/2mCFxalYOZsd7TEHBf+7m5bas=;
 b=lUFDBMLUCiNJ4CB/rk6miCovctQXBgyTBNP+ZLS5V6N/AXp4n17D9MS2DmG+7MgdMz
 C8/WSZHrxzthSo3kQZ5WEamAx5iHQ1prNBl6fiLRsjm8GI4idSFXNsz64HA7ui2bGAI8
 pJ9rm9Bu1osjsb01jiORU8SF4xZZqLhzlN6dX5pw6AC79iqepcSEmaLP5TJ6r3G1hxQs
 2Bklf7aJZCXsXwJfL/Gf4QNYgmbTsW/vQCbVM1oLqxHb8UD9ZbGcGrub0jgXqzAQsFIa
 uSV3JpqhRWYoxgkdn1/kxft91ZeVD2Zk3tZF3d4tmNkyVqMk3+NvbH3gfTQtd3CG15gh
 TLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HG328Qi5HtWYAOIyt/2mCFxalYOZsd7TEHBf+7m5bas=;
 b=BfuwWvnLIj901JeiyzLiHBCVu8BrRkWVni9zw8fESEBlhFicG7fBEjIRt8d7zQIIsz
 7SwYKXFAzukDHD5venxkRyMm2A81sI/3RAZgu7v5SkbQvTWbNqXUpdrok8zk3OcIq0td
 eoxvo8WGrLWKIRStlz7NrXP7/M/0XVy3dIuh6SE96ge8YJ+xq6yZI4JNFT0YVm3XFoLJ
 tguBYuTtMCvBEjPFRVy8B8ZxGay2hB3h+J9B7ls2HO8PKv8oIa7J0VMqtohkG+CCd11u
 RBbLB49mW14tN1oqA3XlwmIBDZJKi6rW0OGvQU6IsLf0mA3pTHN/Ylgv7Y4jBR3x4jbr
 zn8A==
X-Gm-Message-State: AOAM533rvUQE3VpybLzDef1kNFDr0SS51SnxH/GNgLyQNmrUfrSIpRl2
 Ixsbyn0oUZI/KhSqnVEYuzGYl5WezFOrGA==
X-Google-Smtp-Source: ABdhPJyPI65kQt6FQdKa1Ckcg0FRbnzf/zrlQvr81lNAtt2zbJrPUBDgSSTiN4uvkYR42E+Zkd3wxQ==
X-Received: by 2002:aa7:d6d8:: with SMTP id x24mr1849744edr.105.1610028043513; 
 Thu, 07 Jan 2021 06:00:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oq27sm2438523ejb.108.2021.01.07.06.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 06:00:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] cocoa: do not enable coreaudio automatically
Date: Thu,  7 Jan 2021 15:00:33 +0100
Message-Id: <20210107140039.467969-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107140039.467969-1-pbonzini@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: alex.bennee@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the automagic connection between --enable-cocoa
and enabling coreaudio in audio_drv_list.  It can be
overridden anyway just by placing --enable-cocoa before
--audio-drv-list.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 81801a6fe0..2dd772a60c 100755
--- a/configure
+++ b/configure
@@ -1149,9 +1149,7 @@ for opt do
   ;;
   --disable-cocoa) cocoa="disabled"
   ;;
-  --enable-cocoa)
-      cocoa="enabled" ;
-      audio_drv_list="coreaudio $(echo $audio_drv_list | sed s,coreaudio,,g)"
+  --enable-cocoa) cocoa="enabled"
   ;;
   --disable-system) softmmu="no"
   ;;
-- 
2.29.2



