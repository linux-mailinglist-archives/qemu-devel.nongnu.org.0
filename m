Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C46C5096
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 17:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf1I8-0004CO-JW; Wed, 22 Mar 2023 12:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pf1I7-0004B4-3P
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pf1I5-0002Cc-DX
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679502380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S2V4t3KnhlOuG727Hj6mPv8xcqibmPnjogZ63o9SKwg=;
 b=YpJUHy/bMjGA+eRuoJgZoZLnCGD8MhwDWn/hhsUUsGnTKWl5i/e+tzHm/jH9QGgxJ03voL
 ytkKANhO+XPX4vHmCZfMqOuH8W3vBL2niHA4Vhvd/2iawRMVKmLXoYv6J3vfyJNFRgRgw4
 KlQyMIYUD2fIsDXWL4+TW6VfWXyza2w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-r2AjDhSFPy-AC5UjyAxghA-1; Wed, 22 Mar 2023 12:26:17 -0400
X-MC-Unique: r2AjDhSFPy-AC5UjyAxghA-1
Received: by mail-ed1-f69.google.com with SMTP id
 s30-20020a508d1e000000b005005cf48a93so16657580eds.8
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 09:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679502376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S2V4t3KnhlOuG727Hj6mPv8xcqibmPnjogZ63o9SKwg=;
 b=3U/NYmrNtmha9+orjY8nc0YzACOl75vhHgey4PrDgnNOic0hxyd4adqlm1UlXD4XXk
 gHXSrMDd7HJIs4NM1TSml+OHZRcnnf9D6S6/jLeF1Fuyz2AmcT8xMrXXXtishK/qAhmz
 OoT5/+b17gJQtwuBFETBpexF3zZNPg7VpjVDjBMQkE6RDKWSHWMurXex2QX5nBXWA5sb
 mNYV8apm5/ApMg2bGuoiRUO4x8OzXRzQjrO3N3axU6ho7lhBJRdnlihzfRTBbIgg5Ovt
 FpFgVpC5oAYaYNuZyJmPq5PwtEpWwNbSGPJrAedEEPW8Pyr8C0p8Lq3hWI6RGWMi4p4H
 QCfg==
X-Gm-Message-State: AO0yUKWXPAJD7MFVTPMciGkfR6XzBHvnmLmhiPixCmqml+ObUb3WU0jc
 LkXSRXveaJH5R0JTnhlZ56l0fqhhjYU8g2yEjxW3H/8+58PFN61x0P/+hMZBDlu6AwmMT8ezNuj
 V8Oa4DLB2N3z3T4H189ikpAHuwwg6HOF7Dc3lRY5uxdr664hzLqIHpts5SNAq/FlGsHhyzii5aQ
 CP7Q==
X-Received: by 2002:a17:906:7016:b0:930:45ea:4a28 with SMTP id
 n22-20020a170906701600b0093045ea4a28mr8572082ejj.35.1679502376321; 
 Wed, 22 Mar 2023 09:26:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set9kJEFaLT5T8/NlSH72o/wUIwq+QrQ5JstfBCz7p4a+YeqPfYNIp45qXBE4RTHKu2ST8fqAqw==
X-Received: by 2002:a17:906:7016:b0:930:45ea:4a28 with SMTP id
 n22-20020a170906701600b0093045ea4a28mr8572062ejj.35.1679502376014; 
 Wed, 22 Mar 2023 09:26:16 -0700 (PDT)
Received: from [192.168.1.72] ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a170906199600b008b1797b77b2sm7333073ejd.221.2023.03.22.09.26.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 09:26:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] make {{relative_root}} available in the blog/ page
Date: Wed, 22 Mar 2023 17:26:14 +0100
Message-Id: <20230322162614.1023576-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This fixes links to blog posts on gitlab.io, where the website is under
/qemu-web rather than directly in the root.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 blog/index.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blog/index.html b/blog/index.html
index c7ceb0a..ab82aac 100644
--- a/blog/index.html
+++ b/blog/index.html
@@ -2,7 +2,7 @@
 title: Blog
 layout: blog
 ---
-
+{% include relative_root.html %}
 <!-- Main -->
 	{% for post in site.posts offset: 0 limit: 4 %}
 	<div class="row">
-- 
2.39.2


