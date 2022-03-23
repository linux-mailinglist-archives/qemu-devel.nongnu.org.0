Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967F04E51F7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:13:57 +0100 (CET)
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzsC-0004w7-Fc
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:13:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz9A-000200-QM
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:25 -0400
Received: from [2a00:1450:4864:20::42e] (port=34711
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz99-000650-Cd
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:24 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m30so1676820wrb.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGuGTUMcrHWD5fZbjeenyrXuekOw3qU1F/rK5dradzM=;
 b=EYZBL5OZnfr+PQrwx7hUyiL5F3cEDKc9ejGFzlOemnngW3aFKqdbaJTpi/szUjHywk
 hkIqP50nYLlcNL6RNE6xTNRjOtQz2G5Cezxlu1we4SDqEAjdJ7WyOHTy1KBFtxTPEc5d
 3PLW4TVh4rbW75Exork1AXadnixPZNHv8y7J46J/eugeoQG8b3BX8gZA3oKRS4iuHtf1
 LhqSkRg0xGSMGyOA/gEIZcwyhPX8HmZLqMLIg6CwDdQYVVz6pB+NwnrR0nf4bu1soTBl
 5QDqiXGbsURGwnzLSqCIPj/Rr+VPZA/VqxEyzBlZe//H9/VLqmSLlrOdzCWPM9AxxzO8
 +9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGuGTUMcrHWD5fZbjeenyrXuekOw3qU1F/rK5dradzM=;
 b=T1EbJprycrBm5ulKdb/o8ekDhy1phWOrkR4w5ypm0EGL7RCx+uT3iXeOciU+EzOw+O
 DTM+t+YUBLf0hk2glCoWMFtO2kYyQQzH9ECUB5XYMNYAP2e7MC4aHk/lYCdYLnWprHNb
 //WSnM4IWyVny2mf66JhacYSCfAX1OMf4q9UqcTC0j/i6rd2BauZ7HyhVX0Fw5eAdgap
 64xlfmNBFF+CVb/kX8TyPNV1xD6pnjoafCTfrMwol4xkMfVmhegaZVYxW70h+nRNRcfL
 AZJ4Wqxelx4jfAWsIuzE66Txywhx9FJjgKYalWzClw/5fXDzjWGpMsaHQKb3+GDqZt0g
 c0ug==
X-Gm-Message-State: AOAM532qVRpo1+xyNhAsTc51e93+WOPCbyJvX6F+R8Scc201KXsZ81CM
 lKwdCfYnEfGs1sJ7zHQilglJag==
X-Google-Smtp-Source: ABdhPJxHWxLmJnvL48Ar6DJBceQ026TP4P6GEdYKggBv4qQubIiMIZdPKB3Z5h2TNKYfx8VFTSlUOQ==
X-Received: by 2002:a5d:40c8:0:b0:205:2a3b:c2c with SMTP id
 b8-20020a5d40c8000000b002052a3b0c2cmr6692149wrq.13.1648034842126; 
 Wed, 23 Mar 2022 04:27:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d6c6f000000b002040552e88esm11655757wrz.29.2022.03.23.04.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:27:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1BA711FFC0;
 Wed, 23 Mar 2022 11:27:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 8/8] docs/tcg-plugins: document QEMU_PLUGIN behaviour
Date: Wed, 23 Mar 2022 11:27:11 +0000
Message-Id: <20220323112711.440376-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323112711.440376-1-alex.bennee@linaro.org>
References: <20220323112711.440376-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Christoph Muellner <cmuellner@linux.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christoph Muellner <cmuellner@linux.com>

QEMU plugins can be loaded via command line arguments or via
the QEMU_PLUGIN environment variable. Currently, only the first method
is documented. Let's document QEMU_PLUGIN.

As drive-by cleanup, this patch fixes the path to the plugins
in the same section of the documentation.

Signed-off-by: Christoph Muellner <cmuellner@linux.com>
Message-Id: <20220316181412.1550044-1-cmuellner@linux.com>
[AJB: fixed some minor typos]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index f93ef4fe52..a7cc44aa20 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -27,13 +27,18 @@ Once built a program can be run with multiple plugins loaded each with
 their own arguments::
 
   $QEMU $OTHER_QEMU_ARGS \
-      -plugin tests/plugin/libhowvec.so,inline=on,count=hint \
-      -plugin tests/plugin/libhotblocks.so
+      -plugin contrib/plugin/libhowvec.so,inline=on,count=hint \
+      -plugin contrib/plugin/libhotblocks.so
 
 Arguments are plugin specific and can be used to modify their
 behaviour. In this case the howvec plugin is being asked to use inline
 ops to count and break down the hint instructions by type.
 
+Linux user-mode emulation also evaluates the environment variable
+``QEMU_PLUGIN``::
+
+  QEMU_PLUGIN="file=contrib/plugins/libhowvec.so,inline=on,count=hint" $QEMU
+
 Writing plugins
 ---------------
 
-- 
2.30.2


