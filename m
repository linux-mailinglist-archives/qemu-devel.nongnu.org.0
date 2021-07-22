Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C35E3D26F7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:43:00 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aqX-0006vH-9m
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akN-0000g6-OR
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:28 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akJ-0002m9-NG
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:26 -0400
Received: by mail-ej1-x62c.google.com with SMTP id qa36so8970267ejc.10
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mdtr8XFQwFP7ENj776O5QnFQUyoHYwPVbVP0E5RC+v4=;
 b=Hl/o7U56vixTaa03CFQq9rO2Z5Oe/nuONTr+MwXCvvJzzE4THUvJ5gUnaavd/upxAn
 LGHw0zop/pvW4nTJ3RsPmrCPnZFOKlLTJxWaFw/RqeXDc3eqJXvUwJE7TAfb4KsHEr1J
 v5KPSVkWIvAh19y1zHcKw7zFijqF1SUbEF9Hu2lOibbXCMJD5UixgDtIJt4PBGEYOPA0
 mz3fZ46JllT2VAcfbfBFoZx+9/++emjzvO6x3KSkaVMrjgpQ4ldc6bMwiFV3O5GF8Spw
 afalG9w6Ecswfem3J5fh/7tPI644Z4c2yuR6LuXqV3zrFx4M8n0rcqdl0XQG3GgdRhTX
 iWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mdtr8XFQwFP7ENj776O5QnFQUyoHYwPVbVP0E5RC+v4=;
 b=Q1wQ8BSUf/CC9Vbs+VBVbBE6N0SKXyvblcoXQrBbU3boW3aK42kLBc3NiT/wiWmXFB
 c82FVvfUkH5BuP1cjjVhp9WyIETMB10IUWFZWrOv2NgLXRFcE5eCh718W8408d+SX9mj
 BntZ6mvoULN9faVthScTajLCzZ36FOB82F0uTSgu2rLH36ilpqt38kEkqN7FG/x5uxgV
 4yh0hkMS+JtjhcpTlzheRZvCOzPw5KqeaF01ZPRkJ/GlPE5SPQ1hXe2bua2GEro85Hx6
 u+LD7KMHXwvOvKfzSDlDlIfZgdP5xvU4I+FPiuHV02pLdL9eFEGAKIP3hyf8uFprelMd
 8VXA==
X-Gm-Message-State: AOAM5308HzruiwsBp9Iu9p8bv7NrqCgy92PYk6f3O7LmOAiSJ1UzGZ9N
 gua0H9Ugr2ACb8IjMkoWv+RFupMmFlU/ug==
X-Google-Smtp-Source: ABdhPJxywVYxuqrMcrWja00bOeYz0gWBWxy4v1f0UMEDk0ST8tccoNPE4rqoWFqn7PvJnKZ2Ov8bXw==
X-Received: by 2002:a17:906:a18b:: with SMTP id s11mr510429ejy.8.1626968182299; 
 Thu, 22 Jul 2021 08:36:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] configure: Fix --without-default-features propagation to
 meson
Date: Thu, 22 Jul 2021 17:36:09 +0200
Message-Id: <20210722153612.955537-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

A typo prevents that many features get disabled when the user
runs "configure" with the --without-default-features switch.

Reported-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210713093155.677589-2-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 026704f15a..19c4bc1192 100755
--- a/configure
+++ b/configure
@@ -5206,7 +5206,7 @@ if test "$skip_meson" = no; then
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
-        $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
+        $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
 	-Dtcg_interpreter=$tcg_interpreter \
         $cross_arg \
         "$PWD" "$source_path"
-- 
2.31.1



