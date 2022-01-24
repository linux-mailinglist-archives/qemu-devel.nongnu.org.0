Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E8499BEE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 23:05:52 +0100 (CET)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC7TD-0001U3-9C
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 17:05:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7RV-0007oX-74; Mon, 24 Jan 2022 17:04:05 -0500
Received: from [2a00:1450:4864:20::32e] (port=38429
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7RS-0002dp-B1; Mon, 24 Jan 2022 17:04:04 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so296444wms.3; 
 Mon, 24 Jan 2022 14:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e51GsTzBDNbiyWOiw3H0IFkTC5RFdot3ND78qcUi7ac=;
 b=phPty1hj8y4voHV0WnsCK9hU74HuSaXMEZDQ8uFqDDXyHNEbf+Fwdfx2gPoKb55vMS
 K4yYJ63Qar9728Nv/2F0ky77Nd6JxT6UNLUIosQu533X+rz09kEwLvDaHDwE0oV6toeX
 zr/2XlOWQ2+EaUiS/D5gLLblaJlDJN56TjTWj7fvl0nuO3y7xNomBsJasm4Y8TBu6Qup
 5S01XA9xRYRACfGTikEKcUjMn0a6ONZuty3sELWjPvXI8fBpd0tBFBP79dF8NtFQbIfk
 flptRSa4cJJQhMHxgPmziYvRdBSmTP2NxC3MG3URWajoWwmvrybx40BI1TO9UKTiGTlQ
 y86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=e51GsTzBDNbiyWOiw3H0IFkTC5RFdot3ND78qcUi7ac=;
 b=pFi/Wt0rRyCVSWqF02fyNuDt1yVrbBEAd18c+THthvuEcHEBxqV1xnH63X3R157IOB
 aLIMtRTwVwkYmgJosmwoSAeBgJNcBM+Npb20lNUmimrP7Mri/wm7IGQRAaai2tIx39lE
 yvb912/6IigTyKGDeXfOFFv4XDh8iXdLvvtulfIHaBl5BqUkgf373YfZ0AWdFkPuZPkf
 oY29aJVO/OOmgPP4eZCreXGksIuVJoixA02wlvx/OiV87r/wq9xIyuvAwoGfoJMyksEo
 wcED1+YDwema8TOWi3B7U0eFa9RTOdSEPG7Ux3fkCBaWqfFC4hMCdqi4CT5fLdXFU1F8
 vWKw==
X-Gm-Message-State: AOAM530tlgxqDOxILYrFESYE94VyTzAAWYaSDpYzgcIVoPt3KF0+qj5I
 Jmb3wD8w6+yDqpigDRmg9QcnlN9tTXY=
X-Google-Smtp-Source: ABdhPJwWAZ3WgJOargj9bxbzUutYLP1LU4R/IaltRC7QSPxX6wqjW5hgKpZmmpP7VyIX2A4nwlwohQ==
X-Received: by 2002:a1c:4d0e:: with SMTP id o14mr275150wmh.1.1643061840027;
 Mon, 24 Jan 2022 14:04:00 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 bd20sm490219wmb.38.2022.01.24.14.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:03:59 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 0/3] block/export/fuse: Fix build failure on FreeBSD
Date: Mon, 24 Jan 2022 23:03:54 +0100
Message-Id: <20220124220357.74017-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Since v1:=0D
- Extract fuse_allocate_*() to avoid mixing #ifdef'ry with if/else=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  block/export/fuse: Extract fuse_fallocate_punch_hole()=0D
  block/export/fuse: Extract fuse_fallocate_zero_range()=0D
  block/export/fuse: Fix build failure on FreeBSD=0D
=0D
 block/export/fuse.c | 109 +++++++++++++++++++++++++++-----------------=0D
 1 file changed, 68 insertions(+), 41 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

