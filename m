Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A14669027C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:51:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ2dS-0006zr-KS; Thu, 09 Feb 2023 03:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pQ2dE-0006y0-SW
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:50:18 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pQ2dC-0007i7-Ox
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:50:16 -0500
Received: by mail-wm1-x332.google.com with SMTP id u10so906809wmj.3
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lqo0u/rwVHdjlNoO5aDn6nQFE9yTckKjy6CeUI2KWQ=;
 b=qPKSbr+Yo+Sdp4nX/xoRgFH8esMxpyu9fgnDbqv0LBYOr63E99HdzBWaSlWOBDsjST
 p/JnDOOenTFkRJq3+sBY6JMfVKoK6XEAZOJj0e/H2qKVd0lmcYVqlXPwoqEjyRnqL4si
 SoLzL9B0UmNbj2+vNLkLs/mTXur/uSjx8238OTe3uNANAtOWLNtOaX+xdOXCebv2/A/D
 vpbTNf+15bOwHVfFswhMcHKqOIQo3lRC93hHV5I5qCUBE+zt5HFP65E1TFm9i06kOae7
 1NjTTJWA0W6weeYgCqFyuHsXd4eRVL9mF7o62UCBoeSppQ95NB4E02kRJAyxge6dhK1X
 TMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lqo0u/rwVHdjlNoO5aDn6nQFE9yTckKjy6CeUI2KWQ=;
 b=c8WVzgnF+LzcQALe+J3rRjC1cj5eIYmqYHtO5fufpi6uhAF5kxY36ifsBbXjaZceur
 p9RqYIgsMdj1qsqNnTNqobQCJMI7HdISfhYWTy1nTVgkmYbUdGjy8kU9FPomsXrGLRmF
 AtzJwmwYJzsJJTkVPkxoYnT/R0zn5H7tyk1j4ZrdcGT23bZ7fIDjMgGAm/FfDHvc+nPh
 EedmHzs+nR9Dq1TSsTHsWEO9nWILlNQEgxsz8FzJE+vs1JmothfKoyJHBC/Ns8htz+lY
 t17OLRr0n/bt0mY/kMqKfOmNQ/CzhPYnyTr94UAjJ+9/iZnZYR0b47yOtEq+yZVZZApE
 9qYw==
X-Gm-Message-State: AO0yUKWFzit9mQA5g0B3X229IHR+D/vXVKVNKEF/FUg69mMHmW24mO9+
 RPc9nSk42gj83CQIV9ckEP0ffoFmESOQFJ89
X-Google-Smtp-Source: AK7set8wElEyiZaLSRg/z28L3AO/ffjBH4GQxnEdSd626kvgO211YvquPe58EFDVZdLl1DuHjzE1Zg==
X-Received: by 2002:a05:600c:1714:b0:3dc:5a7c:f8ad with SMTP id
 c20-20020a05600c171400b003dc5a7cf8admr12230633wmn.21.1675932612628; 
 Thu, 09 Feb 2023 00:50:12 -0800 (PST)
Received: from bark.. (bzq-84-110-34-91.static-ip.bezeqint.net. [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id
 ay42-20020a05600c1e2a00b003dffe312925sm4169535wmb.15.2023.02.09.00.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 00:50:12 -0800 (PST)
From: Kfir Manor <kfir@daynix.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
Subject: [PATCH 1/3] qga/win/installer: add VssOption to installer
Date: Thu,  9 Feb 2023 10:50:02 +0200
Message-Id: <20230209085004.2745131-2-kfir@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230209085004.2745131-1-kfir@daynix.com>
References: <20230209085004.2745131-1-kfir@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::332;
 envelope-from=kfir@daynix.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Adds registry value VssOption with value 1 to QEMU Guest Agent VSS Provider service registry key

Signed-off-by: Kfir Manor <kfir@daynix.com>
---
 qga/installer/qemu-ga.wxs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 51340f7ecc..f7f145aa05 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -121,6 +121,10 @@
               <RegistryValue Type="integer" Name="TypesSupported" Value="7" />
               <RegistryValue Type="string" Name="EventMessageFile" Value="[qemu_ga_directory]qemu-ga.exe" />
             </RegistryKey>
+            <RegistryKey Root="HKLM"
+                         Key="System\CurrentControlSet\Services\QEMU Guest Agent VSS Provider">
+              <RegistryValue Type="integer" Name="VssOption" Value="1" />
+            </RegistryKey>
           </Component>
         </Directory>
       </Directory>
-- 
2.38.1


