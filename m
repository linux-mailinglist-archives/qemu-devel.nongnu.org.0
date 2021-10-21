Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CD343665F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:35:17 +0200 (CEST)
Received: from localhost ([::1]:54172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mda68-0003sA-AD
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx3-000082-AR
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:53 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZwx-0002IF-9y
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:52 -0400
Received: by mail-pj1-x1032.google.com with SMTP id om14so744146pjb.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XmPiuN7VGWQFXG0wvR4WMwlqOuQOorNdUMgDKtUti9Y=;
 b=YGjkYKoWc+KgioiDALCOk3ZggXpMrkMSC037IzEsjiCyHvBgN3KzURuuZUrDWYqeTK
 Bo72Wpp2FbK3kIf1MiJELRp8dGOOkCz8d53ms2ySd4Zn2o5RICt1tfksIOTV2LQLklbN
 0pflAraOaL7oZPr0Fb1JXWR41kpWE0SoePyRwChXfyRPrYm5ZP2Y5fY2kUly0sLuRV5s
 x8Xq/rdsQf5XWSCi6QOIazLbUgoMlB+mjuvGxYoSyy7mTIcUSTqZsIT7j2qVf64xUXYE
 h7xusDKdfbdUQNRDCWEXNghXdJS1tdg+iPdRzeHJocRsSPwMW6uSazKFYfSWOsmExDhx
 O5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XmPiuN7VGWQFXG0wvR4WMwlqOuQOorNdUMgDKtUti9Y=;
 b=3UxvmNbp46PccnDs6VaTG3fFFCF+d127d1GyGFzARRgjLfvGEqHR75V/dn7LlNj7B2
 8LAd4HaWkEI6/cej5hCXpPtk5hQXW9I8caNX/B3KO+b1tiEGzDNVTxNBoARF8zHPp4va
 wuAbuRYDIj9e7Fk8vl5ceZN1I3lY/JD8zseCMJh+G6Z3MvfYgzYHl1p+brMgCmQpQGks
 vo9BhUnsXJRPfA0JMCSz0DEs7haBTTemA0kc4VL99Y+GD5epYxuejYdBgB1hn97jFW+U
 JL8xhczK12Lm20sVC90V8JwQuVap1yGSJF5ReL5x8TNg03cuGb2Pp32Oi2ME8avjaBQz
 MUVw==
X-Gm-Message-State: AOAM532x+oS2mu3WT/+MMEOl7gRYZD4fc7V7EXFwV95m59884kZkLGoU
 Gv78dU0zwdgR+ypp5x6UVBUzxrOQhWAweg==
X-Google-Smtp-Source: ABdhPJy4JVkj4OJqltS3ENP8/V60RjD9ugJjyE4lUEAa1EagZ0kOOrf2cdGR79PdZ+UDcs3S1F3I2g==
X-Received: by 2002:a17:902:ce85:b0:13f:9678:ecd2 with SMTP id
 f5-20020a170902ce8500b0013f9678ecd2mr5870808plg.39.1634829945975; 
 Thu, 21 Oct 2021 08:25:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/19] roms/edk2: Only init brotli submodule to build BaseTools
Date: Thu, 21 Oct 2021 08:25:27 -0700
Message-Id: <20211021152541.781175-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since EDK2 BaseTools only require the brotli submodule,
we don't need to initialize other submodules to build it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20211018105816.2663195-2-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 roms/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/roms/Makefile b/roms/Makefile
index eeb5970348..b967b53bb7 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -143,7 +143,8 @@ build-efi-roms: build-pxe-roms
 #    efirom
 #
 edk2-basetools:
-	cd edk2/BaseTools && git submodule update --init --force
+	cd edk2/BaseTools && git submodule update --init --force \
+		Source/C/BrotliCompress/brotli
 	$(MAKE) -C edk2/BaseTools \
 		PYTHON_COMMAND=$${EDK2_PYTHON_COMMAND:-python3} \
 		EXTRA_OPTFLAGS='$(EDK2_BASETOOLS_OPTFLAGS)' \
-- 
2.25.1


