Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19521447C4F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:53:38 +0100 (CET)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0PJ-0001Lg-8M
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:53:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk0N8-0006Cf-Hd
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:51:22 -0500
Received: from [2a00:1450:4864:20::129] (port=43847
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk0Mv-0004cl-4B
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:51:22 -0500
Received: by mail-lf1-x129.google.com with SMTP id b40so5029513lfv.10
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SxNQ2oSyayGtLSH54POjOn+Otcw6do72wkhK/MMow3g=;
 b=f5LKawvRqF7YTK+AMSUgiGqBeMiY/Qq1/3yB6T0ylmnomVI083U65Xl+c1fbrLKmRw
 ZpXnfK5/ACTYlBTUlkFQ+2Y8qSJerwsLUdzF32rslj9+WkK23bAOLaFnePnEbmsatas5
 UAuuTf3Z3HJ74Ig98l2leTDlGQvivCkNfzAZ26bJBN96yrdCu37Gp7eisNOh4B1jckkF
 PCaSvR5sOKme8LVEkAeFFN2P6eZrvA5+MdSYkt5VRmNsaW5QYDp3vz/fnIvhUPHd/Qh3
 k4oYcK8n3FququLBfJqLlt69enZHokWEIWmjrl9/H9vPaX81CsRsDmUIrHsAL5NIOkpN
 cLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SxNQ2oSyayGtLSH54POjOn+Otcw6do72wkhK/MMow3g=;
 b=6URKbrxjVMQBzf+pustA75N7gFj9lGjhPQ4Z86QmziikGjFLL3a1iFnOCRa25ol/6p
 s01ji/mlsP3ut8luvVERt+CcxeKBAw+QiNN8EDGRkqOr6Hl3W3sXTwd+t/LDPdbMoXm3
 scYAyjUqvHyzwlDvtrlaUfS9IAfEQ5pQK5o54dYMo3J1OyJNRbSDx8TV4C7Hwuh+u/8c
 eL0G3zV9pf48xRlPPQMauuIWLvqy6wjeiO91jT40QBFWv9+68deVSov2gULDSfdYkgv/
 m2NPRWqaTqnxjBG4jgzi12/Mf34tjTTR3bHXxyfDRm8/GtzADYr+oJZw+avlij3FsmuQ
 x7kw==
X-Gm-Message-State: AOAM532mc3JZxxKteiyiv18wlg5Zmu7cH2kHuqNnOrcdyQ5wQ81q558w
 HI+8wCIcjphZNN8lXN3gdpqNgSa2Bhc=
X-Google-Smtp-Source: ABdhPJzsTUORz/SJGZTFxZC65j7YXlb+wNK0JYHon6ithBgkgGy9cO58+7m/n/3THNwyyV6Y6RUG4g==
X-Received: by 2002:aa7:c34d:: with SMTP id j13mr90691248edr.308.1636361005649; 
 Mon, 08 Nov 2021 00:43:25 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id nb17sm7743211ejc.7.2021.11.08.00.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 00:43:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] configure: preserve CFLAGS,
 CXXFLAGS and LDFLAGS in config.status
Date: Mon,  8 Nov 2021 09:43:20 +0100
Message-Id: <20211108084323.541961-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108084323.541961-1-pbonzini@redhat.com>
References: <20211108084323.541961-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CFLAGS, CXXFLAGS and LDFLAGS influence the tests (for example if they include
-L or -I options), so they should be kept from the invocation of configure
to the subsequent reinvocations via config.status.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 369b5455b6..d268f59246 100755
--- a/configure
+++ b/configure
@@ -4057,9 +4057,12 @@ preserve_env AR
 preserve_env AS
 preserve_env CC
 preserve_env CPP
+preserve_env CFLAGS
 preserve_env CXX
+preserve_env CXXFLAGS
 preserve_env INSTALL
 preserve_env LD
+preserve_env LDFLAGS
 preserve_env LD_LIBRARY_PATH
 preserve_env LIBTOOL
 preserve_env MAKE
-- 
2.33.1



