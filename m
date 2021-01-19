Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E13E2FC06F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:56:48 +0100 (CET)
Received: from localhost ([::1]:57346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1x7P-0005te-Gn
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5a-0003eg-Co
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5Y-0003Zf-J2
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxultYuQWgOEz2/dXyPtdnKKfRlvW9K7zaGIdG23QTU=;
 b=FCprOcfNXIQQTrhaVAIugKbeTdAN3Y7egkghpyBpzuAaob7Ova8SATjpGowZn8oQJLpdYx
 8lKvcoq9L1Xlq7YgtI7yF6fkcocjgy0cjvxz8oMSxaxY/5cdaf3/Eg9rFYcEO198FeyA3d
 S+9q8KZ0iL5YZl+h3Gqu2UIdcv5bTFM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-IRZyZ57YOve2bjUkjhOSiA-1; Tue, 19 Jan 2021 13:50:46 -0500
X-MC-Unique: IRZyZ57YOve2bjUkjhOSiA-1
Received: by mail-ed1-f70.google.com with SMTP id w4so6108080edu.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cxultYuQWgOEz2/dXyPtdnKKfRlvW9K7zaGIdG23QTU=;
 b=AO8UZKv5Upd8a7R83MV1nxLdxZ3vpje2e2ccD0uICJ3qxebi3C2v5hG0tN4a3GLg1/
 kEBpQr5DbaLWN9svhI4+9Yu9t/UpPRWbD/lPFhascOfaSCQokraUzNT5MBVqn6YT3aoh
 RCCCvjRgyQeYB9eYlGtQqw9DGvHrB39J6L9Y2bL5YRLc6eg2+4ZxcgpFgUFa71slPJ/t
 7o1bYo17IFsHZ/DgzqJ9KtUxcDF2FtXojmSF7zM1eSs2hZnAPkF2srKnuZBQgxUVJ+eJ
 6u81/LYKvRWGWuICsMSSFVWd8cNhw65NCqH2LGdNIzZ9p0ZcLNndT/Its82cmTv1641S
 XIig==
X-Gm-Message-State: AOAM532QELJV/y/uU2jcVfX0q1tFuwNOjSbxHzeSY2yNzqFD52OX6xI6
 YSzdyHYR8z7pSpOumTwjfF3dIi4Rgrt1eC8AGPaGlThb9xANBy9xbRHtsGZUVAknsuA904C2WKq
 JdP4m0c/66Hn2vzcY6Q/gBm8+5p6zda1PHb7VMVk9KZRtOP1f6MiDTjyRJf9pnObG
X-Received: by 2002:a17:906:144e:: with SMTP id
 q14mr3800739ejc.150.1611082244302; 
 Tue, 19 Jan 2021 10:50:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzy0zHpLyDyYmwGX7zvixueX5LoIX9AOHPtYESq2WRbdHpOSRXp66k2F12WcTTLcp4cqFLM2Q==
X-Received: by 2002:a17:906:144e:: with SMTP id
 q14mr3800725ejc.150.1611082243891; 
 Tue, 19 Jan 2021 10:50:43 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e7sm8708889ejb.19.2021.01.19.10.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:50:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] meson: Do not configure audio if system-mode is not
 selected
Date: Tue, 19 Jan 2021 19:50:03 +0100
Message-Id: <20210119185005.880322-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119185005.880322-1-philmd@redhat.com>
References: <20210119185005.880322-1-philmd@redhat.com>
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
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure   | 6 ++++++
 meson.build | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 9f016b06b54..a15bdfb6ef3 100755
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
diff --git a/meson.build b/meson.build
index 575e34d88ac..e6c6d1518ef 100644
--- a/meson.build
+++ b/meson.build
@@ -2425,7 +2425,9 @@
 # TODO: add back version
 summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
 summary_info += {'curl support':      curl.found()}
-summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
+if have_system
+  summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
+endif
 summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
 summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
 summary_info += {'VirtFS support':    have_virtfs}
-- 
2.26.2


