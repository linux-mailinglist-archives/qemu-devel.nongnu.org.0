Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A0F308868
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:43:12 +0100 (CET)
Received: from localhost ([::1]:53776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SBD-0001tm-WD
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnY-0004nS-Tq
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:45 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnU-00065C-3i
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:41 -0500
Received: by mail-ed1-x52e.google.com with SMTP id f1so10085547edr.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n0oc9vUhZzR8ZVs9lZClM6fTo+wKdeM1A7PGawhfO4U=;
 b=jAiKzL01gYAnzbn2ajF6jqUyiOBVCF7Ktr2apv45aTSoD9Zshx7pgfvXXbqThwro9z
 Bmty1G3WRECnf+CHbUsDra3p+6+EcR/pMFj7bnl3C/f3Ksw6dkG1mtPrCDjNBYAtKiR+
 LnK5akRa4viTaKTDLGISu31mZWsG3fUErRkuzqOmHOlrVOcjPi1CRwTgNHTof458Y//R
 TbohXIfhjGRPP4S+sHGkuwtdi4Q4kV/euXZdubMWj/mjI+gZhYY62fg+VVkY0W4U+JaG
 l3qQGJfkA6XsAR3KaorpvdD0lsirx+fHbFQL/9yOfwkJNUbfuWx5uW49vBKoK3IImO9e
 22eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n0oc9vUhZzR8ZVs9lZClM6fTo+wKdeM1A7PGawhfO4U=;
 b=mUhqVPM9DAM3fDMzqQNTcgLLdxtZLXFQ15df+DhoD3Y4H4AaXvOXM2v0vZUnmp/5mN
 Fyo3yN8QMwU5qT6LIEYaQ12HYD0JkFaTNIPL5HXBQe2zJ+v8t8ZwsynPqMYbvbKSxlR0
 /EgfJRdcYNWHLa7WIPs5moSYxeUM5NtDF8szYMXBBV8SUsb7PRNIrCWVq4Cpw2NEqZl7
 slav2+j1wMc7+viWQ2Rh120R2fpn1LBqI/KyqbGrN8IL3CThUMEStL/eBDAgoxpL7k0H
 ohu/4gLGr1WcOKSEwiOu4G8UWtQyLNVanKL0x5yKppA/GN7BS4AK/gPRGIF5iPegTT6P
 O6Og==
X-Gm-Message-State: AOAM533SydXxdbGKbL7GvEQO3+qlO7QjMQklCaehC3mFLGCxsUG9n0kW
 QjuMhLIhaFSoMYFJ356WVXSl58FnZ0RX5A==
X-Google-Smtp-Source: ABdhPJxRSkCapsCJNRnHxuyB3CudS1P/1Rst4pmlQAT70QtVqc9jAcfRBZTmNFzxgBJIQvnct7nXhA==
X-Received: by 2002:aa7:c84b:: with SMTP id g11mr4411182edt.169.1611919118969; 
 Fri, 29 Jan 2021 03:18:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/36] pc-bios/meson: Only install EDK2 blob firmwares with
 system emulation
Date: Fri, 29 Jan 2021 12:18:04 +0100
Message-Id: <20210129111814.566629-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index af95c5d1f1..f2b32598af 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -12,6 +12,7 @@ if install_edk2_blobs
 
   foreach f : fds
     custom_target(f,
+                  build_by_default: have_system,
                   output: f,
                   input: '@0@.bz2'.format(f),
                   capture: true,
-- 
2.29.2



