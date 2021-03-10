Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699E334A11
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:49:03 +0100 (CET)
Received: from localhost ([::1]:53484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6hR-0006Gh-Pg
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dv-00036a-Lf; Wed, 10 Mar 2021 16:45:23 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:54883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dr-0004Lo-6f; Wed, 10 Mar 2021 16:45:23 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MVMJ7-1lCiEA0jqR-00SST9; Wed, 10 Mar 2021 22:45:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/22] backends/dbus-vmstate: Fix short read error handling
Date: Wed, 10 Mar 2021 22:44:47 +0100
Message-Id: <20210310214504.1183162-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WjANhdw/2agENRN9J8Z7PO4tw24Gqhlpq3JP5DEEKsjsCGRttIN
 mq49Efs6ywmZxcr9ZqRKx56ZXERmCFWzHWMTzvWyEMpVrlbP+fW80YrpF8bOyjguBfRr9ok
 SPGQOducyjJyZVl8vbCVQTxcphPQVCDkTdZl7TVgKjR45AOEJigR5IyAD+AT9lXjRgX2dQw
 6DQf2gx2ScRV3me1TF5NQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2OwTnDDlQF8=:QGmsS9UFNanGL2IPZwRwGM
 9G8krr8E0AHF8jLMdaq744JjzJJ4QYMUciiS2omA3YCrc9fMtH/O1Zihlvagd/oBmnYTnw6h1
 1Vj63g0DJW1r0owXvabJ2aYHuKzDfm6iEK7FFjhP9TlffnLozvQHzvHIzDhqqmiXvMFODlVB0
 +5/YglGpgrjdkEYgdUDXOFWVlH+9NuuqGXiOcpGo1a4IoFcr6GuQnOzm9k/qOodqke/HXG65a
 crH16CD2cC8L9LIBq1s9z6uP7EZXRzSEywsm1EWlUd84TzSDM32TzpWERNazWgW3xI43DmfgG
 syM+vluSIRHtQkr3fnCXSnkigrF68sV7ez/kxtsni4oqgR5a06iQEb+MvHmaetIyO2uXPgNV+
 8n38B7W47L2g1KsJXuJjJGVYc5WmexFXBGnA0jv9yudYP6CYge1T3vTX63nu8xPyCKC65aPsH
 5D4kegT+dA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

When dbus_vmstate_post_load() fails, it complains to stderr.  Except
on short read, where it checks with g_return_val_if_fail().  This
fails silently if G_DISABLE_CHECKS is undefined (it should be), or
else pads the short read with uninitialized bytes.

Replace g_return_val_if_fail() by a proper error check.

Fixes: 5010cec2bc87dafab39b3913c8ca91f88df9c540
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210126124240.2081959-2-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 backends/dbus-vmstate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index bd050e8e9cab..2a0d2e4a31c0 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -229,7 +229,10 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
                                      &bytes_read, NULL, &err)) {
             goto error;
         }
-        g_return_val_if_fail(bytes_read == len, -1);
+        if (bytes_read != len) {
+            error_report("%s: Short read", __func__);
+            return -1;
+        }
         id[len] = 0;
 
         trace_dbus_vmstate_loading(id);
-- 
2.29.2


