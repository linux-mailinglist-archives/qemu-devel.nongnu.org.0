Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36C633F7D9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:09:30 +0100 (CET)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMabq-0006WC-0I
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaT3-0000kn-2X; Wed, 17 Mar 2021 14:00:25 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaT1-0004wV-Hx; Wed, 17 Mar 2021 14:00:24 -0400
Received: by mail-ed1-x52a.google.com with SMTP id bf3so3397900edb.6;
 Wed, 17 Mar 2021 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sB3+w5MPiq5YtSsSHBffd76Yw89YjLssV56LPOeeU7o=;
 b=JqxyAjNVsYWG8FD4nMDS2cjcip2DkQqlSsnCwTT1Wvxp0/DkaeI6Lfxiqd/oDEYxD1
 i2x1hJTMR6kRWtofzH3hzgNSKXh6l/ogJgrP56Vwg3E75BNNSWNR6kxAjkpmGt3KQm++
 DV4YS3FMwxm7k3QU6jTyNmI1V7asmL5KFHlkDXtU5erHBBEuJW9QdNx46Eyv11RFWpm3
 lpe9XqNby+JL/f3oqtr4TU+Njo3WpMZzHGuttExc4l37jj3mbcr7vAm/rPth3Afp+295
 Awpvg6X4eoQV/RNLK1JEFuH5JRpL+4eYNHNngJb4qyqoodOQflqgCoUHzdvspxFdypIz
 8d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sB3+w5MPiq5YtSsSHBffd76Yw89YjLssV56LPOeeU7o=;
 b=pD27NPxv5vj/yRdy4VkkttgK2FozAhJh0T8VRW/zmMKMO1sbUTCWMr34TlyrJIw0rT
 mF964HtboHTFyaj1yL6guPTpu2oV+aGCzxdUUlgXQqSGv7zIme/njqp1BX2HXtpGlGKh
 WWvscbWVnuMoyrfuprX9U/BbJgUzAwXAANZviVsJ197Pwxmhdikk5Y+y3qL7eWEE2sYD
 /6Ub3o8S8gDtQj4Q2dwURljz56s7CpNsuWzFf78z9QWrjuDBXaQKAfsdVt1rAPvpBBXr
 fZdG5CKHPP/3ZkyDC3VesADsdNFCMC9IRZ4eu5ZYpeBr8V8ZLqkGjOp5KuHDVg8WAKdI
 pX/w==
X-Gm-Message-State: AOAM532mG3IgkvUzK9o00xaGrzTnT9in6TFltXIMrgPXuiA2iQOyR2Uv
 XyN5xbZUEb1WuJhF7owXaaswSmx1Vyc=
X-Google-Smtp-Source: ABdhPJwwtSAo5O4V66GDOrFLhHKQPgFAbNT6aSCZ622wdPQE3w2MkoURb6fGb7Shj8tmnBjxZ+80rA==
X-Received: by 2002:aa7:dd4d:: with SMTP id o13mr10551709edw.53.1616004016916; 
 Wed, 17 Mar 2021 11:00:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id b22sm13159303edv.96.2021.03.17.11.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 11:00:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] block/vdi: Don't assume that blocks are larger than
 VdiHeader
Date: Wed, 17 Mar 2021 19:00:09 +0100
Message-Id: <20210317180013.235231-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317180013.235231-1-pbonzini@redhat.com>
References: <20210317180013.235231-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Given that the block size is read from the header of the VDI file, a
wide variety of sizes might be seen. Rather than re-using a block
sized memory region when writing the VDI header, allocate an
appropriately sized buffer.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210309144015.557477-3-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vdi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index 2a6dc26124..548f8a057b 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -696,18 +696,20 @@ nonallocating_write:
 
     if (block) {
         /* One or more new blocks were allocated. */
-        VdiHeader *header = (VdiHeader *) block;
+        VdiHeader *header;
         uint8_t *base;
         uint64_t offset;
         uint32_t n_sectors;
 
+        g_free(block);
+        header = g_malloc(sizeof(*header));
+
         logout("now writing modified header\n");
         assert(VDI_IS_ALLOCATED(bmap_first));
         *header = s->header;
         vdi_header_to_le(header);
-        ret = bdrv_pwrite(bs->file, 0, block, sizeof(VdiHeader));
-        g_free(block);
-        block = NULL;
+        ret = bdrv_pwrite(bs->file, 0, header, sizeof(*header));
+        g_free(header);
 
         if (ret < 0) {
             return ret;
-- 
2.29.2



