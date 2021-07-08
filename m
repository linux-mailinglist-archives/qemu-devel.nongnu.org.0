Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE733C15D3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:19:54 +0200 (CEST)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vof-00030J-MM
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vml-0008S8-Rb
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:17:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmj-00088F-Nn
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:17:55 -0400
Received: by mail-ed1-x534.google.com with SMTP id m1so9028992edq.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXud1buOFDLkmcLoj6WEV2smKYmGYLQoP7OF5KwGfPQ=;
 b=hgTNuqaeWKnCw4T1JZZRPyzKNaqPwpu7HAUfLgOOMLWUYP509lqJ/FamnpCPZRQ2bd
 GgsNt3aGkzXqcTzNuyffbTF3w4LMFVfEK5iO2ZR2kB0Jfr2IJ+s7k8s8Zvdu/5L+kdwW
 wuxUiEl5eAmPbQTriAtloltoR+TP6OqPlr3IelO5nIMXtZZWq1xV0o9Ka1kj2+Hr4ph+
 5bpEWpa/IlwcHYvAeEgGlMjgQh4EKMTTnuUtgqL1yZgbD367mnblSkpFDw+WiPhzfAR9
 kebnfzWWGwwKcrqZobaZVAlVlT01F3lSSFat5l8dXk7A90zUneeOxqMgDGENhh7510vb
 lZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JXud1buOFDLkmcLoj6WEV2smKYmGYLQoP7OF5KwGfPQ=;
 b=gAdT9a1s/rOiNmXEGq0nxMb5nEjv0L2B0JHiqw0SXZYFWfpSqm6oJajZ3Vz8FYz+EH
 y4rOAkVOZX8gZ39d5FGoR+xHGe65kYfF377Ft1Lz8PiatRDPMP08G9MgDHT9M97vrREn
 PZaFuh0HJ69H7Szj4HkzPTpnSS68dzDdxKOMr/IQ2pxLLAf94Z1Im0VIUFtZUtI0BQFM
 fCBKzqGCb5u0l5ygIJuoEBuf2UCzC/T2RtitzhVWmv09y+W0C5S0OSrXPOInio5ElGYB
 niiLCUAy7mWM1CIDUh1Be2XQAHVp6HAQN9Lo/7AhiDxR0htsBVbsgcRoE8NwAKt5Op32
 xd3Q==
X-Gm-Message-State: AOAM531QFasd+DidrFLzApMXH/BzvXhInWuwOkhU8a0rMsbzrGkmJwxs
 72xWvk5nVfKzFfzMnlUEMN1dQon+L6M=
X-Google-Smtp-Source: ABdhPJySMBPKMydJMV4rpbRWyaZRlLvFOcCuV+C4Bn9INfWmXGfF3Zm17pcLXqE00hiDMShd4WIlLg==
X-Received: by 2002:a05:6402:4311:: with SMTP id
 m17mr20309506edc.346.1625757471234; 
 Thu, 08 Jul 2021 08:17:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/48] configure: fix libpmem configuration option
Date: Thu,  8 Jul 2021 17:17:02 +0200
Message-Id: <20210708151748.408754-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

For some reason, libpmem option setting was set to work in an opposite
way (--enable-libpmem disabled it and vice versa). Fixing this so
configuration works properly.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Connor Kuehl <ckuehl@redhat.com>
Message-Id: <20210707075144.82717-1-mrezanin@redhat.com>
Fixes: e36e8c70f6 ("configure, meson: convert libpmem detection to meson", 2021-07-06)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 4f51528a77..a172c83e15 100755
--- a/configure
+++ b/configure
@@ -1501,9 +1501,9 @@ for opt do
   ;;
   --disable-debug-mutex) debug_mutex=no
   ;;
-  --enable-libpmem) libpmem=disabled
+  --enable-libpmem) libpmem="enabled"
   ;;
-  --disable-libpmem) libpmem=enabled
+  --disable-libpmem) libpmem="disabled"
   ;;
   --enable-xkbcommon) xkbcommon="enabled"
   ;;
-- 
2.31.1



