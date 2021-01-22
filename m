Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07D1300E26
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:52:31 +0100 (CET)
Received: from localhost ([::1]:57140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33Py-0002l4-ON
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33Id-0004tv-Gh
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:44:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33Ic-0002Ty-0O
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmHD1gd1pwAPsPix2HJSRrv+P+pZSRHHJkPZZ/B/00s=;
 b=Eu3h0mFaORU0tC4gPQWHTly0Rpbnb2oeMRGyN2/YUDWEaCd5tqRAvbfO7P3N559NVWi8zs
 j8Xs4vGA4Vd8R4at32pN7xof0jSZTlFWBarGj/lS8AgVlKmm7UgxRqRGhwc6b7+PgzwQU0
 F0qGYH/mTlJ6dcgNf89317OFu6w/oy8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-Ic2C7noLPS2ehe9S1VUyqw-1; Fri, 22 Jan 2021 15:44:51 -0500
X-MC-Unique: Ic2C7noLPS2ehe9S1VUyqw-1
Received: by mail-ej1-f71.google.com with SMTP id ox17so2682541ejb.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XmHD1gd1pwAPsPix2HJSRrv+P+pZSRHHJkPZZ/B/00s=;
 b=Usi4r68B40AYgMUIgvpMU9HrMQ/WT8VDjhITPu/D+uFX+hIdSk9lGYnMPeDSOsuC5a
 AUNDBYjjkWkx4wM0wwH86UAmYTeWvNW+j5yyAaR7XMkO15heV4AMqDglHTikwv2a8k9r
 Z9JMiDr3agj3s7jl94JclfOqHuCvHMrcqJ5rWO5DHz55nKXKv7f62Mpxa043sr7QGxWb
 UYPQJKCuYLY6B8jpepUbZXW5T9fvmmfeb/7tAx4yNlrESRTNLzuXmvIjtcM1dqcabaL8
 LUeE+QBGxXNPBEFenvGyV+7PL7GUgwp19uBf4+GGZbd8KTcizB1hDt8tM/C9FrC4Iajw
 whOA==
X-Gm-Message-State: AOAM530JfjPoYlU8pNEuKsEdIXwTlEXHOT//WgSIl7EIMTz4RdRS1rUA
 FDK3WnB4HNhALq5BTH2AtMLdkfkgpA0e6AeXPjervPIxy5ouqsSvrI8qLUMYamRzDvuZX1evG+i
 6hzoqCUMVZoQwbGAJ9z5ygFUlD2vsk4ZicJRg16pdc8e/Aihqdz/adh0Ew7VpTexP
X-Received: by 2002:a17:906:fc5:: with SMTP id
 c5mr3723750ejk.538.1611348289719; 
 Fri, 22 Jan 2021 12:44:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxK02+JJY99Q9rKGjKUMGnd+sQwdHmgZS+DP00uahWImMj3GkxvoiD/XqpboHLzOJhICFb4wQ==
X-Received: by 2002:a17:906:fc5:: with SMTP id
 c5mr3723731ejk.538.1611348289522; 
 Fri, 22 Jan 2021 12:44:49 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s1sm5227798ejx.25.2021.01.22.12.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:44:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 01/12] configure: Only check for audio drivers if
 system-mode is selected
Date: Fri, 22 Jan 2021 21:44:30 +0100
Message-Id: <20210122204441.2145197-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configure b/configure
index 6f6a319c2f6..a4476d457e0 100755
--- a/configure
+++ b/configure
@@ -2324,6 +2324,12 @@ if test -z "$want_tools"; then
     fi
 fi
 
+##########################################
+# Disable features only meaningful for system-mode emulation
+if test "$softmmu" = "no"; then
+    audio_drv_list=""
+fi
+
 ##########################################
 # Some versions of Mac OS X incorrectly define SIZE_MAX
 cat > $TMPC << EOF
-- 
2.26.2


