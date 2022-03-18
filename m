Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC504DDAAF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:38:32 +0100 (CET)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCoJ-00076f-Ey
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:38:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZn-00071l-Sw
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:31 -0400
Received: from [2a00:1450:4864:20::42c] (port=39834
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZm-0002Di-Az
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:31 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j18so2117043wrd.6
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h4aEzyIE/QZgB0XPdQFg8Zi6U0RcdXK16fZmuwh6B20=;
 b=r7BarEy1LXHlZWskteBMkhmNEatiPXv1ynRcSPvB3Hb5DwjymJKFIGqn4N6DS8PdiQ
 PPc7KofNmTdHOXw+fwlbj/JNqOZot8zkNe1kBnIlGj4F/EPEcQblSatmfwWhbmp9XHfK
 tdBFRMpOLF3dbBSWg1Sb8NP5fb4KaZPqHsaxzmmr8JVwcv7Gr1z/XWFSMTrhZ0BQFG3M
 nylDIkMmsP7EuP798yJQ72pK64ayomEuC+o509aXwpEIT28IoXDrLQpqP+rnJ02typtY
 m6Lr5TxfyfF7e3S3MoPifL9JZBBsepvvmibsaWycrgpsBNtq+9JRIXXNuN/6en5qoPT1
 6qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h4aEzyIE/QZgB0XPdQFg8Zi6U0RcdXK16fZmuwh6B20=;
 b=8OZPFeH8tzc0LjEeMuFU2LepYZxkNj3VWVcG2v40cNOigjDmIa+xh6VOYQVrYfNq70
 Ne7GI1Uywl2qiJV4V+HwZQmaMEbriX5OBp9Try6WPRigc39uahNJjFdz5bmlWNcR2IXK
 ZpaFML0WS0eShVMYE+EnN8mnt14ZfXB++6fiCmcvqcWdr95orl55tJ1WMzYlCgOYzQ2n
 sv5QCANUxhXbtrNlIfSM0bCttJNsX+mzfQExxHfYA+uTHfXSIO/LkG/Q/0gSExV32AKE
 WPCFsKSf6jW/xYadItwOQWLvVF7GgTqnuH2PswX3bgqFkQ4A/G6nA5C7cfev7kmiC77J
 NZng==
X-Gm-Message-State: AOAM532LRwHY+IQwd8aSQBvjL0OjN8rgtkm53bFF5nPCGK4/yo6nbtd9
 4mWSsO/8qg3aU9DrJCgDyd+xxTsKEujlLQ==
X-Google-Smtp-Source: ABdhPJzmhne4EuLOFEneUHtOMJRCfT73xyPh8WMY0O72gdKFkmCtTf3TRD5W0CcJh2vUQ08a3Ek3Mw==
X-Received: by 2002:adf:82b2:0:b0:203:f34d:dff with SMTP id
 47-20020adf82b2000000b00203f34d0dffmr3757159wrc.661.1647609809062; 
 Fri, 18 Mar 2022 06:23:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] hw/i386/acpi-build: Avoid 'sun' identifier
Date: Fri, 18 Mar 2022 13:23:05 +0000
Message-Id: <20220318132306.3254960-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Deason <adeason@sinenomine.net>

On Solaris, 'sun' is #define'd to 1, which causes errors if a variable
is named 'sun'. Slightly change the name of the var for the Slot User
Number so we can build on Solaris.

Reviewed-by: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Andrew Deason <adeason@sinenomine.net>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20220316035227.3702-3-adeason@sinenomine.net
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4ad4d7286c8..dcf6ece3d04 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -583,7 +583,7 @@ Aml *aml_pci_device_dsm(void)
     Aml *bnum = aml_arg(4);
     Aml *func = aml_arg(2);
     Aml *rev = aml_arg(1);
-    Aml *sun = aml_arg(5);
+    Aml *sunum = aml_arg(5);
 
     method = aml_method("PDSM", 6, AML_SERIALIZED);
 
@@ -594,7 +594,7 @@ Aml *aml_pci_device_dsm(void)
     UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
     ifctx = aml_if(aml_equal(aml_arg(0), UUID));
     {
-        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sun), acpi_index));
+        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
         ifctx1 = aml_if(aml_equal(func, zero));
         {
             uint8_t byte_list[1];
-- 
2.25.1


