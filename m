Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6EB526E4B
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 08:10:36 +0200 (CEST)
Received: from localhost ([::1]:49726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npkz5-000870-Nr
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 02:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npku4-0005kO-Aw
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:05:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npku1-00078R-E9
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652508320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HbXuoKgFMK8+YZhLN1m76ki//xYuz8s9DmNhEQf7244=;
 b=ARxdYgycMDZU9pM6FFDBseb6EyBZR9xghVaPdtdv5eWbvW/J7PujMaxHl3tEfCzRdJV0+j
 a/xg1deepllvDQTbrh9s4RCyCWKfsE5hh+dR70Cbm8FBvL0Q0gIC48qGaGQm91iiRdf7qI
 zA43jGQjOudrccp4fa2nzJJWUJFTvS0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-h0CkNBa6P8WfdKvlAB-BBw-1; Sat, 14 May 2022 02:05:19 -0400
X-MC-Unique: h0CkNBa6P8WfdKvlAB-BBw-1
Received: by mail-wm1-f70.google.com with SMTP id
 h6-20020a7bc926000000b0039470bcb9easo3821054wml.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 23:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HbXuoKgFMK8+YZhLN1m76ki//xYuz8s9DmNhEQf7244=;
 b=a/+lnDqw9UeJ2479P7/9FoqSAU5cBThp7TGZmgfA5QFvwF12P/DArC85woNcD7GBu0
 BfBeITcLnH+j32DSimz3AAOH/atvktTW3jzZy9wpb1V1XJjrrFDzGO+rfEUm5hRVMPVA
 CaEUCX1x0RhIVU+Wg7O+o4xn1tIU6FBTYxqHL6KtvGm9894q7zWrGu+gJ25560U8knU8
 3C4+RjgwH7eJM+8wL5wj0p1NA1VNLEzrKNPDLjyaqtkiLT5ODPtdjuCeuNpEwjjxRf7E
 1uPPWK8YzXvcZ6vRtMaep2NMbkPD11meNoYQqohkP2On/C1N5pgo/pdV7yRbmn5zZBP6
 Tkgw==
X-Gm-Message-State: AOAM532RyodgVpFVKDfq9bx//FElkjnRt9iqb1VSsP8lpqAOMNn2kXJZ
 3QeRem63x0L8n6QK+6d5VSjQqSuoshdpTrWvoBgKUrzj0KWb0U809ICnRMXF61xUqZflAhoa/aG
 Mw/j+s2FISvPF4kYh9Z9YSWo26J2R3Z9WG/gqtF3Gdwxpk9Kg8SelmoQFbXt3AL9Lvvs=
X-Received: by 2002:a5d:5911:0:b0:20d:4d:a996 with SMTP id
 v17-20020a5d5911000000b0020d004da996mr246794wrd.129.1652508317402; 
 Fri, 13 May 2022 23:05:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa4wDmpei0rZ4/wmso7buxN+F6jIBpqrEI14nnme2P/GTGt3Uki6IUd3mhHgPOxnC2brsoPA==
X-Received: by 2002:a5d:5911:0:b0:20d:4d:a996 with SMTP id
 v17-20020a5d5911000000b0020d004da996mr246775wrd.129.1652508317081; 
 Fri, 13 May 2022 23:05:17 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x25-20020adfae19000000b0020c5253d90esm4346126wrc.90.2022.05.13.23.05.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 23:05:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: remove duplicate help messages
Date: Sat, 14 May 2022 08:05:14 +0200
Message-Id: <20220514060514.1147856-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These messages are already emitted by scripts/meson-parse-buildoptions.sh.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index dda25f05bf..0cc8c876f7 100755
--- a/configure
+++ b/configure
@@ -1043,10 +1043,6 @@ Advanced options (experts only):
   --enable-tsan            enable thread sanitizer
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
-  --audio-drv-list=LIST    set audio drivers to try if -audiodev is not used
-  --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
-  --with-trace-file=NAME   Full PATH,NAME of file to store traces
-                           Default:trace-<pid>
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
-- 
2.36.0


