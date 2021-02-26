Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A258325F0C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:31:48 +0100 (CET)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYXL-00089x-7i
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY87-0001pc-Ic
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:45 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY82-00048a-C8
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:41 -0500
Received: by mail-wr1-x432.google.com with SMTP id h98so7647470wrh.11
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dyyp+0lRQyqt+67PKzEpz6dldpSC1ghMN214ADCGSKk=;
 b=dksOwJZLQ6LVquCjMyaVnwisMnZhvD0KEgD08LSdGyd+sD0LLCUX38FWMyS6e8nxe4
 5IBITAhltrY8Fls4/uitHdfCzzUK5OiuKrK6ayFuSkAgIH8GtBDTbdJxqfNbwJ8YUsfU
 6OTokoMRgB9PANBFhZE6bIAn4bdsPAPMnM137HSaGim0/kEX2vHMRHkeLSnv0BhPSKVF
 t1i4qgGj3I0A6p+hJJnraN8TU474pviVvuzhHAbYgw0zakuNMeq0I+0isWk7Qty/920c
 UdDtcK8wI17iygLBUzRPvGqSdgagwRx0ule4uOoRi8QL2+mIqgqb/zqMjKBz9cvxdSFU
 FB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dyyp+0lRQyqt+67PKzEpz6dldpSC1ghMN214ADCGSKk=;
 b=kOXeHboQ8IQIdfRnyYho3REKtU3mydMzLxecZ0/bzfsJQGV40tCf2Lsqpl4KIPIbMp
 UlWQMK2EgQXzawTVPK/yzC0CobFJOa4Lva4Wopf56fAeYnlz5z/KMwu5e3lMNdNUYMsc
 yQlj+XE23ZuNhPwxuUOZbXAFbEVyNHBkuVrJmc6zexnS7agduJGx01ahDCjvNZsCgs8J
 cAc22p8UZns2KKPHYd6fBLSEOL4rs6N/DStujLgcWN3RDiOffi/gTGAqXd4emVdROkkQ
 NA3fGpwWMKDcfqXsZJGt5gtOAgo85d4pm4GJv27zPMe5+wg5xExS4L+4TUqkIyILxtb9
 Azhg==
X-Gm-Message-State: AOAM530ArZoLh/yLutJCGUOVWMkeAyCEeWX6glQzDLNtCPji+TMLAkET
 c6ktf/gD1ct/xHlSyRgJ3OLuTUT2YhU=
X-Google-Smtp-Source: ABdhPJy8QceMvn1c/4Tu9FOkz5UPzd1Ix3XSlMcAX960BNqFSq7lMUM+zi9cR+LfXTQQ43nRlDo0CQ==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr1795406wrp.89.1614326737009; 
 Fri, 26 Feb 2021 00:05:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/29] char: don't fail when client is not connected
Date: Fri, 26 Feb 2021 09:05:11 +0100
Message-Id: <20210226080526.651705-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch checks that ioc is not null before
using it in tcp socket tcp_chr_add_watch function.

The failure occurs in replay mode of the execution,
when monitor and serial port are tcp servers,
and there are no clients connected to them:

-monitor tcp:127.0.0.1:8081,server,nowait
-serial tcp:127.0.0.1:8082,server,nowait

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <161284977034.741841.12565530923825663110.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char-socket.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 9061981f6d..b7863b8aae 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -387,6 +387,9 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
 static GSource *tcp_chr_add_watch(Chardev *chr, GIOCondition cond)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
+    if (!s->ioc) {
+        return NULL;
+    }
     return qio_channel_create_watch(s->ioc, cond);
 }
 
-- 
2.29.2



