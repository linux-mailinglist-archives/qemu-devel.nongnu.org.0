Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1BD5692AC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:38:12 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Aqh-0006Ld-6A
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Akb-0003Dh-Dh; Wed, 06 Jul 2022 15:31:53 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:39771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9AkZ-00066y-Jt; Wed, 06 Jul 2022 15:31:52 -0400
Received: by mail-vs1-xe31.google.com with SMTP id 185so4965431vse.6;
 Wed, 06 Jul 2022 12:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+2ErXrxCB6qXTdbl6Z23IWoWY80UDA/nNV+z5Tt2UyA=;
 b=FErryH/nHZK7aKQdLuYW+BCbSNRXK64NYVEiQHhF/cQmQmUjrNreVPYm2I6n1JY32Y
 lcEYkV6vtn9rPqNhogi8KlCj0L+mjTad5VTTi5QsJqHb4CbrZOuZGB4525HyqITzBhX2
 EKlrlTediGDLwMY7SCIrkTtaY7ZBgEh+JtpsT5XAyWO0HI9Tu3BIMgHMf/LSePRw8iRE
 5nn7xIS80T1/vEvv4ZhIJ1smlt5+WaXjU4lhTgyTPh+EAipKMR7nHD502UC0u7Yv5l3I
 y11nHiGXvrjud0l69cj23umEKpCDcVrz/Se91YWaV6Hzih28iy6HmnnDAN9N1p9Lf8I/
 VyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+2ErXrxCB6qXTdbl6Z23IWoWY80UDA/nNV+z5Tt2UyA=;
 b=5k4oCFULeY/PgaxyybjTrydFDuSFJwE49nJozKBpDjBOJ8pMj1h0iH5Cj/lLiuwxpA
 AFS39TzGEjZEP4777ZMrW8ePeNSKYeI2FHBc3ZjOzNs/c1kPXa0xOMBmlUr42PuElRa2
 lP3hN48BnZSWTmj2m70vaI4+QBL9jjy+YiCjaZVAC1gRHqHJ0VTp+9QjoMnwwElg9Cbc
 3maS3Mv0URjuT2Hz2kb8oCLDE/key6Lez0Xdqz05hoeAHBSKxZcLbQxA9IYbPWyRm5QR
 VeA/k+Tbz/U7XZ+9DqbQfsEsG10URFCdspzUkbcr86rQETQ2601+mAjEn0Eh6ojMrpOO
 8Wyw==
X-Gm-Message-State: AJIora9TExMJqY7l5y2yfsV5/N0vxeY0HzkRw4VPlzoQjP9O5xfd7h6l
 B44M0HPTZSV4h9mYix3z5GVtRZNOlMo=
X-Google-Smtp-Source: AGRyM1tISyUPn1MVpCbxuwzhgy7Xwkb5qIOFtXPdLBZAAKWH2j2exZXGGvEoTMpt4xyULBX3fx0nFA==
X-Received: by 2002:a67:e3da:0:b0:356:ba54:fc28 with SMTP id
 k26-20020a67e3da000000b00356ba54fc28mr10579747vsm.77.1657135908559; 
 Wed, 06 Jul 2022 12:31:48 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 p2-20020ab01ec2000000b003828ebf6b49sm6034791uak.4.2022.07.06.12.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:31:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 0/5] cleanup error handling in kvmppc_read_int_cpu_dt()
Date: Wed,  6 Jul 2022 16:31:35 -0300
Message-Id: <20220706193140.468009-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe31.google.com
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

In this second version the biggest change is that I decided to
error_fatal inside kvmppc_get_clockfreq().

After the discussions in v1 [1] it became clear that falling back to a
default value when 'clock-frequency' is missing is a bad idea. Not because
of the default value per se, but for the absence of this root node
property in the userspace.

This assumption works fine with pSeries, the most used KVM platform we
have today. If this change causes a legitimate regression (i.e. a valid
use case where clock-frequency is missing from the DT and it's ok) in
other KVM-capable ppc boards, we can amend it case by case.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg05751.html

Daniel Henrique Barboza (4):
  target/ppc/kvm.c: do not return -1 on uint64_t return
  target/ppc: add errp to kvmppc_read_int_cpu_dt()
  target/ppc: use g_autofree in kvmppc_read_int_cpu_dt()
  target/ppc: exit(1) on failure in kvmppc_get_clockfreq()

jianchunfu (1):
  target/ppc: Add error reporting when opening file fails

 target/ppc/kvm.c | 46 +++++++++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 15 deletions(-)

-- 
2.36.1


