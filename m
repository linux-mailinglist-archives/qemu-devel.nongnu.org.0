Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA5E56ADAC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 23:33:12 +0200 (CEST)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Z7X-000295-3f
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 17:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Z4t-0000HG-BB; Thu, 07 Jul 2022 17:30:27 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:33698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Z4q-0004fZ-6I; Thu, 07 Jul 2022 17:30:26 -0400
Received: by mail-vs1-xe35.google.com with SMTP id l190so2583544vsc.0;
 Thu, 07 Jul 2022 14:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HWmnvnADIKX5GGaKCd+x0ILsXexS28mhqVO/nZa6GVI=;
 b=MLjStocM9EmxD1iYuFMA5I6iWJ/zIzDkHXp/hGgYsFAXTBhXhcwsmh0fNy/EVHIbXl
 9j66Ki6X1GEU/538x1fDrZSRUdJgiqfCw9Sw516y3L0y8qfiUlDRzTwEXD9zxh+pY0ng
 viVNDCeqdwW5mLfWNuRUMO9S4eTvJuyXAmpnbgNY9mlOUfJaDCFW5syVFyha3Nn+Dr6e
 de10W2TauRxTIh+heOTsBGKlyaLZiRn5asvgyzX0URbotqfmYhKXLjH/OPsRTzQOIAhW
 Yv+oN52JIrSOTVLf9BCjCnKw6RrPA4lEFUuLmLUZ/qqhBRl1UC823QiUOCL4RK3EwzhR
 g57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HWmnvnADIKX5GGaKCd+x0ILsXexS28mhqVO/nZa6GVI=;
 b=C/3+Sk82a4IBMQT+dKQixu3qaG5gatuTXx5IjwAB29FRAtGHnqKtdBSgYJd2VZ/ltH
 ntyXrKDe5tKtvFC6VYLFyzjlvqcOJOMCpW5KVWYMEnHYcDqGbGeD+N33kSFCck60S9LI
 wcfG7apNeIa2ZroWKTlUYixN/eP2CrGdv2zehAgCe9b9oRR6tBGZLbnzZiJQG29+yCdV
 cvMvp9rz7XiUnBcS5sRg6Vny6PtXZRlITSmXdzxLeX9JOdUnnhBte8+6lW8e1QNOTWTa
 BeKADiDJZY2DP0Ax2CRKZXaow/IkJLE7uVVy66a4ah/LvR8Wbbq61DLQfFrUfabQlESV
 TZmw==
X-Gm-Message-State: AJIora9AkliYWimj4SU3tNMddCGeJQqS6qtmnpptqWj40IDq92E8srqI
 v6iJ04X/Siq2t4hXRg6xjIoFHgSu/tM=
X-Google-Smtp-Source: AGRyM1s0H5l4GPwkmn0orlKEvdXB/puoh84zUqI4QGD3PH7cXSQdDcq6B9PgxT+XKnu4fN5n8l3hYA==
X-Received: by 2002:a67:f74c:0:b0:354:5c29:aad7 with SMTP id
 w12-20020a67f74c000000b003545c29aad7mr24844516vso.40.1657229420521; 
 Thu, 07 Jul 2022 14:30:20 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 66-20020a1f1745000000b0036bfe74006esm12122103vkx.31.2022.07.07.14.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:30:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 0/4] enhance error handling in kvmppc_read_int*
Date: Thu,  7 Jul 2022 18:30:11 -0300
Message-Id: <20220707213015.552104-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe35.google.com
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

In this v3 I changed the error report after fopen() to use
error_setg_errno(), as suggested by Cedric.

I also cut patch 1/1 because it's simpler to do all the function changes
in a single patch instead of having a separated patch just to change the
return value of both.

Changes from v2:
- former patch 1/1: dropped
- patch 1 (former 3):
  - use error_setg_errno() instead of error_setg() 
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01167.html

Daniel Henrique Barboza (3):
  target/ppc: enhance error report in kvmppc_read_int_cpu_dt()
  target/ppc: use g_autofree in kvmppc_read_int_cpu_dt()
  target/ppc: exit(1) on failure in kvmppc_get_clockfreq()

jianchunfu (1):
  target/ppc: add error report when fopen fails in kvmppc_read_int_dt()

 target/ppc/kvm.c | 46 +++++++++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 15 deletions(-)

-- 
2.36.1


