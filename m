Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4D4C7628
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:59:34 +0100 (CET)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkJ2-0002xm-6q
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:59:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAl-000331-As; Mon, 28 Feb 2022 12:50:59 -0500
Received: from [2607:f8b0:4864:20::232] (port=33737
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAW-0007ys-Al; Mon, 28 Feb 2022 12:50:59 -0500
Received: by mail-oi1-x232.google.com with SMTP id x193so13990321oix.0;
 Mon, 28 Feb 2022 09:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vYwp80VwgpkGj27dkmK9wKIAecowSu10UxZ5mM4Cdr0=;
 b=TcKHqV9/pH1BVeOdgAOuIoJCXc7zCh7BIF2dqJtCUT6KYWm9AXmzRbR2AhTAx4Fg/e
 LpeEr5ioya1SZVjQd1uryRPMbnRE+V1wlCdYINpH2Fx4qdKwm6asdDSmo6XSXVY1Q3BS
 r+k8cA/3tJDBZ37JjsNnZSIuXif5L9hswNjRlEoctK/qu9h63fCBZq3a+RH5Qaxm87sa
 W0sW0wvG0Dt4StCVmh5srOIgf60h0ggsRDX6LzHTadEVWd3EWiXx0B+CZO4GtfIB45BL
 W1NXSW8UhwZxZV1R+D2/Yn4rYJEojc9iNktEhCuoRX92FvdZVrscYdWTazsN4R//5TaV
 7yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vYwp80VwgpkGj27dkmK9wKIAecowSu10UxZ5mM4Cdr0=;
 b=OoKjrXr6cwqCXtFdS8pOzygvLBtmKamsoQ90Pg9CsnA8mudFmKIkJ2YgWLenL+tqac
 N4ZnI+Zh9eKUTFFy3LJkov8yhYQDWSRfEmhMxFKRPzHY2M0qWKGFqGwdeb0BQVR7b5gl
 V/BXEnuQIHuKyrNmJyy8iKhk3EOnAgNsFzsnPwgHMXjXMWd5K+518W5rIMhU/8D5SOtX
 wZlLyqB5HSGAhG8yOlDTz90Cl/B0xiFF26E/gWUxC/cStwvzTP/lzd6kxDcH6ZUg8ySI
 NxV4jdVx12G5xpbI77kJ1MGWvIVnkCArs71XXZeSv4FhdVBONpwXpeOcOXp1qwpQ9Kls
 FQIw==
X-Gm-Message-State: AOAM5331mI2dJHZ3LeiD2Y9O4Kg0aE8AxBkwT+7UoVR4BjRYs9D0VI2C
 Nifv5QYHD3ifaupPVYGwE3xi5s9Wo90=
X-Google-Smtp-Source: ABdhPJymlNUcpsxj7K2J2sEyUnRpCGDplcdSXmfU//O/EZtEVTqM4XlmCd2B3Q+bL7Coc7E+KDHgSA==
X-Received: by 2002:a05:6808:3021:b0:2d4:40f3:6b30 with SMTP id
 ay33-20020a056808302100b002d440f36b30mr11577629oib.31.1646070641195; 
 Mon, 28 Feb 2022 09:50:41 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:41 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/14] hw/ppc/spapr_numa.c: simplify
 spapr_numa_write_assoc_lookup_arrays()
Date: Mon, 28 Feb 2022 14:50:01 -0300
Message-Id: <20220228175004.8862-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can get the job done in spapr_numa_write_assoc_lookup_arrays() a bit
cleaner:

- 'cur_index = int_buf = g_malloc0(..)' is doing a g_malloc0() in the
'int_buf' pointer and making 'cur_index' point to 'int_buf' all in a
single line. No problem with that, but splitting into 2 lines is clearer
to follow

- use g_autofree in 'int_buf' to avoid a g_free() call later on

- 'buf_len' is only being used to store the size of 'int_buf' malloc.
Remove the var and just use the value in g_malloc0() directly

- remove the 'ret' var and just return the result of fdt_setprop()

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index e9ef7e7646..4f93bdefec 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -431,12 +431,14 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
     int max_distance_ref_points = get_max_dist_ref_points(spapr);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     int nr_nodes = nb_numa_nodes ? nb_numa_nodes : 1;
-    uint32_t *int_buf, *cur_index, buf_len;
-    int ret, i;
+    g_autofree uint32_t *int_buf = NULL;
+    uint32_t *cur_index;
+    int i;
 
     /* ibm,associativity-lookup-arrays */
-    buf_len = (nr_nodes * max_distance_ref_points + 2) * sizeof(uint32_t);
-    cur_index = int_buf = g_malloc0(buf_len);
+    int_buf = g_malloc0((nr_nodes * max_distance_ref_points + 2) *
+                        sizeof(uint32_t));
+    cur_index = int_buf;
     int_buf[0] = cpu_to_be32(nr_nodes);
      /* Number of entries per associativity list */
     int_buf[1] = cpu_to_be32(max_distance_ref_points);
@@ -451,11 +453,9 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
                sizeof(uint32_t) * max_distance_ref_points);
         cur_index += max_distance_ref_points;
     }
-    ret = fdt_setprop(fdt, offset, "ibm,associativity-lookup-arrays", int_buf,
-                      (cur_index - int_buf) * sizeof(uint32_t));
-    g_free(int_buf);
 
-    return ret;
+    return fdt_setprop(fdt, offset, "ibm,associativity-lookup-arrays",
+                       int_buf, (cur_index - int_buf) * sizeof(uint32_t));
 }
 
 static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
-- 
2.35.1


