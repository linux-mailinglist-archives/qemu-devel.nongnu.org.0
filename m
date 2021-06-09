Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CADC3A0FF9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:09:25 +0200 (CEST)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv9I-0008G9-6v
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5H-0000O8-By
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:15 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5E-0006u9-A1
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:15 -0400
Received: by mail-lf1-x133.google.com with SMTP id r198so33785666lff.11
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9MSBl1qwvm6PBKVcWEziC8/TNLeqsJud3KoYE2xPGRI=;
 b=dsGPg8nwx1fpwwj+0nX5kZPn3GNDqlmnqrar8rbYjEHycTT/IpOQSZGHkCTCk/OyLR
 rWeQcOiIl5Fwaw8rwKxXF89uLUBrpWmuuETw/4m2m5wVVWp3xpXUTjl86uCWiIRGFZ0H
 uulUyLbafEbjkkdIT+LLDkn22rGY+dF5BOOMkR74vc1WIJNDVfLF+Nc9rkkOGU6UuCTr
 Urb1ehvAGATlSoj2Got6Rf2uqwjMR9vdKsaTImFXIxZQQBevI2AnbrjyzFFyCKJGY2Qq
 e3vGVRG4PG+Ffr3OlaY8o6zrJMTInqASqHsVyM+FUIAcqyvGBhf/igiOz2XIYafxwhDj
 H76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9MSBl1qwvm6PBKVcWEziC8/TNLeqsJud3KoYE2xPGRI=;
 b=ZeQqhD5C8Ee1oHa3iXmsMh656ncWU0H/HIZaRa6pV4SgjXgrQwcHYc6UCH5Zf/Q+nd
 O/06QSK8ATQnADranDYZsILixmyZEmpSDI1wMDewdNA1QdOLHccbVUtULqQLmaTXJQoQ
 nN9HBjQmQyrrDUGfdyMZc61y26d4eXlIWZaOV1vfEYNjhGauLU92LvxkraBkXo8mwjOQ
 ydKj6LyVCCLPfaFNPqMOsDOZnTXU3U5SUCbDaX9l/8xpjPzjS66zonvaStthyhmUdgyc
 bafzhlY7MFq1T+7+gv/iY4Na5tlUiBdUJFD2SdFyicyuNfsw2FfHobDXe6uTu3F1+iyV
 QBUA==
X-Gm-Message-State: AOAM530zAFOapwHYrtQqZat830DwOw82smqeReL3N0RRUonkTnPG0EnS
 oMOnYaHbASc5/g//a/uRJZ3TJA==
X-Google-Smtp-Source: ABdhPJxzGbPwC2xqcBYPR1uqHvrZ4nsSZXPQvoQ+UczkJJ3J/gMuuepqv6mlc+v9AzCV8kCY1csiug==
X-Received: by 2002:a05:6512:3c9f:: with SMTP id
 h31mr1877617lfv.51.1623233110914; 
 Wed, 09 Jun 2021 03:05:10 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id l12sm333590lfk.10.2021.06.09.03.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:05:10 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [RFC PATCH 5/5] meson: libbpf dependency now exclusively for Linux.
Date: Wed,  9 Jun 2021 13:04:57 +0300
Message-Id: <20210609100457.142570-6-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609100457.142570-1-andrew@daynix.com>
References: <20210609100457.142570-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::133;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libbpf is used for eBPF RSS steering, which is
supported only by Linux TAP.
There is no reason yet to build eBPF loader and
helper for non Linux systems, even if libbpf is
present.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 meson.build | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/meson.build b/meson.build
index ce26bddead..fa6c48fb86 100644
--- a/meson.build
+++ b/meson.build
@@ -1033,19 +1033,22 @@ if not get_option('fuse_lseek').disabled()
 endif
 
 # libbpf
-libbpf = dependency('libbpf', required: get_option('bpf'), method: 'pkg-config')
-if libbpf.found() and not cc.links('''
-   #include <bpf/libbpf.h>
-   int main(void)
-   {
-     bpf_object__destroy_skeleton(NULL);
-     return 0;
-   }''', dependencies: libbpf)
-  libbpf = not_found
-  if get_option('bpf').enabled()
-    error('libbpf skeleton test failed')
-  else
-    warning('libbpf skeleton test failed, disabling')
+libbpf = not_found
+if targetos == 'linux'
+  libbpf = dependency('libbpf', required: get_option('bpf'), method: 'pkg-config')
+  if libbpf.found() and not cc.links('''
+    #include <bpf/libbpf.h>
+    int main(void)
+    {
+      bpf_object__destroy_skeleton(NULL);
+      return 0;
+    }''', dependencies: libbpf)
+    libbpf = not_found
+    if get_option('bpf').enabled()
+      error('libbpf skeleton test failed')
+    else
+      warning('libbpf skeleton test failed, disabling')
+    endif
   endif
 endif
 
-- 
2.31.1


