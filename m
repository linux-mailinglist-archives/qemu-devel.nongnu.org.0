Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C3C68AF42
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObuE-0001hq-Cr; Sun, 05 Feb 2023 05:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtr-00017o-9H; Sun, 05 Feb 2023 05:05:36 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtp-0005Kk-9n; Sun, 05 Feb 2023 05:05:30 -0500
Received: by mail-oi1-x230.google.com with SMTP id c15so7454085oic.8;
 Sun, 05 Feb 2023 02:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ZK40hW+ej+3krgMzPgquYQLQLED2GYWToj+30Unhk0=;
 b=eRJ++PblueVtxXFu6FL1rJj3ccMrohi4DtPF5Dftgn6ec8VkuqE1l4z0HS66+gLBRx
 767q4JKZ0sFxMAP7uZvsazXJQr5owvrpFbDcMjQC3PBqExBT7NMZBBTFVWF+RMFXWB1O
 y8zh+VA4Qg7ViugFuywjH6ERx3FE86xmCNUn28I1wC4DZnpnaFnlEDkEj2GIdJMderqY
 K5CQv6xS3h1tjfsqBXNxUL2/Vdsta18/CIQWFpHuxkx0BQiAYudWr+Pq1vKN0huw5VMO
 8i5NyB495ThbpkfSsn6OVtyMv2YkMz4LvkRylxi3i5APk/gJflASOwP36jVkTNghFF0y
 xe2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ZK40hW+ej+3krgMzPgquYQLQLED2GYWToj+30Unhk0=;
 b=YjNdM3l41Dks/Pmrz2vJsEMxK1IypDgMxiYh1QY2QGfmyQz+/Srnybw+KxuWFacHfh
 yFkfjpdq6agzxzy4e+uZ5JN1BE1KGMN/pZuJGSZR9ui9YKfyFElXsRcKgEaqZRTQFtzg
 JZ2aJ+E2BPEEA3OOWtIBh29lFPHOW+3lRl+WCDJGA5JNKyTYRePQNJtX5Lr6o8CqBgyP
 YfeTgBqSQTbn0hk4wCfvUdwWWb0otcsphCNoUd3/KA1FXPCzbpsN3OA30uXSml0B9pke
 NklQVW952jKkmROI5H0i5ooj4jzGQv+eKjBgJW2aERuxNbaPKm+RcPSl1f9mKsUQsg5Q
 7Vtw==
X-Gm-Message-State: AO0yUKUJtzXmwFRpFPhiS7Goc1dIW85Hl1ChzmHvkAdfLdSpBVVa/Na4
 ta8RvxkDl/45ZY+gl0dcVnzXPdIrlvw=
X-Google-Smtp-Source: AK7set8SrbHA+1tPbdaCmTsU+e5zi1pEDffooT7T9umKivSpZga2FxEib2xCkY0c5Iw5eGixs6EAmw==
X-Received: by 2002:aca:2209:0:b0:37a:cef7:c9f3 with SMTP id
 b9-20020aca2209000000b0037acef7c9f3mr4942616oic.14.1675591526674; 
 Sun, 05 Feb 2023 02:05:26 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:26 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 15/16] hw/display/sm501: Remove unneeded casts from void pointer
Date: Sun,  5 Feb 2023 07:04:48 -0300
Message-Id: <20230205100449.2352781-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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

From: BALATON Zoltan <balaton@eik.bme.hu>

This is not needed in C.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <58f599387dd0739ea1880bfb678872c0be26bf1b.1674333199.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/display/sm501.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 0cbd1fecd5..1e17072452 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -868,7 +868,7 @@ static void sm501_2d_operation(SM501State *s)
 static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
                                          unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
     uint32_t ret = 0;
 
     switch (addr) {
@@ -928,7 +928,7 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
 static void sm501_system_config_write(void *opaque, hwaddr addr,
                                       uint64_t value, unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_system_config_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
@@ -996,7 +996,7 @@ static const MemoryRegionOps sm501_system_config_ops = {
 
 static uint64_t sm501_i2c_read(void *opaque, hwaddr addr, unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
     uint8_t ret = 0;
 
     switch (addr) {
@@ -1023,7 +1023,7 @@ static uint64_t sm501_i2c_read(void *opaque, hwaddr addr, unsigned size)
 static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
                             unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_i2c_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
@@ -1092,7 +1092,7 @@ static const MemoryRegionOps sm501_i2c_ops = {
 
 static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_palette_read((uint32_t)addr);
 
@@ -1106,7 +1106,7 @@ static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
 static void sm501_palette_write(void *opaque, hwaddr addr,
                                 uint32_t value)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_palette_write((uint32_t)addr, value);
 
@@ -1121,7 +1121,7 @@ static void sm501_palette_write(void *opaque, hwaddr addr,
 static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
                                      unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
     uint32_t ret = 0;
 
     switch (addr) {
@@ -1234,7 +1234,7 @@ static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
 static void sm501_disp_ctrl_write(void *opaque, hwaddr addr,
                                   uint64_t value, unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_disp_ctrl_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
@@ -1379,7 +1379,7 @@ static const MemoryRegionOps sm501_disp_ctrl_ops = {
 static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
                                      unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
     uint32_t ret = 0;
 
     switch (addr) {
@@ -1457,7 +1457,7 @@ static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
 static void sm501_2d_engine_write(void *opaque, hwaddr addr,
                                   uint64_t value, unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_2d_engine_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
@@ -1644,7 +1644,7 @@ static void draw_hwc_line_32(uint8_t *d, const uint8_t *s, int width,
 
 static void sm501_update_display(void *opaque)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
     DirtyBitmapSnapshot *snap;
     int y, c_x = 0, c_y = 0;
-- 
2.39.1


