Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DCD32F925
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 10:34:49 +0100 (CET)
Received: from localhost ([::1]:37962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lITKh-0007C2-JF
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 04:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.a.melnikov@gmail.com>)
 id 1lITJ7-0006jK-Dz
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 04:33:10 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:40347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ivan.a.melnikov@gmail.com>)
 id 1lITJ3-0007Ny-G1
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 04:33:09 -0500
Received: by mail-lf1-x133.google.com with SMTP id x4so3254451lfu.7
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 01:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2nkftZPw7wHjP7jh8U/tMxxARHByP0A5sIXfm3o819g=;
 b=XJtAHjIBAescB5UjPTig1M7Gx9iFRG3B7mRAl3O0Echme0aVA1Cgd2mTpkFhvTgwmw
 XwKUZtxmNwXx02cm69one0wCrT+kGzZ5uNhuNe3gCmQdK3SnwIqD9cRKvCfiwSzVYGfH
 Xe8stYC/g5ofQo7DTsrWDyelAMkI5WBZSu5URTfRgf5HEwekhQmAWCrvMy1EI70fIZXC
 10GJUVvdVuxYJ2tYDxvlDbqg7LBD/bUSmrpWtYUUsmgUiyiQX2vEh63rgQwf8c/ptfrU
 mfG0XhPTu+fBThZ7jD+iq6E07NFDmmgBzT49XakeHBlNRIsymt+rshnma9Pnb2jyAMbN
 21XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=2nkftZPw7wHjP7jh8U/tMxxARHByP0A5sIXfm3o819g=;
 b=uDbYdgkkvIaVt1QdWrSStf58Y3+MrarUJLYyVJhwESoLIJdiKLTodqhAoJfeU5LBjM
 YOj/UFZmuCWUxgYzQRKPXWcB2AIpB+SZ0d6r61t5l1s3SgAOYOwlCSde6wE0sohCjaFj
 fQxyHvs5S4KiwS0MXebnWuxey4LXGw37Xy79qyuExRHkiNfE4FdhrH38uspjhe4PCJ09
 6GVP2DYQ2PYjJM9zL8FGm2DtCWiJTw3okZ6455SBKqIRzPZUpsNV2h70q6BEcqVe7QJj
 Px6bnxfz+ADPUno2m7E99Mk0/VAlAe6yyD+7/8F5lZ2fQ0iD+jGMdZzzN0WDp4IvPn1+
 aURw==
X-Gm-Message-State: AOAM5315umU5UKKc6ILAUionr0CJB/LLFgwaZ79NMC3ijPQMPpkgzi5U
 RThbqcYMWNdpJl7LfeIFMSaohflDYJ4=
X-Google-Smtp-Source: ABdhPJznIsE8BV8LaCOgkC4xsvFcWCo3TnKJOU9YhCT7MnPh2BJ1dN8DdpvV47yddNrawrPtl15iWw==
X-Received: by 2002:a19:ed0e:: with SMTP id y14mr8673178lfy.440.1615023182232; 
 Sat, 06 Mar 2021 01:33:02 -0800 (PST)
Received: from titan.localdomain ([193.43.9.4])
 by smtp.gmail.com with ESMTPSA id r5sm633024ljh.128.2021.03.06.01.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 01:33:01 -0800 (PST)
Date: Sat, 6 Mar 2021 13:33:00 +0400
From: "Ivan A. Melnikov" <iv@altlinux.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Adjust pgd_find_hole_fallback result with
 guest_loaddr
Message-ID: <20210306093300.ymbogset7fi6p2cr@titan.localdomain>
References: <20210303094919.x6wnlh6qulx72fz6@titan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303094919.x6wnlh6qulx72fz6@titan.localdomain>
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=ivan.a.melnikov@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While pgd_find_hole_fallback returns the beginning of the
hole found, pgb_find_hole returns guest_base, which
is somewhat different as the binary qemu-user is loading
usually have non-zero load address.

Failing to take that into account leads to random crashes
if the hole is "just big enough", but not bigger:
in that case, important mappings (e.g. parts of qemu-user
itself) may be replaced with the binary we are loading
(e.g. guest elf interpreter).

Downstream issue (in Russian): https://bugzilla.altlinux.org/39141
Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
---
 linux-user/elfload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index bab4237e90..58281e00f8 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2259,7 +2259,8 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     brk = (uintptr_t)sbrk(0);
 
     if (!maps) {
-        return pgd_find_hole_fallback(guest_size, brk, align, offset);
+        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
+        return (ret == (uintptr_t) -1) ? -1 : (ret - guest_loaddr);
     }
 
     /* The first hole is before the first map entry. */
-- 
2.29.2


