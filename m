Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446D35E413
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:35:07 +0200 (CEST)
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWM0I-0000VU-5R
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWLay-00072m-VQ
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:57 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWLax-0007Ht-C5
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:56 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u21so26808241ejo.13
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qsvSz9M49RzWb+6RGDeUXmR8bevynykltE41KgLy07I=;
 b=Tg+6slIxNMnxwrDVcyVT0TF1wA+Xrtb182sjzbUHdKUXT8pnazuwlwaekv4QtxWG97
 ejm/U1wCqEVo2psGL5PHwUjGD9iuZ2KNCy7wGhD/OZ4n69zQ2uxYOKiNojnWfCNRrkIu
 sBMWkF6ZeUPdV/v50xKgv+TUAl6JtESEsVV6uokCAKBbKCPAPypJ5ymd2BhLq99j7sYr
 Etllm4eMBCEjK+dYBZn7KieyPD4PLhcORvFbGgcJbILfZqPtHUJUQgbIpT9eOJvmYFnZ
 ybzQkZYmBYU0jOrVVGKD53XYa33BtEn5EHtBkE5RZQT7TV96ifQufroRCB2GVjG/HlPa
 hvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qsvSz9M49RzWb+6RGDeUXmR8bevynykltE41KgLy07I=;
 b=s0N4DaCFnOSlv7O2gY6C1r4dEMZbrG30HgZKUDvC5PS6yuo1Pes2H1QkBvI5FQrNcY
 0fnQxp4v3uFVervAMagdzcj6Nv2P2r+XuGNtIfyn5llS0Epk4if94tqf2TdxYQ4hNASc
 WJppKX4edDmljQWsxk6fJg6NJObtLDKjWRJkbqLnn78j9b7vIM6SmweT1dJC1tQQz6xR
 5lFhAXtWUwhtXBVHqSH+SiwBVFHc9RupC1l9DZWNmTOnZKzmK8rx+aBChCL+B2riRPEf
 VX9/FdNT9ZkSIyCSbXYlxClC+7u0rdieGFUNAONpoTEPzYnQTg3Tc5MHdN6sXyOCAjvT
 TJTg==
X-Gm-Message-State: AOAM532E4CQeFijnDO+JhlxWnAEu/KvsjaUwZRzfYgnc+IcL3htozbvz
 q7j1u4QTxDD2qay2T8rEvNu9oZa5q4U=
X-Google-Smtp-Source: ABdhPJzH2La0PZXTRbYfxdSMOmiE6QcKqjITQ88f1EuEn+CqMNXWJTPkps/c6l27t42eBsHsjBx/WA==
X-Received: by 2002:a17:906:c1c9:: with SMTP id
 bw9mr12599709ejb.239.1618330134121; 
 Tue, 13 Apr 2021 09:08:54 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u19sm9897670edy.23.2021.04.13.09.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 3/3] qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in
 common code
Date: Tue, 13 Apr 2021 18:08:50 +0200
Message-Id: <20210413160850.240064-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413160850.240064-1-pbonzini@redhat.com>
References: <20210413160850.240064-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The ObjectType enum and ObjectOptions are included from qapi-types-qom.h
into common code. We should not use target-specific config switches like
CONFIG_VIRTIO_CRYPTO here, since this is not defined in common code and
thus the enum will look differently between common and target specific
code. For this case, it's hopefully enough to check for CONFIG_VHOST_CRYPTO
only (which is a host specific config switch, i.e. it's the same on all
targets).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210412160710.639800-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/qom.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index db5ac419b1..cd0e76d564 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -752,7 +752,7 @@
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     { 'name': 'cryptodev-vhost-user',
-      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
+      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
     'dbus-vmstate',
     'filter-buffer',
     'filter-dump',
@@ -809,7 +809,7 @@
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
-                                      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
+                                      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
       'dbus-vmstate':               'DBusVMStateProperties',
       'filter-buffer':              'FilterBufferProperties',
       'filter-dump':                'FilterDumpProperties',
-- 
2.30.1


