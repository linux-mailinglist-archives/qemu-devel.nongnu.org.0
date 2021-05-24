Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307D38F1F7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:04:05 +0200 (CEST)
Received: from localhost ([::1]:50884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDzo-0006Qa-KN
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeS-0004wU-Bb
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:00 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004OK-KJ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:00 -0400
Received: by mail-ej1-x629.google.com with SMTP id z12so41347028ejw.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dQR+AbnZ3miqg+tciMmI8Yj2lCzGMfCWCQYc5IFEC9s=;
 b=A/FYnowcpPVFp0qag31ki10FqrInMX7PNgqRkOKxgEsIIPWrAoU0gs5yiwjbCajQyD
 nzG37Ehi6UlwsH3sb0CzFFmGGYuy9q1Uf8q/phHJYeuaXTuMAUOWeCiTjHTyp4VbKjey
 zqpXkSbjCKtM5pH5TPaFXcIIXlXhFWmTOwaED1sdjk584Rxo3jFIj0b2An6QlwATUhqT
 e1vfBeDnCEE945sGWwev+BloN1C43K582QHJ+eVop99lFfc9jw+TNivJwstpNyMXvtVJ
 LHph22Xzteb+ADQBZNNOikSUkHE7t/5BtBP1cjEr1GHMEVNr+4bF8z4rxQp5JiuCrIZb
 S1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dQR+AbnZ3miqg+tciMmI8Yj2lCzGMfCWCQYc5IFEC9s=;
 b=IvnXlhP9NrlLKawO3XUBllSn3Ci5C57XBTpGs35RR5vuWskfKVcvLNM2XNRS8+0X2S
 q4AcJNnuQQ8cQh7WgcC504uYojX3g/5nsx3XrtVOuqwiXndPIytzjdAg2QTLzRusu/6m
 bLgI6jOIVrCUEgykVnuZEbE1JqkYvnrIcnu3Kp3Zgszrg4Vd61qqJQfLrFwPXKAq43E7
 pUkzi0dd++QHtSn5pA1rG1+FFkz5uPMp5LmSAj8ffshRMXHfcycG8NRinXHeSkCwTGzJ
 SoRfUQDHED6VKoTjscYG8kn+eq6VHNR7xyiaq/aNeoqWrPXGMk9d0duEibCZL+8u74/z
 SbOg==
X-Gm-Message-State: AOAM531UFmCBCH24rtoYtyy69EcwdJ+10lcc5Od7d9vCvHdYIRHKUEQ9
 QcsbnYcySautNrDewyBWR6fabkyAzP32Ag==
X-Google-Smtp-Source: ABdhPJy9yMdrtEXAWVD7S2V/JGQsiHYkvQcvR+2u+d0ALpazSWoZaOGGPvYC9488lczTwXHRmDcY/A==
X-Received: by 2002:a17:907:20a8:: with SMTP id
 pw8mr24811237ejb.256.1621874506376; 
 Mon, 24 May 2021 09:41:46 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/28] meson: Set implicit_include_directories to false
Date: Mon, 24 May 2021 18:41:23 +0200
Message-Id: <20210524164131.383778-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Alexander Graf <agraf@csgraf.de>, Katsuhiro Ueno <uenobk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Katsuhiro Ueno <uenobk@gmail.com>

Without this, libvixl cannot be compiled with macOS 11.3 SDK due to
include file name conflict (usr/include/c++/v1/version conflicts with
VERSION).

Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
Message-Id: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
Tested-by: Alexander Graf <agraf@csgraf.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index 632b380738..20d7035e44 100644
--- a/meson.build
+++ b/meson.build
@@ -2145,6 +2145,7 @@ common_all = common_ss.apply(config_all, strict: false)
 common_all = static_library('common',
                             build_by_default: false,
                             sources: common_all.sources() + genh,
+                            implicit_include_directories: false,
                             dependencies: common_all.dependencies(),
                             name_suffix: 'fa')
 
-- 
2.31.1



