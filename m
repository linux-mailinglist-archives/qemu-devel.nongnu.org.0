Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590D86535EE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:12:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83QI-00013k-Ai; Wed, 21 Dec 2022 13:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QD-0000yo-Ra
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QC-0004Kz-9A
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6utDEA9FL9+z6a3dK1CdWp05StWrgcvctPIPndusps=;
 b=BXxp+Bu2QglLiGNSrz79XvIUaOUvupcuTiyqrawvYWmhoWiLjz3yHHVxnh28Q954k6uvpc
 M8LNn4HMrbTziJdcbMUvqvGY8D3hejchcmScacU13Kec1IXtD9ChCCKqaljz0Ui/ks89QG
 AyVHdeFx/NfHGzpJoFJCvyRAWiSJ/Rw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-HIXHYlxCPGKPUVtTWxiUfg-1; Wed, 21 Dec 2022 13:02:26 -0500
X-MC-Unique: HIXHYlxCPGKPUVtTWxiUfg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h18-20020a05640250d200b004758e655ebeso11522692edb.11
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H6utDEA9FL9+z6a3dK1CdWp05StWrgcvctPIPndusps=;
 b=DQCcmXX8N/cUzKPYcIGMhNxwSRDm39WCRRVPymqLoH3n7+QHxaZgYn3jNCfvjHYH3T
 MDcuVxh6jS4oE1wDxSN09tK0lpMAyeVA8RvWCZI2hqk4CNwsB3OLOsb+bhlzBqjEG+r4
 H0vfD4MlprfHl5TIHkdkPMLEJu7TaFhB1ma70g2rMEyVIu6Q1Bh0nkOpPeKXLOtQ36Cq
 lRjA+NFe379e5AdXM3QmgSZVkU/9TQb0a/0mGu6+tA9/7dA8tQzXi29cHyjT3Yshy8Ea
 c2V1sLkv983sm32NRYnNLNmd119CS2qELXpDolv5yVpMBg9qhEwQMGjlcviSPUpoiU03
 ascA==
X-Gm-Message-State: AFqh2kp61uxDuyRqQqF8BK2+tMzWVnVOQYF6Fax9Msdt7mVN2ioYT/xn
 YH6sAcJR82UJuq+F7cr/IZCXIPgfImOU7+cisjI5yT5Md7Fidp542fFrLXFyVIZrgk84mnwVdOZ
 Bv/oj5n9U0AGOPXNHAy8sjZ+Mn0eC7eEG94DDiTkvcmMvmmJmV3UZ+2xC6F+B+8zS7Zc=
X-Received: by 2002:a17:907:cb84:b0:836:e8a6:f6f5 with SMTP id
 un4-20020a170907cb8400b00836e8a6f6f5mr2248457ejc.66.1671645744651; 
 Wed, 21 Dec 2022 10:02:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtIkk+nMMwJUZdY8SofM13H2xO74mvLMGRrgG6lPPq3ktGT0Ypfx0g3rNpIBKG7m5d4pQCJhA==
X-Received: by 2002:a17:907:cb84:b0:836:e8a6:f6f5 with SMTP id
 un4-20020a170907cb8400b00836e8a6f6f5mr2248438ejc.66.1671645744418; 
 Wed, 21 Dec 2022 10:02:24 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 kb18-20020a1709070f9200b007c0f90792ffsm7318693ejc.89.2022.12.21.10.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 15/24] configure: test all warnings
Date: Wed, 21 Dec 2022 19:01:32 +0100
Message-Id: <20221221180141.839616-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Some warnings are hardcoded in QEMU_CFLAGS and not tested.  There is
no particular reason to single out these five, as many more -W flags are
present on all the supported compilers.  For homogeneity when moving
the detection to meson, make them use the same warn_flags infrastructure.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 0667dde1654c..df19605ec398 100755
--- a/configure
+++ b/configure
@@ -378,8 +378,6 @@ sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 # 2s-complement style results. (Both clang and gcc agree that it
 # provides these semantics.)
 QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv"
-QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
-QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
 QEMU_LDFLAGS=
@@ -1166,6 +1164,11 @@ fi
 # just silently disable some features, so it's too error prone.
 
 warn_flags=
+add_to warn_flags -Wundef
+add_to warn_flags -Wwrite-strings
+add_to warn_flags -Wmissing-prototypes
+add_to warn_flags -Wstrict-prototypes
+add_to warn_flags -Wredundant-decls
 add_to warn_flags -Wold-style-declaration
 add_to warn_flags -Wold-style-definition
 add_to warn_flags -Wtype-limits
-- 
2.38.1


