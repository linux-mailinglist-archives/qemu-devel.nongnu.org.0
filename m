Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23034C36CA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:21:37 +0100 (CET)
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKcK-0001dO-Rh
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKa1-00083L-RJ; Thu, 24 Feb 2022 15:19:13 -0500
Received: from [2607:f8b0:4864:20::22f] (port=34676
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKZz-0002zy-Ng; Thu, 24 Feb 2022 15:19:13 -0500
Received: by mail-oi1-x22f.google.com with SMTP id i5so4758768oih.1;
 Thu, 24 Feb 2022 12:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VsXyd7RRGOaiMkJWEYgks0YhH8612nBhCItmI78T/lA=;
 b=Y/aVd+YatQKgsyG5CWS1/t+SaKJiYf7l90krut2/i/V2whKhQjkUEjh36FIg2rDLIA
 4jY4iCOhT0mS52Gw5jilYfc/kTTRS55YBsRSFG15ujACrcwM9P7pdoa9zzaSULkTFCkE
 0iAObQfzWEdW4yUsG7ReNlbWiOMDWmlUp+mB7AGVlIMGrA0No/PTU7jfXJCEkx5A5m4P
 IMmrwNxxWJu0QFPo9RiHxRgOpsNk/FJ0njH9Ccuo4iPj/j9/jaGlasbKk4EFoZG7aGWC
 PDhqrnG1upYe4JUKaXrQWuQpgb/K1LPROtQl3+dYwZ4t+uW+vv/R3Ls8+HYo1YWQKs0m
 Zojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VsXyd7RRGOaiMkJWEYgks0YhH8612nBhCItmI78T/lA=;
 b=QjK0hcnOtbv2Je7lSxlVWAw58s81RtEV2M1jQO/EZih007AnB6alSny6E3hNdpLKtb
 BZeWx4w8nCv1f8Fin/iAzhYl725O3wApw0moRGWmJghOPb7H2yboN71MJhFJAIgXkEvZ
 6W0CRzJhLr+uF/QUMb43FClouu8574cfzupoYim6+X0RrSc+6S/lZlKswKyBNxam947w
 8IcRWss+A+hDgqtAr0fWBGBY09wpwwcdfA19rHBpoEpN9dnAz2DJ2sE5LMstzkUaHUHA
 lsl2CkKj3VYvf1GK78jVZwT0a/48xVPQCMfgGZK7agp75Dw3V86dJLhUHfFSYGN0YMVp
 x0VA==
X-Gm-Message-State: AOAM5333yY1nwALa2EI4HP+7gruhLA9tkdM49irtVKdpmO0WaEdET3ci
 Nxg2618l2sXvVt/BlqVhLpi28NS0dAs=
X-Google-Smtp-Source: ABdhPJwX/QQHxuK7ykfHL6Gc1siPZMnJN63DvGeXAN2EPGw/8JdH+1RvDizXX19aZ03Rt7gT2OzVQQ==
X-Received: by 2002:a05:6870:610d:b0:d6:ccb0:39cb with SMTP id
 s13-20020a056870610d00b000d6ccb039cbmr1972875oae.231.1645733950096; 
 Thu, 24 Feb 2022 12:19:10 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 bh42-20020a056808182a00b002d538a8d5afsm305775oib.7.2022.02.24.12.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:19:09 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 0/4] PMU-EBB support for PPC64 TCG
Date: Thu, 24 Feb 2022 17:18:56 -0300
Message-Id: <20220224201900.1037465-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version contains a change in patch 1 (former 2) that was
proposed by Richard in the v12 review.

Changes from v12:
- former patch 1: dropped, no longer applicable
- patch 1 (former 2):
  * use tcg_enabled() instead of !kvm_enabled() to avoid defined(CONFIG_TCG)
  ifdefs
- v12 link: https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg03622.html

Daniel Henrique Barboza (4):
  target/ppc: make power8-pmu.c CONFIG_TCG only
  target/ppc: finalize pre-EBB PMU logic
  target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions
  target/ppc: trigger PERFM EBBs from power8-pmu.c

 target/ppc/cpu.h         |  5 ++-
 target/ppc/cpu_init.c    | 20 +++++-----
 target/ppc/excp_helper.c | 81 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/helper.h      |  1 +
 target/ppc/machine.c     |  6 ++-
 target/ppc/meson.build   |  2 +-
 target/ppc/power8-pmu.c  | 39 +++++++++++++++++--
 target/ppc/power8-pmu.h  |  4 +-
 8 files changed, 140 insertions(+), 18 deletions(-)

-- 
2.35.1


