Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C261648192
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:26:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bUr-0003xQ-GL; Fri, 09 Dec 2022 06:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUY-0003wn-HH
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUV-0000xA-Vv
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhvjNB4OA8hsIXov8nN5lZt2h9cUBGWr2ztc3bOaMEc=;
 b=HkFasVVbJ+yZPv6X8Aj7S6MRHZdAfOCuyO7h8BceoIpOjathxDHr3IuopMRJrREp/Qh+FW
 KD6oc2bDj4D3Bb08lRLtBN5HTWeiIpS9IObJUkdJOsNyrgXdUaKMBOFyVp0J/qw8oaOCMP
 W11+sNznlZh0yU2PrZgNnMpFy1F/SRE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503--htBy_JsP9-xmxMbChUiuQ-1; Fri, 09 Dec 2022 06:24:21 -0500
X-MC-Unique: -htBy_JsP9-xmxMbChUiuQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a05640234cf00b0046d32d7b153so1219303edc.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhvjNB4OA8hsIXov8nN5lZt2h9cUBGWr2ztc3bOaMEc=;
 b=EsF7k8NwgkpZXv16hjqtFDxbxpkydX+krHcLkeUmPXV/5maKn8oTPFR30f0FA7k5hO
 i1nkd/rKYyCsPA00oPVwKlMQxtUTEWmrpX4ihZkf9dJFXat3L+gMm/w7qZK6REGufs+i
 1tKxOcjnTmoxtzj1j+PaNwgM3yiqQSiOwr8usG6pFVsuoz+GfmeKureVclq/PBmRA3J3
 SVsgBx+PjzCTmunbgNo08UoK58F/RCWysIB+s+D7QWz6zzB9BTBYgemK/Sh/ZEiG67h1
 yV19jsbRgs05SFGeVPRIdxtnToTYo1jYCA3psMSj2BNdUDMiPenV438Wfgp2BNbpHlvv
 OI/g==
X-Gm-Message-State: ANoB5pkevAKZRwFp9tlU7faCoRkr68iPcm3g9qCNjCAj+WUVmY2mIR1r
 Y5xzSAdSnjho4MRT2GSjaobrL2/LMeo/0CKu02JmtQOqwDPPZOdA9uIvfukoPkS6OQXVa9BwG4v
 /c5HIgd8r/iDISYfcSICfI5hB1GyY9jjYxoz6EThBjU1TuxMQXny4pKL57iTLr6lEWac=
X-Received: by 2002:a05:6402:3982:b0:461:9578:f904 with SMTP id
 fk2-20020a056402398200b004619578f904mr5362996edb.23.1670585059732; 
 Fri, 09 Dec 2022 03:24:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Pwf36K7bncHBZ02kn2ZTwXBH3KSI9ykTT+/NAUJoJNEqazTWh09QcxYyd+IyjGDl/cuy0ng==
X-Received: by 2002:a05:6402:3982:b0:461:9578:f904 with SMTP id
 fk2-20020a056402398200b004619578f904mr5362979edb.23.1670585059320; 
 Fri, 09 Dec 2022 03:24:19 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a50930f000000b00463597d2c25sm523812eda.74.2022.12.09.03.24.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/30] configure: remove useless test
Date: Fri,  9 Dec 2022 12:23:42 +0100
Message-Id: <20221209112409.184703-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

$cpu is derived from preprocessor defines rather than uname these days,
so do not bother using isainfo on Solaris.  Likewise do not recognize
BeOS's uname -m output.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/configure b/configure
index 543fd5a48bf0..db2b45740449 100755
--- a/configure
+++ b/configure
@@ -337,9 +337,6 @@ for opt do
   ;;
   esac
 done
-# OS specific
-# Using uname is really, really broken.  Once we have the right set of checks
-# we can eliminate its usage altogether.
 
 # Preferred compiler:
 #  ${CC} (if set)
@@ -489,13 +486,6 @@ sunos)
   QEMU_CFLAGS="-D_XOPEN_SOURCE=600 $QEMU_CFLAGS"
 # needed for TIOCWIN* defines in termios.h
   QEMU_CFLAGS="-D__EXTENSIONS__ $QEMU_CFLAGS"
-  # $(uname -m) returns i86pc even on an x86_64 box, so default based on isainfo
-  # Note that this check is broken for cross-compilation: if you're
-  # cross-compiling to one of these OSes then you'll need to specify
-  # the correct CPU with the --cpu option.
-  if test -z "$cpu" && test "$(isainfo -k)" = "amd64"; then
-    cpu="x86_64"
-  fi
 ;;
 haiku)
   pie="no"
@@ -559,7 +549,7 @@ case "$cpu" in
   armv*b|armv*l|arm)
     cpu="arm" ;;
 
-  i386|i486|i586|i686|i86pc|BePC)
+  i386|i486|i586|i686)
     cpu="i386"
     CPU_CFLAGS="-m32" ;;
   x32)
-- 
2.38.1


