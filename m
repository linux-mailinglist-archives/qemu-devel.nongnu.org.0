Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1DD6EA725
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:37:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9C-0008Eh-CX; Fri, 21 Apr 2023 05:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn94-0008Dt-7H
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn92-00032P-Qp
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/J2UWc60zpZAoalQ9qoSYz4mkciDC6lH/O28J3u9T3I=;
 b=GYnwkO523EAXZmqcOxTTwFlTJsmyHVFhuDLySht983dTva6bwvTMNvsF6muMF2OkKQc141
 YrdqDp8EsgUhFFgjZx+wm07c3Bz8FoUmomyjrXqm2+zTBL098GOWO/RsH4uXRS7gPvZ54Z
 IgHNMjU2syNOhW7EzTAXoAjF469OW1g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-4sfXuyOMN1S2owA3Hz700w-1; Fri, 21 Apr 2023 05:33:30 -0400
X-MC-Unique: 4sfXuyOMN1S2owA3Hz700w-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5069f2ae8eeso7117200a12.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069609; x=1684661609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/J2UWc60zpZAoalQ9qoSYz4mkciDC6lH/O28J3u9T3I=;
 b=hXi2B9J8j7IqGJ2UMn3qaWg+8Enbrx4gfv1TUSzzZ2ErLiDIamuHRK9KoymvxWa1Sz
 PFCWkSK3hYXXsXXwQS6Nz1Z3pvjKsuJXHpZHYoJVnGUyIh+ji+hWoASpkCCC6wkw+Nib
 T6oA5UJ5oaLwdjwSA7LYboSxl8q4Uig+tCPvgPJTsCTUuCjqInT/Im9oTpfLxBipvi7w
 m5NmftDp1ZxouZp9inPZI9Gze5zY7yoVI6GqZRWY0oCgkoI4jkYd/JVS1JH2TEHgD8Yl
 3zC4wJGtf9HflrE0QSqspx/1Immn442CvpWadmF9JajsIy93M6H7K+eINozTgoEp6Ss0
 9bxg==
X-Gm-Message-State: AAQBX9f0oG9Uh0j9Y386IXn5FfHmSd7jNEryQp7LZZqRfkC84nxUWhLl
 1umsmp6hFT3T4rrxom2nFG+98ZJsJFirtKYydqCs3sZGg3pSifnUDSRhgPrnklSzlvOX4Nfbztr
 96QvAhex1ekd6kz0xPx3LPNHOKjJi479uAGpDIv5oL8vAvdrgdINthjAHfGqrQDIhKDGAwMKTxA
 NV4g==
X-Received: by 2002:a17:906:a007:b0:933:4d47:55b7 with SMTP id
 p7-20020a170906a00700b009334d4755b7mr1777269ejy.2.1682069609057; 
 Fri, 21 Apr 2023 02:33:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350aFCwbGgzP9ZMNjVFXyHgkxB53/FYMgk6OVpHkflzK5cccy0OSlgWkUdU0y3YFa2GQIkGVo8w==
X-Received: by 2002:a17:906:a007:b0:933:4d47:55b7 with SMTP id
 p7-20020a170906a00700b009334d4755b7mr1777258ejy.2.1682069608735; 
 Fri, 21 Apr 2023 02:33:28 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a1709061e4f00b0094f3d700868sm1826389ejj.80.2023.04.21.02.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/25] target/i386: Avoid unreachable variable declaration in
 mmu_translate()
Date: Fri, 21 Apr 2023 11:32:59 +0200
Message-Id: <20230421093316.17941-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

Coverity complains (CID 1507880) that the declaration "int error_code;"
in mmu_translate() is unreachable code. Since this is only a declaration,
this isn't actually a bug, but:
 * it's a bear-trap for future changes, because if it was changed to
   include an initialization 'int error_code = foo;' then the
   initialization wouldn't actually happen (being dead code)
 * it's against our coding style, which wants declarations to be
   at the start of blocks
 * it means that anybody reading the code has to go and look up
   exactly what the C rules are for skipping over variable declarations
   using a goto

Move the declaration to the top of the function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230406155946.3362077-1-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index e87f90dbe3c7..b5f0abffa3de 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -147,6 +147,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
     hwaddr pte_addr, paddr;
     uint32_t pkr;
     int page_size;
+    int error_code;
 
  restart_all:
     rsvd_mask = ~MAKE_64BIT_MASK(0, env_archcpu(env)->phys_bits);
@@ -467,7 +468,6 @@ do_check_protect_pse36:
     out->page_size = page_size;
     return true;
 
-    int error_code;
  do_fault_rsvd:
     error_code = PG_ERROR_RSVD_MASK;
     goto do_fault_cont;
-- 
2.40.0


