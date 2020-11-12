Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30D72B125C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 00:03:24 +0100 (CET)
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdLch-0003TQ-D3
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 18:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kdLb1-00027s-CP; Thu, 12 Nov 2020 18:01:39 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kdLaz-0004wP-7C; Thu, 12 Nov 2020 18:01:39 -0500
Received: by mail-wr1-x442.google.com with SMTP id p8so7731635wrx.5;
 Thu, 12 Nov 2020 15:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fgQeMzrdvi7WD3Tb5iw7MuHQ93bDi33qHQK6exKx+k0=;
 b=YzM6taWpTbPMWvlrjUwfUy5SA4Fta12um/X7GNIQRgjN0MZ8FJJGj3I3p4SkbTGaRB
 1ZXovJP6T8mlibKihq95BZ9tVScd63gF9pb5kqed8lDUKGEEybmeXMPYPgCkcn1I5me+
 tr0cwsnmwoL02ajGNa3UmTe9BrimfMvYqSmUwxU9o6EKmjc577QL+6A2WsxI9r9H5qaC
 +MVRdfM19EhQf5HVUYHv5YnU2jHMFS+V1NK7Sp4C3MAmx4jGPL0WnqxlUFDDQLyWFs7x
 wP+WBcQbEC6aVS7X5Bryesh7LlWkvrGYZRF7Jq6+slvNc1hhsTLhkgRlGXIIG8c9yEvP
 ULkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fgQeMzrdvi7WD3Tb5iw7MuHQ93bDi33qHQK6exKx+k0=;
 b=b6alKZn4XH0aLhH7WvZLf1Rh5ftNUvbDC0ECivWi8CLRtpLY+iYqWq9MOg1H0UXVdp
 2FJFzb17q9K0sandmIZiyNfaAC5Qdk8F6kFXNQCnocJKHGU31THfabW6oqW0ZS37HyfE
 cal2JhlX2teYEmaP48VeMQHNgJkDgSsc4NSMZZYob4bHUTsud08sDAs2cZlug1FRUuOO
 C7q1ue+AVEYc+1A3xOHVi6sSjGkR386u5sqjHGR3LldJYbsOtuksOFVgdjX+W87BA/F9
 LSzRB06pMBtUkGDnyamBGg1JwrUtWVugrUCBN8V1RGo5rwO91IfG56BoA//Zuau51gBc
 VMxg==
X-Gm-Message-State: AOAM5316/5bmhYIUkPc9EE6J3ym0L+2GFGHfN6JRYWZ2IedOkk4yJcVq
 E7bixn1zyzRXvIu1GR2gMibuz3aDpAqcYA==
X-Google-Smtp-Source: ABdhPJwVeSv6HSuvCOqTst7pOyFZaYoRDPUkPkKZ56vw6tvVRUkBzhPzN7y8dyUXYzNQarxoGDqm6w==
X-Received: by 2002:a5d:54d0:: with SMTP id x16mr2128429wrv.75.1605222092866; 
 Thu, 12 Nov 2020 15:01:32 -0800 (PST)
Received: from localhost.localdomain ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id v16sm8326184wml.33.2020.11.12.15.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 15:01:32 -0800 (PST)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] ppc/translate: Fix unordered f64/f128 comparisons
Date: Fri, 13 Nov 2020 00:01:26 +0100
Message-Id: <20201112230130.65262-1-thatlemon@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=thatlemon@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: LemonBoy <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a couple of problems found in the emulation of f64/f128 comparisons plus
some minimal self-contained commits to clean-up some code.

Giuseppe Musacchio (4):
  ppc/translate: Fix unordered f64/f128 comparisons
  ppc/translate: Turn the helper macros into functions
  ppc/translate: Delay NaN checking after comparison
  ppc/translate: Raise exceptions after setting the cc

 target/ppc/fpu_helper.c | 212 +++++++++++++++++++++++-----------------
 1 file changed, 121 insertions(+), 91 deletions(-)

-- 
2.27.0


