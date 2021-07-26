Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C86E3D690B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:53:30 +0200 (CEST)
Received: from localhost ([::1]:60958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88XR-00067L-ME
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rr-0002c4-Bh
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rp-0006A6-It
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:43 -0400
Received: by mail-pj1-x102b.google.com with SMTP id l19so14938106pjz.0
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uhTllRAcP5EDg9V5XkEgroJIfh+vzkvbNymihDVIEY=;
 b=N0re2mOSQr/b8huLbqi/4FmYzrjnWexfhUiEGCra0UMWJ9k6zJ2E/DWOO2oc5sBIO8
 jRc7NFBvqpI19JIL0IBvK4ZbayHVspdyEoJGu2WFxp+k4A+axT5qnb+y3foxl6F+ZDof
 DmsrFSJZyd5iyjywudiT8NktbovrvNXh/0mt3XAsh8kjfCxEXzaKF+4/2db/53ap+NM7
 Dsig0NWO0dh2WkFGtJ/7QOvvHL5PjskOnMi+DhhLig9vbHHzo8Hwf2oh+DOFpmZx6YL7
 NOrQHLyzGYLaM0ol4hP20f0ccI4H3Wk6LuIOruh5s7i2/Gt34fP0ZoGrvgbmAMiSFmw5
 b7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2uhTllRAcP5EDg9V5XkEgroJIfh+vzkvbNymihDVIEY=;
 b=IJlfCGXwhEUGLg+1Sj/iPH7KurxEXAinxnOzZvDoj9Xxka7c6pIxcrNwNdBX5sOVee
 NG2DmmapInfLWpZMe+1lEWFsRXjbdSZmU6/Uh36vRY4Jknqy3BC45YGZMOKFz3o7IJEb
 gwGqfvT+gd8iGhVlOXunPO2SZyl7m1UGl4jbtTc34DSAPahsWpfTLm+wDiEirieM9W58
 sq+CNRuf0xQBKaGe2StIDQGsflADqI7vl1KTNgkcYsaZaAgkkWZesz29UXaz2cAbH1jX
 MS0PAM94l9UA3FUIOLmpiwuFTx3q8nQ2zz0YX7PfPxZEZxwAdI1tPH6rwMMTIZtBoGB0
 HUhg==
X-Gm-Message-State: AOAM532m9t5x7kfikHUohbuw75Ky0ymDbcjEp7h53lMLM7aDW9/SmbHv
 TcGOHsGkAUwbIslL3IUHHh6PTtBWNaoPdQ==
X-Google-Smtp-Source: ABdhPJx4BuR8hDhcs7m+68yBJ/ROdtX7z86F++7+5FuySTMod+8viTiX98I4ODhPhKUUWg4xn6Q4yQ==
X-Received: by 2002:a17:902:6b82:b029:120:3404:ce99 with SMTP id
 p2-20020a1709026b82b02901203404ce99mr15863822plk.49.1627336060337; 
 Mon, 26 Jul 2021 14:47:40 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 06/12] util/selfmap: Discard mapping on error
Date: Mon, 26 Jul 2021 11:47:23 -1000
Message-Id: <20210726214729.2062862-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
util/selfmap.c:26:21: error: variable 'errors' set but not used \
    [-Werror,-Wunused-but-set-variable]

Quite right of course, but there's no reason not to check errors.

First, incrementing errors is incorrect, because qemu_strtoul
returns an errno not a count -- just or them together so that
we have a non-zero value at the end.

Second, if we have an error, do not add the struct to the list,
but free it instead.

Cc: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/selfmap.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/util/selfmap.c b/util/selfmap.c
index 2ec99dfdda..2c14f019ce 100644
--- a/util/selfmap.c
+++ b/util/selfmap.c
@@ -23,29 +23,34 @@ GSList *read_self_maps(void)
             gchar **fields = g_strsplit(lines[i], " ", 6);
             if (g_strv_length(fields) > 4) {
                 MapInfo *e = g_new0(MapInfo, 1);
-                int errors;
+                int errors = 0;
                 const char *end;
 
-                errors  = qemu_strtoul(fields[0], &end, 16, &e->start);
-                errors += qemu_strtoul(end + 1, NULL, 16, &e->end);
+                errors |= qemu_strtoul(fields[0], &end, 16, &e->start);
+                errors |= qemu_strtoul(end + 1, NULL, 16, &e->end);
 
                 e->is_read  = fields[1][0] == 'r';
                 e->is_write = fields[1][1] == 'w';
                 e->is_exec  = fields[1][2] == 'x';
                 e->is_priv  = fields[1][3] == 'p';
 
-                errors += qemu_strtoul(fields[2], NULL, 16, &e->offset);
+                errors |= qemu_strtoul(fields[2], NULL, 16, &e->offset);
                 e->dev = g_strdup(fields[3]);
-                errors += qemu_strtou64(fields[4], NULL, 10, &e->inode);
+                errors |= qemu_strtou64(fields[4], NULL, 10, &e->inode);
 
-                /*
-                 * The last field may have leading spaces which we
-                 * need to strip.
-                 */
-                if (g_strv_length(fields) == 6) {
-                    e->path = g_strdup(g_strchug(fields[5]));
+                if (!errors) {
+                    /*
+                     * The last field may have leading spaces which we
+                     * need to strip.
+                     */
+                    if (g_strv_length(fields) == 6) {
+                        e->path = g_strdup(g_strchug(fields[5]));
+                    }
+                    map_info = g_slist_prepend(map_info, e);
+                } else {
+                    g_free(e->dev);
+                    g_free(e);
                 }
-                map_info = g_slist_prepend(map_info, e);
             }
 
             g_strfreev(fields);
-- 
2.25.1


