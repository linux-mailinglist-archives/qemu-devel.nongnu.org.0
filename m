Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD333ADC87
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:23:43 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luozl-0007tv-K5
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxv-0005JF-FV
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:49 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxt-0007vq-KS
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:47 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x10so6728044plg.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxOR6ja1ON2bEVZKU9mrMienSlqSaNKmFRtyGVfEJGM=;
 b=waFxTKUyVP4L3eHe/vY2n5rWLWDxAkg9wtt0YqI1FIaxXCNvhF06KTOjgCpxjSmE+X
 uRz53rqQl2C7GPqA+Cldd9WP8alT5UEv2ordVpb/lk0MY6PSZX67Ue/PNJPT6eHF6Uf7
 AGMI1QKL3k71H9p8ZJxQCnqPg8D36oyS8dMMVswU7/a22+OQKJqRTHqzavf3sEFGF6HX
 yCiDKRcJQUNF9GeWVA+2ITnVLj/BMXzi/EHdi6r3KamrCxZnxXrUSHYETyh80BBHcvgq
 xd9MfuSABBqP1O8OuWJaDIwELPsA8TlIHkW14xd9WX/dTyASzdRyFl9H5zzTtlHRQ2Th
 8n/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxOR6ja1ON2bEVZKU9mrMienSlqSaNKmFRtyGVfEJGM=;
 b=XqFKCFY8hyklT5PnLlbAdy6GEVWWkdzqurhexRJWBgUj7TAF+kOAeHdwwTPfWdxSv4
 GwmHgAyozKM5QEBHZTtBzxw5EARO1XCqJ0oSBC3H99sNGtnA/qXn7QHlQpUhtZ4j+bnr
 BeVh+YWRQyKD8OXeuhw/0qBiF0Tnst/rxkjV2KkHw8XfMfmGmi51L931x1dpcUtmv7nK
 aro925wOrhZOEinj9Co35ReuOiB7JT21duWvrBhU9Z+6ExM/xentWNE0e56CKAzBJ1Nr
 kI9kDlIaO9KE30N6Cw8Wqhy0SuQtXcdqOaT60bD2wjsRRuHbIi/gIhQJgfcbO68OJBOe
 SSfQ==
X-Gm-Message-State: AOAM532DfavXlryMoy5rUL6Nbv9RGAYHzopCqdvkQQwR+/81XZktXIUM
 mzYV8aAMVe4ZgYQL5LMKoTBsIwo2aqXKWw==
X-Google-Smtp-Source: ABdhPJz+VRqq7HNHNt0UwFePr7WOKdcoQwxjSyhUvD+rtyyXn7/yXM77onELlSczmukNLDgDcE1FWA==
X-Received: by 2002:a17:90a:4208:: with SMTP id
 o8mr19504084pjg.216.1624162903719; 
 Sat, 19 Jun 2021 21:21:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b6sm11923156pfv.16.2021.06.19.21.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:21:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] target/cris: Convert to TranslatorOps
Date: Sat, 19 Jun 2021 21:21:32 -0700
Message-Id: <20210620042141.1235541-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've reached a point where *all* targets must use the translator loop.  
Do that, plus some other obvious cleanups.


r~


Richard Henderson (9):
  target/cris: Add DisasContextBase to DisasContext
  target/cris: Replace DISAS_TB_JUMP with DISAS_NORETURN
  target/cris: Mark exceptions as DISAS_NORETURN
  target/cris: Remove DISAS_SWI
  target/cris: Convert to TranslatorOps
  target/cris: Mark helper_raise_exception noreturn
  target/cris: Mark static arrays const
  target/cris: Use movcond for t_gen_cc_jmp
  target/cris: Use tcg_gen_lookup_and_goto_ptr

 target/cris/helper.h            |   2 +-
 target/cris/translate.c         | 373 +++++++++++++++++---------------
 target/cris/translate_v10.c.inc |  11 +-
 3 files changed, 210 insertions(+), 176 deletions(-)

-- 
2.25.1


