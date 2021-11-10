Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A06644C525
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:37:43 +0100 (CET)
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqbW-0001TY-FH
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:37:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWi-0007eu-I0
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:44 -0500
Received: from [2607:f8b0:4864:20::d29] (port=40519
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWf-0005cQ-UR
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:44 -0500
Received: by mail-io1-xd29.google.com with SMTP id r8so3488714iog.7
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M3YNJExhThSIbj1o2Es/Nt0wLEmypXnIdeRMVKOi/c8=;
 b=spcPYVd584+LiL84FKldoc4r6gg5FlLc4mL6fts4tEtBIiD6xFICDcK34T7Hp9PA0l
 HjTBIbBK+79mLZbEi8n32xvRRtSulUQkHHydrjFbF6kZQyP2d2BwU9S34Ts/Z82n9IBK
 DCPDmTVwS6VUmJ6AOLLh5KRJq7GBok+XKCYdC9sKqA3YgOQfIO5qYNLyqyzNuDISmSt0
 +lNpEdw4DRbSKfg5Jao6LDoV/8jN7INLZXT4KdRMpNOoF1ZxMAraNd2Y/unFs0IKovLe
 qOOt1nTyy3NLdQU0pqw4p8Y5twbFC6Rj2bX1jPF9r5vmMrEZHOeeG2hUfYiCDe5dKRga
 T0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M3YNJExhThSIbj1o2Es/Nt0wLEmypXnIdeRMVKOi/c8=;
 b=LGx9yrngvn46LQRJ18m4PDLQS0UJ7B7hhDC7YCRsdMieGH54ArzgSVA5kH3NJt+Wnt
 EtX33RqTvsvB9kKx04w811nnIByvDgdJjbmIUBIsoJC/yhtaVIehGzvBaT4nRO8NYzgm
 kFcB67G7yTriXO4/GbKf2NvhKaDSraeVMZ8m4bYqyUYQFN8td/pPJNpde2BtMTv5rQSL
 NBrhKROs7QiRcjFysUO3TEpOH/kCnedE2xo5QM3cL3GEdYy9kM5uYov+zfXJCk6TELPh
 KG5wUYB3aw7KIIyFkfXhFp9i3txRo6IbpZasRwXh0crMlbE5FbNnfM2azottDBed2QmO
 183w==
X-Gm-Message-State: AOAM533k4avdl1r4nGCQs1VJWXqP74F9Kn1/BQ+M3bVb4KAoSKaPmYAm
 2d9WIDYdVHZvRv0dAtT6lL5mK6fioGovMQ==
X-Google-Smtp-Source: ABdhPJyLCvqe2bgMRYt01kGjPKxFWPBlLdcFhMbV5f2cZCG4zztgincKElPTwMlkbgW1aY95HnGIew==
X-Received: by 2002:a05:6638:22c2:: with SMTP id
 j2mr83356jat.105.1636561960484; 
 Wed, 10 Nov 2021 08:32:40 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x2sm130403iom.46.2021.11.10.08.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 08:32:40 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 5/6] common-user/host/mips: create,
 though mips hosts likely don't work reliably
Date: Wed, 10 Nov 2021 09:31:32 -0700
Message-Id: <20211110163133.76357-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211110163133.76357-1-imp@bsdimp.com>
References: <20211110163133.76357-1-imp@bsdimp.com>
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
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 common-user/host/mips/safe-syscall.inc.S | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 common-user/host/mips/safe-syscall.inc.S

diff --git a/common-user/host/mips/safe-syscall.inc.S b/common-user/host/mips/safe-syscall.inc.S
new file mode 100644
index 0000000000..72d9064acb
--- /dev/null
+++ b/common-user/host/mips/safe-syscall.inc.S
@@ -0,0 +1 @@
+	.asciiz	"This file is not compiled and mips hosts are likely broken"
-- 
2.33.0


