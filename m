Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A761404D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:01:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcqd-00054P-8a; Mon, 31 Oct 2022 18:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcpi-00053D-Ce
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:00:38 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcpf-0000pF-SY
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:00:37 -0400
Received: by mail-io1-xd33.google.com with SMTP id p184so10913188iof.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9OVsqAmyqPbTHmE3w0Zkzp7OCwHypnqZuwBCZ2+0TpM=;
 b=rFgJ/IJeWfeTZKMUyHZrGxNOakgKpN5pRpCNlnHiJlUXGBSwh9CD7PXXieM5tZqtDe
 DA6ykZoS2mrwcRA1X6h6VLV+8CzeY2fr8kgYaOubsPMWYJgabcvUp2EB/n8siH5wbBU4
 dYN7jZ+7/2UAxKzul6CaIFQc+PTWdVxr+FvPwlu5CHEmvy5TRBTU5XDca5CJnAISON66
 O75rmy8DOqDYhP+Ugv/qgX3FfJQ4ttm5KSSY/X/S7iDftk6C86+/Fxn3sNtJQULakIlI
 Zf/BeiapkaGhnmb4UFHrr7Rtp4fipO8A8xjF0kpPLAf3lVSxrE7ubLKcIMro+WolGiTh
 T5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9OVsqAmyqPbTHmE3w0Zkzp7OCwHypnqZuwBCZ2+0TpM=;
 b=DEYhYxfv6RL6jmZJk4v8VyR8y6nk6pYxBx3P4iVFP6lxmBKmGdSlsa5JEt/WnAQE1u
 dVHrJOyswgskQoREEUCHYJZmRuNkp2MXCYQVN7QaTQOZzaQv3vNU5L8OSq1reozn5Ry2
 MuT6h29QRRJt89MBhD5Upfu4p9NzEsqp9APXyka358wOo48zMfJug9QESgke/0UsqehJ
 amfPdH8DoGbIdqNnolc+sC2rhHt05KB+yGlLa7B0HrlvxPOMVrUm3//PN3ae4S2+SfPH
 swpi/t4jzbh1gp0IGq8uvoTB5YuQVMCgD5eUM1NSYieX5m3N9HogatvDI2lsBTZMh30m
 JQ3w==
X-Gm-Message-State: ACrzQf1gXSbBaVt7/m1fgE6sQgcJE2f4Uedbkv8o1y7VGj/IEwJvf7q3
 OlbBQc8TgfviPtHGsfySGDW4X7ij1/+xWg==
X-Google-Smtp-Source: AMsMyM5J2wa1qmd9XNGd0CQu58U6JVtlcDMEp/mGtNuF4oLNVO6hRVsMWy2fZ2kAZeQifMnkv4hYBQ==
X-Received: by 2002:a05:6602:1491:b0:6d2:c228:a157 with SMTP id
 a17-20020a056602149100b006d2c228a157mr1105220iow.116.1667253634691; 
 Mon, 31 Oct 2022 15:00:34 -0700 (PDT)
Received: from stoup.. ([172.58.176.58]) by smtp.gmail.com with ESMTPSA id
 d6-20020a926806000000b002f9537986f3sm2916853ilc.24.2022.10.31.15.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:00:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Icenowy Zheng <uwu@icenowy.me>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 04/13] tcg/tci: fix logic error when registering helpers via
 FFI
Date: Tue,  1 Nov 2022 09:00:15 +1100
Message-Id: <20221031220020.414768-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031215723.414467-1-richard.henderson@linaro.org>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Icenowy Zheng <uwu@icenowy.me>

When registering helpers via FFI for TCI, the inner loop that iterates
parameters of the helper reuses (and thus pollutes) the same variable
used by the outer loop that iterates all helpers, thus made some helpers
unregistered.

Fix this logic error by using a dedicated temporary variable for the
inner loop.

Fixes: 22f15579fa ("tcg: Build ffi data structures for helpers")
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Message-Id: <20221028072145.1593205-1-uwu@icenowy.me>
[rth: Move declaration of j to the for loop itself]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c9e664ee31..b6c46b7e25 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -634,9 +634,9 @@ static void tcg_context_init(unsigned max_cpus)
 
         if (nargs != 0) {
             ca->cif.arg_types = ca->args;
-            for (i = 0; i < nargs; ++i) {
-                int typecode = extract32(typemask, (i + 1) * 3, 3);
-                ca->args[i] = typecode_to_ffi[typecode];
+            for (int j = 0; j < nargs; ++j) {
+                int typecode = extract32(typemask, (j + 1) * 3, 3);
+                ca->args[j] = typecode_to_ffi[typecode];
             }
         }
 
-- 
2.34.1


