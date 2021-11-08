Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7806344792D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:12:13 +0100 (CET)
Received: from localhost ([::1]:38866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjw0y-0006IO-K7
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:12:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi9-00077l-Td
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:45 -0500
Received: from [2607:f8b0:4864:20::d29] (port=39485
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi8-0002zK-Go
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:45 -0500
Received: by mail-io1-xd29.google.com with SMTP id c3so3969170iob.6
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zU+m2dj4H6cVY5IXZl2McfoeKw+azePnbjkTpHB+KrU=;
 b=8N+E5L7KYKyhQ3CKu8U/oBBMPGBoz9yprQUf5HlujxyE7ErYlPrhOkjgBi+EW94UE0
 sFAK7kJSTyBgpRZLcMRJPZusoFUgmgev0WMk+8+Jb/hLGdPg7jiYKrIRQBMOd7IwBxeX
 JYGHu8JMubOwL/wgR1SHbT/htAojTEQVYL/b7AVJ5azf4bqahTr+zbM2XBIo1TQH5PPu
 G3ghIgNw8oPaJ35NOakb0jp114GMIctXyTaHiMJP5iFkHfrH/o/nbac4et7HO3V3EPTw
 1PmBjEZ2okNejwK4jJCC97cbfXBMAM28YPkmSx/JL2LuXrmsDaGqPTdh1LqggUE1wuzF
 CaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zU+m2dj4H6cVY5IXZl2McfoeKw+azePnbjkTpHB+KrU=;
 b=UfDxC95FbYSgthAUa1/NydkXLVeJ+RY1os2KUgXLZ1sWtLVCpslEBby/izE+LiN7vj
 mZpj9MEpcHYRKbgVT2TlHr1helrAPGSnuKxY1XVmdru1xhgxpK8t7jgUzEyUCDedbVG/
 attHljIwcYsd+9JGXxJjCE2fkZlclDHbJpwYTbmudlkPzP6Rujg2OyHqnls6H2+cIh5p
 5xwkcnclOvEANAPIt36sEM2Ffr7V/F455vvKsRifyiVirSQJNN4APzCt3B19KwCkEA6b
 HP1i+ici54LFKbPpCZiLFoDKqF45XJ8WH+Ef4fyHEiBTkyJg8hWwwqGMqE1o2JvtMicE
 iWQA==
X-Gm-Message-State: AOAM531EXnXHko2a8P6ZJzGaLPirCHzDVGVGiN6TSsmLDGANMufdgSGk
 J+RGnBvgcsA8NJ9XhPK5DWnTVTCyFf0ojw==
X-Google-Smtp-Source: ABdhPJxsUKg1cIF96ekePZGSkqEC2hlatOETv4EkwHEZCLsLvsx6heKNqV2gPWu9QjegFPYwdiiO2Q==
X-Received: by 2002:a05:6638:a2d:: with SMTP id
 13mr21401774jao.12.1636343563364; 
 Sun, 07 Nov 2021 19:52:43 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:43 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 36/37] bsd-user/freebsd/target_os_ucontext.h: Require
 TARGET_*CONTEXT_SIZE
Date: Sun,  7 Nov 2021 20:51:35 -0700
Message-Id: <20211108035136.43687-37-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all architecutres define TARGET_[MU]CONTEXT_SIZE, enforce
requiring them and always check the sizeof target_{u,m}context_t
sizes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_ucontext.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/bsd-user/freebsd/target_os_ucontext.h b/bsd-user/freebsd/target_os_ucontext.h
index dd61aec7cc..41b28b2c15 100644
--- a/bsd-user/freebsd/target_os_ucontext.h
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -27,10 +27,8 @@ typedef struct target_ucontext {
     int32_t             __spare__[4];
 } target_ucontext_t;
 
-#ifdef TARGET_MCONTEXT_SIZE
 G_STATIC_ASSERT(TARGET_MCONTEXT_SIZE == sizeof(target_mcontext_t));
 G_STATIC_ASSERT(TARGET_UCONTEXT_SIZE == sizeof(target_ucontext_t));
-#endif /* TARGET_MCONTEXT_SIZE */
 
 struct target_sigframe;
 
-- 
2.33.0


