Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42240047B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:04:29 +0200 (CEST)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDYC-0007XX-0O
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHV-0001IW-Fg
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHQ-000281-J2
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vC6PIuQnjMImB1rzjEb7/fuKsW0b+ne9BdxKzdZmtOI=;
 b=JGdhMoCjClfq95XjnKrtrgNvCaGBKzUScrrz+9YbWBKFOH3gxLudrPxjyWZeiFG29IvfKG
 UzKbfXH0Sw41lZ2/3wMwmHU+ZsVQZebAhmTsEBh4l6zDt2GDSCHpOGtNqk0QyOt/oJPRet
 2IelFz5RKo6cKccLAcqW3qhRw36R2qE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-iSIVBwxSPpWzw2ipKRYqnA-1; Fri, 03 Sep 2021 13:47:07 -0400
X-MC-Unique: iSIVBwxSPpWzw2ipKRYqnA-1
Received: by mail-wm1-f69.google.com with SMTP id
 y24-20020a7bcd98000000b002eb50db2b62so42681wmj.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vC6PIuQnjMImB1rzjEb7/fuKsW0b+ne9BdxKzdZmtOI=;
 b=ci+xVDvXlI05cxlOd2QZduJtLaOGe3iZ8I9OqXBCkl4qRZijixpW7hdJD4MX/iDT45
 gCoZutNVmAqt4uemcXM9vugpbpp2FwIGzeYURskhAkTXd3z3Ch3m7/7Q0iUHX7GZJtk9
 j0ZWyFXK3OptbwMdbJKsi5IuGNGKKJ1aONqHvNMw2PHFTRXPHqIVy3w+sQF8fkpxL8xd
 +NFONClMsG+zSEC3x4EDRQqco0PEv6y+kmhHo4/KyCslQVHu8IbQ6iiVuyFqiUa4O3Ba
 qJFwhHeeEPz3P92X/VPXMNDIADcBlVN5AarBD3LsOS3Zo/odOdjrbT5vKjoaaYT6FZ5k
 kzoQ==
X-Gm-Message-State: AOAM532w8NTAuJq1xBPUZ5DhJAmoCzzV9lvKjbLsKtJWfSU3UtsTmhGi
 yoOfNzk51JTpdgw1ZHqdeZ/dR0GqXfcoq9RSytoMEGnIzDZr5UqxsbuIWLmuEchisYIz2BUh0q4
 YReSJC3eTcGZcAk7/edo3tq2nMJSWvFSyjg+VFR2kpEYlUZRWrefQxRkJcDTM9Ibn
X-Received: by 2002:a1c:7304:: with SMTP id d4mr17219wmb.119.1630691225590;
 Fri, 03 Sep 2021 10:47:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPU/5cLYuhYqsTcAzaJSAxmX/L8p2iA8qsSiz4BRSPdtah1qveeKGv8kgF4TPpGGeX3DJ+yQ==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr17190wmb.119.1630691225406;
 Fri, 03 Sep 2021 10:47:05 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id f3sm30821wmj.28.2021.09.03.10.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:47:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 21/28] ui/clipboard: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:03 +0200
Message-Id: <20210903174510.751630-22-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
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

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
TODO: audit qemu_clipboard_set_data() calls
---
 ui/clipboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index d7b008d62a0..d8e11bb6596 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -123,7 +123,7 @@ void qemu_clipboard_set_data(QemuClipboardPeer *peer,
     }
 
     g_free(info->types[type].data);
-    info->types[type].data = g_memdup(data, size);
+    info->types[type].data = g_memdup2(data, size);
     info->types[type].size = size;
     info->types[type].available = true;
 
-- 
2.31.1


