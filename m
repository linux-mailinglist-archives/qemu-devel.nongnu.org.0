Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C738F201
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:07:09 +0200 (CEST)
Received: from localhost ([::1]:57262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llE2m-0002Sf-5o
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeT-0004z8-4r
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:01 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeJ-0004Kx-4L
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:00 -0400
Received: by mail-ed1-x52d.google.com with SMTP id t3so32710118edc.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5tP9XZkZCa+TFNyC9cMy34jaLrb1FV2M8KBhC9kwnjY=;
 b=EkoVZ3tjFPFnNTqH4xU4OQN9ufpMRE8+BYch5YkQwvvcKiNE9GO6CTwE895iU8Nc3j
 Z3LlHAxTzfCF94BngzubjrJqelfneSYqs1trzU+yTYSw88diRt2a4ObWcz15+0X5kREm
 OIOdpR7Qpm+DjPBAmPknV24J/KhC9nQEWDz08D0KAwCzfjCmcPNS6XCJBm9N5PkYNo0P
 0xtLD0U1uxACqYahyK/gRvDiAwUAMcV27Ie81xGIDvNAf9fwe3kpJAJMeQJ/L27zv6+l
 DhZE1rPb8wsJ2bEwFIkui5uQmTYKItz61AZgozb6QgEW1hX7d/JFwRqy5ADLPYyY1DKo
 /YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5tP9XZkZCa+TFNyC9cMy34jaLrb1FV2M8KBhC9kwnjY=;
 b=QgSBA/2wG/wbh+67Vx+zhJZzruVpNlu58mbRJqilhjqG1g1rVBNrjAksH1NBno9Efc
 ZvuDFFljv5H5JFgirche9BU+nbjtY1bB+Uxq8uvzUeQGMbDriDaowHv1zrMivHfi22VD
 tPCCX8RfOmrJZQS2RJEd9ln6RRzorFKeIHlUS3WzViZBnIsmxWWEvcVR/WIsjTMNPMgA
 QOG4aFQ7nJMUV0Tk2Rlm4yelUIkr5AgGHpqou7nnFYysQpxuO70dWlIdPBOd9qpHd+Ew
 iLT08zgs1ueXOK4QWqSfgOgU4H8Vi9MVW4fzmVZ727G+Ca5HmVuE/TL6GZAYnxY3mT53
 9p1g==
X-Gm-Message-State: AOAM531bBggdqtCMsP6bXketjQ9nBPtCDQtoQjYKSmk9S2DfGFcb0hVD
 bKn6CA/8VNAX5iv6SUuNOS+iDr261JA43A==
X-Google-Smtp-Source: ABdhPJz70RnlDXEdcqkZ+3HOUcrovFbJJnbCb1FL8I6gdqanP8tFtQyKk3jk7KpKJeTZrZPhHruo7A==
X-Received: by 2002:aa7:df11:: with SMTP id c17mr26908650edy.317.1621874492859; 
 Mon, 24 May 2021 09:41:32 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/28] configure: Only clone softfloat-3 repositories if TCG is
 enabled
Date: Mon, 24 May 2021 18:41:04 +0200
Message-Id: <20210524164131.383778-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210512045821.3257963-1-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 676239c697..808874cb31 100755
--- a/configure
+++ b/configure
@@ -257,8 +257,6 @@ if test -e "$source_path/.git"
 then
     git_submodules_action="update"
     git_submodules="ui/keycodemapdb"
-    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
-    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 else
     git_submodules_action="ignore"
     git_submodules=""
@@ -2281,6 +2279,11 @@ if test "$solaris" = "yes" ; then
   fi
 fi
 
+if test "$tcg" = "enabled"; then
+    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
+    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
+fi
+
 if test -z "${target_list+xxx}" ; then
     default_targets=yes
     for target in $default_target_list; do
-- 
2.31.1



