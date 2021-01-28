Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA588307971
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:19:43 +0100 (CET)
Received: from localhost ([::1]:41474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l595C-00038t-Vv
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l593K-0001At-UT; Thu, 28 Jan 2021 10:17:48 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:35925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l593J-0003QS-2Z; Thu, 28 Jan 2021 10:17:46 -0500
Received: by mail-qt1-x82c.google.com with SMTP id r20so731905qtm.3;
 Thu, 28 Jan 2021 07:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n6CFFcEibTVJBKBZ08pv7d6Vc7tpsuB1vU5ML75P+SY=;
 b=ns+Q0I+GIiK+1WjqkttHEDk/VUUeOCYCrFETMhSrFOJXh0Wp1+suLhYChYRmGezY0I
 bJ3q35MgL0tf75UGW+3pp6JK8n/5AEmo5fUel8qmjdLF43an1l8DNIMTxVPq+3D87odt
 EqpalpBx1By5DoTymmrPKPj5SlbwUPfcgVCusn09Hcw8JvYwdr/aAN4jdy+VzjDZLgIB
 +AoNj7Qivdf9fSpDl7d0r5Y2z7PCoqR7hO/1c49PCzfl2sMCzhM89XvrS/sCkOt3Kv7h
 wgMhAzufNyoSyMuXzUS0iNcnNBf3E4Hb02tQ2df/AEnX36FF/0DkuiTMmV/50C/+JzcW
 iz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n6CFFcEibTVJBKBZ08pv7d6Vc7tpsuB1vU5ML75P+SY=;
 b=X44duxkitgHf6Gey/NjwDQNrVwgJzarkHb4WhjsdGhnnZgGkXinhEo7mf+6EpmzglC
 kdr9hx5xnEPhWsVNN1HT7hnUbePMr5dstVraiYvGSfoarNykI8MPRpBzExMbv1HgIctt
 WHqA/LDb/OSWnDgFCqkdmEV6E5rAcpad4om3WDSS+R2LnKRv1iBnsYhUvMfgO8nyT3vG
 306s5+MZ8w7hIqLR3Jqs9d6fCa2fQDPkaIWGK8BPjWK5MMBT9p0lqR2KlQWFZ1OqIT37
 9emJ+xZ/xQaNwGoeP3QRg3laGRmfeUVR5qyZyHQDS2of0lKqW9e13uswer3R9xkxs1kp
 paPQ==
X-Gm-Message-State: AOAM533d38EaNELdxfv76DNtp9HDNB5cIWQ1JXeSA8uteKHgEXqcseEZ
 T5SVfq231fTaINSWU+G8pKt9wexXLuc=
X-Google-Smtp-Source: ABdhPJxqETL47HsjX3ZpJb0HzSZ1PF9ZkFhQehYyx/h1Un5ZBj5djytI/wxZ18jatw6XtmQ4MhuBjQ==
X-Received: by 2002:ac8:6b11:: with SMTP id w17mr14894437qts.274.1611847063041; 
 Thu, 28 Jan 2021 07:17:43 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6df1:6267:881f:cc79:a1f7])
 by smtp.gmail.com with ESMTPSA id g131sm810855qkb.91.2021.01.28.07.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:17:42 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] spapr, spapr_numa: fix max-associativity-domains
Date: Thu, 28 Jan 2021 12:17:28 -0300
Message-Id: <20210128151731.1333664-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
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

Hi,

Patches 02 and 03 contain fixes for a problem Cedric found out when
booting TCG guests with multiple NUMA nodes. See patch 03 commit
message for more info.

First patch is an unrelated cleanup I did while investigating.

Daniel Henrique Barboza (3):
  spapr: move spapr_machine_using_legacy_numa() to spapr_numa.c
  spapr_numa.c: create spapr_numa_initial_nvgpu_NUMA_id() helper
  spapr_numa.c: fix ibm,max-associativity-domains calculation

 hw/ppc/spapr.c              | 21 ++------------------
 hw/ppc/spapr_numa.c         | 39 ++++++++++++++++++++++++++++++++++++-
 include/hw/ppc/spapr.h      |  1 -
 include/hw/ppc/spapr_numa.h |  1 +
 4 files changed, 41 insertions(+), 21 deletions(-)

-- 
2.26.2


