Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37515307CE2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:46:36 +0100 (CET)
Received: from localhost ([::1]:35134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BNL-0001YH-89
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l5BJT-00084B-0y; Thu, 28 Jan 2021 12:42:36 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:33031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l5BJL-00085l-8A; Thu, 28 Jan 2021 12:42:34 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id 2so3200590qvd.0;
 Thu, 28 Jan 2021 09:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BAvwBMnBjegt4jAqvg44/lpbYU+er4k6cG+j0Az5lio=;
 b=agNl5wrWtDXkSmsJ4KxNmNajacIh1leG4UDPXxzS/5FdOCu2mLMqhFYeuXTYe3cQxq
 xFFxMJ1CNGESTvofiztKUlzPwwPMtkSNM7rApZc9+QYP25ssroSDtkIzftVew2y4tryg
 PbvJRawFanDeApD/cQHBqQJccrVVBAJOYxxzHc3V8gQDxqpLsdouOHCwgi6Fqxa51a3N
 l3PORsulQRFILfMjyY3AfldKc1nEvd2PimYLoXDzy38hAB9hdOI/erIOIWvRHa6cKMIa
 XCiRwFiMO/tAhyj0Gzwe5h/dvdApogcjt+u7DvmwqRSlrnnyjLUPDOtXWQx7YL2peyNX
 5ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BAvwBMnBjegt4jAqvg44/lpbYU+er4k6cG+j0Az5lio=;
 b=nagJ5NitSnBppA5ezRSQIcGk7ZfF2y+R5DpzPXcYe19IGvCs4H1Pvc3l0QLiLL3nla
 qilhBvjxxFbnIUredztmlY1OK7cAkmiWj8gYXVpNuNor8KHnqZZ32ZHHHrvDrzLvCb70
 tO+pk7KvLyuMctUmia24kqgQ8nNALojEuGzGiTBnifDXXEA2XANjv8MkPUX4g032wjjq
 poy/sJ3mLjx839RluEu+NZDy9S+UZFc/Dedumu3SGI5eacxzJaGE2BIEv7h4HAlJc4wg
 NUcU3c/AMoL/kz89wG+lI5OV9ZU/j7JpRc/Db/5Ah6yXLeeeYvjOqoS8URw8oppZ3nfK
 M5uw==
X-Gm-Message-State: AOAM530NvpCszaZCD9imCOJZultxLOx/hKjHvxAGRML+6BAZoknl/qfw
 umyFlMjL48kP/Je/2gBDHLmX4d13YAY=
X-Google-Smtp-Source: ABdhPJxA9Wky2qnCDvJjVqochtdaPFEn4GxtAoBSOkzp22iXwDYvhJWyQ7I9SFkhJi6OrjqpXLQMhg==
X-Received: by 2002:a0c:c38e:: with SMTP id o14mr305597qvi.29.1611855743305;
 Thu, 28 Jan 2021 09:42:23 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6df1:6267:881f:cc79:a1f7])
 by smtp.gmail.com with ESMTPSA id i8sm3804038qtr.84.2021.01.28.09.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 09:42:22 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] spapr, spapr_numa: fix max-associativity-domains
Date: Thu, 28 Jan 2021 14:42:10 -0300
Message-Id: <20210128174213.1349181-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

changes from v1:
- Patch 01: added Greg's R-b
- Patch 02:
    * removed trivial comment in spapr.c
    * removed the 'NUMA' caps in spapr_numa_initial_nvgpu_numa_id
    * added Greg's R-b
- Patch 03:
    * open-coded the logic inside spapr_numa_write_rtas_dt() instead of
      creating a helper
- added Cédric's 'Tested-by' in all patches
v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07324.html

Daniel Henrique Barboza (3):
  spapr: move spapr_machine_using_legacy_numa() to spapr_numa.c
  spapr_numa.c: create spapr_numa_initial_nvgpu_numa_id() helper
  spapr_numa.c: fix ibm,max-associativity-domains calculation

 hw/ppc/spapr.c              | 20 +-------------------
 hw/ppc/spapr_numa.c         | 27 ++++++++++++++++++++++++++-
 include/hw/ppc/spapr.h      |  1 -
 include/hw/ppc/spapr_numa.h |  1 +
 4 files changed, 28 insertions(+), 21 deletions(-)

-- 
2.26.2


