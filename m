Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A290858165E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:27:59 +0200 (CEST)
Received: from localhost ([::1]:51582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMTW-0000tv-93
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMG-0006Ri-Ov
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMA-000633-NE
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:28 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d8so20534592wrp.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4EXt2WFXE+cYyllwhs3b3h+DGb3HVin2P2P0aToXQ9g=;
 b=NQnkdnNNOpifRbydF7sNu+aOYdbAErmwB1+i+S/ZluHU1e+gQ2UKskz6Z3sl5ohs8F
 c71b81H5X+/9klDtwv8tnWwuDJ0E6FiQYRAVRydmv0N6CYhxzWxTBAitc3HULva2Tr6e
 XG35INE9hc4rVUTgJXVAU79EWDIx8a4dCNfgFWx7y9xZbmUCcdebEI1BsKZP7zQvWItr
 M8ewAv99rM5YBe9vssrxWsElTgrX18GW/r779s9hkSOCPCWWfdKtrU1G7uw/ZMu8EwGH
 jhMArMVKOgZYVK0ZKTmcwg6b5a0ssaTvvZ9g5jCmwMM2RxGhfiX8OtJQMRn5fAnmvLRQ
 ehmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4EXt2WFXE+cYyllwhs3b3h+DGb3HVin2P2P0aToXQ9g=;
 b=dcc4V8Gb2CAxEKVej/TOubK2C5XX1HFCUOopWUiF8e5MQHLlyodZ3hciaIy7dC/xhh
 0Ej3nxsX/ylqBYdix4MA+0V6rTO5xenk94wwbGLmhiLaAJi4kYr8wopvQNoYus9te4Yy
 HlIiyN1jzRwzRW+5GW2p9rgz1ioerV5KGMiK2c4knjXrvbDqAYAdF95l8QEDQjz7Lg9w
 8xF68idjk1p9K8XC77NRvYMLlMJeTAz96vwhgvNKyTj9GlfrugMvBCTwpPuXC+phkeXF
 rOuRrojfHY4gSLOJky4s0UPaz5SEvrA1puEyqFpkVnmA8N1mh1GQ8nK7lIadjYSVd1CM
 CAxA==
X-Gm-Message-State: AJIora9pFm+RNlq2Ih4ws305Y7fILxuABrr2nVLVBNteh5Lz5fIKUc7t
 wKR93kfNqPVZfr2Xi1JtO0GWZDKT3iM8lA==
X-Google-Smtp-Source: AGRyM1uwneGf+K3C+3Nx0x5FzsZcaxC6KrALbV0zEuTVsAEuygb/JQmRCxe61H8HRL/n9ruj13eB2w==
X-Received: by 2002:adf:f807:0:b0:21e:5094:aeb9 with SMTP id
 s7-20020adff807000000b0021e5094aeb9mr11520016wrp.497.1658848820103; 
 Tue, 26 Jul 2022 08:20:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm21932739wmn.47.2022.07.26.08.20.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:20:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] configure: Add braces to clarify intent of $emu[[:space:]]
Date: Tue, 26 Jul 2022 16:20:08 +0100
Message-Id: <20220726152012.1631158-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726152012.1631158-1-peter.maydell@linaro.org>
References: <20220726152012.1631158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

In shell script syntax, $var[something] is not special for variable
expansion: $var is expanded.  However, as it can look as if it were
intended to be an array element access (the correct syntax for which
is ${var[something]}), shellcheck recommends using explicit braces
around ${var} to clarify the intended expansion.

This fixes the warning:

In ./configure line 2346:
        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
                                                              ^-- SC1087: Use braces when expanding arrays, e.g. ${array[idx]} (or ${var}[.. to quiet).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20220720152631.450903-3-peter.maydell@linaro.org
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index dec6f030346..a56c3d921be 100755
--- a/configure
+++ b/configure
@@ -2343,7 +2343,7 @@ if test -n "$target_cc" &&
     # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
     # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
     for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
-        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
+        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*${emu}[[:space:]]*$"; then
             ld_i386_emulation="$emu"
             break
         fi
-- 
2.25.1


