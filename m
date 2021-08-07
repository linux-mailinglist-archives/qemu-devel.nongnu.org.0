Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF8A3E375C
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:09:50 +0200 (CEST)
Received: from localhost ([::1]:56362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUVp-0003hT-V3
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6O-0008PO-Us
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:32 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:46046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6N-0005KP-Ij
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:32 -0400
Received: by mail-io1-xd31.google.com with SMTP id e186so17979404iof.12
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=va1ltaQnDQahwRJKm8S9pyEvLkuFSkPE295Tlhm8C0M=;
 b=LMrS5v4pHu5RN4wG7VAaJlSOPwUhvKhfB4BNUNOw7KCi3RISyKKV/0SMWLEXZB4b9k
 PQUPt6ba8JyIrHFQPDzm+xyPqUtxxyOP1n4KSeb1R+J+n8Dj/YGR6e3gWrUduuzxRnZy
 7rUE0zlo7ylY+Z3EtZd6qEO5cIywFFXnNxaXBmkhRhQg+e73p0/JkMtgy1kj1zAPswUA
 gTG4pydl73GwHxQ6bMcEhtmNvfb4hqSj21XVbq2N6yKM3eOdM/10r0yiUzGn1Hj0g4Og
 9K1h1cFAeGnYwmdK1FDCGIFEQCnDnNL7TKnKE8eP9ioIzQdMNqVrkHEH9uNIbnCPEQjK
 L77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=va1ltaQnDQahwRJKm8S9pyEvLkuFSkPE295Tlhm8C0M=;
 b=m2lB4YL3G+WkFSw7R2AxELDoxiKCW+tedCNRMqaUAHMfsTtH5p4NJSSr7WYjlTBkv/
 8jGFNsND0rrju8U97e5QtZmeIEl5EpushTPWIxREx5ElnAvQmk8RNV/FPQI/c9DEMFwY
 +n4gcwi9kzLcn8RpKnyQLncjQ6RxfPfzlLcbN4jgRE3RYUoSa2qDpCC0szUBJnLcy23J
 L+jF1FetDShyV3HHwHDo+cnntC48bSUcC/F0M9CDvu8PATZWt67jMkguwBN3unvCRELf
 SM2MHwkzKm6BgEfzMcntj6s8P4AhHPvBD8Gm96ife1co3imHeXCw0ji256BNLPtrCZMD
 FgGg==
X-Gm-Message-State: AOAM532t3Jq6npeqPoCrEdWapCDJ+PLxO3aCm9O9OCQLoimnh/pYyd9y
 09b3rGx4xVf8Owjmv+FmdREq8bmnTfOZniA4
X-Google-Smtp-Source: ABdhPJzJc6hsnsdrwxgxQsOWplVofzyxW0Dx0VYswh1VtjMtd7VtdJMkJXvTCJVv52rOiZlkY85OfQ==
X-Received: by 2002:a05:6638:303:: with SMTP id
 w3mr8492566jap.79.1628372610265; 
 Sat, 07 Aug 2021 14:43:30 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 39/49] bsd-user: Need to reset CPU after creation.
Date: Sat,  7 Aug 2021 15:42:32 -0600
Message-Id: <20210807214242.82385-40-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 36852604f8..08f88d9668 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -405,8 +405,10 @@ int main(int argc, char **argv)
         accel_init_interfaces(ac);
         ac->init_machine(NULL);
     }
+
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
+    cpu_reset(cpu);
     thread_cpu = cpu;
 
     if (getenv("QEMU_STRACE")) {
-- 
2.32.0


