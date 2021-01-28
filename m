Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803F3068AB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 01:33:46 +0100 (CET)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4vFo-0008WB-Qi
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 19:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4vEb-0007av-EZ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 19:32:29 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4vEZ-0005PE-TL
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 19:32:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id y187so3165792wmd.3
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 16:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ou3YxyswYaFE001hkAoRhPXD90JfM5pN/fMIC3IVFNk=;
 b=uB15axq+zaAL1cnliP9UBkLDEpQ/w+R+eIai+KcO6h6qApqd2A8rEJhXLEuIjStvSW
 tX3XcQWwGPU4HRPSQwP4jF7ZJZGAWkHE2JE9fIGv1kxFNtawjaib3YSiujag5+EI/5Bi
 Sis56p9urD8nz8SAeeXfBLQ82VjW6L88fMHeSvipnYONNCFo3mEVrzMe0cnkbkC43gr0
 sGh31ZDgCF16JZG3Wn1wVmoXM5QqNSOIUTEsniLDMYY/CZhYVQQcVWnQZ/uCw+luQxnU
 9ECdVASsw+MvTJZOqrR2+zLIIU3ypOjAnaBZBejJ96RujAp8ak4WiZRwdOuymbaUbzNq
 FdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ou3YxyswYaFE001hkAoRhPXD90JfM5pN/fMIC3IVFNk=;
 b=Y63+Rm51n/NQXys3dkdv1gToiPKwns26bEtGCwdHh90VpVfYRGH70sxUjJIdX+LOT9
 SEd7pgr71fDSxVVlL/D7qCFgNrCc+ADfpMYUe2zgRWwswOiHlzKeAYVOJ3OAdJFH0htw
 Bvvnm4uG/+H+HJ9J2V0W8GzOX1DpIp0DeIt48Wjczn0BHMk29TVtjlkXUcp/dry51Z1R
 HRZfdZ9fyq+Jxw6Dn5YIItLcV+mDOMugYQDFwLL3B6iPhWA6xK819JGi0jpXx3saQOED
 d7o12Gt1XNiIaM9EoDW3hI0wEMgqadq/I2p9XDFUAg4x14cyx42lWcU9ZBKaBiTN1IXc
 sUlQ==
X-Gm-Message-State: AOAM5339yWWk2HlnfKaGRp/onxcrQkDYJdmJbKLrSnNyn6gya7iQRE3R
 bBX3zd8JIyfseehbZ6mqUa6Jj0SoLJ4=
X-Google-Smtp-Source: ABdhPJwbSlaDZkFpprUqVPK1cnGfrCw46F8+sCm/nhx4YmcDmqMtatspzITeVpA8XQJJ3Oo3OXrTkg==
X-Received: by 2002:a05:600c:1457:: with SMTP id
 h23mr6318456wmi.30.1611793945710; 
 Wed, 27 Jan 2021 16:32:25 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h125sm4165564wmh.16.2021.01.27.16.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:32:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/cris: Pass MMUAccessType to cris_mmu_translate()
Date: Thu, 28 Jan 2021 01:32:21 +0100
Message-Id: <20210128003223.3561108-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Taking notes while reviewing commit 671a0a1265a=0D
("use MMUAccessType instead of int in mmu_translate").=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/cris: Use MMUAccessType enum type when possible=0D
  target/cris: Let cris_mmu_translate() use MMUAccessType access_type=0D
=0D
 target/cris/mmu.h    |  2 +-=0D
 target/cris/helper.c |  4 ++--=0D
 target/cris/mmu.c    | 31 +++++++++++++++----------------=0D
 3 files changed, 18 insertions(+), 19 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

