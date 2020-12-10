Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A53E2D5EC3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:58:04 +0100 (CET)
Received: from localhost ([::1]:39494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNON-000719-0F
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knNLv-0005Qr-2Z; Thu, 10 Dec 2020 09:55:31 -0500
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:44747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knNLt-0000Dn-Ao; Thu, 10 Dec 2020 09:55:30 -0500
Received: by mail-qt1-x844.google.com with SMTP id u21so3784952qtw.11;
 Thu, 10 Dec 2020 06:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3T/xx8BxsbUIawVPQVEIKoqgmKBBcveomridufBtqNc=;
 b=gb7LzZ72LkZDMDyS1jOT0RnajlIY1Y9Nq4UHdRV3e0gDTd23cmeZ610/QqqK4QPnOS
 NrL0/4aCG6NaSDZcRRT5WaOt/MyrirwBrK9YyGS0jTF7NuitMHmzlZfkHPJr/sZcz0Fq
 i2z7y/a8okRmYSttZsGLwRylMurpo4n+nrMyxogpglRKtU1OsVTWaPw2gZY920juRnnf
 BUdhAk6ryCsvuhE9RO3CbTltjx8uekKEftf45lZxvJdnFxF/Hzb8SplcCWYzbI4xC9RX
 nOKvgDxap1pgAjzwqqF5zxHhdVPgFXkBaQ4sHIoKd0PC99y3F2+JAFSA3YEq520ocPT1
 zMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3T/xx8BxsbUIawVPQVEIKoqgmKBBcveomridufBtqNc=;
 b=jGVd668AaNdzBbK8UDGyo8ckjCl+bfsEJWG1zmyIl0NBCZjWQmKvwvzEFmSWuZ0fnt
 zWr5JkYpRDbmvPeGaw77If0SjW5UeWnkmW6RCv95X0/pbDerELVJ82QscSCeLD5F2klF
 qh5Vcbhvacwhs8RepfLBq8wyuGSyhn3D3Z0ZusbjcxPqr6wXhDFI14xvHfN+VRvu3RLe
 emRWZ24UMkMMD8Bklxtn+/pMpiLsW6AU6e0uUlf2BICr3RFPI+8jyHbFnCqhUwR5g94r
 GxliVdGBnzTeREiK/yAUMmGcjPWit/OxOiXo1EQ4/JqmzgINLXuDfo2sp8mHOdOceUlK
 6Hwg==
X-Gm-Message-State: AOAM533F0rLkYJ4fr6IVSTSckWItMggd4AL/gFyA2ziBhvFWpAU8q8Mh
 VM6eYDH93oBKTRx2s3n3fhr0Hsf4V8g=
X-Google-Smtp-Source: ABdhPJzP0f6xLqKFEyhUl9iO+XSu2QosuBlJcbbIzMCG5wpSRbuvXzcEHw4AuUxQ8YxsirMXw0oFFQ==
X-Received: by 2002:ac8:5982:: with SMTP id e2mr9305291qte.257.1607612126386; 
 Thu, 10 Dec 2020 06:55:26 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id b6sm3592534qkc.128.2020.12.10.06.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 06:55:25 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
Date: Thu, 10 Dec 2020 11:55:16 -0300
Message-Id: <20201210145517.1532269-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::844;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x844.google.com
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
Cc: pbonzini@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

changes from v2, all proposed by Greg:
* Handle 'NULL' value as default mode fallback in spapr_kvm_type()
* Do not allow for 'AUTO' to be a valid mode in spapr_kvm_type()
* Initialize 'spapr->kvm_type' in spapr_instance_init() like Paolo
  proposed. This will spare us from changing spapr_get_kvm_type()
  altogether.
v2 link: https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg02623.html


This patch addresses an issue that happens with the pseries machine after
testing Paolo's patch [1]:

$ sudo ./ppc64-softmmu/qemu-system-ppc64 -nographic -nodefaults -machine pseries --enable-kvm
qemu-system-ppc64: Unknown kvm-type specified '' 

The reason lies on how qemu_opt_get() and object_property_get_str() works
when there is no 'kvm-type' specified. We were conting on receiving NULL
for kvm-type, but the latter will use a blank string "". Instead on relying
on NULL, let's expose the already existing 'auto' kvm-type mode to the users
and use that as default.

[1] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg00471.html

Daniel Henrique Barboza (1):
  spapr.c: set a 'kvm-type' default value instead of relying on NULL

 hw/ppc/spapr.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

-- 
2.26.2


