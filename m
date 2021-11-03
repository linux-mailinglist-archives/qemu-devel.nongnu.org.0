Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9514446B6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:11:16 +0100 (CET)
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJn9-00086r-DU
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiS-0004B9-OF
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiQ-0003xV-DT
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id d5so4651539wrc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHcYTC5lNCjrZHkm+0rV2h3yz1/+QOqms6mqHEoCWSE=;
 b=Xxj0EVrbIWFh3dwOXMXBLs4amXEhGGfsGWYMZOke2otHIO2efFfQxpHz2NXKqOZAcW
 psJAm+aqLddTTqLCOoTkV65UY2WKs1SzFaccUnPVUJnOzYJ9Pzk2AqQvlS/nWcuxXeWC
 ycftZBbmJ2jjglqstwMfnu3bANBIh4APE22W+lybcmC680ZEYj62EcpQfp5xbzw5Cqu3
 o6RX/DPGk3kkMrhxXWyahkRIFv6SvA2iZHqqQ8gHyBTzFiKlfJx4ME6el7gOxcXJo6ZJ
 Bcjeb1pY6J+QKWuN+DBoXy8Rw9u9lwvrrqsGoFyL6lHMs1p09IwQHmelTTSDcX/3azwv
 hR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHcYTC5lNCjrZHkm+0rV2h3yz1/+QOqms6mqHEoCWSE=;
 b=0Pw+RJooDcoR9epb9hXdSTHm4cINZ4e+uzS2i6N6vX5vNImHY05cCvYW8TRJE0EHpQ
 w9+ThsP/wS1XcbWMwOxaWuNKFmmlmoJTgfQTHYBp5WC6tdHMBjHDWtoCClNQzXyIVjMT
 EdpNKbpLdvCWRKs1TwLgjEm+aXIgIy+2j9+/+7qZtnWcViVcYnNjKmLit089EXG0Wuqf
 eI81IzX4AZ9TxEnipdphcCST6sa+Wlq0+shYBXml3D3GWB++ZoNtyNQoRxEBRsAY2nTD
 Ylp2fpgFnsj3SN9vQgT2RAElS9hea50rWRHRU9liJ+DQl/Tt4NNf6rYLBDLHW6AnKR4k
 Orpw==
X-Gm-Message-State: AOAM533BU5k3eXAP/jkg5ZffdUVy2oftBeSnJ34lIZK2WkWVdAGHM13s
 swLQ/VMlYzoYuvcGIYs9hzJ/CnVAE6XYdg==
X-Google-Smtp-Source: ABdhPJwgzvxg415c69XvUZh0zae7qRLuwDt8IawTNa4Zf7kyQxib3o/SLYliHmMxUeUZOLi26AtngA==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr40342135wrs.26.1635959181044; 
 Wed, 03 Nov 2021 10:06:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l7sm3449809wry.86.2021.11.03.10.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:06:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A840C1FFAC;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/21] docs/tcg-plugins: add L2 arguments to cache docs
Date: Wed,  3 Nov 2021 17:05:51 +0000
Message-Id: <20211103170558.717981-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

cache plugin now allows optional L2 per-core cache emulation that can be
configured through plugin arguments, this commit adds this functionality
to the docs.

While I'm at it, I editted the bullet point for cache plugin to say:
    contrib/plugins/cache.c
instead of
    contrib/plugins/cache
to match other plugins.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210810134844.166490-6-ma.mandourr@gmail.com>
Message-Id: <20211026102234.3961636-18-alex.bennee@linaro.org>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 842ae01a4c..59a7d838be 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -361,8 +361,9 @@ which will output an execution trace following this structure::
 
 - contrib/plugins/cache.c
 
-Cache modelling plugin that measures the performance of a given cache
-configuration when a given working set is run::
+Cache modelling plugin that measures the performance of a given L1 cache
+configuration, and optionally a unified L2 per-core cache when a given working
+set is run::
 
     qemu-x86_64 -plugin ./contrib/plugins/libcache.so \
       -d plugin -D cache.log ./tests/tcg/x86_64-linux-user/float_convs
@@ -420,3 +421,18 @@ The plugin has a number of arguments, all of them are optional:
   Sets the number of cores for which we maintain separate icache and dcache.
   (default: for linux-user, N = 1, for full system emulation: N = cores
   available to guest)
+
+  * l2=on
+
+  Simulates a unified L2 cache (stores blocks for both instructions and data)
+  using the default L2 configuration (cache size = 2MB, associativity = 16-way,
+  block size = 64B).
+
+  * l2cachesize=N
+  * l2blksize=B
+  * l2assoc=A
+
+  L2 cache configuration arguments. They specify the cache size, block size, and
+  associativity of the L2 cache, respectively. Setting any of the L2
+  configuration arguments implies ``l2=on``.
+  (default: N = 2097152 (2MB), B = 64, A = 16)
-- 
2.30.2


