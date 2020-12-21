Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B722DFD1D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:59:00 +0100 (CET)
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMeJ-00049R-G1
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRD-0004rT-8o
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR9-0007lK-St
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:26 -0500
Received: by mail-wm1-x330.google.com with SMTP id v14so10095089wml.1
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4xkRnQKoaqp5QhpLOFtcF2nzdn950oGLnCfoEhfvu7E=;
 b=T7C1esfuc1FL3X9ac+gDGwoiJ+IvTo9aFHptceqiholVNkUfm1MTOVKVbMB6pe6pAD
 cpNPh7cy90W/TJpVzehkuDRVUTNOfn5Z3+O+b1IcYZzgQn8ubuMVVsrhResFhmld+wGV
 B2WQ6iBrWLSc5YGz620SiZHEK8aPaV5ZBxsMzZWSsgf53fn44eOC4pggCeYgLQFCSrHN
 ZLHSSdEAacAWILWYVHPWQ3CvMgmtfouk0acgLE58zPV9r/7UlrO5YeKBhOW6svd/dUnh
 l8HX0FMjmWyiIGR5iPp+kezlXf2YMCre5kNIjpeLfrBcU+Cz0+6e1k+dQdPWBBsP+GQX
 EJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4xkRnQKoaqp5QhpLOFtcF2nzdn950oGLnCfoEhfvu7E=;
 b=XwXW77U/VBo8DNHTwVAEmWr/JBrBmDTGL/r7XBhHYYAUYW7s3eB0WojrDJgEOdfh0Q
 JgsKzx34UWEqBD3ddvCzcZvJH/rE2oDpMTrqE1G0xgh1mW5nKuS5mLeKjgzbq6aa7kif
 Yl6Egb11uBtsNcZphnkE1/+WyDmfPpMi2R4VBo8zlnNLzdhEnocxx3Tu94ftd5KopV/i
 y0b9Nk8ZoY5JE5AotQjPyCnleYY88dq5Pcqjewx4BO1gqCbVxlwqhYXGiS777xlC/FmS
 yhSS+OQCI99V5oP1w1oRL+wuNI7qxVcXipHAI22RpQe5W67FZxvjsn4J7i1YW7yW2jki
 s0+A==
X-Gm-Message-State: AOAM531PuxbHZO0rkhabcMRze9rtN1yebl5LqxEwoD9FvpqnMxZ5aU2E
 2qdkoQqYohktm7mZctaMF9PjpX/z55E=
X-Google-Smtp-Source: ABdhPJzWcS6Eve1OwliQBWHGkJz8Vn8a6NJExcH43Za202GrCHw7P8EAZoy7aX7kPEhunUhgYS0C6Q==
X-Received: by 2002:a05:600c:2116:: with SMTP id
 u22mr16821870wml.174.1608561914644; 
 Mon, 21 Dec 2020 06:45:14 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/55] meson: use pkg-config method for libudev
Date: Mon, 21 Dec 2020 15:44:21 +0100
Message-Id: <20201221144447.26161-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index d5d08c8b6b..45155114d3 100644
--- a/meson.build
+++ b/meson.build
@@ -399,6 +399,7 @@ endif
 libudev = not_found
 if targetos == 'linux' and (have_system or have_tools)
   libudev = dependency('libudev',
+                       method: 'pkg-config',
                        required: get_option('libudev'),
                        static: enable_static)
 endif
-- 
2.29.2



