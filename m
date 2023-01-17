Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4786C670B5A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9G-00006X-8s; Tue, 17 Jan 2023 17:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9D-00005Z-Nj
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu96-0007XN-4T
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PC4mh0B0hMSMRIj8sb0h21wn9Jn8Ce4T2CHIcXSGJ8A=;
 b=hQZdD6csxfKplwaYJYqYKwLCLpq1vIEBC7h4S9X8sbJc3wrb27btLIvcugnxIJ9eFGX+U3
 NOfIaKxgVeyJpmy8JgrQc6y0Tr2zSzM5y5mXoaeVEFKhPDdIEnPE/pVW5ZxYOyuqNkTKRS
 jZmdJECY65cCQh3b6JcrtzkapWncyg0=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-RwOLqgfmODikMKjmxxiGGg-1; Tue, 17 Jan 2023 17:09:24 -0500
X-MC-Unique: RwOLqgfmODikMKjmxxiGGg-1
Received: by mail-vk1-f199.google.com with SMTP id
 m84-20020a1fa357000000b003bcb3e83df3so9620095vke.7
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PC4mh0B0hMSMRIj8sb0h21wn9Jn8Ce4T2CHIcXSGJ8A=;
 b=XKAeawyHF6hdqEuqM5vozABdwVtIFFyVDjOCUlMtXBixM/C/w3fvqO9MET34GAJ0VT
 0VqSL/J/Cv+0/XGIgR/gTWyK8mwzpmM7KBMXNPzqMmdU2oYN6IWKeXyBhewCbeInN3H5
 qBRuFyU/Fu3kVfPLRB284IKLso8Ek/q7H/oLpgKitjHRtCudRWW5sLoSDoJ7mApZNIdP
 VGRyX40LtlrCdjszMKZ6Z/7+GhemBPEjz5sZvJXr4eHsyqk9rZW+SJIoOrCQVKoY6CIo
 pod++dOZqrW2+ZGqBpQyxtY240inIUipNCH1LFTc2Tpx9HlBZvoKEC298TVwmeeYfIbz
 7xDg==
X-Gm-Message-State: AFqh2kqASqrCmvQxvuiHUAphHrUtqkee2099XpnASh6TMh4nPEfIlVc0
 JWc0vMZmjf/jTxFAQKqlyQKNQEmyG2vMkUXlAOyUnWvo+1FG7yCV5IMOnN2epnEluFCeaZdqLrn
 u5FAVDZJlCgoteN4/z9eTeL62zqq7zNLQ5CB9ldHtv7NwwOiUJfZHrfdBxYJey040
X-Received: by 2002:a67:ee97:0:b0:3d0:ce41:85d6 with SMTP id
 n23-20020a67ee97000000b003d0ce4185d6mr2290957vsp.25.1673993363727; 
 Tue, 17 Jan 2023 14:09:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtWoZYc9RTP2JiPaqdTvMnPe3x9+rQMc1gtpSIsM+O2IF4F4We4LoPY1j6c4WfVBXRKwPBHwA==
X-Received: by 2002:a67:ee97:0:b0:3d0:ce41:85d6 with SMTP id
 n23-20020a67ee97000000b003d0ce4185d6mr2290934vsp.25.1673993363424; 
 Tue, 17 Jan 2023 14:09:23 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:22 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 03/21] physmem: Add qemu_ram_is_hugetlb()
Date: Tue, 17 Jan 2023 17:08:56 -0500
Message-Id: <20230117220914.2062125-4-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Returns true for a hugetlbfs mapping, false otherwise.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/cpu-common.h | 1 +
 softmmu/physmem.c         | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6feaa40ca7..94452aa17f 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -95,6 +95,7 @@ void qemu_ram_unset_migratable(RAMBlock *rb);
 int qemu_ram_get_fd(RAMBlock *rb);
 
 size_t qemu_ram_pagesize(RAMBlock *block);
+bool qemu_ram_is_hugetlb(RAMBlock *rb);
 size_t qemu_ram_pagesize_largest(void);
 
 /**
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index edec095c7a..a4fb129d8f 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1798,6 +1798,11 @@ size_t qemu_ram_pagesize(RAMBlock *rb)
     return rb->page_size;
 }
 
+bool qemu_ram_is_hugetlb(RAMBlock *rb)
+{
+    return rb->page_size > qemu_real_host_page_size();
+}
+
 /* Returns the largest size of page in use */
 size_t qemu_ram_pagesize_largest(void)
 {
-- 
2.37.3


