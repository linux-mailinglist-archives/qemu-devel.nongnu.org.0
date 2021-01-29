Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082A308832
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:22:02 +0100 (CET)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rqj-0006FG-FU
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnM-0004RG-0b
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:32 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnJ-0005yF-Rt
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:31 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c6so10160217ede.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C8pY6ef/gvyMoBxKzaS6s9owrZc+gVZ4zdWQxqRNCqM=;
 b=qWEdZrzpk0NmXyrPG7Fz1H3dvyuMqkdw5glyEEz3/hk/c/0h1o27jDmOKfZLB3gDb2
 htDxpqCWO6Dd/JnqKHlQLBe0lbjGcFXNP1ein93vDv0/hdFHO7tnhK5XsyR9QFIWW2z/
 HK4SlSIZ7+m2Db1u3DZC2I5fiNhyLu30f9ZIffFusrOG/Nor0Y1girf592M+/x8RUuWz
 Lkq81216pse5ircclRzcsgmQpITBiCE+mmzqACE/f6z+ABWex47YLV7y4hbhhK7dw3ei
 kSLq0NcSAFhpbvQT+++R56qA4gcCkAUN/ZfOXgJGE+j5ccWcTmPmIk6K9wlVtejbODOv
 EYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C8pY6ef/gvyMoBxKzaS6s9owrZc+gVZ4zdWQxqRNCqM=;
 b=qHelztsSamesIDFuYYmGFILDhjd3T3toLHTrfG42HzkIy8ib+hr8OuGD62lQ0lvk8i
 hLTLtyWgc40aRi4v4KEGJ/T3w53AG/LXXhsdiGXFXmEgtQRTLpQXs46iQyvjqWHk1vYF
 8K6Q109SB/7c1Z3FQH3UOArj9k4qrnY508LsMeZ4xrDJGUNPIw5ocWmkUdVt/NSxMqK3
 YvAUSAaA1HUc/GuijVLJOkdSXqwtc21YW7iqspcJiIi16g0Eif4Bbx6cbjiskfzV33bo
 0Ao5kBMopWQsV+dDbkZeSwjeC/mu8vrhzbjzHHR9RMnycFT46SSI9t1QYKje9RY84O5a
 4gCg==
X-Gm-Message-State: AOAM531FU5qLtKbx+RxwiFj15dPwdFW9ofFigB1p1oB/ynqe7q304vrl
 oEoAKV3v2/DMOsDL6djR+IRW5y+W6qlwvQ==
X-Google-Smtp-Source: ABdhPJyySDlRbOfJacXXi6gfEX9tO3YLIXqBkRTKmOzjGoTFOuiOtr8i7gKq69TQM9qVLNt0TthohQ==
X-Received: by 2002:a05:6402:1e5:: with SMTP id
 i5mr4600354edy.86.1611919108539; 
 Fri, 29 Jan 2021 03:18:28 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/36] docs: don't install corresponding man page if guest
 agent is disabled
Date: Fri, 29 Jan 2021 12:17:52 +0100
Message-Id: <20210129111814.566629-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Stefan Reiter <s.reiter@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

No sense outputting the qemu-ga and qemu-ga-ref man pages when the guest
agent binary itself is disabled. This mirrors behaviour from before the
meson switch.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
Message-Id: <20210128145801.14384-1-s.reiter@proxmox.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index bb14eaebd3..f84306ba7e 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -46,9 +46,11 @@ if build_docs
                           meson.source_root() / 'docs/sphinx/qmp_lexer.py',
                           qapi_gen_depends ]
 
+  have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
+
   man_pages = {
-        'qemu-ga.8': (have_tools ? 'man8' : ''),
-        'qemu-ga-ref.7': 'man7',
+        'qemu-ga.8': (have_ga ? 'man8' : ''),
+        'qemu-ga-ref.7': (have_ga ? 'man7' : ''),
         'qemu-qmp-ref.7': 'man7',
         'qemu-storage-daemon-qmp-ref.7': (have_tools ? 'man7' : ''),
         'qemu-img.1': (have_tools ? 'man1' : ''),
-- 
2.29.2



