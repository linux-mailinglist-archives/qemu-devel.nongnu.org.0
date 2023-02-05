Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D43768AF3F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObu6-0001BW-40; Sun, 05 Feb 2023 05:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtU-0000yx-R7; Sun, 05 Feb 2023 05:05:15 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtT-0005Ip-5m; Sun, 05 Feb 2023 05:05:08 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-16332831ed0so11902281fac.10; 
 Sun, 05 Feb 2023 02:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Nuf0VHcX1ggZGxGk6xB4grHnqoZN1Uy+s0FlANDBEE=;
 b=NMhmx7nT9vLQIZoGBybfoOMlzvyFeCIOP9UuyvclRLCKfY4Kxn3Y1rB+G3WR59rJsr
 L8S9LQCyoKiHjRZIXwadN7r309QQIC9SmUqTh85cmhEMT9ayOPPKfPbob2Prgbf/iGiK
 k/xsapGN02VkPoaK9278nvN9hrVpOgVGNTvKSwkCjl09agfeRevia0oEskq1BqDV58mZ
 +OaorkODRFIriMfon+3kMgAWjHTGkEl3HXYtGnQqMykKkFUooBL5ZLD5w+28F8MLeKlB
 TV0gYw/hBo/AonMGikqpnda8u32qwXuaqptZOJNOVv35e2LWxDb647m2mKh/m0D9GbQO
 bUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Nuf0VHcX1ggZGxGk6xB4grHnqoZN1Uy+s0FlANDBEE=;
 b=uCZvaFke3X0qjYGxRLT3jomKwm3UWPv22Tt//9FcO9VSg/SKGdByMMch0eRTUWwp9r
 894Bg0B/UVNsCE2jhEOCPMA/FknPXlcLmQv23MlYBOHW1cI1V52x0SXZm1ObsM8NnkY0
 Fj3Q5BqI2IvdSnW4r40ZzXD5cHxPMTFie5B/Dc2ma0D1Dx+KKEilEL0oRcs4PCwm3axZ
 bS6mGAAAjTgJKqwUz4w1XqSKG0jTIkSeff3sX5ZcAzoKB0oWv8rSMhNztdPf4JcYk8YI
 l1hUHF+rzJAmx7gEyW8v+qYbN4ERLiPMAzVxYyAmRKSDiMUHkFNBKu+6ZpNQHTqiZjQb
 9+Dw==
X-Gm-Message-State: AO0yUKU724wp+JVt7se53HaOfVgc2g0xuQrA0B+1Bpkf5MWGKYDrOYQb
 7tpfP0fypR/y+TIvey4l7AZmMHF76+4=
X-Google-Smtp-Source: AK7set84KKPAzaMIowEH6NZYXyRUtyXac8hYQmZHyrSQmIPkLkR0PBRGDk8NGFVBMQQV3s9YbIXdCw==
X-Received: by 2002:a05:6871:a8:b0:163:c555:24e0 with SMTP id
 u40-20020a05687100a800b00163c55524e0mr9842640oaa.18.1675591505343; 
 Sun, 05 Feb 2023 02:05:05 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:05 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 05/16] hw/ppc: Set machine->fdt in e500 machines
Date: Sun,  5 Feb 2023 07:04:38 -0300
Message-Id: <20230205100449.2352781-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

This enables support for the 'dumpdtb' QMP/HMP command for all
e500 machines.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20230125130024.158721-2-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 9fa1f8e6cf..7239993acc 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -659,9 +659,14 @@ done:
     if (!dry_run) {
         qemu_fdt_dumpdtb(fdt, fdt_size);
         cpu_physical_memory_write(addr, fdt, fdt_size);
+
+        /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+        g_free(machine->fdt);
+        machine->fdt = fdt;
+    } else {
+        g_free(fdt);
     }
     ret = fdt_size;
-    g_free(fdt);
 
 out:
     g_free(pci_map);
-- 
2.39.1


