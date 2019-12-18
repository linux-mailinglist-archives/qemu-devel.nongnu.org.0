Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2A4124699
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:15:35 +0100 (CET)
Received: from localhost ([::1]:53290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYEn-0005T6-Kc
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY2p-00066E-WA
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY2o-0008PG-Mx
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:11 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33357)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY2o-0008Mn-AF
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:10 -0500
Received: by mail-wr1-x430.google.com with SMTP id b6so2028887wrq.0
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TAsGaMkNvgX/1PLIh8rhtcIKT0XZhmfnt+sThwwjUYM=;
 b=J/7utKiPuH2S7OdchHgT5h5XYsAukmf4Dd/hSJ9kwhxhyRetf6KaphydiOKijXLdzF
 eGw4mX0sgIF/2b/uykbjCk5fxmBErSbpsKRgfP7dMEcPHdAsuID7jNP+QO5BmXLUYWkH
 UTI3qaqh3uQtBaER0O6fDLQXFDe215vhOEQjrtNkIjzOOOwb5d0Ym8Y7a0wmUx58XoEo
 2XfV4Yu2z+XwfzDRm/QV73IvZtkYXRMiqjOx/bGS405H0uz/5Xx7V+aTbCHF2jRDcoKj
 RY3JqcWCM0bzuXcZa6vboR8XQ1WaHnKou+1vaKfYvzykfwxxn7YX8uNg9PzcZWwkqUNs
 vHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TAsGaMkNvgX/1PLIh8rhtcIKT0XZhmfnt+sThwwjUYM=;
 b=i9W3JRGlH8YZFAEtxjL5K1vavXqaVhhgAV9HkRYQkHQJ3EjbKNjQlChxg7ZcEDD2te
 Q+4+7eK4XT4qfdN2TYXpAm5vYO9BFeYxIGQTO+LCENqD2YuTP+jIAp/zGTL9kFxP9o+J
 8Ojz7gihV7QyYZyJi0GA2tOudLkilbNDXyCl904mrRD991mZkrXZbv4TpwmakSzdyPgS
 GjgGlEK9ddGYW4pXDwNidr+W6bJzDNd1oZllt4PJ/kzX/Hefh5wJw8mWK7RmGYtzpbUf
 sWnSjSrgGITMHvWAtivgZfaoO9G4TRZcIvz8iX7AKrRNEElQ2ecVYb1ZozSXkRT6NOev
 myvg==
X-Gm-Message-State: APjAAAVh7RixjcXpWXOUhKlPfNVnTHy6HFGlbu35kGvrHgw93E/9R9VV
 6ne6Ynn9lxWP2dbbB1RniweStYLf
X-Google-Smtp-Source: APXvYqzcdlIELg70iyA5ZS8mpkes5PYtTnsSAuilVVpEinWuhGz/7q0O3TCEqMDO9eCke68kGDCKTw==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr2344446wru.99.1576670587594;
 Wed, 18 Dec 2019 04:03:07 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.03.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:03:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/87] memory: do not look at current_machine->accel
Date: Wed, 18 Dec 2019 13:01:38 +0100
Message-Id: <1576670573-48048-13-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
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

"info mtree -f" prints the wrong accelerator name if used with for example
"-machine accel=kvm:tcg".  The right thing to do is to fetch the name
from the AccelClass, which will also work nicely once
current_machine->accel stops existing.

Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 memory.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/memory.c b/memory.c
index 0228cad..d7b9bb6 100644
--- a/memory.c
+++ b/memory.c
@@ -2991,7 +2991,6 @@ struct FlatViewInfo {
     bool dispatch_tree;
     bool owner;
     AccelClass *ac;
-    const char *ac_name;
 };
 
 static void mtree_print_flatview(gpointer key, gpointer value,
@@ -3061,7 +3060,7 @@ static void mtree_print_flatview(gpointer key, gpointer value,
                 if (fvi->ac->has_memory(current_machine, as,
                                         int128_get64(range->addr.start),
                                         MR_SIZE(range->addr.size) + 1)) {
-                    qemu_printf(" %s", fvi->ac_name);
+                    qemu_printf(" %s", fvi->ac->name);
                 }
             }
         }
@@ -3109,8 +3108,6 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner)
 
         if (ac->has_memory) {
             fvi.ac = ac;
-            fvi.ac_name = current_machine->accel ? current_machine->accel :
-                object_class_get_name(OBJECT_CLASS(ac));
         }
 
         /* Gather all FVs in one table */
-- 
1.8.3.1



