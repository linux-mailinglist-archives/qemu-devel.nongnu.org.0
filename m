Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024342FAA3A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 20:33:04 +0100 (CET)
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1aGt-0008Ud-3S
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 14:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1aEk-0007r1-Sb; Mon, 18 Jan 2021 14:30:50 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:34646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1aEh-0002xf-SD; Mon, 18 Jan 2021 14:30:50 -0500
Received: by mail-qt1-x834.google.com with SMTP id c1so12082762qtc.1;
 Mon, 18 Jan 2021 11:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CjE1ovpZ7husLhHbnrpMYisprMq3aV/q91La1JNgRsE=;
 b=DSvFOXiy/7XKZZHiAjGZ7nozuCmnsz9x8dQG26jU8FoM0PlTRS0GrvGoWVbeEl2syK
 X5+56em7zyohh/nVTYLqruNHzfb7BjnH3XPDsK2pxYU9XGeF4JJdfXQTRpgCp8xOHsDe
 keUZrrCyhFThXg+U1kXsYVhsyPcq9ZafcufjQugmNMTVMBPzMkXj6OtJaKtP4qvTqmp/
 bDW/fyM/NRXOVoRGtkcR++WVTxx53Hi0H9bIwuYYcJK7EINLkK4GSVxhDC8rMRY15Rf6
 /DCjCN33JIG36JZpHImZsmmBleiQL+WU1YNNy/7DkLQPJTB0hpTyZWuZQDUZIXjm/0Tn
 dvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CjE1ovpZ7husLhHbnrpMYisprMq3aV/q91La1JNgRsE=;
 b=C4M3KMUfQPPh4Z1kqtzdVCnVvOWudMJKwm6dUgsovWFyFRPCaPOPYdVwXoj5Ihq169
 pLY/3ai52vOVkaKFW/uRGtzyzeVzKK9hG6xTyhMmT9wyvJyaEikzZNwB9U2cDOvLTCNQ
 cyOmBIuzG/HnNwMa9gqfzj/Jv6pFjCYmi3ED+0+SkKsf2ATD8zZuLbdmIxs0MhhbNfAd
 QlPhgd6IvorhcLVbMIpaeBZ26KX8IcXleiSNnfcU9OIZlR6myNdEYhcZrTl4g7y9ppis
 ULi9Xy1xbtT70Opv1UlT85c2HZjcn1tcvBz+Q4BMeKhTrnc7FqFooSvIaGolRF4/tA3x
 cPSA==
X-Gm-Message-State: AOAM5335Fd1aQoXIhovBkDyYkqDfjPQmAfOGRBSU7d8esecxlCOGad6D
 B+D3BA3s27tk/LuZPVa2ttvuU5Xgm4FMXg==
X-Google-Smtp-Source: ABdhPJwX6B6vXqejuofTOsHF+Bb+iowM/nKSpkIjtjsCR/UGLpxcUThrsnzQ2xc1b24T2/a9mfcp2A==
X-Received: by 2002:a05:622a:2d6:: with SMTP id
 a22mr1104169qtx.111.1610998246392; 
 Mon, 18 Jan 2021 11:30:46 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id d25sm11458195qkl.97.2021.01.18.11.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 11:30:45 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] pseries: allow CPU unplug after failed attempt
Date: Mon, 18 Jan 2021 16:30:34 -0300
Message-Id: <20210118193035.2089474-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
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

This is a different approach to the problem after reviews from David
and Greg. See the commit msg for the reasoning behind it.

changes from v1:
- Patches 1,2,4 and 5: applied to ppc-for-6.0
- Patches 3, 6 and 7: removed
- new patch:  always pulse guest IRQ in spapr_core_unplug_request()
v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg03349.html


Daniel Henrique Barboza (1):
  spapr.c: always pulse guest IRQ in spapr_core_unplug_request()

 hw/ppc/spapr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.26.2


