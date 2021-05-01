Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C523706AC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:38:09 +0200 (CEST)
Received: from localhost ([::1]:39940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcm4e-00087C-3g
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxT-0000Z6-B7
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:43 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:46833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxQ-0005YE-DR
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:42 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h10so778674edt.13
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ezztMan+aCk3LpSU9driVzqY0tgeZFrNCnQhZCY0Sws=;
 b=p6qlP0vIMh6mEvnPrJ7GS55wvhs23AapR7Zj2t8aITAMBY3fPwJoGD74UIms7XuABV
 OwivqM/AS7clQm7Go4AGkkodutPVZwmK/TIJkQTCpprB9hOPR/c7z3QTO379+qn1LOjW
 XRssqQpP+8+3KyS6B97DWIed+HdraEUAsgOYSaGVB5RBbl24gq6ShYM4A4nJZNH5/0B8
 yPg3cCK6LBSD1HcnYeA5eotyboUQsG7di1GwOBDJu/e10KzE+4Y+saUVZi4FAOyKLZoc
 H3hoGxyTBTaB45V/xB/ex3v/IN0c3OZmZBtpRE34kqvJ7VtheBa6ssQwAcvsH0ch3Jej
 XeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ezztMan+aCk3LpSU9driVzqY0tgeZFrNCnQhZCY0Sws=;
 b=JMwBOEisOosbbQarsLS3xYhsWhJNf9QSHeIK9o3yZBoVypxcV8oKnM8hoQh8ZJe4a9
 cton4UdmdaT1dk+iZarQ1pivUhtdh0477MpvPPaNeymcckFQqt2OZ+nRqcNQGhh9uHSC
 gbn1nugC0AmXB96DLWWJd2pDp7vJ1JRD7SdVxEUgiwy3ObWm2udceMGqlOf1CgZXbHgG
 ANiZCt2EvkraYzo0IzXnsHjAQPT6zZsqXxXEbtJHSqp0sNTjkp0UFxuwg9g6jf51hnHY
 Yf+FqW4oV0u5u3VOg8SHG+K/mb5JQrg4ZZlLo5Dsa8Z7T3FVjqeoHkbOOwTBm+jefvgg
 3fvw==
X-Gm-Message-State: AOAM5309ibB0WgZHd1q6kdPsa1dNZPSBoDEXtLOoogF6jld4SspgXgTM
 1j0mm2mXLhOXy0pEquogXe6nHnLt3H4=
X-Google-Smtp-Source: ABdhPJziBt/NSFnxeHNj1J9um0fvBwGIBPEb8+CUMrfiNpXIXjUhsyfKkxj8VQV5xImtp8a5MQ52lg==
X-Received: by 2002:aa7:dbc7:: with SMTP id v7mr10697634edt.110.1619861437364; 
 Sat, 01 May 2021 02:30:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ga33sm4632721ejc.11.2021.05.01.02.30.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:30:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] configure: handle meson options that have changed type
Date: Sat,  1 May 2021 11:30:25 +0200
Message-Id: <20210501093026.189429-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501093026.189429-1-pbonzini@redhat.com>
References: <20210501093026.189429-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Usually Meson uses pre-serialized information in meson-private to
speed up re-runs.  This is not possible for version changes, where
Meson instead rebuilds the serialized information using cmd_line.txt.
In some cases cmd_line.txt can contain stale information, since it
is not rebuild except when "meson setup" is invoked.  Update it in
the configure script to allow upgrading our Meson version.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/configure b/configure
index 0b8283c95c..54f8475444 100755
--- a/configure
+++ b/configure
@@ -6458,6 +6458,15 @@ if test "$skip_meson" = no; then
   if test "$?" -ne 0 ; then
       error_exit "meson setup failed"
   fi
+else
+  if test -f meson-private/cmd_line.txt; then
+    # Adjust old command line options whose type was changed
+    # Avoids having to use "setup --wipe" when Meson is upgraded
+    perl -i -ne '
+      s/^gettext = true$/gettext = auto/;
+      s/^gettext = false$/gettext = disabled/;
+      print;' meson-private/cmd_line.txt
+  fi
 fi
 
 if test -n "${deprecated_features}"; then
-- 
2.31.1



