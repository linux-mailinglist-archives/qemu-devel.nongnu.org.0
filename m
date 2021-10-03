Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609AE420085
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:49:28 +0200 (CEST)
Received: from localhost ([::1]:34878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwFT-0003LD-Dx
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9C-000395-Fv
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:58 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw99-0000kC-Fu
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:58 -0400
Received: by mail-ed1-x531.google.com with SMTP id g7so50878211edv.1
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8xHug5FjGPs5JZhes9WoDYRkpuVcomb9e+VGlwSX9NE=;
 b=nsxEFFoTyLjDO3ihdbuCtH81r35P9DK2Z/uD09T3YJTlypVI4CBhJtNLP3l9uLK8sf
 qRWDOSyqXoMIiKT7ZyeKw6WkYDKEqxbbf35qopEavB1PvzP8/azWXYl1olxnII8i0OQQ
 IhUrXyztllreTP+PpR0IwwXSifHT6Zg9WN64FUr3HzfMqMSoqRFQ5vtNKOp1GxvniMXo
 JKubzLjVo4HPPsjJxOBCz/id3OHEw41/66T6i/yNM0RJWkN9XvGvrWJH0SRBO4M4BuRW
 s3JjkDeQElJUNsrwpA6BLUXWIXiAqcxVjSHj/9V3GJQt6EWH63UPDSPGd8TXuD99xF+I
 Sdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8xHug5FjGPs5JZhes9WoDYRkpuVcomb9e+VGlwSX9NE=;
 b=OKpvkJce3t7Ybod8DnG9waHLgm03P1JwqlzwyzWqv1RohycKvlMoYN65ofLudhIRhi
 WfaBUvm640qQOkN2CCnux9ah0RLDSmkBH1RHd8OJvXqXwCxIfj83jMdCP2/Vi0GNtnhP
 yJMmc7gEo2KtlwfQssraFXI/WhgPemVPZE5GaL9W7TbqF3cZUDmfqXRsuhWEPk36sjwA
 JXyrcqSCFJhkFO2rVkjgWj2bTLRlgn1kI6HdD1vhOjCDhpqcn3u7VqhWSNAFSAT2FpiF
 oo2jEiD01nXOFJb5GVTyshu4iodbFbMkDccVmKxRmT7l4i8mR/WrkZ7B7bzMs46VFspi
 ha4A==
X-Gm-Message-State: AOAM532XmV6XKLsmqrw9d/62pAohlEculsZ65SrKO+xAEdUAczd2NLoI
 oqRiEEmFMHFLEUhUcSGaHzUsufIPs9A=
X-Google-Smtp-Source: ABdhPJwTTScNNOlXLfMm8RaDTrV/81pPbf2I2ORFKk2IBhGc3nBfzbz3UHkqHwGsVxVvccAu1Ec27g==
X-Received: by 2002:aa7:c988:: with SMTP id c8mr1394261edt.94.1633246974084;
 Sun, 03 Oct 2021 00:42:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:42:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/30] machine: Deprecate "parameter=0" SMP configurations
Date: Sun,  3 Oct 2021 09:42:22 +0200
Message-Id: <20211003074250.60869-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

In the SMP configuration, we should either provide a topology
parameter with a reasonable value (greater than zero) or just
omit it and QEMU will compute the missing value.

The users shouldn't provide a configuration with any parameter
of it specified as zero (e.g. -smp 8,sockets=0) which could
possibly cause unexpected results in the -smp parsing. So we
deprecate this kind of configurations since 6.2 by adding the
explicit sanity check.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210929025816.21076-3-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst | 15 +++++++++++++++
 hw/core/machine.c         | 14 ++++++++++++++
 qemu-options.hx           | 12 +++++++-----
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2f7db9a98d..0bed6ecb1d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -160,6 +160,21 @@ Use ``-display sdl`` instead.
 
 Use ``-display curses`` instead.
 
+``-smp`` ("parameter=0" SMP configurations) (since 6.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Specified CPU topology parameters must be greater than zero.
+
+In the SMP configuration, users should either provide a CPU topology
+parameter with a reasonable value (greater than zero) or just omit it
+and QEMU will compute the missing value.
+
+However, historically it was implicitly allowed for users to provide
+a parameter with zero value, which is meaningless and could also possibly
+cause unexpected results in the -smp parsing. So support for this kind of
+configurations (e.g. -smp 8,sockets=0) is deprecated since 6.2 and will
+be removed in the near future, users have to ensure that all the topology
+members described with -smp are greater than zero.
 
 Plugin argument passing through ``arg=<string>`` (since 6.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528..4e409261c9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -835,6 +835,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    /*
+     * Specified CPU topology parameters must be greater than zero,
+     * explicit configuration like "cpus=0" is not allowed.
+     */
+    if ((config->has_cpus && config->cpus == 0) ||
+        (config->has_sockets && config->sockets == 0) ||
+        (config->has_dies && config->dies == 0) ||
+        (config->has_cores && config->cores == 0) ||
+        (config->has_threads && config->threads == 0) ||
+        (config->has_maxcpus && config->maxcpus == 0)) {
+        warn_report("Deprecated CPU topology (considered invalid): "
+                    "CPU topology parameters must be greater than zero");
+    }
+
     mc->smp_parse(ms, config, errp);
     if (*errp) {
         goto out_free;
diff --git a/qemu-options.hx b/qemu-options.hx
index ceca52818a..4a092a092a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -233,11 +233,13 @@ SRST
     of computing the CPU maximum count.
 
     Either the initial CPU count, or at least one of the topology parameters
-    must be specified. Values for any omitted parameters will be computed
-    from those which are given. Historically preference was given to the
-    coarsest topology parameters when computing missing values (ie sockets
-    preferred over cores, which were preferred over threads), however, this
-    behaviour is considered liable to change.
+    must be specified. The specified parameters must be greater than zero,
+    explicit configuration like "cpus=0" is not allowed. Values for any
+    omitted parameters will be computed from those which are given.
+    Historically preference was given to the coarsest topology parameters
+    when computing missing values (ie sockets preferred over cores, which
+    were preferred over threads), however, this behaviour is considered
+    liable to change.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.31.1



