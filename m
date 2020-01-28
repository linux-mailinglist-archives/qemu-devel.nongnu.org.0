Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63A14C070
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 19:55:22 +0100 (CET)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwW1B-0008TG-RT
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 13:55:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV5u-0000oT-Hr
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:56:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV5r-0003Vv-Ke
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:56:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37767)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iwV5r-0003Sl-Cr
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:56:07 -0500
Received: by mail-wm1-x334.google.com with SMTP id f129so3580375wmf.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ob/sfkbts6dDG4RDCRaCyMU8UFlczZj8w1orN4lxo8=;
 b=pGRSQC10B+Hz/IHH5F4klp8CZQinLHfE8Va0C0J/sE6kJJBnaMBVOtcdbbXyh/Ednf
 Nn0hiEvx6ajqChwNtPdLVVkyoei8emHxi/B0ZNFDY/dg6DIBr83wYAdW0ayXmeucSvx+
 IaIrCJrrHgJSd9d/gBrY0FW2MmgbEZg/uFDbzqQQaAEhVFo7XbaJddxKLKP+zUv/uSY/
 2vcGIieSw1q884QubFPs6Iky04+NA4PqN8N/iqzFknHnZ0ITG8wz4mjHc0X+pCQt/F8q
 CKpvwQjNUr6UQuIFdecngvT1/k9Ai3ZGcE0Hg2XFTp+DnQw8oMlFqSxKRyDOI6jze1ej
 A3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4ob/sfkbts6dDG4RDCRaCyMU8UFlczZj8w1orN4lxo8=;
 b=Il+2QJTiyYt6fCQVDXjIzV/Uf4DUiX9kq7w/8/RVrs4DYerC/AwroJnO7QCnjcTquZ
 mxBzRwOqptI72wy0vA9RtAE/yqXr+04hEDkks0moAxMWLNX35Zr5yx9NmYf0LmlNA0+3
 W3KKW4p9wYaQZ7uIf8E2uZyiBJT1d4La6KhuxDqYJVwOjvOv+L7PMNp0iSDxVVnN4tvl
 Aklm4mSAcGaeKrUvsGTc6iTwweGBQGkCjgzX6AgZ27cPweuKrsYW+1RscCIo2FykOJse
 pcbSF18iaQPs275JeVlaDIzMaM9iO7e0DfDWOvsCPhrE0gQ/+G0s4isG8mLV33Bz3Gdo
 HrEg==
X-Gm-Message-State: APjAAAW/TFeIVjtM3ZhIiKkrz+vrhtWUc4dJAYW3iUETVpF2tefBdY9/
 ODTucg3yKUtctxt6/KnyDKnknWwW
X-Google-Smtp-Source: APXvYqzo91ivbW4cg3L8RaG6ddfWM3PyT4/j3QtQ262JsjE6yjHKSg779/B06AjMF3c7gvJM6VqRPw==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr6268316wmc.119.1580234166199; 
 Tue, 28 Jan 2020 09:56:06 -0800 (PST)
Received: from localhost.localdomain (93-36-56-206.ip58.fastwebnet.it.
 [93.36.56.206])
 by smtp.gmail.com with ESMTPSA id o4sm27046968wrx.25.2020.01.28.09.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 09:56:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 058/142] meson: convert block/
Date: Tue, 28 Jan 2020 18:52:18 +0100
Message-Id: <20200128175342.9066-59-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200128175342.9066-1-pbonzini@redhat.com>
References: <20200128175342.9066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::334
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 Makefile.objs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 8a158b93bb..56d5e855da 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -35,8 +35,7 @@ qom-obj-y = qom/libqom.fa
 # single QEMU executable should support all CPUs and machines.
 
 ifeq ($(CONFIG_SOFTMMU),y)
-common-obj-y = block/
-common-obj-y += dump/
+common-obj-y = dump/
 common-obj-y += monitor/
 common-obj-y += net/
 common-obj-$(CONFIG_LINUX) += fsdev/
-- 
2.21.0



