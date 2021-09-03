Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498873FFF40
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:34:27 +0200 (CEST)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7Sk-0003kQ-9q
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74L-0000V6-KR
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74J-0001sn-Hr
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHnJ0cVcteOlyXY2WQSoPOrlbaqqNkIp409L2/nVF/Q=;
 b=WhHJfzPW255vqVa4J6JhM4F/4+KRMSrbTn76eXL3oZkgssip+q1sw7DiT/g82B7C9egVyg
 IvoqgBrQl7lhx0hs5KeQ5h1zp0DWH3p5k7YrmwET+qhkMgJemrJtY0izMeuXZOh0QGp5Jh
 ZhbkwZNbaQ9mUpYXytkdLv6aC1NmU7M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-8Kn_zo9PMJWY-0bRxLgReg-1; Fri, 03 Sep 2021 07:09:07 -0400
X-MC-Unique: 8Kn_zo9PMJWY-0bRxLgReg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so2513277wmj.8
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHnJ0cVcteOlyXY2WQSoPOrlbaqqNkIp409L2/nVF/Q=;
 b=uXwZOIY9xW3vMLqLCW68XPiZnERqqzYqNpircezBiIHVSDD5CfNr2Cpt1yJT587QsK
 fzCnUQlqtZeCdSsEHJBNgodm1KPs30JSZqYvqnHlMRawPwOIJzL8N1vddpcQy0Iibicf
 k93eoSSvfASCJg0C1OtBG3ruNKvB/xn08Lrs+i4ABrXD9FZwD66dob9INX6vU1OYgT2f
 oq7zIey4mDc+i7/KH7ROTKByUidB7q2Zuy/Nf8TfydlJPZa2ZPyY6D/ORdUmAtAMjDgA
 FGnuL03hdXMoedjkn3J8L/+gJfsYtwQWomfxf6NK+99l4095mKsehnWohLyVMm4EeSGS
 5wGA==
X-Gm-Message-State: AOAM533zWjr0RX3nT02m1VZ3V0N3Dcwwc4XD+Oj7ZgD273C1edP5Ji2I
 MJ5jh3DqnYlO64hHj1d7ux7/QkkRtuJiV7iTd3dDOc0Xdw1bp9InF408jPw/H+08Q1feRK630qH
 ZmiSOpkO2EEzlUre5TnIL2NfRQmnkA1anGKPiM2XBwMjrJTI6pRypOPhzD0taElRh
X-Received: by 2002:a05:600c:2210:: with SMTP id
 z16mr7583429wml.70.1630667344786; 
 Fri, 03 Sep 2021 04:09:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzXN5Abat+u5GhU97+T79No5Nl13oW/wgdhYam21QjGlUyuHjSwW1tSLBF2QoToAE6kZSvQQ==
X-Received: by 2002:a05:600c:2210:: with SMTP id
 z16mr7583359wml.70.1630667344397; 
 Fri, 03 Sep 2021 04:09:04 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 q13sm3880071wmj.46.2021.09.03.04.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:09:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 21/28] ui/clipboard: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:55 +0200
Message-Id: <20210903110702.588291-22-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
TODO: audit qemu_clipboard_set_data() calls
---
 ui/clipboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index d7b008d62a0..0e12a55d3e5 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -123,7 +123,7 @@ void qemu_clipboard_set_data(QemuClipboardPeer *peer,
     }
 
     g_free(info->types[type].data);
-    info->types[type].data = g_memdup(data, size);
+    info->types[type].data = g_memdup2_qemu(data, size);
     info->types[type].size = size;
     info->types[type].available = true;
 
-- 
2.31.1


