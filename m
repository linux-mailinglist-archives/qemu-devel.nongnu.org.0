Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586A742DF4C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:40:18 +0200 (CEST)
Received: from localhost ([::1]:41388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3mD-0001FW-C9
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cB-0003kF-V5
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:55 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cA-0000fl-DL
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:55 -0400
Received: by mail-ed1-x530.google.com with SMTP id r18so26590680edv.12
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yKX+0RY9dKnvtMGdHrAusBKgI+02YSB+9Ufsypua5fU=;
 b=PLGJCZj01V5XxuTzz/WCKchSWQtp05HBQxxKP1eh603LDnLLAUjH7kTpLlBkkR5Pag
 uth0e0+oDzhrF4MV5xLAFub25BC5pnitIaa3I7v4Nead2F7LhwoqaGtZTGXkfLTAV4wm
 Bqx2cmsH4+5NwNt1lBdFm6K97P3+RImBgkpkdKRKZkHcwYsmZ79ceQmPQbUqM3esj2yu
 G52nFbM0a1Zt+uB8CIF+EuxHdursA9Q0ORucW97uHLmIiB74ilUO0WbV6wcJUyDlA84o
 7acv6v7EgZcmV/zRWd0euGAD8+RnRPBEE9tkcCp783FPq1/2ICnc5vv6o0l31LS5/5XI
 HRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yKX+0RY9dKnvtMGdHrAusBKgI+02YSB+9Ufsypua5fU=;
 b=D6gWROmioeFw5VHfoYYWkFjyk2hRW5Rrmg2fetos0rZcIWEuO8yxXuLwgUYpSYSOc+
 EWDdfpuWizr9xw8cFh/tutOlci/u9P/UxO3Qn8M3njg/IJEiQwlf57y+ZC3v+evM43D4
 XYMRqmVMpF9z7VqMCkmK8t5JL4TszzmsZoHR6gWH/JyMGBewkG0qKrXI7Q/T7QwyHgpZ
 6bfSsnstxNPyLrf6e9iV2AYBA3ezCbBAuXZ7Jekokjz0YjNlLVsi5eZsvXh6bc5Dpi25
 QgXRkvLu+0nYfDs7YuuJHPz2e+JdCmR/1GyG55GuVWoANW49RRYsh8JV3xHSFYCLAihX
 zE6g==
X-Gm-Message-State: AOAM531iDF//rYddK1vsRsYuZlse3/cAWLP1L3ZhH1qFQAWQ7tNcgz/w
 +ddaVDRucROjeuutba6zUI92UsszMI4=
X-Google-Smtp-Source: ABdhPJwi4e/GLgvWPgdawypdUTWkDpiE2yRlmGVfjLOD2XDIetcrPaqxUOa2QzElBnMMSfCXyO/kGw==
X-Received: by 2002:a05:6402:3488:: with SMTP id
 v8mr9676697edc.106.1634228991994; 
 Thu, 14 Oct 2021 09:29:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/26] meson: HAVE_GDB_BIN is not used by C code
Date: Thu, 14 Oct 2021 18:29:25 +0200
Message-Id: <20211014162938.430211-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is only used by the TCG tests, remove it from config-host.h.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index ff19d54fc6..bdcedf2eef 100644
--- a/meson.build
+++ b/meson.build
@@ -1609,7 +1609,8 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
-ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
+ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
+    'HAVE_GDB_BIN']
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
 strings = ['CONFIG_IASL']
 foreach k, v: config_host
-- 
2.31.1



