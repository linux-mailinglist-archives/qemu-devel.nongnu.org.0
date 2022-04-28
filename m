Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F2D512C90
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:18:29 +0200 (CEST)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyQ0-0003YW-75
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy26-0000Ib-8h
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:46 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy24-00055u-Lq
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:45 -0400
Received: by mail-ej1-x633.google.com with SMTP id l18so7593064ejc.7
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SfhKCmUO//k2KKxCugtKMMJyeYbHUaz7sxHNSvDAQHc=;
 b=SSgHlNPZOFNUTnBeQOWfAXgf7doPyIwv9bAQ2jEdB1Vwytd/c6rEI+2oz4GsC7GpLi
 rti0klwf4TqMBkfD8mCrmKyKvH/9N5DpEEemXYDeV5YO2/yQaBkw/6Yc902GPmDjkhfG
 E33XEA0ZBtOieL7QFpmne0boZPhm0Q3eTh2uaE7t3e41h6zI2BdJdKZXGa3d2S2QHvEO
 EeqYxRko5Pm27AE783DPpEqBiib6pCwDmPGkzinWyWz1IqoH/xyM2EJHLUFd2n5zAvbb
 KYxP3hhs/Qvdpl4il2CAN09b4CKzmOCX0bhIfRL9owdBgnyzBVZSM7k/gjSe4H7WmQDT
 ZjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SfhKCmUO//k2KKxCugtKMMJyeYbHUaz7sxHNSvDAQHc=;
 b=29gDuaTum5k4OJ2rpz93Zytw9QzyKfpHeMop63leOf6Dtn7TQzUMiq4y4nWdbvYQCa
 GGal6/WeT7Sw/QzxXDyJvVzkv1yNOWg4XCy9vtlGO/06BCFUp0GpdlrYp5cxGoWyD0Lk
 PGz2mq8cilQbYPODoSmH5MwAA2Pv18GIAtZ4bc4jGcdS5f2jFyv7gGvE202f+YxUxcki
 +RlrTac8pFTxkxlX72qZ4OX8tHjJPBtxachfZaxNPIK+778dicePMZWAQ6/1RAijuv4Q
 vta31hc+K4kxmviUTTgBHGK2gaMQdX9q2CyBphiEK1CuxBQhjp//YpwS6v3RCH4QfERR
 ZQMg==
X-Gm-Message-State: AOAM532Z7xJsGQoroUE6agYmXUW1l6axCwaIPrh8vGeV+CQ+8lAnosxe
 8WpVxX7GaQyR58wYSZnPn+UvPulT/fgjqw==
X-Google-Smtp-Source: ABdhPJwvitATW50FQHPasvb+SSTnLqAg2gmqs5WpRpWzPbdeCEgjOQvOBEQA5EPeUdfcGjAiIbKacQ==
X-Received: by 2002:a17:906:699:b0:6f3:a7a3:d3 with SMTP id
 u25-20020a170906069900b006f3a7a300d3mr14563881ejb.650.1651128823341; 
 Wed, 27 Apr 2022 23:53:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/18] configure: pc-bios/qemu-icon.bmp does not exist
Date: Thu, 28 Apr 2022 08:53:25 +0200
Message-Id: <20220428065335.189795-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The file has been removed in commit a8260d3876 ("ui: install logo icons to
$prefix/share/icons", 2019-01-21), do not try to symlink it in the build tree.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 049f669a94..a6ed3498f2 100755
--- a/configure
+++ b/configure
@@ -3019,7 +3019,6 @@ LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
-LINKS="$LINKS pc-bios/qemu-icon.bmp"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
-- 
2.35.1



