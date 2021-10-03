Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746FC42009B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:59:22 +0200 (CEST)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwP3-0005xS-Dt
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9Q-0003xX-7l
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:12 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9O-0000yC-D3
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:11 -0400
Received: by mail-ed1-x535.google.com with SMTP id x7so50489779edd.6
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qcYxgU2BWHGdyqmbza1PuxPba8AZTnDNMxkoorI7FVY=;
 b=moNi+qHOV+loeVj2ooFDJ1iKQKTafV56PaMLPhdC3LS+NJljO9rcVtWqbhAVGUCX7w
 buGSxJvBkRst9H9C9Xjz3gBvVy1O30QYx0k8R9j6W3CWy7lK4rL9p/f5HHABzSMuFtuf
 SSQ3yS5BISUwp/aPjyB+Miz61uWfunvA0eXB+pdszjs5eTzXJq5PvuQKipWnZ/2xmavP
 aFqSMu6V47UyRe/CLbTAn/imYFHk9gNOdUAq4JN+zsjIktU7I90TiHH9Aho+CjzEX9J6
 lJXn2V4s++vkFWLverY1niM6uR5vk7JYANnWpbnxDC47ni2J0qT0MHvpnMYOBdP4oPY/
 nrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qcYxgU2BWHGdyqmbza1PuxPba8AZTnDNMxkoorI7FVY=;
 b=pJJ8SodQuZKxql1AONVIE5ZTr2VL89KAksbJN8Gg0Mh3CKZSVojvZ0UcYfe8SEP/Uj
 N4QbsGUCw63ZD4Je/ZJjZ85U6Iv6DUHbXiXBRXaWY3UyyXyqevQ94Zme2za+XP6bCeI5
 QNbqaffdHWBRsh8Kg9XGpqn39/IrxsPHcsfdIwvxurpGYt4dIYcdLtIcvnUeqprOWy5c
 dXDTUauJalgLD5fC4xHTtyUfTm9s1be2zvX+U/4gkwsfruccuwfS5nUVZSy0pX9HUll7
 P4UXT45qShhOSBXJ6KmRV0hWpw7L1Z9uaUbLsyeOYrJnwu7yeW+B8gA8CcvVn471LQO6
 VTxg==
X-Gm-Message-State: AOAM53218qBh7tDs/7/5cVNs01OWrQLFhHuGEAhkfNmKnWNzR8QcHUIL
 YdCF+I5B7NxDC3Y1VlF9Tm8nDQ5WOIE=
X-Google-Smtp-Source: ABdhPJz0eR2gFLXZbquq1l6Wz3X1OQ61rfxBn76U4iBciKSHem898DGHGh1D9w13c+Y5UvsUL3moBQ==
X-Received: by 2002:a17:907:2091:: with SMTP id
 pv17mr8830617ejb.180.1633246989146; 
 Sun, 03 Oct 2021 00:43:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/30] configure: Loosen GCC requirement from 7.5.0 to 7.4.0
Date: Sun,  3 Oct 2021 09:42:43 +0200
Message-Id: <20211003074250.60869-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: nia <nia@NetBSD.org>, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: nia <nia@NetBSD.org>

As discussed in issue 614, we're shipping GCC 7.4.0 as the
system compiler in NetBSD 9, the most recent stable branch,
and are still actively interested in QEMU on this platform.

The differences between GCC 7.5.0 and 7.4.0 are trivial.

Signed-off-by: Nia Alarie <nia@NetBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <YVcpe79I0rly1HJh@homeworld.netbsd.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 1043ccce4f..b0b1a1cc25 100755
--- a/configure
+++ b/configure
@@ -2094,8 +2094,8 @@ cat > $TMPC << EOF
 #  endif
 # endif
 #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
-# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 5)
-#  error You need at least GCC v7.5.0 to compile QEMU
+# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
+#  error You need at least GCC v7.4.0 to compile QEMU
 # endif
 #else
 # error You either need GCC or Clang to compiler QEMU
@@ -2103,7 +2103,7 @@ cat > $TMPC << EOF
 int main (void) { return 0; }
 EOF
 if ! compile_prog "" "" ; then
-    error_exit "You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10.0)"
+    error_exit "You need at least GCC v7.4 or Clang v6.0 (or XCode Clang v10.0)"
 fi
 
 # Accumulate -Wfoo and -Wno-bar separately.
-- 
2.31.1



