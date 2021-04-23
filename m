Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24B8369BA5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:54:58 +0200 (CEST)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2pF-00075x-OZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b8-0005ti-B4
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:23 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:42814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b4-0008DB-Ik
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:22 -0400
Received: by mail-io1-xd29.google.com with SMTP id s16so44834428iog.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YRAy0eIrnh85I4tH3EXzrP9m4u6fh0Jy9AAmaLsFdpQ=;
 b=D9kIwemACN+0drwniE1gaXoTGwBNdTj+1dJEir/ue5nwpPYHtKaaBjlc4clR7Pg0Ix
 2SptWAcA+7STzH1wXbJB0fP7Id+Q5wyuvlzsGYeOeQrh//Y/YRyKaf8dv3fHplI7c1Nu
 csvVr/igN0EX0C5u+wCEZJjpNrDhLEQPs/ty4mYmfbFfhJcI1c1xoMkWgbP/LZTPqU2Y
 +THkckgeuuG2QRGeHtFTVxZeJxePdbo+ccBN7cnWGonsJcDY81QXWsTAO4tEnYUG8uu5
 pxEvfH3+huVJvXrW5Cu3CpdW76tiA8cW8+g+J2usu58qCMpX0C0T4kdOiSk48twiAc/0
 6HiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRAy0eIrnh85I4tH3EXzrP9m4u6fh0Jy9AAmaLsFdpQ=;
 b=H1WQJPT6TpoTBE7dFdexLJkbv7jk6DV326DP+TlPqpLl966kP6TQxjH3lYjESrWXeq
 my15H2VC2NUYbk870vEm6riUnttvd1NzR1tqj8HXB/2B4ZIHqTELN3FF+Aft5L7KS5Jw
 zz0vn3iuoE+HlmLnDVEs9qscrop9fQQBQoMaYEKfoEqYHCCUSr+NczpFChJPBgTWUjkh
 nB+nBA3zODhiBrnqVIvM+X6gYfQnmijqK3D07h5h17FcMunRJBq+7VytR3dtatU7XPJm
 NyLyyjvbc5wf3przDd6h1Yb0ZvFydxHh80gXgmLrwlsTCQsozwF4OmWeIF7hLQ8M1AFW
 au1A==
X-Gm-Message-State: AOAM5319pnRARJuum9aUzKrKJ+citrmvK2FymwXHTie1iXuRjy55qpyE
 XPobazC43N9vEPBnGXldlUb5XRYxmqod7yBV
X-Google-Smtp-Source: ABdhPJxtYL5hZElS9m+IZfVLZ4mqY6eqACIS4eHp9HjXzakMa+sqB3rGwHiimGZK8UoH+PTB5pER1g==
X-Received: by 2002:a05:6602:1689:: with SMTP id
 s9mr4472638iow.171.1619210417256; 
 Fri, 23 Apr 2021 13:40:17 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:16 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 19/24] bsd-user: use qemu_strtol in preference to strtol
Date: Fri, 23 Apr 2021 14:39:54 -0600
Message-Id: <20210423203959.78275-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 69e5525607..95fda8c5ae 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -821,7 +821,7 @@ int main(int argc, char **argv)
             }
         } else if (!strcmp(r, "s")) {
             r = argv[optind++];
-            x86_stack_size = strtol(r, (char **)&r, 0);
+            x86_stack_size = qemu_strtol(r, (char **)&r, 0);
             if (x86_stack_size <= 0) {
                 usage();
             }
@@ -853,7 +853,7 @@ int main(int argc, char **argv)
                 exit(1);
             }
         } else if (!strcmp(r, "B")) {
-            guest_base = strtol(argv[optind++], NULL, 0);
+            guest_base = qemu_strtol(argv[optind++], NULL, 0);
             have_guest_base = true;
         } else if (!strcmp(r, "drop-ld-preload")) {
             (void) envlist_unsetenv(envlist, "LD_PRELOAD");
-- 
2.22.1


