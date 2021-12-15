Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0B476360
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:33:59 +0100 (CET)
Received: from localhost ([::1]:48468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxayM-0001MT-Hu
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:33:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq3-0003s9-0x
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:24 -0500
Received: from [2a00:1450:4864:20::42c] (port=34565
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq1-0004D9-6M
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:22 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s1so6089977wrg.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zikH4w8gTl4z+VcRhU+TPNlwl/NYQdcIB+Sy1v402YA=;
 b=SAhRt2XTBYlgNAm7z2SfcdgHjOTzcZzE4/dn5Vodzwg7c84SDpDjTlgbKRBEObgAWU
 2o1oXA4wdoh6sHbSWMX0ykTrkBe9QKeso7PkbLAco+0KoAH6CrVhRtj/jnxgEOex349L
 Usk9g4UardQVQh4OcoDeif3iuYtVu/CVEwWGb5MV4OCqfniuwGpBl7Azp72/Qnbftpf2
 8fFx+StgtTHqzgjoaM1FGi0b7t5M8a16dzCyGw1U187ENI0ZadhzYwNcw4DpGR3/wvKO
 Q7oJTG3eP+UO19KNwGaWvaD6Q4um0o9ZrfHWLF47tMYkNVxqg93U1jaFldnrEm2f55EI
 MdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zikH4w8gTl4z+VcRhU+TPNlwl/NYQdcIB+Sy1v402YA=;
 b=V8RvRBcJ5g0Ie4ilxGmlC/fPSCyji7odNdpYcW89PHQeVUlsXd+lsINTw0mQWq8XrE
 ICuxwlEi395eYCnlQFDG5Rqo//P/nIwjKEsUtZ3lcTvd8x5/Ax8hGf4ZmnYtuGGfdrZT
 oavIZXlvsY8q3ABgUU7cdMGZnPGPQG+kDpiJOyRQE5/M4O5+GCvvq8VXbpXRqHZTI9a9
 8s4HDu826xTcH3IDTLtXplAQoFHhpntuYTFnrVAPKYBerl/HN/Zju8woDSPwrPHgna0e
 v94VquLkb9MB1KnKgXwiTCzwW5n/CUKw5F7+dDLcqa9gGWraHIvTjg9Em6R+G6lQlQkC
 bvVg==
X-Gm-Message-State: AOAM5312zTJ/Q4pv5LPKUDNwy1VuEvA4aph37MM/o61lsSZHekxwgAqb
 Nk1fGoV7srAYr5fFT5yYE1LYZ57MYCI=
X-Google-Smtp-Source: ABdhPJwwTIs6XGkW9ixzDTRFSrPtr9Y27b3oHi0HT0Asi4tH5Z0xG0wcfln9XtNmluAAeMoZh7bypg==
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr601090wrv.651.1639599919484; 
 Wed, 15 Dec 2021 12:25:19 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] scripts/entitlement.sh: Use backward-compatible cp flags
Date: Wed, 15 Dec 2021 21:25:06 +0100
Message-Id: <20211215202515.91586-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Evan Miller <emmiller@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Evan Miller <emmiller@gmail.com>

Older versions of Mac OS X do not support cp -a. The cp man page indicates
that -a is equivalent to -pPR.

Signed-off-by: Evan Miller <emmiller@gmail.com>
Message-Id: <40635C6E-059A-4146-B1E2-F6376700EE85@gmail.com>
[Leave out -R, these are files and not directories. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/entitlement.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
index e2c956a3ac..0f412949ec 100755
--- a/scripts/entitlement.sh
+++ b/scripts/entitlement.sh
@@ -15,7 +15,7 @@ ENTITLEMENT="$4"
 
 if $in_place; then
   trap 'rm "$DST.tmp"' exit
-  cp -af "$SRC" "$DST.tmp"
+  cp -pPf "$SRC" "$DST.tmp"
   SRC="$DST.tmp"
 else
   cd "$MESON_INSTALL_DESTDIR_PREFIX"
-- 
2.33.1



