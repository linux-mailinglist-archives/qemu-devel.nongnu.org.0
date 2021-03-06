Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0032F9A6
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:12:04 +0100 (CET)
Received: from localhost ([::1]:33820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUqp-0003Tl-2k
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZz-00061V-UK
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:41 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZy-0008DR-80
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:39 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u16so5209764wrt.1
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vKU24c2goh4ZPVsr56GPlz5qY3b7PrySvcGJUKUjT34=;
 b=pCHp9DgPxswEzK9iqPPIVAByfTPrWl19CFCnikV9bkl0mm6qEbIOSsl+33NhCAbJRu
 NcFgLbvhR1E0nkejGFK/Dadysu9Caybee7DKQe8KzdYhkcBY0PAOvcaTWbl0/xaBM5Cr
 xbdUcaUwCaPqhSrXZKyoAT1a5jsDPrsx8jydPabetXfJTzBufiblTf5iuS/Xm6BwSSdC
 etT9Kul8bUzGnk0poMu40MfjWBqe6u2aTOr7ENRaSczngA0HGS9ptbB92yycVISVjA39
 BVdv6g8YXNx6rFLabGrYtSF2GMql46mjZaQxqQeTPBiRck3mB8jKCWWs38BIJtGI1Owl
 4CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vKU24c2goh4ZPVsr56GPlz5qY3b7PrySvcGJUKUjT34=;
 b=MwOvA7zyNewtcjmR1sgvjEuiCdBhnWd/s6ToPObh4jpd7Iuv6v7mAqmDGQ2xnaxelY
 S3jtBR+cLWY3nlYn0AHnXDLlHwoAgD9APL+c/ROPMB2jIQ4Csz8ZN8mPVBQ5pf3BdIeo
 bvMq789rP5b+fi9tnVTQs0nGhwy2wSQGCPDh/HiyHPI74kASFqnVQZ3LCqPy/fllTilV
 iizOZ4D1tbMpeiagtyjRJ24F23XjMAHlqRT5/LXu6OciEwr56YMSXF0+IdHJVEDpgmX0
 q5VzMI0Yz1ooV1EIazIKwK/I30A2wb3tjWOaSIble1/omp3Q1o0Z6NwpGFRyPQNHRTzi
 M+IQ==
X-Gm-Message-State: AOAM5307oXtcA++fs5bnitMW2x67HQwVvDcPJ3hL+MXbcLlvZ5qgpEet
 KhJxiYHJnU2VhsXHF67FWGuBf0eLH3U=
X-Google-Smtp-Source: ABdhPJyq+KpldszD1OQsH5vLrv7AU+z0UgDp5o1nS97pwF3r88YazDZpGxoc7kqOOd+qcMr8MtoK2g==
X-Received: by 2002:a05:6000:245:: with SMTP id
 m5mr13987439wrz.284.1615028077121; 
 Sat, 06 Mar 2021 02:54:37 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/23] build-sys: invoke ninja with -d keepdepfile
Date: Sat,  6 Mar 2021 11:54:15 +0100
Message-Id: <20210306105419.110503-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
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

After reading the dependency file, ninja just deletes it, in the name
of cleanliness I guess.  However this complicates debugging unnecessarily
compared to good old "-include *.d".  Use the keepdepfile debugging
option to make it easier to see what is going on.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210215122103.63933-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d7fb6b270e..bcbbec71a1 100644
--- a/Makefile
+++ b/Makefile
@@ -149,7 +149,7 @@ $(ninja-targets): run-ninja
 # --output-sync line.
 run-ninja: config-host.mak
 ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
-	+$(quiet-@)$(if $(MAKE.nq),@:, $(NINJA) \
+	+$(quiet-@)$(if $(MAKE.nq),@:, $(NINJA) -d keepdepfile \
 	   $(NINJAFLAGS) $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)
 endif
 endif
-- 
2.29.2



