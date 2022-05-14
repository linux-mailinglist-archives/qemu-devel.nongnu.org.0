Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D65D526E4A
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 08:10:29 +0200 (CEST)
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npkyx-00083g-T6
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 02:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npku2-0005kD-Ja
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npktz-00078D-7R
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652508317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HbXuoKgFMK8+YZhLN1m76ki//xYuz8s9DmNhEQf7244=;
 b=QVHmTaKml0nW443rHW0W6ayhKMUvU2Hf4Bo2AxRDu7doE+tXy5Az5m1AfNuSTniFTfppcx
 fU33FcEv7mJIEzXPWSxJwgFp1Ra7va0k8xXzwZHL0n29a+Y7qLX7spAB2DQxNWYWfjSlWR
 0tlH6dF5O8RemCiYdEeRjmtwkd1yLnE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-iKGoj2NaNDGNIq6Es3hWYg-1; Sat, 14 May 2022 02:05:16 -0400
X-MC-Unique: iKGoj2NaNDGNIq6Es3hWYg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c125-20020a1c3583000000b0038e3f6e871aso3746621wma.8
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 23:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HbXuoKgFMK8+YZhLN1m76ki//xYuz8s9DmNhEQf7244=;
 b=QSCPe0qg14Z/uygFVs71+MbUx5z5Z2/+BJdEdoZ43T4fZxCV2MTWxWlVwoAuPpQKc7
 g06ufP/38lWaHUHonFoucgR6h7G2VTZhDkI3NRFqAZQdZ3mCcTKQpYnLcobNsvMl8k4a
 7JSg0dOjui3Gvwkhk7ASiMzqlNT2/8iyH4knEyJUGoimKa7BG6EtwrSr1MsUqsexJMRQ
 Y9li9RAo7AIhXhYRjblesv+AxR1EYfLRkXB3nPIOLHeZyqboHGmokxcyIY59REpyzNsl
 btQ9WGqQVLjcBDanP/nP2ZZy2QnsdNMG/P5CBPbscI1wDKbl55OmGtRmDnmvqruKpTkb
 oo8g==
X-Gm-Message-State: AOAM531iyKzXBJLnvhZJduI5Zfi/KoWwRr5HbZOYQQYwqJXrYRa7XD01
 y3Tar7VYNbZVMWAsrZFw/gjqnNiHCRD6cGs+PBqUgo99RhSv9VPs26INIz03IA+0QHJXLOhS//8
 DF1S0EaR77sP6t0gLhil2yQF0jFtvYe4BGyyBtyH34PPwS8UsTbi6sJj5Z72E/ozhYIA=
X-Received: by 2002:a05:6000:1e09:b0:20c:dbc7:e391 with SMTP id
 bj9-20020a0560001e0900b0020cdbc7e391mr6566232wrb.218.1652508314406; 
 Fri, 13 May 2022 23:05:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywXUuNdnK0h0nkYZyzSMafiQI1dL3bXVIJWWbMMLdKkfbw/tAGPuL+5DDVS6S/wUf8lOVYWA==
X-Received: by 2002:a05:6000:1e09:b0:20c:dbc7:e391 with SMTP id
 bj9-20020a0560001e0900b0020cdbc7e391mr6566202wrb.218.1652508314027; 
 Fri, 13 May 2022 23:05:14 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x15-20020adfcc0f000000b0020c5253d923sm3950859wrh.111.2022.05.13.23.05.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 23:05:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: remove duplicate help messages
Date: Sat, 14 May 2022 08:05:11 +0200
Message-Id: <20220514060511.1147834-1-pbonzini@redhat.com>
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


