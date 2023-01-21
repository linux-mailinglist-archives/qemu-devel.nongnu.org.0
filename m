Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E3A67671D
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 16:22:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJFex-00022q-TF; Sat, 21 Jan 2023 10:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFev-00022K-SG; Sat, 21 Jan 2023 10:19:57 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFeu-0005ep-EM; Sat, 21 Jan 2023 10:19:57 -0500
Received: by mail-ej1-x62e.google.com with SMTP id v6so20785690ejg.6;
 Sat, 21 Jan 2023 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+IlR0N13hXD5WjeVdS0Wm7n5FtF6VTAAQGcvRRrtGc=;
 b=f872WOrCop+PJIvwlufjzhoP5GFV/V8wLnRHjsSbMi5RQJOx0CmVbBo0xyseq8r9kO
 KgxKp4gn9/kS+1wvhdzUBrg/M59f/tPRjZQtrYL0UvLX1vB7k1GtapGdOZRD6FFJjBwg
 9JS4Qsg1QcbVD4Tfmkz7lh10FOxqHv1SCI2zi8AsBAE65LTnN70mwZ+u12f170OJt94Y
 6zaoTGAfsr1fbuNiKXWRrWLtFSuD69BDohUlQwcX6yatvxvgXAMDsb7ANejIpcY5xYos
 TJh3O9ylWspb/xgL9skzVDZUAtw/CZ3ZFdef7px/nbhxpUecN7Uq2kKvya7D7UONW3/x
 nQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+IlR0N13hXD5WjeVdS0Wm7n5FtF6VTAAQGcvRRrtGc=;
 b=knsMhDPuEKgrirWXMXaBGN2nJFB9x1JkQPMqihIMZA3Nak34oP2CZI0kn4jWUam3Lg
 THEJbItYXHMBhCImH4ofceOBKk+fb7gDbMO6/8fIHEP1EHqGGNiGRwCsTOeZYfTRYOdN
 QFreHDUJoxMrSeEltSoSk5R+pPy5Y3x2S7FjSwZUNaBX/oSY5s0Fz429BQvKQiU8+iEh
 4ihxGpbz39cxULXQUy8Z3KRSlO5LZ+bDMZeMqqnV3dzc5B2OxS59HrVCoYrnTEPoldtH
 yxDHEnevRl720qK8sRpZsFdnigIyM5rTGGFbFC9ChPc57tI1mTIddEpiLZU3IrgIbMV8
 pSJg==
X-Gm-Message-State: AFqh2krsUMN8zCAoTfnMIknCOuLvolI5mXTdMn/azdFpLvMeNGaQnlcL
 lgVL80uOf5qIq25gsyQz4PMa7D/SlDWNUQ==
X-Google-Smtp-Source: AMrXdXvHsBP9t3hftC/jXuRRqWyhkVitVnvOyAUbsxwkWzkiKbJC2WPYe3d+EHcJuYNS430RCDBpOg==
X-Received: by 2002:a17:906:80d8:b0:871:e9a0:ebab with SMTP id
 a24-20020a17090680d800b00871e9a0ebabmr19110212ejx.31.1674314394610; 
 Sat, 21 Jan 2023 07:19:54 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906101400b0085ff05d5dbdsm14162567ejm.173.2023.01.21.07.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 07:19:54 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 1/7] hw/i386/acpi-build: Remove unused attributes
Date: Sat, 21 Jan 2023 16:19:35 +0100
Message-Id: <20230121151941.24120-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121151941.24120-1-shentey@gmail.com>
References: <20230121151941.24120-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Ammends commit 3db119da7915 'pc: acpi: switch to AML API composed DSDT'.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 127c4e2d50..8c333973f9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -117,8 +117,6 @@ typedef struct AcpiMiscInfo {
 #ifdef CONFIG_TPM
     TPMVersion tpm_version;
 #endif
-    const unsigned char *dsdt_code;
-    unsigned dsdt_size;
 } AcpiMiscInfo;
 
 typedef struct FwCfgTPMConfig {
-- 
2.39.1


