Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B8B2B6ACF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:58:39 +0100 (CET)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4JS-000272-EK
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EP-00021M-AF
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:25 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:42188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EM-00073t-9P
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:25 -0500
Received: by mail-ej1-x643.google.com with SMTP id i19so30376958ejx.9
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JEFn2myAfvQw/Vg4eNXG7kpGva/yiW9GffCGDX+kPnA=;
 b=fE0NQAjwsPO6tq8enYvewmT2fjA5tibOwQp61lVJ7PxKwJgO06NqcFH+8PjbjLy4dK
 /tUEN029hXkE25V2OE46iXpurTfyPhBvpHCjWjhqZTFrW6i0kxAi8gc0pt62Br9SV8PK
 DkPbuIXJw8sWl5bV7WxBNYvqmldbm+0BPh9kqcte1ll6w0dOtfKCLYUShlqT7TCD0lgQ
 Yy0qzhEchvmWtt2PQzU8GlJCGVqZzogwtZKu6twbtrakNGBYTh/xNCwoC2MCIp0ItjSq
 Bw0zrQ6BDwaNufzB1Q3AkaD/YrnvQsAAp6eAF2h7FJRY/c5kjdbtWNtAzQIPa9HLSnoh
 Mf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JEFn2myAfvQw/Vg4eNXG7kpGva/yiW9GffCGDX+kPnA=;
 b=olcBn9RIUHAXNqgdDN+6g0XSxj15KyY5hp3fe1rRXd+DmOmN7afLX2qxXX3Pb830wK
 SYMie7rI+tZcdeY2k3/TXDgVFq8YTW7gd4ZCNK9r8Q441c2GKO4zIAUTNpocdRM8mA5c
 YVXe6sVVJQXtnRgv+pCm/dT7CQOXjum58AJLqQXlYQVdWZsBU5lNKoIY1RgwNK0qeqC7
 9zfDFsdJGVkxRU6AyWI9/Lr5P1ba3ZrlQbcqrDnAJZ23GYCE3AMobo+uhV3EiENHHweP
 /YvedDdHEHuewevjQwdzJWQaSAHlACSkAJ2Ia/CYAQT7fxGuIyz9tqafXPCrVrUvSX/o
 FrGA==
X-Gm-Message-State: AOAM531sPPKunFwZ8gnMGKBnwSqSi73mA1DrY2fJtcVCtx5J7cSb3JQq
 hqZog6UdUmilCOqRMD6cgzyhA/RhUp0=
X-Google-Smtp-Source: ABdhPJy+ZIudjZOr/O4kEYybSQeJclEqMarH0sJO4M+qUFwCQ1BzCJj+/j5JJCdnE6NX6JJE0ZEYTQ==
X-Received: by 2002:a17:906:519e:: with SMTP id
 y30mr19751922ejk.186.1605632000592; 
 Tue, 17 Nov 2020 08:53:20 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/29] scripts: kernel-doc: accept negation like !@var
Date: Tue, 17 Nov 2020 17:52:48 +0100
Message-Id: <20201117165312.118257-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On a few places, it sometimes need to indicate a negation of a
parameter, like:

	!@fshared

This pattern happens, for example, at:

	kernel/futex.c

and it is perfectly valid. However, kernel-doc currently
transforms it into:

	!**fshared**

This won't do what it would be expected.

Fortunately, fixing the script is a simple matter of storing
the "!" before "@" and adding it after the bold markup, like:

	**!fshared**

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/0314b47f8c3e1f9db00d5375a73dc3cddd8a21f2.1586881715.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 99530fb08b..e4b3cd486f 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -215,6 +215,7 @@ my $type_constant = '\b``([^\`]+)``\b';
 my $type_constant2 = '\%([-_\w]+)';
 my $type_func = '(\w+)\(\)';
 my $type_param = '\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)';
+my $type_param_ref = '([\!]?)\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)';
 my $type_fp_param = '\@(\w+)\(\)';  # Special RST handling for func ptr params
 my $type_fp_param2 = '\@(\w+->\S+)\(\)';  # Special RST handling for structs with func ptr params
 my $type_env = '(\$\w+)';
@@ -239,6 +240,7 @@ my @highlights_man = (
                       [$type_typedef, "\\\\fI\$1\\\\fP"],
                       [$type_union, "\\\\fI\$1\\\\fP"],
                       [$type_param, "\\\\fI\$1\\\\fP"],
+                      [$type_param_ref, "\\\\fI\$1\$2\\\\fP"],
                       [$type_member, "\\\\fI\$1\$2\$3\\\\fP"],
                       [$type_fallback, "\\\\fI\$1\\\\fP"]
 		     );
@@ -260,7 +262,7 @@ my @highlights_rst = (
                        [$type_union, "\\:c\\:type\\:`\$1 <\$2>`"],
                        # in rst this can refer to any type
                        [$type_fallback, "\\:c\\:type\\:`\$1`"],
-                       [$type_param, "**\$1**"]
+                       [$type_param_ref, "**\$1\$2**"]
 		      );
 my $blankline_rst = "\n";
 
-- 
2.28.0



