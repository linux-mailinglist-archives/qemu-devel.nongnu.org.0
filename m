Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB2B6B0EB7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 17:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZwcN-0004ko-NO; Wed, 08 Mar 2023 11:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhobsong@igel.co.jp>)
 id 1pZwcL-0004kY-BG
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 11:26:17 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dhobsong@igel.co.jp>)
 id 1pZwcJ-0002re-BY
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 11:26:17 -0500
Received: by mail-qt1-x835.google.com with SMTP id d7so18590551qtr.12
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 08:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112; t=1678292774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qOIi1CH/JsTPf5cx35mmqx9zyHjauzvaEw+3nDwjxSg=;
 b=gXxMy47nrS3UgvF0XxaEhAQ/AbImxgnz1rVbdfn5aKGXlb8+NvYVJ87MEriqMoWfps
 JgFzTMsrCMFgJBlKVGLvj0+SwbJ39IVZrP4Vr8PVeQG3lDtvt/d0XlGKbx9b4hoi7bgI
 CrlDXiyAWOzE+ACoPylL0OxlNcCpA+opVD+IuWXlCx0yhp1W9dwMRkMqA7rcpouQtFX/
 zCpDpdAdgfpNSnOinu18ryd8zTNRhmjJozaxlviGXKJbqgLl+QPTA2cm+55za1aBJkdt
 DQVZBHnP4IRc2Dn/0Lk+5vbLejC0WIygtFfth8w0jj2UYLQJvJIgcOj6HK+9SoIOUxn0
 fbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678292774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qOIi1CH/JsTPf5cx35mmqx9zyHjauzvaEw+3nDwjxSg=;
 b=Ry0KpWeWk81AMiDFscy2pcI/Yd9Yz5DxBmqCbMUrO8EqlSSYtwEiJJ4sOV2YapTmbK
 z8VgVUWwZPml7IVA0uiBO4rcLR5Lok0TW9ZGqV4qF4uvUk7saJU4tM/NtHaKM+xJ5KqK
 z1YfGSgOHV28IdMsM8irr9GedY/dlIt4jQctuS3KbyMX4cJssEkGA41H4LqUFB8cRVVd
 tPALAcilUxzsDjy8ZwuCjq2eNF7qr/FlP3q5CbVHF09Fxpfy7e4n9k5xxlGoVVF8VEUb
 8IR8iBGgd0eNzxKU5Sv1X272IMDGH2lG6t60+sGoOH9VWMBafuDjb3GG1vUZRKCJYdm3
 Hgvg==
X-Gm-Message-State: AO0yUKWUdbg8JhG06Gb3VIgLDwlBdUIegN3s7illUQ012wqgJPuLM66q
 LRXpZZEaN0HK3MVRDFoCUwpKrOOL/Ymh553PH2k=
X-Google-Smtp-Source: AK7set/RDazIsalmjRqDkW2SZej1tcXyr7GgLKL7kCXDJ7ygeMiL5IPYyfqI/a+hRWGDhFKjTJWZQQ==
X-Received: by 2002:ac8:5d91:0:b0:3bf:c221:5871 with SMTP id
 d17-20020ac85d91000000b003bfc2215871mr33742623qtx.54.1678292773922; 
 Wed, 08 Mar 2023 08:26:13 -0800 (PST)
Received: from D100-Linux.hq.igel.co.jp (135-23-249-188.cpe.pppoe.ca.
 [135.23.249.188]) by smtp.gmail.com with ESMTPSA id
 z207-20020a3765d8000000b0074236d3a149sm11780577qkb.92.2023.03.08.08.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:26:13 -0800 (PST)
From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: [RFC PATCH 1/2] gtk: Make sure widget is realized before updating
Date: Wed,  8 Mar 2023 11:25:47 -0500
Message-Id: <20230308162548.1766359-2-dhobsong@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308162548.1766359-1-dhobsong@igel.co.jp>
References: <20230308162548.1766359-1-dhobsong@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=dhobsong@igel.co.jp; helo=mail-qt1-x835.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Check that a widget has a window before trying
to update its contents.
---
 ui/gtk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index fd82e9b1ca..e4e0980323 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -340,6 +340,10 @@ static void gd_update_full_redraw(VirtualConsole *vc)
 {
     GtkWidget *area = vc->gfx.drawing_area;
     int ww, wh;
+
+    if (!gtk_widget_get_realized(area)) {
+        return;
+    }
     ww = gdk_window_get_width(gtk_widget_get_window(area));
     wh = gdk_window_get_height(gtk_widget_get_window(area));
 #if defined(CONFIG_OPENGL)
-- 
2.25.1


