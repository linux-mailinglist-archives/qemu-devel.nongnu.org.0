Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1936A6FEF6C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:54:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2xQ-0001y4-0S; Thu, 11 May 2023 05:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2xG-0001FE-Ef
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2xE-0006t4-Ui
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XASAtd8hluVAdm2L32hc4+4zqkKT9h2A0ZTCXCQRCGw=;
 b=VO/ql1JKQdXG4loCMz9Z734zEhBJk49wK90WUlLJMvJhPLmaWUBYIp2Q//DjGIfntfACck
 zXQuyUa1e7UyHf12NR3U7C1WMtDzSi5kaEysY5Y4yiJke6RPMZid/Ju/hJ5uRJdFnlU5OR
 RKHnlPHi9gCHTyBeQXD6qEX0SuZ1vWg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-FBm0C41DOUiDSxoculjO-Q-1; Thu, 11 May 2023 05:51:10 -0400
X-MC-Unique: FBm0C41DOUiDSxoculjO-Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50ddef368e4so1639399a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798669; x=1686390669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XASAtd8hluVAdm2L32hc4+4zqkKT9h2A0ZTCXCQRCGw=;
 b=XEjW9u7yo2w+f9brTdX2xfIFw8XS7IXAt7DvBh0kPMLcS2H5XN69hAEwsp0K7rFcW5
 dVj64lIz0DUFJ6DvYTcNmaXAZi37izGONpiBCmhwUK5aCETvB1MYUjCewj9rYqMN/krc
 RfkKQuBG344C5nhmrQWFD3pmWG+k9DJlRPhNvVct29tOIo6BEndFxHHwYHberBdAE1Dv
 fi7StSV0F1fdLiGUUcbUdPEz8iKoa+3ZpTbiugecWchrv7s7EZE0h0iEins3EY/IazSW
 e4UVpXULtKokfrDb+44dJ4mw/PnXycTzhSj7yOm5LtA066NZjhHE4H3eLnc/IIKlYhSB
 Ao8g==
X-Gm-Message-State: AC+VfDwRM7VkoqS8upsE8TL42zyNlY3yshMqoALVZsmdyj7V3UAPSZY1
 SEMN8gLhb6LZyZkVirLvNn6vFMH+646tuw8xA0b0KaIkQAKiDojK9CIEGFiTCLtfyeJ5WAS2ukg
 J54Fi+pAXDZYGqygzOk+jq2QzdYDox4arO75ZI8Ge2JCgoPqSID6ensBDWkuyNZvyYQKsRdZeyl
 Y=
X-Received: by 2002:a05:6402:b2c:b0:50b:d470:4118 with SMTP id
 bo12-20020a0564020b2c00b0050bd4704118mr17767108edb.18.1683798668915; 
 Thu, 11 May 2023 02:51:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4XwA1FoyyixmyMlk5+lr29WEKPRVvk4aKQYQmTq0alILm8T15Kr4JVV07z9UuVWhNvFGY++g==
X-Received: by 2002:a05:6402:b2c:b0:50b:d470:4118 with SMTP id
 bo12-20020a0564020b2c00b0050bd4704118mr17767096edb.18.1683798668545; 
 Thu, 11 May 2023 02:51:08 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 d20-20020aa7d694000000b0050bcbb5708asm2749192edr.35.2023.05.11.02.51.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:51:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/24] configure: remove unnecessary mkdir
Date: Thu, 11 May 2023 11:50:18 +0200
Message-Id: <20230511095021.1397802-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It is taken care of by the symlink shell function.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index e24a533b3af1..fc76082c3896 100755
--- a/configure
+++ b/configure
@@ -1673,7 +1673,6 @@ LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
 for f in $LINKS ; do
     if [ -e "$source_path/$f" ]; then
-        mkdir -p "$(dirname ./"$f")"
         symlink "$source_path/$f" "$f"
     fi
 done
-- 
2.40.1


