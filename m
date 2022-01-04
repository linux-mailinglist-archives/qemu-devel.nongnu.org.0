Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2044849D8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 22:27:11 +0100 (CET)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4rKn-0001JC-Oh
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 16:27:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qbnUYQcKCoQ3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com>)
 id 1n4rJl-0008OT-R7
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 16:26:06 -0500
Received: from [2607:f8b0:4864:20::94a] (port=51058
 helo=mail-ua1-x94a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qbnUYQcKCoQ3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com>)
 id 1n4rJj-0006bH-Mh
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 16:26:04 -0500
Received: by mail-ua1-x94a.google.com with SMTP id
 w48-20020a9f31f3000000b002cf15fe9655so20206316uad.17
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 13:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=XPFthdQVtTbG0KBSO3DBGWaZ0e7wQDncg1awl1ETk6w=;
 b=bS+bIdZz/aA0AOKDfE8afjfJ+ArTC0RphVr/P3AuKbY5bD58AW4S4kjPEDYT1crD/9
 gyC2O9OvyKa5kTfhnOfl9qvzqVedNLcHrdn0m/OVRY8F+Eza4XWogmHsxwFw+lWageEB
 nNowGAa6SI01ikg6pBL6bqWYhOir5SlYFgaubP6FuUHNnCCtiIO+TTtwBF73n/z/dJjp
 xfaz7fS+fGaE3M7dc3UveVkzeshZ0XQiCZfDkphpXB4+mGakjQWJ4wALoHIgyjPN3/aa
 fVj6TCFjjO4kWCC1iLndMTZ0R9Nzf0fRoTywL0xPcaW3ei5DqBWIYame/OaoVzwj/Zpk
 lqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=XPFthdQVtTbG0KBSO3DBGWaZ0e7wQDncg1awl1ETk6w=;
 b=Ocfludc/Qi7Go9+2kBCOAWNabmgqlOn4oskwCmUcLxA9Talh0kzfAOKgIt488GiLiK
 aL7BALpkBxWXx0PHHSRH4PpNE5NfAFSegXBA9/dfEj7BAxmZRviwPt5SCwfjNw3EdGw0
 4sV07YktB/QutGKj114bWwgURtNU/wa4Ud+Mb6NzT/8YXUnr+BJPgt8yHjAuMqUomkE+
 DHROCLQMYGeX66wiH76uQIxVb9Ej83i8wBgf2qNxDCdHPO08QC4gE5Pi1sSmY+gzU8mG
 5a8v+TeotYh/A27qiHAd+c7YTtwa4On1MAEO+s0e6pMMQJs6uOg+eJocxg7lDidw4mki
 eVkw==
X-Gm-Message-State: AOAM530CvFn6XY2eALssVUvFiZ9TzR0l+2P2725Co+LdzwsDxl3qzb26
 WHqDIdGySDmjLCxNVz54BsSLAo9VWDn0
X-Google-Smtp-Source: ABdhPJwe1H7mY4rKvagBO0pR2N8flnBuQOMYr7MEvO25WlsRImvdkvgw350RB9VVSUvrHlAw8COVADnVoP2A
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:65c2:54a7:3cd8:6aae])
 (user=venture job=sendgmr) by 2002:a25:74c9:: with SMTP id
 p192mr45551169ybc.359.1641331113270; Tue, 04 Jan 2022 13:18:33 -0800 (PST)
Date: Tue,  4 Jan 2022 13:18:27 -0800
Message-Id: <20220104211827.3260431-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH] Set return code on failure
From: Patrick Venture <venture@google.com>
To: jasowang@redhat.com
Cc: qemu-devel@nongnu.org, Peter Foley <pefoley@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::94a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::94a;
 envelope-from=3qbnUYQcKCoQ3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com;
 helo=mail-ua1-x94a.google.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

From: Peter Foley <pefoley@google.com>

Match the other error handling in this function.

Signed-off-by: Peter Foley <pefoley@google.com>
---
 net/tap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap.c b/net/tap.c
index f716be3e3f..c5cbeaa7a2 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -900,6 +900,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
             if (i == 0) {
                 vnet_hdr = tap_probe_vnet_hdr(fd, errp);
                 if (vnet_hdr < 0) {
+                    ret = -1;
                     goto free_fail;
                 }
             } else if (vnet_hdr != tap_probe_vnet_hdr(fd, NULL)) {
-- 
2.34.1.448.ga2b2bfdf31-goog


