Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC9489B6A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:38:59 +0100 (CET)
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vp4-0005wG-NC
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:38:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkI-0001No-46; Mon, 10 Jan 2022 09:34:02 -0500
Received: from [2607:f8b0:4864:20::a2a] (port=39593
 helo=mail-vk1-xa2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkG-0007NP-E4; Mon, 10 Jan 2022 09:34:01 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id n124so3608159vke.6;
 Mon, 10 Jan 2022 06:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3XAzD/a0c97CZaqS8CLOsQDc+iSe9gvFodznrtnsh/w=;
 b=O7wdeGbfE8qdQoZpa8MqND+MheL30jbCU6v6znPGi4ItsBhkdVq9leeA2ZQHy5IPjV
 GWYZ+/CKUpQy9l0rzXMM/zyMoTlT4uc3TJRiG0hiZh3UyHehHj87Ecgohb6rXoeQgFR3
 LNYHySeqyp61BnzMJpN0BBFECGtLfiuf+TICkGb9dCS/YLTamV5n4CineH526ch/D+tU
 n/Iz/FIqtYyhfbaBYdWEzFoxjriQ5rynhAhYFow/nK14cn/e8JDiaHywyaLE61XB3+eS
 CC6sIPWuLgMfHnJODDISb2F52dvKCGlbv2Gl54tVFjwGcPIDq2r484MBQG8EwLILsahT
 A7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3XAzD/a0c97CZaqS8CLOsQDc+iSe9gvFodznrtnsh/w=;
 b=mf02ti3SPC+Nl2M2SxxYtAEwIiTRIPeB5YFkODA18mFGnLNZDqK284A1YyBC6z6oLt
 AKdVVhJoMdlHhzMOu/3lYCy4Hja4YiwmCd2m32/b7A9LaadAWrFGK1gTt+aFKkiwWTNV
 nuzGGjG0oddAmWX5vmYhAxoFFoNOAomlqGP7abcL2QgrnjfUUQ0CEaGuTg8OtM4IhPZC
 daHvoBF2OJcltmy93cPch8c4CSaFzlJ1Arteb1GBRzWDf9rWjWW1IZfyFFafS9mfH2WW
 HXJQDkhCZkyHuyFKVePjuyhAkdikR82RobROPG3w/SQ4Jed4WUlNL7wF9PlB9IRicWdk
 u3PA==
X-Gm-Message-State: AOAM530cJrTFEUE/X3HDw5IHwqzHgae4mw1Zaz5bX+6LytwnxRWPyrw5
 ZreNRzzbFG/mH8NatkQ7iKWY+rx8i4Ta55Jk
X-Google-Smtp-Source: ABdhPJyAFl+3JDTCqtKP8At8+oL965qLb8h+gxCsABeR4/4zyOlYPKWZZRjQr21MW9oMBvKa6IJTXg==
X-Received: by 2002:a05:6122:200d:: with SMTP id
 l13mr28850vkd.16.1641825235382; 
 Mon, 10 Jan 2022 06:33:55 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:33:55 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/10] user creatable pnv-phb4 devices
Date: Mon, 10 Jan 2022 11:33:36 -0300
Message-Id: <20220110143346.455901-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This v3 contains new versions of pnv-phb4 exclusive patches from
version 2. Patches 1-10 are already accepted.

I changed how patch 9 (v2 patch 17) works by doing everything possible
in extra patches/cleanups beforehand, and then using patch 9 to flip the
switch in a single step. This means that handling the default initialization
of pnv-phb4s is done at the same time we enable user creatable pnv-phb4s.

There's also a change in how XSCOM initializion is being handled. We're not
using a flag to do a partial XSCOM initialization during phb4_realize() anymore.
Intead, we moved XSCOM initialization code, as less intrusive as we could, to
phb4_realize(). 

This time I also took the precaution of testing the default case
(i.e. running without -nodefaults) in every patch. v2 was breaking
this default run between some patches.

changes from v2:
- former patch 16: removed
- patch 10 (v2 18): unchanged
- patches 4,5,7,8: new
- patch 9 (former 17):
  * added g_assert() if stack == NULL
  * added a comment explaining why we shouldn't assert on user error
with wrong chip-id/index values
- minor changes across the patches due to the design changes 
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg00671.html 

Daniel Henrique Barboza (10):
  pnv_phb4.c: introduce pnv_phb4_set_stack_phb_props()
  pnv_phb4_pec.c: move pnv_pec_phb_offset() to pnv_phb4.c
  pnv_phb4_pec: use pnv_phb4_pec_get_phb_id() in pnv_pec_dt_xscom()
  pnv_phb4_pec.c: remove stack 'phb-id' alias
  pnv_phb4_pec.c: move phb4 properties setup to pec_realize()
  ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
  ppc/pnv: move PHB4 related XSCOM init to phb4_realize()
  pnv_phb4.c: check stack->phb not NULL in phb4_update_regions()
  ppc/pnv: Introduce user creatable pnv-phb4 devices
  pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name

 hw/pci-host/pnv_phb4.c         | 162 ++++++++++++++++++++++++++++++++-
 hw/pci-host/pnv_phb4_pec.c     |  58 +++++-------
 hw/ppc/pnv.c                   |   2 +
 include/hw/pci-host/pnv_phb4.h |  12 ++-
 4 files changed, 191 insertions(+), 43 deletions(-)

-- 
2.33.1


