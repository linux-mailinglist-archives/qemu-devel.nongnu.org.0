Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D376C97F0
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 23:07:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgXZ5-0004rt-JK; Sun, 26 Mar 2023 17:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgXZ2-0004rM-3n
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 17:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgXYy-0005B6-1I
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 17:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679864762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fmlXWej1Xdx6NJARM/R6yDS5/MAZgSEn7N2RNVKL6wE=;
 b=BB6abfamMXm27940VIwUSX10Dk3IJ+QQFNkR+Cbye3F4YPIyoZrfZtvUMkIYvso8DXIVTc
 k43QQYbF4EAdslRxi9vxq3rsGu8WgeSbYCoD1hO6uLdQfjNhMOn9JGs9AzZEiGSKKVQF2f
 fsQbqJtdAxXtUg9KPcuX6R71T9MRT28=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-9vTSXuLRPFeldp_8nVk_4Q-1; Sun, 26 Mar 2023 17:04:52 -0400
X-MC-Unique: 9vTSXuLRPFeldp_8nVk_4Q-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-177bf70751bso4244193fac.16
 for <qemu-devel@nongnu.org>; Sun, 26 Mar 2023 14:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679864691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fmlXWej1Xdx6NJARM/R6yDS5/MAZgSEn7N2RNVKL6wE=;
 b=00IpPKMsA+/4q+St73Cye1kIbDmn1pTwOBk3yf7GH0wdr7YNZSYYguIYtnBzXzSHui
 X81KaOEqg3Ci5NcGeXhUWvkU6klmqxflJczwF5iU8OZV86sqcWmpLn1wCCsOsfvchm9Z
 A8oqB8MSxQekCBa4l8CF/yIap85INRvF1WGUL4lIpm4PuuwMg8YE7splYH72h0Fr3HMi
 wVdj4HT9N56uazRpSotgQ2MYP+jsyHly4vYDB0IcVR1We8V/jHgRArxpKQdc87TR98Fm
 DYsn40jg2Ixb+N0Rd+cqxBlRq/84IDYDhZkP9Tr2gfYljHth9xlmWvskTmyksnHNIB9R
 xF8g==
X-Gm-Message-State: AO0yUKU1OM1g8GnECNXA0wJ/uZLO2X6X3wU770QYKDuBIX83jTN7Qvxw
 0nbTz4ICIm7ie8gZmh06lpaup+2V/pLE4LpUKSVh0uoMtZhiP6FW+FslhY0KB7YPOLlsvbXJu7I
 QA4icMiF26yiqDTUYOPJTnlHXAq5PgxJdrclfKfJ5EcAaluSNhQQMlhU9Dd9Wla94Q68vaVid7k
 0=
X-Received: by 2002:a05:6808:1443:b0:386:9c8a:ed74 with SMTP id
 x3-20020a056808144300b003869c8aed74mr4201363oiv.38.1679864691639; 
 Sun, 26 Mar 2023 14:04:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set/FleZao6+6fvMal7S2Fb+ouL3sPkbrjpIaYiMXruMWWao1P7YOAAl5+PkeFODr2W9YGHZmng==
X-Received: by 2002:a05:6808:1443:b0:386:9c8a:ed74 with SMTP id
 x3-20020a056808144300b003869c8aed74mr4201355oiv.38.1679864691361; 
 Sun, 26 Mar 2023 14:04:51 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.139.132])
 by smtp.gmail.com with ESMTPSA id
 q130-20020acaf288000000b00383ef567cfdsm10398710oih.21.2023.03.26.14.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 14:04:51 -0700 (PDT)
From: casantos@redhat.com
To: qemu-devel@nongnu.org
Cc: Carlos Santos <casantos@redhat.com>
Subject: [PATCH] tracing: install trace events file only if necessary
Date: Sun, 26 Mar 2023 18:04:46 -0300
Message-Id: <20230326210446.66170-1-casantos@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=casantos@redhat.com;
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

From: Carlos Santos <casantos@redhat.com>

It is required only if linux-user, bsd-user or system emulator is built.

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
 trace/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/trace/meson.build b/trace/meson.build
index 8e80be895c..3fb41c97a4 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -64,7 +64,7 @@ trace_events_all = custom_target('trace-events-all',
                                  input: trace_events_files,
                                  command: [ 'cat', '@INPUT@' ],
                                  capture: true,
-                                 install: true,
+                                 install: have_linux_user or have_bsd_user or have_system,
                                  install_dir: qemu_datadir)
 
 if 'ust' in get_option('trace_backends')
-- 
2.31.1


