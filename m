Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB9599909
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:53:54 +0200 (CEST)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyhM-00052T-Uj
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOybe-0000Ol-3U; Fri, 19 Aug 2022 05:47:58 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:46984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOybb-0006gW-PL; Fri, 19 Aug 2022 05:47:57 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-11c5505dba2so4634656fac.13; 
 Fri, 19 Aug 2022 02:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=oc7tZt2mwFbShoi1G5kJn/PGIUDHYk3t0Du6r0W4WZE=;
 b=O3EC8s7a6puexKLHoeSnAeqSYbz9GyqnhcHKMaBSX/d6aFhCPLbvhrtAorUCz6Zu6F
 FlTfwKoaCh/ypYB6xDbuwJ/b/VAmNsWSqIi/ILBpI4O2ROZ3HlG1iEzzGKmQw+7A8kcn
 6+/Gopiqj/NmFB6DD71Otv3z9wMgv/+GwaG5vxOlsfIaY4XvuYfZgKYG7mBrbWwCsXil
 vewfS2BYVOcxBNMnhaiIvEeSjUb3pPgfyvmjRmDjEzbGuM7YhDgPkg23r9q4wSyWAMqd
 +Zw6+iB+jMbcTADTUt8LQqAG5aYRj+iwuHNDJT9mONfn34dsmy1Fql4/k3MLlI88pThG
 sgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=oc7tZt2mwFbShoi1G5kJn/PGIUDHYk3t0Du6r0W4WZE=;
 b=7dfhYQfZFMiNVAoAmVAWWcFPF/MTgJE1yR61GYI6giC+cFzld3CBgM1y6IIj9AGVpm
 tgs2gofmbeFYTELdrbcSGrwxUHOb4nSEJc2Mr1CzwztGOnrQP+aMiVKpVsbaFmZy0Rt7
 t6XxfS6rfxn8898ZsHc1TBUTX3Bb9eIV26qsOw09U4JQKW7mP9nZnUPPNmchXNSIwRE5
 rks8MGJaOBc5YzPzDopTaLU8LSvSFhbTDyWxjKPun5B/Upzh3PHomV0fZdlIfTbDpWwV
 +mTmcqkIdYfM6XeFmubADa3T1FMOTMceo7LUZKAjGPmYXSVMkfc2wtFUfxRIykK0Zjbt
 XkQw==
X-Gm-Message-State: ACgBeo2qyYmSIxza2f4/8L8OWQRwb3LVBHKQA+N/YL2ol1+J0kyV8ml7
 J1Ii2BtimsSP0ccc1Tr+iomGRzRy2wmL+g==
X-Google-Smtp-Source: AA6agR6RoiIQ1toxT3WrBXYPVaTL8nif6CTTgqfB/O7KbLm5xT8bdMr2Gjzv/ksViGGSdHGZ7Bc26w==
X-Received: by 2002:a05:6870:4186:b0:101:17ef:d966 with SMTP id
 y6-20020a056870418600b0010117efd966mr3334070oac.97.1660902473340; 
 Fri, 19 Aug 2022 02:47:53 -0700 (PDT)
Received: from balboa.ibmmodules.com ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a4ad845000000b0044b06d0eae7sm228112oov.33.2022.08.19.02.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 02:47:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v2 0/2] ppc/pnv: fix root port QOM parenting
Date: Fri, 19 Aug 2022 06:47:46 -0300
Message-Id: <20220819094748.400578-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi,

Second version removes pnv_phb_attach_root_port() in patch 2 as
suggested by Cedric.

The patches are based on ppc-7.2:

https://gitlab.com/danielhb/qemu/-/tree/ppc-7.2

Changes from v1:
- patch 2:
  - removed pnv_phb_attach_root_port() as suggested by Cedric

v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02811.html

Daniel Henrique Barboza (2):
  ppc/pnv: consolidate pnv_parent_*_fixup() helpers
  ppc/pnv: fix QOM parenting of user creatable root ports

 hw/pci-host/pnv_phb.c | 88 +++++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 41 deletions(-)

-- 
2.37.2


