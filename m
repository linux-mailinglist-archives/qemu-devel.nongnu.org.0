Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32244481FA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:40:20 +0100 (CET)
Received: from localhost ([::1]:36658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5oq-00067i-21
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:40:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5lA-0008Br-AS
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:32 -0500
Received: from [2a00:1450:4864:20::533] (port=34665
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l6-00075b-R7
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:31 -0500
Received: by mail-ed1-x533.google.com with SMTP id x15so32097274edv.1
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWahwRqrrpEtyJD8Ih6TbRhDOSQH3TpZiE8QfsT8qT8=;
 b=qIXrpgOJEOYNz2bfX1GrgtjVQxC6JGg/FAlFs05FTA2x/93dxejiFHXsue2Z7RJcit
 GnGAhclvnzH5GcgBms57GPHzBDv2DwkKvpjIBiy7Q/EOgeNYzjYkvBDtQo7nSy4F3CCD
 uiNaKbUraARykiDZp8YrKseSxitMESdgP8PxZrp8fhGW60iEbtdXziB3gApRNfXljNdT
 coIb/hcBs2Dxq97nw5xlP69auY69LOSo/q04lOSmVCHgjmyRnA7NYgbaFHLDTIBXRC8C
 W6rIO98Bnmx5PQdZreUt3OYpUKlFaTMKZDZZThOJFbGzVgShZtCGyLzp/zFOx8SD7FK6
 kmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JWahwRqrrpEtyJD8Ih6TbRhDOSQH3TpZiE8QfsT8qT8=;
 b=zMIBGCWeLVs+0e2tQHyxVSuSqX5sG8KV33gfv3UETvVQDMjthDsv/hjBBJ47s3sZkf
 Yt5IWf79JxyDoVWX7+D9OwmTiWdUeEU8gA1YX6pkGrj7pScaDUvpD0cllRmf9x8Alkc6
 0DnalariwViiJxD9ReOPgFjPQ2V1P911pBkbUSy+rAK9WiD0frBAEJMBplKL6u7BRV8s
 C4wxhNcXeAkQYBS/2ndXqtfuWzTtFPH6K3tmT+oAGlWnyCzb/viMJ3xwBPCmee1/n2ZC
 RnbOHv2YPLk9hkjHeeu+pKChBeaj1oyjGoBW6bqpeO65xp37H1uGGoIxIIbxC8n/U6HM
 wUiA==
X-Gm-Message-State: AOAM530aA/sBL8ynmpDQKeWB5YCXFSfl+0OgAsM2KdTcUbDBdeXs5H3/
 yxm8nx7UN3Sx9gFfGYpnf7I/PORQ2c4=
X-Google-Smtp-Source: ABdhPJyOEuYfq89jHXrSAd4kACfsE346YH/vtEKyTRv2hpefZ43nYYiow0kgFtIesQLsL1UhOf64lA==
X-Received: by 2002:a05:6402:26cb:: with SMTP id
 x11mr78929edd.127.1636382183627; 
 Mon, 08 Nov 2021 06:36:23 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp3sm8366662ejc.61.2021.11.08.06.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:36:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] configure: preserve CFLAGS,
 CXXFLAGS and LDFLAGS in config.status
Date: Mon,  8 Nov 2021 15:36:13 +0100
Message-Id: <20211108143616.660340-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108143616.660340-1-pbonzini@redhat.com>
References: <20211108143616.660340-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CFLAGS, CXXFLAGS and LDFLAGS influence the tests (for example if they include
-L or -I options), so they should be kept from the invocation of configure
to the subsequent reinvocations via config.status.

Reviewed-by: Thomas Huth <thuth@redhat.com>
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



