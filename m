Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E554C423C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:26:17 +0100 (CET)
Received: from localhost ([::1]:45400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXnk-0004o7-9l
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:26:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNXa6-00072v-2B; Fri, 25 Feb 2022 05:12:10 -0500
Received: from [2607:f8b0:4864:20::c29] (port=34456
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNXZq-0004Sc-52; Fri, 25 Feb 2022 05:12:09 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso5661777ooi.1; 
 Fri, 25 Feb 2022 02:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y/kliasIGxu5nM/kr6VxdZkCwUtqzr6N5xlJOs8w+1c=;
 b=ppvZz6xVmGtiN7aCk0St/Jo6woZKEsvOv6mmM3mK2gzZGRR+UcE3KqXoezUyXwZmcS
 yWsNeUpokzY/t/D4GT2BiR2DFva0/uIyTcrU664yZEb47+z08uIe6W2sYzy9pzI2xB7I
 TEEalK2zuj6a+SF7knE+aUnkyTyQ+PjR5FwNcvyG8D4Rvq4gUeO+TlYeOK6hF8HKP7Np
 pgllhT5JR9gaIJ7ovYn3d9HoJyjsX3eSlZBjqnPH3xiPjHZvEoROTcxvUurdZIOJYXNW
 E+ySkYvJki+Cjpa3HyJJQw1O40sueWDx9r+qimQOQMmXVrViqWZHhkJCpmfscamaD041
 jJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y/kliasIGxu5nM/kr6VxdZkCwUtqzr6N5xlJOs8w+1c=;
 b=BF+dXZEMpZgeJUCwT0QCxJ5hlRbbQjiPfaKjC+HPnb6SRZV89GEdzTuyVqqLBVTJB6
 ljIawwDcwWH/dA5LKWpXYuoTqZiABa1b3fsPUhlD6jsN6BGcACqOjNVCJGEw9Gk7nbvC
 5M17cF7AmZ+7LLFsZcU1lJwF2ZXl8y15hTeC0aoQK3n9kWVt8KJKN5gBJHNjZ/VdYwFs
 nFVhYitCJcOn3pWaaWHUvCrvLk8MoXtDeNIyj7RW1EAt/TgqMtWtC9CxBU4UOeyGDRyx
 iJGtX4Sz1UjSjYZoaNtqeWdsjywn0NW1HVI6mnW4zxcWoPY/YJtGNMWyTUUjNJ4rBiS+
 sjfg==
X-Gm-Message-State: AOAM533uEnyX/w2NRlsEm2vVj7ubuhQCKAjRHYm5heVecFDlGxEUIIrI
 LpjiLN5wsUeXG2CKsm4H3+uzgCMtQbU=
X-Google-Smtp-Source: ABdhPJyHubUvZDlSuGMQh8Tm7kpb0EpGnpr1xtDdQTqDd7sqn6Z/mTPjNKiX9Kw/y1wMDBqVUz7kUw==
X-Received: by 2002:a05:6820:343:b0:317:837c:abe3 with SMTP id
 m3-20020a056820034300b00317837cabe3mr2396874ooe.17.1645783912692; 
 Fri, 25 Feb 2022 02:11:52 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a4ae6c8000000b0031c2e6dd492sm847823oot.28.2022.02.25.02.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 02:11:52 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 0/4] PMU-EBB support for PPC64 TCG
Date: Fri, 25 Feb 2022 07:11:36 -0300
Message-Id: <20220225101140.1054160-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

This new version contains a change suggested by Richard in patch 4. No
function change was made.

Changes from v13:
- patch 1:
  * added Richard's r-b
- patch 4:
  * renamed helper_ebb_perfm_excp() to raise_ebb_perfm_exception(). The
    function is no longer declared as translation helper
- v13 link: https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg05414.html

Daniel Henrique Barboza (4):
  target/ppc: make power8-pmu.c CONFIG_TCG only
  target/ppc: finalize pre-EBB PMU logic
  target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions
  target/ppc: trigger PERFM EBBs from power8-pmu.c

 target/ppc/cpu.h         | 10 ++++-
 target/ppc/cpu_init.c    | 20 +++++-----
 target/ppc/excp_helper.c | 81 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/machine.c     |  6 ++-
 target/ppc/meson.build   |  2 +-
 target/ppc/power8-pmu.c  | 39 +++++++++++++++++--
 target/ppc/power8-pmu.h  |  4 +-
 7 files changed, 144 insertions(+), 18 deletions(-)

-- 
2.35.1


