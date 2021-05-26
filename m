Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF5391750
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 14:27:07 +0200 (CEST)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llscs-00016n-Gy
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 08:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV6-0001aU-KZ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:19:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsUx-00032Q-W8
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:19:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id d11so888670wrw.8
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8uXjHA9kguAl2uafgh4fpUXuz0c8B7cZeKcMlNX+cs=;
 b=cqmYtV7mYGhZXTpYhl7l+h7mekWMQGs1ewKwXT4lU+egPpdivvJZDB85zpxGa3xpgC
 lPTPoQYFKjWta6d8lNOFIRrB6PZCA2Di5nFTIuVR0Kb506i27Ew6oYnGLryc3eLdm4Aj
 K095SM/dCJ696hLkccyxocprMtWlYR0+sxdCgggHDA0vg4veYn/bTekZC6acjK3Jomz7
 MP+HXUpKOOY6UXHSxNvBrMk/9lDb//SzjQglupQNhOoxLh4gqO9rLw5JBDUO/1tok4YC
 ba0uGsxHFead6zyj2ISrjaGLxLrsiyW91DaO9RwxKetpxfvKJb/xIIy2HqU78rIzLBZL
 qZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8uXjHA9kguAl2uafgh4fpUXuz0c8B7cZeKcMlNX+cs=;
 b=W2uZ2dT8p7fs4bpr29hwHZM9LC+Wm3D+zQgNokI9aWZciBkMQsalzmeCWK8obVoSrR
 qvN2a8/AO2+Hu9qKdtuS0jrATcySYlB6rceo28Vv0+KBXfhxt5DBkKn1nAddZ5WmwL1I
 uZ86KD1N+chrkxEgSAJySXRRhl10We7seAT1k9h/Pf9QWipLRsTAdiU6hv81zLV5Fgvq
 Qo43Nf3eMNKtxEy9EDnbqUdzqNWCwL7pACU+ZSkpXe/6hSts9cyO7YbSVjN98vx1BWDy
 In5T9Bp628cfhyH5K/eaeONDSuATspyoWdpJIwemdVogNJra2L8O9vlwYVtBJWzVDFxe
 dMIw==
X-Gm-Message-State: AOAM5322y00nSq+Gpt9JY+dbJrVxf/qVxvAr050PwvN4d9LecuFTx5ON
 DyPlfoTpIpUy2A3y79E1gn+YLg==
X-Google-Smtp-Source: ABdhPJyIDidZRkSQt3IXL7Pg6HAuJYOWgsxF2SrOVbTfgAAcxwrBTrQm0o1E1lxCRWSU1mWZN8DkLg==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr33493825wri.41.1622031532062; 
 Wed, 26 May 2021 05:18:52 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id e22sm14288539wme.48.2021.05.26.05.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:18:51 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2 0/4] target/arm: fix missing exception class
Date: Wed, 26 May 2021 13:18:43 +0100
Message-Id: <20210526121847.1935454-1-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jamie@nuviainc.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jamie Iles <jamie@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Peter for the suggestions, I also added a patch to switch a 
couple of cpu_restore_state+raise_exception pairs in stack limit 
exception handling for both v7m and v8m.

v2:
 - fix raise_exception_ra to restore state before raising exception
 - remove redundant do_raise_exception
 - remove now redundant open coded raise_exception_ra from MTE and stack 
   limit exception handling

Jamie Iles (4):
  target/arm: fix missing exception class
  target/arm: fold do_raise_exception into raise_exception
  target/arm: use raise_exception_ra for MTE check failure
  target/arm: use raise_exception_ra for stack limit exception

 target/arm/m_helper.c   |  5 +----
 target/arm/mte_helper.c | 11 ++---------
 target/arm/op_helper.c  | 28 +++++++---------------------
 3 files changed, 10 insertions(+), 34 deletions(-)

-- 
2.30.2


