Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BF247E2B7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:55:11 +0100 (CET)
Received: from localhost ([::1]:45340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mgg-0001Gl-5w
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:55:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdI-0004G2-Cg
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:40 -0500
Received: from [2a00:1450:4864:20::42f] (port=33780
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdG-0008OK-6T
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d9so11056023wrb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T5FPBJ394Dd3sA5Gnr0P+ccc+bkdQleyaVOEfIkhHPM=;
 b=Y5O2J9dd/8B0KGkla1flSW8t/HVVb8NPin4FRXvGZblCg42LEVQCw8eF7uig3kgWMG
 PnihIs1BfFoZLjn0PxA1xxw+xY8fo1tnZZCHoBjKFDa3/Pf/Tr6AJ3WxYbA0X+X4sQAK
 JahV1pG5JZhGq7NtPvJNrrMOUDZideHpmGG3EqsLmFGHXTd17FoG9ezwfYVs/8BzcUMm
 hDmxUzePK2/TalN9ubCDe6wrBc+sO/98oeVRLzj3VgOiZu7sYfhFKllR92Ot/PctpvQy
 3vlqcVsO3EjVpBrQXvO7OfKkD/4EY4L5ATKusGjZi70KBZw6zsN9Nhyf9L8x4YEl1Dqb
 zUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T5FPBJ394Dd3sA5Gnr0P+ccc+bkdQleyaVOEfIkhHPM=;
 b=LCPbMxz39w1CGC5FWICHnpy2XpzKPoB+sRf2AQogBpVGewAy8MTfEi4gMTMxyWPkkk
 bCNd1uw+0EN2Ag5lYFCCs0UzjpEqZocweExNHB9eZWzn6L4hly5cdiR9piinbgvW/3EJ
 nqT+bOnNX4NKY56FNtyoT7LtaNKTyOEryYWoFk7Y/BWX4YqipsQgDDu3qkXbVTvKbqAQ
 2umJpLu+rA2jcfY3tTBN7Ln6bu0VUWdH22wR9uZE/5TRyGC5WOYFcJg6mLerd4mfywEV
 Hkm0+h1mLnTEgHGyjizlW5tlTgXvis+3oqYA+Gdb9vvgM9OhZdLCIGnkmAzM36QcHVQf
 7QIQ==
X-Gm-Message-State: AOAM530ooZx75N3XXBSQfX0+c5d5+5JkjoICs+WqmJ3yVWvqRJww/J0S
 sQQUcMXZ89Czy3ZCAzVFzCw1CAgbw/o=
X-Google-Smtp-Source: ABdhPJyje20BI3dbbEW56CdaHqhKk8b9ipiYnVN5H7cArkcGdK2oFnEfjN15CqqBbEtQpmJG3ScWyQ==
X-Received: by 2002:adf:ba8b:: with SMTP id p11mr1500761wrg.390.1640260296688; 
 Thu, 23 Dec 2021 03:51:36 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] docker: include bison in debian-tricore-cross
Date: Thu, 23 Dec 2021 12:51:20 +0100
Message-Id: <20211223115134.579235-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Binutils sometimes fail to build if bison is not installed:

  /bin/sh ./ylwrap `test -f arparse.y || echo ./`arparse.y y.tab.c arparse.c y.tab.h arparse.h y.output arparse.output --  -d
  ./ylwrap: 109: ./ylwrap: -d: not found

(the correct invocation of ylwrap would have "bison -d" after the double
dash).  Work around by installing it in the container.

Cc: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/596
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/debian-tricore-cross.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index d8df2c6117..3f6b55562c 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -16,6 +16,7 @@ MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+       bison \
        bzip2 \
        ca-certificates \
        ccache \
-- 
2.33.1



