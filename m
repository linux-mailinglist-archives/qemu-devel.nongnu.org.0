Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFF04D0776
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:18:17 +0100 (CET)
Received: from localhost ([::1]:35232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIs4-0000vY-9B
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:18:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq0-0006WP-VT; Mon, 07 Mar 2022 14:16:10 -0500
Received: from [2607:f8b0:4864:20::230] (port=44699
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIpy-0005vg-9g; Mon, 07 Mar 2022 14:16:07 -0500
Received: by mail-oi1-x230.google.com with SMTP id j24so16281881oii.11;
 Mon, 07 Mar 2022 11:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0fYpMuA68OXbuijMMrBNh4HbVkbPX/oWCD6OEX7sqbw=;
 b=UgNkz+ywC8VN5EFuII8RbT0H4BvEcKbynHlG7Yy4vQ9W//DGT3b0lnvKGfmYQLkiNZ
 lJmVGc/uC3uixgSEmgEufNFoUljxMWLsbYljlVgQkeRxev+DKWCHPsfdV08sfTI8vryh
 4YhpRnYZnJsca5MarOqzTrdK/dYl0Srp8pVjCw59teoLy/20zFGHdZ3sx8YllOaAlA+I
 JGW8hrOH+/5iuEQlJ1MOGkPr7y7lBj6EN+gSwSHsbsDWAyau2OcGLU8Rods38D96i3zs
 0OJlnUb9cAbXz+LlMbBwmtdRySiLxSDjreCOHntaj4jlWwFvn01yoT3oEJhWHheld32r
 fq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0fYpMuA68OXbuijMMrBNh4HbVkbPX/oWCD6OEX7sqbw=;
 b=0s7IfyF9vQ8yp9CiA8sy8glVYrUrtPftNeqgZZjGxAZjxy0oDxuE5WADNJhbL1ihAa
 6J7Dmi1DDDes8S7hT4eGBJssUFOWvhyWPl9CvL8rhjYMW2w4gE64UI8sArNSeFD+G3VM
 YHC+7T9tHYjb1OVTo/QgmgimWMn8+PxFVVFEPbopoABdEjCCF4s5jdMzHkQwLFXAYiUy
 NkXXO6zf2TLQesV55/bC0lKhPUPzaMmVelqTJGU9ipdmnAP9e6wAeZ8BT8r4uJAJ0yHl
 WHCxRmlmWg5/nK7MM+8VYaprLSu4jhVFEdyJhcVmiSXp5rLKBP3TpQ/exCcCMNLVWyBO
 WT8Q==
X-Gm-Message-State: AOAM530AJLbLsjIweCQh2yZJnU9JWz8hrRNoDkUB0uLnUctnqur6/x9I
 S6ScYOCD6vPqJMRkciaC7rsPeIAd7dw=
X-Google-Smtp-Source: ABdhPJyENFDZz3l/Y2QsNbU9dVaYp2elgdBwhAwaqD5ND8GyRyNYHxgOztD2ZzUjVLYeREHne4VQoA==
X-Received: by 2002:a05:6808:2026:b0:2d5:409e:1dc2 with SMTP id
 q38-20020a056808202600b002d5409e1dc2mr316238oiw.130.1646680563528; 
 Mon, 07 Mar 2022 11:16:03 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 t40-20020a05680815a800b002d48ffad94bsm7283093oiw.2.2022.03.07.11.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 11:16:03 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] add LOG_UNSUPP log type + mark hcalls as unsupp
Date: Mon,  7 Mar 2022 16:15:44 -0300
Message-Id: <20220307191553.429236-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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

I got a lot of noise trying to debug an AIX guest in a pseries machine when running with 
'-d unimp'. The reason is that there is no distinction between features
(in my case, hypercalls) that are unimplemented because we never considered,
versus features that we made a design choice not to implement.

This series adds a new log type, LOG_UNSUPP, as a way to filter the
second case. After changing the log level of existing unsupported
pseries hypercalls, -d unimp was reporting just the ones that I need to
worry about and decide whether we should implement it or mark as
unsupported in our model. After this series there's still one hypercall
thgat is being thrown by AIX. We'll deal with that another day.

I am posting this a little too close of the soft freeze. If we manage
to get it reviewed in time, since it's a debug QoL change that doesn't
break anything, I'd say we take it. 

Also, I didn't find the maintainer for the util/log.c file. Let me know
if I need to CC someone in special for this file.

Daniel Henrique Barboza (9):
  util/log.c: add LOG_UNSUPP type
  hw/ppc/spapr_hcall.c: log h_clean_slb() as unsupported
  hw/ppc/spapr_hcall.c: log h_invalidate_pid() as unsupported
  hw/ppc/spapr_hcall.c: log h_copy_tofrom_guest() as unsupported
  hw/ppc/spapr_hcall.c: log H_GET_EM_PARMS as unsupported
  hw/ppc/spapr_hcall.c: log H_BEST_ENERGY as unsupported
  hw/ppc/spapr_hcall.c: log H_QUERY_VAS_CAPABILITIES as unsupported
  hw/ppc/spapr_hcall.c: log H_GET_PPP as unsupported
  hw/ppc/spapr_hcall.c: log H_VIOCTL as unsupported

 hw/ppc/spapr_hcall.c   | 98 +++++++++++++++++++++++++++++++++++++++++-
 include/hw/ppc/spapr.h |  3 ++
 include/qemu/log.h     |  3 +-
 util/log.c             |  2 +
 4 files changed, 103 insertions(+), 3 deletions(-)

-- 
2.35.1


