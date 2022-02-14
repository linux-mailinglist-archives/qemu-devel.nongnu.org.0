Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F814B5399
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:44:26 +0100 (CET)
Received: from localhost ([::1]:52762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcaX-0007FT-EQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJc6F-0002Nn-Cs
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:13:07 -0500
Received: from [2607:f8b0:4864:20::432] (port=39652
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJc6D-0005EH-8u
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:13:07 -0500
Received: by mail-pf1-x432.google.com with SMTP id m22so10212694pfk.6
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 06:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycavZoZPX7J3Ozv02qmlnrxXATVX1+vVJSq0ZPIAwe8=;
 b=b6NkQxRhskarvI+BgzgNcRaV9Qo/8mx1HEUsuToarVZkSn1ktPt87E1aO8SYI6ArTt
 sHIVLP0kswcDWc4w61VYvVb/c5KKQC2ZLhBRjTbH5u5Qpo6E5dUokP/edYM2NhKlu8/X
 8ZPQ+7vGpSk//t2p8pxOPiFCvCkG7xskn1KmzdirqOAQqcXnfOs3GVfulRPVd5kvvavx
 VZZbrK2tdnYkuKxasWkC1bLn+SXJMYpudNnHWZq24t3Op6EcCwjeXlIOVCXF3ISCDaXw
 1179yNVRYXPi0OM0sCNeH5717eU8AfdGPbzKbFvcX0bB/xS4bvs6UYdDRAPSo7dUHi/K
 IL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycavZoZPX7J3Ozv02qmlnrxXATVX1+vVJSq0ZPIAwe8=;
 b=tOeh9QhN0zKQQeP5rVxrY6r5OQ19+Vw5ywiXZaOaYTchb6flPawJxuI3xhruHbQqnp
 4RnS60bjdBdvE1/XPhChrCipZBCu58DjbN/PFVjNANuA/tkooGrL+qhauBSoqxfuiOrg
 vRTplXMiA6ZN9jiwkuSvnTkYExTGhdY4L23cG9bpS2HxtycUS+B6T/JnYL/7TK1xtyS9
 yRA4kVQAwNYFYsSgq5mR4JBjqot5jA9rtmAS01e+LB7TvUK6x27LjKS5qbbrSZFfFeh5
 IaaQ+Q/W+D3gmpe4+XdtZWkYNLe5rBDyDWQ5v64Jr0NrHMRZk5hhY/Mw54s03yI6/Hsv
 P+RA==
X-Gm-Message-State: AOAM533eeAOASSm7eZOvnu9p1mywwsDKvWCBfIUsWSVjqWqJdl/Eup7P
 UovvfCN4Ae+jeZ4h0LYoKKa+bxCgigNC7A==
X-Google-Smtp-Source: ABdhPJyIWTk38h5rTf+97LhoboGh7n9DlCFgP4QZG7FIdw7QKE0p1mzuyXaHydxvHw107GtLww9TXg==
X-Received: by 2002:a05:6a00:170d:: with SMTP id
 h13mr14628624pfc.39.1644847983673; 
 Mon, 14 Feb 2022 06:13:03 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.127.101])
 by smtp.googlemail.com with ESMTPSA id hk3sm9808340pjb.12.2022.02.14.06.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 06:13:03 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] hw/smbios: fix table memory corruption with large
 memory vms
Date: Mon, 14 Feb 2022 19:42:33 +0530
Message-Id: <20220214141237.47946-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x432.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset tries to address the issue raised in
https://bugzilla.redhat.com/show_bug.cgi?id=2023977 .

Patch 2 and patch 3 are dependent on patch 1.
Patch 1 makes some code cleanup to make thing more readable and also is
a preparatory patch for patches 2 and 3. Patch 2 is the actual fix.
Patch 3 adds an additional assertion because of changes introduced in
patch 2.

changelog:

v3: addressed Igor's comment on v2. reworded the commit log and the
comments in code to more accurately reflect the fix.
v2: split up patches into separate patches to keep things clean.

Ani Sinha (3):
  hw/smbios: code cleanup - use macro definitions for table header
    handles
  hw/smbios: fix table memory corruption with large memory vms
  hw/smbios: add assertion to ensure handles of tables 19 and 32 do not
    collide

 hw/smbios/smbios.c | 61 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 15 deletions(-)

-- 
2.25.1


