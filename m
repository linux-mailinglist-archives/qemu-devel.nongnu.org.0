Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4730C6DB7E9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 03:05:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkx0F-00071f-Kq; Fri, 07 Apr 2023 21:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pkx0D-00071O-1D
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 21:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pkx0B-0005m9-H7
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 21:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680915861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=a6YA3eTTcy8F3zokFufVOEGJWuBmzbx0b8aP7pipWmY=;
 b=I0sqOhjaw2pC5KPLaKvlQXt7QtxjsMQ9AyHOPmm4FIP4MPQUhFQ7cCo4jgrfX+k8mjOvxl
 iRH0UN3HlEibgtUp4u0dcJFI1/kx/I+bXS8UO/ccluvdUw/2IZt8Rcl86qo3hcP0/Bp25f
 Q8AtFN//NDhMAzcnilkHMSbhVQ/CFVM=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-N3Lk9SfLMkSvqa0VFMkoLQ-1; Fri, 07 Apr 2023 21:04:18 -0400
X-MC-Unique: N3Lk9SfLMkSvqa0VFMkoLQ-1
Received: by mail-ot1-f71.google.com with SMTP id
 l8-20020a05683004a800b006a384299c67so5276575otd.6
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 18:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680915857;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a6YA3eTTcy8F3zokFufVOEGJWuBmzbx0b8aP7pipWmY=;
 b=3TGnNPznzkjPEFKDKmNZ7+IuBeurFI1W+8QU4H2aqTMlPl+Y9oa4Md5JcZd97dlSNx
 lf3dpaesY7+h/63oHqpiNHROtQW22WvOQl1zYck/xhgojuO94iQ7Wkavrc+OKmf8ofsu
 KBfWuN/Z5YxJOrvWMHeb5CYJx6zE+i4S8qj41eY0e5mL1wVj1VyZQHSsWaOQHlyv0TpD
 eslgTWGvPju2okJAv27QUds/OlTdjjZzrmiIeCKp4FOBati23pTB/ToEHZZJbSBCAoi+
 ngHf5yG5WzLmpwuJ/kN5MvjhVdZ3VIF9VDhTpkRxWBGcNSMOEFqCIHn7kDb1lvUq3Svr
 GgZQ==
X-Gm-Message-State: AAQBX9fjYPLmn7r0ntodMVt/wh8vcJtALuc6Nul1MySkmZXIDxn9bu0R
 4sbsvz4otawYr6kYPbBfzR4iuFg6JXkN2Ni4ZIqcTQOVn0DAKvjNcK/mUA4B+v/48Su0EOEbeGg
 5HNHBc6gqEi2th+zPS4ZL05XCKgUpZETqmpXKTl1IUzY0UiDbU8gXoi8/ZrWaVJ4QhVrnztwDC0
 k=
X-Received: by 2002:a05:6808:8:b0:384:34e:bf2 with SMTP id
 u8-20020a056808000800b00384034e0bf2mr1537550oic.49.1680915856668; 
 Fri, 07 Apr 2023 18:04:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350YhpmtBew0N9Mk3EPGQuSzQDXHyH5Wda+GkO5zu0poQEmUzHK4Kiof5SY644H5lLNWXcWMFfQ==
X-Received: by 2002:a05:6808:8:b0:384:34e:bf2 with SMTP id
 u8-20020a056808000800b00384034e0bf2mr1537543oic.49.1680915856398; 
 Fri, 07 Apr 2023 18:04:16 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.136.22])
 by smtp.gmail.com with ESMTPSA id
 v5-20020aca6105000000b003896e31867esm2161390oib.49.2023.04.07.18.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 18:04:16 -0700 (PDT)
From: casantos@redhat.com
To: qemu-devel@nongnu.org
Cc: Carlos Santos <casantos@redhat.com>
Subject: [PATCH V4] tracing: install trace events file only if necessary
Date: Fri,  7 Apr 2023 22:04:10 -0300
Message-Id: <20230408010410.281263-1-casantos@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=casantos@redhat.com;
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

It is not useful when configuring with --enable-trace-backends=nop.

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
Changes v1->v2:
  Install based on chosen trace backend, not on chosen emulators.
Changes v2->v3:
  Add missing comma
Changes v3->v4:
  Fix array comparison:
    get_option('trace_backends') != [ 'nop' ]
  not
    get_option('trace_backends') != 'nop'
---
 trace/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/trace/meson.build b/trace/meson.build
index 8e80be895c..30b1d942eb 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -64,7 +64,7 @@ trace_events_all = custom_target('trace-events-all',
                                  input: trace_events_files,
                                  command: [ 'cat', '@INPUT@' ],
                                  capture: true,
-                                 install: true,
+                                 install: get_option('trace_backends') != [ 'nop' ],
                                  install_dir: qemu_datadir)
 
 if 'ust' in get_option('trace_backends')
-- 
2.31.1


