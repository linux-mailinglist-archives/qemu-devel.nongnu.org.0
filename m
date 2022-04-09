Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D004FA78A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 14:11:34 +0200 (CEST)
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nd9wC-000165-RT
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 08:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nd9uc-0000DP-46; Sat, 09 Apr 2022 08:09:54 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nd9ua-0005RN-HZ; Sat, 09 Apr 2022 08:09:53 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so12378205fac.11; 
 Sat, 09 Apr 2022 05:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GPSa58+bXEAoR1QzPkvn6NwREBWT5TrOsRlmaLXTOeE=;
 b=mvMZhhnw3lZq3AR2XDf/90wBrJ+P2a13jXzJsSE/Iys0fqR2pG1hwKfDpz2JqZfZqC
 ltBflm1z+I1ysqwSdQrJDgsnipT7saVfVU/8c2WbJgngLKFPTZzFWWlzNvWtWL2BavXm
 lBKVIjY/33tCPTnzzk89FMW9wqSXubmOZVOMvUbeLf86u/jqI4ao9Q/CmJLAP1y4+BfH
 gkYvqPrrNFCQhObzarLJcJ3eJPMiW6BrEVStfId4dJcnhBc8RD6BRu0FO/xn+wT73Ded
 Ui0L+TIUlHkFRRU5S6JdOswUqTaCDpfgHy7Nvyn6EFtJTUVTX14EJn53EcvDupA77+nT
 ARuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GPSa58+bXEAoR1QzPkvn6NwREBWT5TrOsRlmaLXTOeE=;
 b=RBYPDYgU7WxINlSNZo9i9pkmk5H20qWk0MGyrxOa1FOT5MQ6aDRKFKdbbqGblU0OC0
 +BG7tm5OVBJ+KTbb797p6yVr9sIgGXkTcqHls+4wkFpplk8wY/0hVcmJtDGrPEQYngZd
 ZbTJLufJx4HpCdsuqJMrZWYjYob2ax41AYVEuYy9IfFL+IWWHQ3yMZfsz9LmPUl86as6
 Zsg9QAHDmzpe0VSPOnM/IeWYlP3WaxEq6va1csYnbjo20HZcibT/2DoXSco4hZH63f8J
 SJwcRor6/f+KojAJW2LqCPGySmzoRxL4fh0KMFphEoR7ZgBE/9bdiIxdSI+YJP+O3ya8
 KI3w==
X-Gm-Message-State: AOAM532GfHQ+2m9+UzVeoaE/JrLUUqthDz84q5wBlEq6e6ao6AFD1CMs
 Y5mm54giVLVZ/LYLKSWi02UbJCucctU=
X-Google-Smtp-Source: ABdhPJzY1xPFh0Qb3Hy8sa6mO26lChgLJz9ZCWUm6QpijUonBGabZPqpeXlm2Z8MMxGkCv+4Osy4tg==
X-Received: by 2002:a05:6870:58aa:b0:dd:a976:5e8f with SMTP id
 be42-20020a05687058aa00b000dda9765e8fmr10637945oab.112.1649506190329; 
 Sat, 09 Apr 2022 05:09:50 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a056820060900b003216277bfdasm9677598oow.19.2022.04.09.05.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 05:09:50 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v2 0/1] use dc->vmsd with spapr devices vmstate
Date: Sat,  9 Apr 2022 09:09:39 -0300
Message-Id: <20220409120940.263369-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This v2 contains only the last patch from v1, patch 4, given that all
other patches are breaking backward migration due to how
qdev_set_legacy_instance_id() works when vmstate_register() is passing
an id to the vmsds.

Changes from v1:
- patches 1-3: removed
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg05615.html

Daniel Henrique Barboza (1):
  hw/ppc: use qdev to register spapr_nvdimm vmsd

 hw/ppc/spapr_nvdimm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

-- 
2.35.1


