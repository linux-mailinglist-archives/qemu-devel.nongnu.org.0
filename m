Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6216F2FDCDC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 00:25:00 +0100 (CET)
Received: from localhost ([::1]:57922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2MqQ-0001oC-U2
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 18:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l2Mop-0000OU-VT; Wed, 20 Jan 2021 18:23:20 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:36726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l2Moo-0005kB-9S; Wed, 20 Jan 2021 18:23:19 -0500
Received: by mail-qt1-x82e.google.com with SMTP id e17so332822qto.3;
 Wed, 20 Jan 2021 15:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N09u5ewyyGWY/V5bYit+1nA2cLjLCCKSRfEr435sEy0=;
 b=Bkj43hMOcvq4KQkHsTGVlQcOL56hmcSHk+LMUKd78EcoyFvn9aFBdLYTf8PJ5MWrsr
 43iZADdur46RlG9HsL5+klaPk9Ax10TgkLB2TNUnv6hfOQfyL+eGj7e8yrezA9oVpXud
 VEGElV6ao3KnIDFmd5TIiIUpooOjd8HteALun9QHX8vEYTZMddv0CMEr3uo4AmxLvzRd
 j83um0UxKvu3Wv8K9ptRVd1ZJDBRVuCrqEHC8VpYsYRbuCWWv/6RsCJi3iB2rJ64kptw
 p7EwFH1YED9UD0baKqwPJJxvEtbuY62WQFBQ30HPjvjT8A08iPtpShyD37QyhMXPbk53
 4Sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N09u5ewyyGWY/V5bYit+1nA2cLjLCCKSRfEr435sEy0=;
 b=gBk27+VHq1td6luSjzckm3bEL8Dk7F7zGV2wCx/uzVXzJ9YUe8Vlw3KxPU7t+Wo34j
 azsFdYyCcmgAJ55kA53a4PEqLNTDbxGzKzs92VXepsdhf0bxaDzQEmdycZNUX2XKzX5D
 IsaG71MD+C3+NDKSNz/rPGc5spIACWTgxix5LnRN0sahfGr5Fc4TFu3oRFi6Vvcsm42C
 s32xJpXDMWIBZ4llqjvCNR81O5sOy0FAB+yHZIG1rw3U/tDkockI90yNljivOoEjPiB6
 zynUthHDICsSxK+FBvt77johV6Nl5FVOiQxEcmysusJItiz0bMJ0gP5rDp1OIDioRgRD
 YckQ==
X-Gm-Message-State: AOAM533WwrMe3dZjmctTli4BVfpb1Hzwmp4WChs0D3hSIvVLNphDMn5T
 nS012mu5GTauyRJnWVobdaqhnVm5vhc=
X-Google-Smtp-Source: ABdhPJzPJ7dq19lcNPKOID7bS4EMDOhNsNlsbM3CgDQLLqkhyeEI9RGL1ho7hnZzpGPaMecM3N03pg==
X-Received: by 2002:ac8:110e:: with SMTP id c14mr10842591qtj.293.1611184996331; 
 Wed, 20 Jan 2021 15:23:16 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id b6sm2452548qkc.128.2021.01.20.15.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 15:23:15 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] spapr.c: add 'name' property for hotplugged CPUs nodes
Date: Wed, 20 Jan 2021 20:23:03 -0300
Message-Id: <20210120232305.241521-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82e.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

We're not adding the 'name' property in the hotplugged CPU nodes, and
this is being reflected in the kernel in a CPU hotunplug bug. See
patch 02 for more info. 


Daniel Henrique Barboza (2):
  spapr.c: use g_auto* with 'nodename' in CPU DT functions
  spapr.c: add 'name' property for hotplugged CPUs nodes

 hw/ppc/spapr.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
2.26.2


