Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA2F6FC253
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:07:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHc-0005GM-TT; Tue, 09 May 2023 05:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHa-0005Fm-9m
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHV-0004vL-Nt
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fa+E1cn+aXVgyQqv6KJG8RpWbfGinqZr96xu6cSJyhw=;
 b=ANzLpDCJmeoaGi6ZUq5/XtVar5LL7F0Poh5VgSkPI5hZPSyL0YpwlS86LVth6HHahUPRZA
 IFggCgM9S5alF1aLY/tOvdMiz6vNmQOP8sc1Taq/zCYuyY3GreeLbMzwISw2I9XSxQFZVt
 l8qWOzBNd5dVqGKgOE2fZdd2HvAp5mY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-wMyB7eiHMjOCzoJbjOb2aQ-1; Tue, 09 May 2023 05:05:11 -0400
X-MC-Unique: wMyB7eiHMjOCzoJbjOb2aQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50bd1f08901so5347328a12.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623110; x=1686215110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fa+E1cn+aXVgyQqv6KJG8RpWbfGinqZr96xu6cSJyhw=;
 b=MRnDD7yY6jyao/cPIK+6jGQDqSeXyIiDd3ytXeleWl/0f3p/G0QklaGpQuVIi90+cT
 SHuI5+CTeZIyAVHpAKn+MQzxfQ+tUsN5c04ySI3MxZJovz49+QReqgIyAZTHXWuv/DyM
 MQcNSM3WUZghoj+KDrBOz84n6aSXtyBhxamhuWKBz6P8G84Hr/AIGO5CTXnMMT3dm9oo
 2UjPdMSs8d4wD3StXpsTjvCiEHhhbrtJQW3pfVD0uOQPDTG3aE3CSqPh0WnLBZosOX1w
 z21jP1Af890s7o0FYXprdeJn1Ydh85zDzlexfadEH8HB8OX9gcsKVG0bDbXtMx0HBZxL
 nQ3A==
X-Gm-Message-State: AC+VfDxNhIupWzBHg9H0lZYuRc/K5f6pdkCylsi0BNZOM0S2BZ5uC8BX
 sdSTZG+muXPeskGwDCafsVkOA5f1O9qwqtF7SWm4Iq6vOXmT+pCOx7v7xB5Pc1kRyPGNN4JoSH5
 Ei79yVqdlD9/+iTkW2fshSMuJWiLP793ssYcA7LfBS4I7NIf9PMtz+GzS5w1vvPTP3omItf1ohU
 4=
X-Received: by 2002:a17:907:78c:b0:953:43a1:1988 with SMTP id
 xd12-20020a170907078c00b0095343a11988mr10635485ejb.46.1683623109896; 
 Tue, 09 May 2023 02:05:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6GDK9OPvwO5HVNjGHpaEBY65H09O7hA6rI7ePn8QYVwJ3S9EldzmAVKPUSAq5uXQG9RZHBHw==
X-Received: by 2002:a17:907:78c:b0:953:43a1:1988 with SMTP id
 xd12-20020a170907078c00b0095343a11988mr10635466ejb.46.1683623109606; 
 Tue, 09 May 2023 02:05:09 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a1709067a5200b009661afd3b86sm1068205ejo.171.2023.05.09.02.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL 07/16] include/qemu/osdep.h: Bump _WIN32_WINNT to the Windows 8
 API
Date: Tue,  9 May 2023 11:04:44 +0200
Message-Id: <20230509090453.37884-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

Commit cf60ccc330 ("cutils: Introduce bundle mechanism") abandoned
compatibility with Windows older than 8 - we should reflect this
in our _WIN32_WINNT and set it to the value that corresponds to
Windows 8.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230504081351.125140-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 9eff0be95bd5..cc61b00ba9b7 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -75,7 +75,7 @@ QEMU_EXTERN_C int daemon(int, int);
 #ifdef _WIN32
 /* as defined in sdkddkver.h */
 #ifndef _WIN32_WINNT
-#define _WIN32_WINNT 0x0601 /* Windows 7 API (should be in sync with glib) */
+#define _WIN32_WINNT 0x0602 /* Windows 8 API (should be >= the one from glib) */
 #endif
 /* reduces the number of implicitly included headers */
 #ifndef WIN32_LEAN_AND_MEAN
-- 
2.40.1


