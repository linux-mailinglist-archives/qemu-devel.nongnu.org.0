Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20846F19A0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:33:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOAV-0007ep-LB; Fri, 28 Apr 2023 09:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO3B-0005jh-D9; Fri, 28 Apr 2023 09:22:13 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO39-0001Na-Rf; Fri, 28 Apr 2023 09:22:13 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8ba5f1d6bso96553601fa.2; 
 Fri, 28 Apr 2023 06:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688129; x=1685280129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LMSALsuI5bpfnW+C12t8ZnQABPa8cDalQLfhJ2Oa3w=;
 b=DfLQaM6e2wQgIEtfLG73ZVKEx+ONU1lex9LfBJKttx2KE4Ap6W7nw2D7hcr0VSdf7B
 VtqLxUzr/EXAjWrgCtL0nuoSHqX5igX5GfMpjrBP/Pjf9FpGuZG/m7NbBgOrdbkybTJs
 JzweSzu2J3Pbwog1QpaN/V1SgGKXc5SQ5uwXt2W9RKTzwM45YKHK0kpbwErNs1USitMG
 2s4nlmz8vLZ2QcaTxnLF0Os1gz09arIOqvVhhibC4K7l36Z1Whika5v7Y2XgKfaXGK93
 SB7jnkceFzHfdiVwN0o6aST+HxsOOHWxDNmGJBM/yaGDSXVr9GQgon7pfjs7+8Cun38D
 D0LQ==
X-Gm-Message-State: AC+VfDwaJ42B2sMY6Lg7oJBZKVYLwlIKD6eZdZ+jusxQNB/mRCZcxzGq
 ghT19cUipFp+UCbBzWVTTGPwr1E154iDxirf
X-Google-Smtp-Source: ACHHUZ4io+UPwW/mmnKq+A4fzA6ePjt8OMev9ZGjQyCGcxL6DodPNta76hvbJAiuYoUELbaMpRtSmA==
X-Received: by 2002:a2e:6e11:0:b0:2ab:42c7:cf25 with SMTP id
 j17-20020a2e6e11000000b002ab42c7cf25mr1250576ljc.13.1682688129474; 
 Fri, 28 Apr 2023 06:22:09 -0700 (PDT)
Received: from flawful.org (c-fcf6e255.011-101-6d6c6d3.bbcust.telenor.se.
 [85.226.246.252]) by smtp.gmail.com with ESMTPSA id
 y19-20020a2e9793000000b002a7774d124dsm3360770lji.14.2023.04.28.06.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:22:09 -0700 (PDT)
Received: by flawful.org (Postfix, from userid 112)
 id E5C34D18; Fri, 28 Apr 2023 15:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688127; bh=fq5iRvvH0/BVYfWhjkzjKQ5RAk9CZObd1FKucUM3yTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T56zdMOJymZBdEhK4nh/pScoKxaIGInDKLUnvsYCFBUTdDeuMQGR9oYJD1vpc31ks
 Y12sgNeMeQzlkcFNqYdOVcccXPuK5TQUAJ5F26eZXeSBDD19d1sjn9kXONaEHYyGea
 rKBh0+pG3ttEsBdGM7QOh9PxkCEa4hOFI8tTuz7A=
Received: from x1-carbon.lan (OpenWrt.lan [192.168.1.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by flawful.org (Postfix) with ESMTPSA id EC6063C7;
 Fri, 28 Apr 2023 15:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688100; bh=fq5iRvvH0/BVYfWhjkzjKQ5RAk9CZObd1FKucUM3yTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qF3t+YpeGdVcA0akiSnd4XBPH1KC/LXpL8dKZLQjpEr7SvobO47cs1zwTZk527/kb
 Yrr5xae8kbmVpy4Mj2l3LzrUfhiE5JqKLXLHLW9xymEQf3O7ucpY+iSn4+5LioGfSF
 B48g2gvJbZK9snNz9b30GqVYDfgP+4496Lm4AnS4=
From: Niklas Cassel <nks@flawful.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 1/9] hw/ide/ahci: remove stray backslash
Date: Fri, 28 Apr 2023 15:21:16 +0200
Message-Id: <20230428132124.670840-2-nks@flawful.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428132124.670840-1-nks@flawful.org>
References: <20230428132124.670840-1-nks@flawful.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=nks.gnu@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 28 Apr 2023 09:29:45 -0400
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

From: Niklas Cassel <niklas.cassel@wdc.com>

This backslash obviously does not belong here, so remove it.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/ide/ahci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 55902e1df7..a36e3fb77c 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -690,7 +690,7 @@ static void ahci_reset_port(AHCIState *s, int port)
 
     s->dev[port].port_state = STATE_RUN;
     if (ide_state->drive_kind == IDE_CD) {
-        ahci_set_signature(d, SATA_SIGNATURE_CDROM);\
+        ahci_set_signature(d, SATA_SIGNATURE_CDROM);
         ide_state->status = SEEK_STAT | WRERR_STAT | READY_STAT;
     } else {
         ahci_set_signature(d, SATA_SIGNATURE_DISK);
-- 
2.40.0


