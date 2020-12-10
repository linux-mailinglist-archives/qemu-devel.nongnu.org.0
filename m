Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791A32D5CE0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:07:46 +0100 (CET)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMbh-0005C0-FI
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knLfb-0007k8-A1; Thu, 10 Dec 2020 08:07:43 -0500
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:46160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knLfX-0006Fr-6o; Thu, 10 Dec 2020 08:07:43 -0500
Received: by mail-qk1-x741.google.com with SMTP id d14so3946491qkc.13;
 Thu, 10 Dec 2020 05:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a84nTp4DZ+8jZgGQiBVuv7ILzRk0ryR91U6XmleK49I=;
 b=EOBIBwCCmU7IvWCqL2HDuoYpkhbw2f7iQu5dGuWNwh3ERalfzTBqh4SAOj7aGuGA3b
 PPV8n3L2ADPIBy2uMCwLHiWL9z1h7s8WgHkaGXgRvz4pGINjwwAVD/m80S7TItmIMExZ
 5akhOrd1+Y/dlNn63Edo3n6CFapHTDZdP9xaG7+a03EMbzhqq3DpTrWt34gMrrtqxtar
 OrAFFz/nhghrExoAJLLWzqX/sXTLwBFBlI9CqUgqqbunT2+Cx1Q0yCoH9f8lhYfVgpf5
 vcaJ47kRyRYB8WzEYbDucsGV/sWZ4gv/FqJNGyZX1RA/tVaa+h2MYs6XIqPbtflqmHgv
 2ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a84nTp4DZ+8jZgGQiBVuv7ILzRk0ryR91U6XmleK49I=;
 b=ex3KvXjxC+mTin+IRYJkmHHMBBs7Ot46H6qwVZN2peOF5awXprEr6gN7Weu1rCtKqx
 3+t5Vrl8fNTl+IcVIwP37Vfncmfi6ZjeBFS9UsCwHpicVaCOR9xV4It+24xDZwuEii2f
 NlDzBZSJxX2MLS/IQXNJbLI2+D9dkHqlH2SLht07KWhbsAhvLPETf4bCP8ekYzWtpTOX
 NmmjcqcVanCHT4dtV7UpDvVk68KSN+xQ3s7snTPxD9h4yJ5B6kTuUMd7u6xbX7+yS9x7
 wz/Aiwr6vO2fiTAytxiQvzvPpczzJ1erf0JT/6WJjb0afrHDzRmh60Z28J/HMsq4AZco
 hlkA==
X-Gm-Message-State: AOAM530bOo6B6sfh6c+jTjYK6UWxc8fJNiXBEEmPPxP6okWEIbjpEC8l
 UoA+DavuoYzY77iLNLe7vq+HDLMNe7I=
X-Google-Smtp-Source: ABdhPJyWdyRLgsHmXTkVIIqqoky2tuDH05AiTCQLRFY6TM1/831FVCHo6+Fy4qIpnQVW7Wql2NkMpw==
X-Received: by 2002:a37:8943:: with SMTP id l64mr8590914qkd.212.1607605654682; 
 Thu, 10 Dec 2020 05:07:34 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id d66sm3594914qke.132.2020.12.10.05.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 05:07:33 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
Date: Thu, 10 Dec 2020 10:07:20 -0300
Message-Id: <20201210130721.1521487-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x741.google.com
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

changes from v1, all proposed by Greg:
* Removed comment at the start of spapr_get_kvm_type()
* Added a one liner return in spapr_get_kvm_type()
* use g_ascii_strcasecmp() in all str comparisons in spapr_kvm_type()
* Exposed the 'auto' default kvm-type mode in the docs
* changed HV and PR to lower-case in the docs
v1 link: https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg01677.html


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

 hw/ppc/spapr.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.26.2


