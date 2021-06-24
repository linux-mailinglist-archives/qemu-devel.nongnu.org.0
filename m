Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8673B355A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:12:24 +0200 (CEST)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTpv-0003Fw-Cn
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiS-00081X-6B; Thu, 24 Jun 2021 14:04:41 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiO-0001Uf-9N; Thu, 24 Jun 2021 14:04:39 -0400
Received: by mail-ed1-x52e.google.com with SMTP id df12so9829498edb.2;
 Thu, 24 Jun 2021 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BevMjojoz4Zbbmnx7q+o91aCSPbNgcWVWrT6Beq1/n0=;
 b=P/aa0oaMfot02Hc47c+81ANMFB5yE+bJ1WpScVwsE44Cc1w5kAQm4WpixNPLVZk5Th
 JHDDu7Psuliiz4JANSXzJpfZyoJd43UNi0aIDR3JG6tJls1Yc8GZbObohZl8JYJgy3CB
 bZ2AHeodzMy4zPnNzmBtyteW/JWaetApSi81wk5nMDmDSuyjm88WXXnZ32O6GncJK4ZH
 C2k1iDBtM4lBJbz1jkS0rDP53ylfKxNe09Mf8TPWqS000mXdbITC8ZSHOMU+xMJ1rXdW
 RfkOvwkQ9ktce2o/KAs0KpdNPB2q2SqysgH1dcYAi6UXcovApfdW/AC6otgMxK7AhSQn
 7OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BevMjojoz4Zbbmnx7q+o91aCSPbNgcWVWrT6Beq1/n0=;
 b=t0tS4RY4FtPySKgh+xb1TomhHK2V82YO5bo4FqUbAwMQCRGQUn2IOgNcfDQo0HCjiv
 e0nhZgZgqJg02nSpE732DXo4DlPOAo0QtfVyxgPrNOqo3jb70BN0OUoAuFbglvB9OAMM
 Ptfa9zrEJ2hlKNXoVQv4PbFm+Ea9USwtjY6+U12RlTRw+skAkDlfeZEkMmUbiErtXC0Q
 NUmxAaHMdG7hzx8X72EgtIw/f3YEZLGsnh10F7xzANDmioBA087DHnUxw8G4Lr7yWKBx
 rfZEkpHdJ0Qdqu/jI4U6gEQJAqntpDm7v7KtUWr41qqyrZg4EWIvxGk8JTKTHzsax1S6
 gNtw==
X-Gm-Message-State: AOAM532rhqBbu+Qs64A/BiIntNlTthUBvL7xEjIbptElO7bYdIAtJDjx
 ECpCCSvwXiw8gBhM/tAmBUwbas+k+Qw=
X-Google-Smtp-Source: ABdhPJw4Sy+1cAYVeLyYEo35IcTLsO8Z0TRmTPIbGuow/4sG76pFeAkOmDtKXBhd09UI+rXBvX+btA==
X-Received: by 2002:a05:6402:1e89:: with SMTP id
 f9mr8934095edf.117.1624557874316; 
 Thu, 24 Jun 2021 11:04:34 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm2436466edt.16.2021.06.24.11.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 11:04:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
Date: Thu, 24 Jun 2021 20:04:22 +0200
Message-Id: <20210624180423.1322165-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624180423.1322165-1-pbonzini@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Warner Losh <imp@bsdimp.com>, mreitz@redhat.com,
 Joelle van Dyne <j@getutm.app>, qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

iOS hosts do not have these defined so we fallback to the
default behaviour.

Co-authored-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index f16d987c07..74b8216077 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2341,7 +2341,7 @@ again:
             }
         }
 #endif
-#if defined(__APPLE__) && defined(__MACH__)
+#if defined(DKIOCGETBLOCKCOUNT) && defined(DKIOCGETBLOCKSIZE)
         if (size == 0) {
             uint64_t sectors = 0;
             uint32_t sector_size = 0;
-- 
2.31.1



