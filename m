Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870362FD3B9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:19:28 +0100 (CET)
Received: from localhost ([::1]:39286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FGY-0000dA-Rb
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FDC-0007ln-0d
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FD5-0006o7-Cu
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0Lg6uX84p1LPWITP9dNPvIU5LrfcXr+e7/igv0ptxWE=;
 b=bCj3QQfX8SvDY/cl5ZlP/OugrUY05qQo5+gsuI+IhPsE+D4JcNu23q8kDcoUOdsDIOQs2w
 oXrDq6iZUYEFJXXVLOXu4LnveCT+YzyDDYL2pCBsh64tlc9w8mWIJp9QWEhUxzwgdlIfpU
 M+wIhKoI3gbjYwkxOQWiJT69oHrVq4E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-toD6RvjkP7SSB-BE9rmWtg-1; Wed, 20 Jan 2021 10:15:42 -0500
X-MC-Unique: toD6RvjkP7SSB-BE9rmWtg-1
Received: by mail-ed1-f70.google.com with SMTP id m16so11146377edd.21
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 07:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Lg6uX84p1LPWITP9dNPvIU5LrfcXr+e7/igv0ptxWE=;
 b=IjGsMIk2W5TuwDLESocyNRW4PpHV21nozjHAWm79P+dObsYIa7LvvaiUb1BKdAjFJI
 Zy7/g8Qj3jNCZg44yHruj4xCuevUS5wXah33kJF8SGKF0KdjvKg65wAcO4OmcIuNb7rO
 3414xtor5OKiFjZWlphG5ycSRn4i7yRGWhnAbsBsIQPDhQf9C5m7ZBBGiyS2fbinsbDS
 daV40oyn5H62or7VSdyMW2HKlSh4eNJwjBhxLKryFiqWptDuHdQtxlPtt8101eR8fx9D
 rZCuQC82SjcSi6miKUzkg5nxDtBC16Wjz56zg5nRufKHMaLqeua7BHyGSjuHzCd4dC1B
 yu4Q==
X-Gm-Message-State: AOAM532yWVPUqV3PsXXUN/1AXF0tC6JF6kyYVplRblodZBgodvwZG9M0
 /kr1S8SIJTlNzAr2bCHYIn0Xh2i2jz08Pdlm03AqukPUmMg/+OI3/R+uArZrGI4Xvact6b3IglI
 KVv+GzIZ0q2/wbffV6OXf7PLO86FfAAMuoVLMoD9xn/stPnFanD9TENVIUSNgzbmC
X-Received: by 2002:a17:906:9342:: with SMTP id
 p2mr6676380ejw.300.1611155741257; 
 Wed, 20 Jan 2021 07:15:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHDEmSmQjbyXiXiN4cQ4PRL1RP84s7hySxy7XqUsXtCj01tihxdTR6YcaFCHfvB7EexGjwTA==
X-Received: by 2002:a17:906:9342:: with SMTP id
 p2mr6676356ejw.300.1611155740995; 
 Wed, 20 Jan 2021 07:15:40 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d18sm1265254edz.14.2021.01.20.07.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:15:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: Declare have_virtfs_proxy_helper in main meson.build
Date: Wed, 20 Jan 2021 16:15:39 +0100
Message-Id: <20210120151539.1166252-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

have_virtfs_proxy_helper is used from docs/meson.build, and can be
not declared when including it before fsdev/meson.build. This fixes:

  ../docs/meson.build:54:2: ERROR: Unknown variable "have_virtfs_proxy_helper".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build       | 2 ++
 fsdev/meson.build | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 3d889857a09..8f5a8b997d3 100644
--- a/meson.build
+++ b/meson.build
@@ -1032,6 +1032,8 @@
     libattr.found() and
     libcap_ng.found())
 
+have_virtfs_proxy_helper = have_virtfs and have_tools
+
 if get_option('virtfs').enabled()
   if not have_virtfs
     if targetos != 'linux'
diff --git a/fsdev/meson.build b/fsdev/meson.build
index 65455a179e5..adf57cc43ed 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -8,7 +8,6 @@
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
 
-have_virtfs_proxy_helper = have_tools and libattr.found() and libcap_ng.found() and have_virtfs
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
              files('virtfs-proxy-helper.c', '9p-marshal.c', '9p-iov-marshal.c'),
-- 
2.26.2


