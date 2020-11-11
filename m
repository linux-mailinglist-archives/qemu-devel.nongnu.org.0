Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDDA2AF047
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:11:05 +0100 (CET)
Received: from localhost ([::1]:49006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcoxs-0003P8-Fz
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcowN-0001l5-Q8
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcowL-0006rD-P5
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DhWy8pholMfQJkiIQJrVZ9r7WROXeO4d6XcEJNyaGT8=;
 b=dJdaEhWG3hRnRvLt+9jaFY+3Fha8TvBQgPeNWPi+PROppYZ+ME4kzMIfIqWpHQxe72TB0X
 s6QvLmWMlGuF+widL8SskHIS3WHURFyvHiwZBXQN+JXfD2OPyuu7u+G+1xJaDO5gGXFhou
 N7nXx81oWfCHma/lfKJRTS2U0TrJw8w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-WBLhG3VcP-yTdgOePZoKig-1; Wed, 11 Nov 2020 07:09:26 -0500
X-MC-Unique: WBLhG3VcP-yTdgOePZoKig-1
Received: by mail-wr1-f71.google.com with SMTP id k1so523673wrg.12
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DhWy8pholMfQJkiIQJrVZ9r7WROXeO4d6XcEJNyaGT8=;
 b=tc1eIGQXR2ZmpqxvvWwL1+SkXqF01TSvA04Ae/JDpsfPEUltPXbjiWU1B8JDdWGlzp
 S+qfysu7UEZGptLy46Vch8Tfa3/IYJRr4JxCf7yXYDDCSqu35I+6oYBPjTDWbNbHf4VA
 sQmsgpsn0nKQ4itYsTZmPecHDyrXx4qBObp+4EkNYVjRhmIUpIdohixqOMNtvI4s17W8
 VwVEo9gukN7s4a5Yrd2mvSaUWN0sBCzlOSL6MHc7Jeoq/3RcExtxp5HzZMmp40Miz2Fr
 qE2PptZHleuLSVMfKCtKvNADHfgAHw4KtaVll/HriB4pxsts4TQlMrLDS5ughS1AEDNQ
 +RbQ==
X-Gm-Message-State: AOAM530B29S86ALuDy1JART1ON9YCm0QuVYI2cPphfYXl8cxgYQrXCHG
 2Nz8DRhYJIBOqP8z7czRUsBsjTremdjvOayJwqfCPCkvnZG6jF+vFOlm5VrNegO+qgllhQLWqjC
 k3S05Z32ACw3SUqk544sdrurMGKvjZboRE/nRE5/z3TNLrQSWlfg86fd9aAQGYDLg
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr3703191wmb.39.1605096564493;
 Wed, 11 Nov 2020 04:09:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziR1WVuyO/s1eaMfNt3JS97VllbCIjBCaUwwiB6m6SsvMbzRPclpgJwZQhgWM1x0CfVNjw1w==
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr3703172wmb.39.1605096564324;
 Wed, 11 Nov 2020 04:09:24 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id y11sm2194390wmj.36.2020.11.11.04.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 04:09:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 2/4] meson: Only build vhost-user when system or
 tools is enabled
Date: Wed, 11 Nov 2020 13:09:10 +0100
Message-Id: <20201111120912.3245574-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111120912.3245574-1-philmd@redhat.com>
References: <20201111120912.3245574-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It does not make sense to select vhost-user features
without system-mode or tools. Return an error when
this configuration is selected. Example:

  $ ../configure --disable-tools --disable-system --enable-vhost-user-blk-server

  ../meson.build:755:4: ERROR: Problem encountered: vhost-user does not make sense without system or tools support enabled

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meson.build b/meson.build
index 4b789f18c17..4fc58eb2c3d 100644
--- a/meson.build
+++ b/meson.build
@@ -751,6 +751,10 @@
 
 has_statx = cc.links(statx_test)
 
+if 'CONFIG_VHOST_USER' in config_host and not (have_system or have_tools)
+    error('vhost-user does not make sense without system or tools support enabled')
+endif
+
 have_vhost_user_blk_server = (targetos == 'linux')
 
 if get_option('vhost_user_blk_server').enabled()
-- 
2.26.2


