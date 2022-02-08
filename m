Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE04AE2A8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:48:52 +0100 (CET)
Received: from localhost ([::1]:43542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXPu-0000xT-UZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:48:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nHWTy-0007QB-Q7; Tue, 08 Feb 2022 14:48:59 -0500
Received: from [2607:f8b0:4864:20::22c] (port=44558
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nHWTx-0002sf-9y; Tue, 08 Feb 2022 14:48:58 -0500
Received: by mail-oi1-x22c.google.com with SMTP id 4so147549oil.11;
 Tue, 08 Feb 2022 11:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=74l4L/x3SEESNvbIg44gDoIv3zQR75I1+Dpw1Cua05c=;
 b=OwyYOBcBPBDsFA93v9S39niW02ukrsTWxmICC8jgYgC+2UppP4a+2xhuTSnDxQme24
 bRsMdJVn+laT6uCVYGkcGPJd3WC9hnzQKS9ifLNWzX/Vg7aKfUldkT5l98+esVoqgMnU
 MvJcu1fssnBGn/PRa2AY/P8ao5Uw/erO8L26+RMlsrKVhrW3BWtpTkLUfVcTYKkjTKBv
 rk4Z25vmhZzN1gvE+pHTu3Jev3oaLfVlA5kOZzcMITvxJ+pf0pRESASby/ZFqn1pMG6K
 vu4oX6U3OXgIPyh3gHBwGU1cy4zdRBc3Byh+Evh9+a0EyixTF4pMVSiF8i81JO70p8gt
 mjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=74l4L/x3SEESNvbIg44gDoIv3zQR75I1+Dpw1Cua05c=;
 b=2LFmM2g0BhDr9PO/9oE5SNuq+vu/QR0rEwPUGfSxdnyTR2LKuJBITgZPMtyZ68ciA/
 0Ylb4mUzZAikaaftnL3N7zN/cMgU3y8ItQQcaOM8ITrjFkUdhstV0SOg9CGtDRCkuOqj
 7nuM6VtwTcdQ0G6xnwtx88Ttyc77HrC+URrkpKgmW96s08STosABWCk/FO0+ilfphnd5
 gXd75wLsgWfDt+PCHP5VhCNlFxdTTeRPt1exGr7Q9hp+F0IKTQXaZgv3cDFBdNlO4n60
 PE+MZQJEX56ClTo190+NVAe17Wv9p1/AWV8N1l6MZ40lhp/yMpxU9TOvPB56kOmYkvkf
 JWPQ==
X-Gm-Message-State: AOAM532YkIU4QNAGNQ+eFfTv36Fb4SOSIkfJ2zSOnVU9zrj/yalpxYVH
 wJuSvTTpCaED4z3AqeHLRonk5i7pW60=
X-Google-Smtp-Source: ABdhPJzUjsCtdGPsrhgNM+SSt5BHD5SqZECaRI81nK+UI+APeE/rL6AyQqcTFDzLmYBakLbfR7GLsQ==
X-Received: by 2002:a05:6808:140c:: with SMTP id
 w12mr1369474oiv.265.1644349734511; 
 Tue, 08 Feb 2022 11:48:54 -0800 (PST)
Received: from rekt.COMFAST ([191.205.140.35])
 by smtp.gmail.com with ESMTPSA id s14sm6012592oiw.42.2022.02.08.11.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 11:48:54 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 0/3] PMU-EBB support for PPC64 TCG
Date: Tue,  8 Feb 2022 16:48:35 -0300
Message-Id: <20220208194838.169257-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This small series finalizes the pending PMU-EBB support for PPC64 TCG.
In theory this would be a re-send of patches 09 and 10 of the v9, but
those patches were so off the mark with the recent exception changes
that I ended up discarding them and doing from the start.

Patch 1 is a trivial indent fix. I've read a lot of code in excp_helper.c
and this mis-indent was being annoying.

Patch 2 is the last bits of the PMU specific code before triggering
EBBs. I chose to do it separately to not mix PMU specific code and
EBB logic.

Patch 3 is the re-implementation of what patches 09+10 of the v9 were
doing back then. The most significant change is that we're now gating
the exception before reaching powerpc_excp_books(). 

v9 link: https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg00073.html

Daniel Henrique Barboza (3):
  target/ppc: fix indent of function parameters
  target/ppc: finalize pre-EBB PMU logic
  target/ppc: EBB exception implementation

 target/ppc/excp_helper.c | 59 +++++++++++++++++++++++++++++++++++-----
 target/ppc/helper.h      |  1 +
 target/ppc/power8-pmu.c  | 48 +++++++++++++++++++++++++++++---
 3 files changed, 97 insertions(+), 11 deletions(-)

-- 
2.34.1


