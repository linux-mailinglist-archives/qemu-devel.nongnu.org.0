Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F92061E117
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:54:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbPa-0001XM-Qk; Sun, 06 Nov 2022 03:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPW-0001Uu-O8
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPU-0002xG-Vq
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIXyt2FeskuhuvmdCFhfOM+ZpfIi7IvpCQfG+/pfreM=;
 b=i3w6Fx651y/BRRMuTmLq+VIC5TdsE0cokuu5aM5Z0GPjGspV6tD9P0MTH9B+MLKZ7Al0W2
 S02txPsIfLY2KCh+fZW6xwqlEDPxkRUu4DLBrVpGuHmpJPLU8URygMjNc5xxQZmfwxtW87
 xMhBgHZPAciqOUyDcT/1AQvBbOBb34E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-m6425xHCNrGY9ZZaMFX0EA-1; Sun, 06 Nov 2022 03:53:43 -0500
X-MC-Unique: m6425xHCNrGY9ZZaMFX0EA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso4551260wmb.4
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIXyt2FeskuhuvmdCFhfOM+ZpfIi7IvpCQfG+/pfreM=;
 b=h9GlJk2Q0kNhRGWP579xK84DJrM3ifbAX6HEj2f72BAZoa0gY40bF6jje8QlEvWv0H
 Z/iubl8ps5TSlXbAVspzw8y4MukM9H6HcyZQA0u6KNH1QkCcM0DicStDU5fCoLKWMsAZ
 fs3pXqHB8A1u1WatwuaL0GSY4tRzJIleiI6yMuFzkPVUgmPaqyfIT3Yp5n8ibyiRgCzt
 dSm5bOb9xNiPY7VTH9CNeUHUHSfsEtvTaggaXZuy126FTc16/EXjR8Wf5irw0QSwgecC
 +H5IrNwnSV6xLg+ikDJ3+n5KllweYdcS6KCMIxo0iIyduTm56baGjp+B2isLKBXXU6Op
 P7vA==
X-Gm-Message-State: ACrzQf1rS9XiZIX+U+UWZjMewvEdmOlryGRJCB68ADQcbATVxYq2ff8M
 hLNOJexIOPh/K08UN5OSeE74lAddp9BX13VsbRxx4V+KRKhUwCugdliFXdiaTFvUHcEt2JZKce4
 MhzbBvPxX1u0Zqrd2iII3moNCzQWRVbf4eDEYPtDslRBc9j/ZdFXXhuK9ggI5olys1p8=
X-Received: by 2002:a5d:4a82:0:b0:236:6ee4:769d with SMTP id
 o2-20020a5d4a82000000b002366ee4769dmr27679835wrq.112.1667724821285; 
 Sun, 06 Nov 2022 01:53:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5MZR+xWJbTcwzceYvmWzsQhXlK9mZKZUTjqVQJMPGo5vlGIk3xCXGYI7r45fTG1560x9+ksQ==
X-Received: by 2002:a5d:4a82:0:b0:236:6ee4:769d with SMTP id
 o2-20020a5d4a82000000b002366ee4769dmr27679823wrq.112.1667724820975; 
 Sun, 06 Nov 2022 01:53:40 -0700 (PDT)
Received: from avogadro.local ([93.56.171.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020adfd0cc000000b0023672104c24sm4128825wrh.74.2022.11.06.01.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:53:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [PULL 05/12] Fix broken configure with -Wunused-parameter
Date: Sun,  6 Nov 2022 09:51:08 +0100
Message-Id: <20221106085115.257018-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Weil <sw@weilnetz.de>

The configure script fails because it tries to compile small C programs
with a main function which is declared with arguments argc and argv
although those arguments are unused.

Running `configure -extra-cflags=-Wunused-parameter` triggers the problem.
configure for a native build does abort but shows the error in config.log.
A cross build configure for Windows with Debian stable aborts with an
error.

Avoiding unused arguments fixes this.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20221102202258.456359-1-sw@weilnetz.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 4275f5419fae..66928692b058 100755
--- a/configure
+++ b/configure
@@ -1258,7 +1258,7 @@ if test "$stack_protector" != "no"; then
   cat > $TMPC << EOF
 int main(int argc, char *argv[])
 {
-    char arr[64], *p = arr, *c = argv[0];
+    char arr[64], *p = arr, *c = argv[argc - 1];
     while (*c) {
         *p++ = *c++;
     }
@@ -1607,7 +1607,7 @@ fi
 
 if test "$safe_stack" = "yes"; then
 cat > $TMPC << EOF
-int main(int argc, char *argv[])
+int main(void)
 {
 #if ! __has_feature(safe_stack)
 #error SafeStack Disabled
@@ -1629,7 +1629,7 @@ EOF
   fi
 else
 cat > $TMPC << EOF
-int main(int argc, char *argv[])
+int main(void)
 {
 #if defined(__has_feature)
 #if __has_feature(safe_stack)
@@ -1675,7 +1675,7 @@ static const int Z = 1;
 #define TAUT(X) ((X) == Z)
 #define PAREN(X, Y) (X == Y)
 #define ID(X) (X)
-int main(int argc, char *argv[])
+int main(void)
 {
     int x = 0, y = 0;
     x = ID(x);
-- 
2.38.1


