Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917C86A8317
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:02:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiBX-0007kv-JK; Thu, 02 Mar 2023 07:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi8H-0003Kn-HY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:34:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7t-000402-75
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VzYrCiOSSwuHpZgRg3228aUTO/Ukfcmohe1DeHbe5A=;
 b=QgK5t1Q/kdUp7XLE+UWGvm/5C7CvGuzyU3EQpk1AoX0j+bQP9VZXPNXKJ4bTO1zAspSzaY
 uZEo+KIBTgA2PLxLncAqEGEz8lqmRL0ZjjYYwM8rSljV8HZF8YCVb0KVhdSGKq//o/34hW
 D788SpBIOqh4VsvrHBlK/BGXQoDYvdM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-ea9TPiPaOLu8YoBMpOen5g-1; Thu, 02 Mar 2023 07:33:35 -0500
X-MC-Unique: ea9TPiPaOLu8YoBMpOen5g-1
Received: by mail-wr1-f70.google.com with SMTP id
 m7-20020a056000008700b002c7047ea429so3200292wrx.21
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/VzYrCiOSSwuHpZgRg3228aUTO/Ukfcmohe1DeHbe5A=;
 b=fF3VgFtA5jt6puXSA+du5Uyuc+T4aYIy4Mzq/AmecvmBv3WC4/E1/uafM7vPxInINQ
 I6K+9haxxBNmorsm0YZ7AYHqO1dSiNSPzy0bnhiD84T6kMfSUL91KeUfNPRoGwUx+mQv
 Tgt/sOnJ1YKzmgZmifd/0S+s3Sv7dOmsSmc/Uj5aTqudv7lajTxGfKXOBisxYNP9brJw
 m0n1taQ84p+RTtxnO9aItOg8UueQaE9GdWUvfFXTQZ6J5mkoUGkxfZbDLTLaOgFp0hcG
 LmE2/ySKpvo9d6usKUhJMOxjkYDNGDckFKstBRDX3zHCuWgbcd94XDtgwUF3HMyr7e5V
 hEBQ==
X-Gm-Message-State: AO0yUKWp1rHiT4xzQIGuHQZ261G9tAJCqWbWw83CuVZNpph2zHWXWY9O
 8nbnJ9j5B5QJlb1I7yGn5dUAwGBhaBtWL2RzKtI6YD/yvobC7TFCUk3+tI9pMMUhUVL1CgjQXmg
 5HYfkoAyf4stPa765byeMdH17cFNO+BoaY+cVDeeDtgmG4Gs0Z4nkv6ebYXCFU1ERmWpfRuHWE6
 E=
X-Received: by 2002:a5d:6a85:0:b0:2c7:deb:c61 with SMTP id
 s5-20020a5d6a85000000b002c70deb0c61mr7524846wru.39.1677760413989; 
 Thu, 02 Mar 2023 04:33:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+QsVU70FuQcYVCnRZr4EDDHLe978aERdz36s1FC3u0qPgIJ5ccd/mqFAae0N4NYcLgR/OlLg==
X-Received: by 2002:a5d:6a85:0:b0:2c7:deb:c61 with SMTP id
 s5-20020a5d6a85000000b002c70deb0c61mr7524836wru.39.1677760413761; 
 Thu, 02 Mar 2023 04:33:33 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l8-20020adff488000000b002c557f82e27sm15284106wro.99.2023.03.02.04.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:33:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>
Subject: [PULL 62/62] Makefile: qemu-bundle is a directory
Date: Thu,  2 Mar 2023 13:30:29 +0100
Message-Id: <20230302123029.153265-63-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
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

From: Juan Quintela <quintela@redhat.com>

So make distclean should remove it with -rf, not -f alone.

It has been that way since it was included.

ommit cf60ccc3306ca4726cbd286a156863863b00ff4f
Author: Akihiko Odaki <akihiko.odaki@gmail.com>
Date:   Fri Jun 24 23:50:37 2022 +0900

    cutils: Introduce bundle mechanism

Fixes: cf60ccc3306ca4726cbd286a156863863b00ff4f

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230301111910.1660-1-quintela@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ce2f83a684f6..e421f8a1f4f7 100644
--- a/Makefile
+++ b/Makefile
@@ -220,7 +220,7 @@ qemu-%.tar.bz2:
 
 distclean: clean recurse-distclean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak Makefile.prereqs qemu-bundle
+	rm -f config-host.mak Makefile.prereqs
 	rm -f tests/tcg/*/config-target.mak tests/tcg/config-host.mak
 	rm -f config.status
 	rm -f roms/seabios/config.mak
@@ -230,7 +230,7 @@ distclean: clean recurse-distclean
 	rm -f Makefile.ninja Makefile.mtest build.ninja.stamp meson.stamp
 	rm -f config.log
 	rm -f linux-headers/asm
-	rm -Rf .sdk
+	rm -Rf .sdk qemu-bundle
 
 find-src-path = find "$(SRC_PATH)" -path "$(SRC_PATH)/meson" -prune -o \
 	-type l -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
-- 
2.39.1


