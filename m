Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7153C65E2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:03:39 +0200 (CEST)
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m341a-0004gv-Ih
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tv-0000ac-PN
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:43 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33ts-0006rY-RI
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:43 -0400
Received: by mail-pj1-x102a.google.com with SMTP id bt15so5844225pjb.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V4NDEP6+OPN3RZuxFlIMW6dNi+3smAct890DuJEN23o=;
 b=QPmfAvbabUtgs8i44opkL8TVTPxkjd+6w/WNlclRMTNopwLELhWfrIQnTh1nYeJObF
 V4R7GLhDRbBpA72gjlYNen8xeSV0TN+u0s9mD6PIAbBbwYqMxf5Zb2vs25DcBqmteK+a
 FxWM1XzLrJ4Lo1zesZO3YuRbRn16BEveJQ0IHstqgc3V+lLhBT6KgOL8HTQeG0TeLSUO
 iZbrtW7AonexFnLAjAhmzhDdxNjVidDBnIE30Y6cmCBSDXC4n2d41ijoBR8Jz7TR4MBT
 xVUYOh9OL6/PAZE0gcflVozCc30fOY9OUUcUReXYOsjT7cGHzdMJRlPpQIy6Uu8jb22P
 ZCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V4NDEP6+OPN3RZuxFlIMW6dNi+3smAct890DuJEN23o=;
 b=D2GjO8FayQ/7956L1rgmmeigzvPnaPPYoPP6j4sXQPwjfPyy+FxZ4JZkkLy36tGAwH
 uo4L+3ZuWeJFMEGngeF3X0D+0Xw8+zEXEROM12i242JQUcytlukDk7oyeFwvoU8GPJk4
 pNhWBu9gFEWzT+i2ufkxBvLPUew8ipWu4C1FYYb/tCqrITKHGIiJfAJsr8hm5tlOsfYt
 BvYHuzSFRqsnnjxOQ3fMVvfzuLnbhcsmBZwz5eWEwRgXQkq9dJFkjONWj+29rWRlZdbh
 2cQO7V7+VnddDys04ujp3+xRFkOZa0JHdNbs3EUQsPAIL5eer/e0IVXtxCDdpqDfyIxH
 0I8w==
X-Gm-Message-State: AOAM531vVTQQWrC6ByhPIibXqwP1YznNK+9vGPNkGtoj9AcWMHyQUZBw
 YUWD9KOpKY+rad9V3aGFT7+SGKL2tWdLvw==
X-Google-Smtp-Source: ABdhPJyJCPeu7EbTaSZQmQiaBixk13lotszPbyHr9eZlrXiafZQR+q/D066hT1OUq+Jlh/WsafBbdw==
X-Received: by 2002:a17:90a:a087:: with SMTP id
 r7mr16124415pjp.84.1626126939211; 
 Mon, 12 Jul 2021 14:55:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] util/selfmap: Discard mapping on error
Date: Mon, 12 Jul 2021 14:55:27 -0700
Message-Id: <20210712215535.1471256-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/selfmap.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/util/selfmap.c b/util/selfmap.c
index 2ec99dfdda..0178c2ff8b 100644
--- a/util/selfmap.c
+++ b/util/selfmap.c
@@ -23,29 +23,33 @@ GSList *read_self_maps(void)
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
+                    g_free(e);
                 }
-                map_info = g_slist_prepend(map_info, e);
             }
 
             g_strfreev(fields);
-- 
2.25.1


