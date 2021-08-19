Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9403F1B8F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:25:00 +0200 (CEST)
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiyZ-0002Mk-Nj
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiud-0002hL-Em
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:20:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiub-0006O7-R1
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5J953m8jthIx8YKw7RXWxnSJEtO9PzEi6CmU+gZmWk=;
 b=J8XElWANuvAW+3XgD0jb9mwQBQiEr/mkEXxtN2kTk0lOvxNn1m+DUV826UbKaM8hdx3Lek
 0ZYACnpwd3GLvPKwQGrNFfePBYJCh9V/8a9vG9EXNBiVGOhQAlm4X+5Iq/5TQ9C1zAgBtC
 BwbkbRx4ieYfxso3zXk3fW18PcBNLgI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-ithVkMyrMIS75XwCLD5HCA-1; Thu, 19 Aug 2021 10:20:52 -0400
X-MC-Unique: ithVkMyrMIS75XwCLD5HCA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so3549321wml.5
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S5J953m8jthIx8YKw7RXWxnSJEtO9PzEi6CmU+gZmWk=;
 b=XON+rdA0SWUG3bN9ZXNVENu1Xk3fyIlqS3zDyI9QUUWryIrbVyzWGb2InBZwcaj0mB
 VXkcbEZCIkH60EVMZqSdsj/GH2h4Z2feSJJjl/IHwrRpJedEWL6GmCKgz8ZWiTV/n6Ra
 Ddyg5bTbkvEu68HvaOOFE24VSqZm9y3R9Eot3edAML18eLgcYrHB7XyO8fzoeHGvAoxb
 S2lUKgXC97u3rn9i+VweZlQyFu6kLBLFUabXMQiaLYOKyOmRjE4twDkTnZO6X4BRWDX4
 d6sMRBDo2TBGXKkoYtG0deN+EfnCMged1VJol91PmNAON8xOZJFT8M8D/2glue8n6uk5
 I00A==
X-Gm-Message-State: AOAM5332c2fWnO9+QELM7kEShhsW6PbWJSWf3rjZ3fkAXBp3+VZzHB/e
 DZ1+rnUyThjHiBxU/jYIdnB/n7NND0mnD9omBjcWPX18aDf8aJ0oFsykOQ+usCmYlmSKzeQXFPQ
 XrRrupVw2FOIK9vCJ+/1BBG8BHmxVMXYGqt7tYn9APTw0yUWNIaZik06tsvfinfhF
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr13857478wmh.99.1629382850788; 
 Thu, 19 Aug 2021 07:20:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwljsaK8xTKC3ZxT9A69p0K+bI18Pkfe97AyeppN9b9VIrWOghxSBpZCtS3dKIT74BP9VJCnA==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr13857427wmh.99.1629382850326; 
 Thu, 19 Aug 2021 07:20:50 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n10sm2984641wrw.76.2021.08.19.07.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:20:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] memory: Introduce address_space_create()
Date: Thu, 19 Aug 2021 16:20:35 +0200
Message-Id: <20210819142039.2825366-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819142039.2825366-1-philmd@redhat.com>
References: <20210819142039.2825366-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce address_space_create(). In is similar to
address_space_init() but returns a pointer to a heap
allocated  AddressSpace.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory.h | 14 ++++++++++++++
 softmmu/memory.c      | 10 ++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317f..b353a48c25f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2418,6 +2418,20 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
  */
 void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name);
 
+/**
+ * address_space_create: Create and initializes an address space
+ *
+ * @root: a #MemoryRegion that routes addresses for the address space
+ * @name: an address space name.  The name is only used for debugging
+ *        output.
+ *
+ * Returns pointer to initialized #AddressSpace.
+ *
+ * The caller is responsible for releasing the pointer returned
+ * with address_space_destroy() after use.
+ */
+AddressSpace *address_space_create(MemoryRegion *root, const char *name);
+
 /**
  * address_space_destroy: destroy an address space
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 185f978c925..16a2b518d8d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2937,6 +2937,16 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
     address_space_update_ioeventfds(as);
 }
 
+AddressSpace *address_space_create(MemoryRegion *root, const char *name)
+{
+    AddressSpace *as;
+
+    as = g_new(AddressSpace, 1);
+    address_space_init(as, root, name);
+
+    return as;
+}
+
 static void do_address_space_destroy(AddressSpace *as)
 {
     assert(QTAILQ_EMPTY(&as->listeners));
-- 
2.31.1


