Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854AD4BA507
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:54:17 +0100 (CET)
Received: from localhost ([::1]:47434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKj6m-000470-KD
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:54:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKiUI-00082z-F0
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:14:30 -0500
Received: from [2607:f8b0:4864:20::533] (port=39731
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKiUF-0007bO-DD
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:14:29 -0500
Received: by mail-pg1-x533.google.com with SMTP id 195so5285932pgc.6
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 07:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pb3VDZqqLzrBO2foxXQoL4fhH6fG0WDvNhMuQDci7z8=;
 b=IZphCP8SFb0r48wsdGHkR4Yh5gpZ2K77vP8oYRip5TBgMus5EuQqToQ5446z/aFPIm
 bjOuYBwYa95C6GPXSmRzH1oWo7g1KltTMYTLpxoXYsXGS3z5xsUrjrF5bqXMmPAGm16b
 OUkSsm6hmApsPz1iHxRBf9b2D63ua6zylMiWcHWMk7M3nHpHxPh+47wXxZcFuVPO5g2u
 l1BxfCUEOTBXPqe1LFQPtycLLAopW+N3M39IRbin81/dNi/vJ5kRuY+fms1+89O+8dmz
 Q+t4aaED+GoudlzqnOh/0sunAfsF34Nzjve4anOCHR07o1eYVcIkeYaNOMinBeeVDiVK
 Ju4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pb3VDZqqLzrBO2foxXQoL4fhH6fG0WDvNhMuQDci7z8=;
 b=oLR4Q72sTazYCBJoViQ1v30EOaAXP3N9MjUtNEe9hlqTyKvvUQbgwOcfq5LOG6Wg2T
 ZdjsvL+DTz+6SGyMud/nRtlEeT5yyiswEyzR8tgRz9OISIq/wyV1PelCZwoDzhppd9gc
 M73OZSe/Qbu3y+AtC1LW9/YRcK21xs4vh1YYKWh1oKiecaj5oWC8RZ4nX+3A4mypICKr
 HUegSX1+0S04QBnBGj9JnBHc07iEOYUvIEEs4x89PEEvGUkN6dYjZKulbOdCcYpaOor3
 CK0yYJRCcw6WB7fYpQZv9hhVBjpsJViIYxH404EM/4I1xqgyMOjYFFaEBBwPbEvabDLZ
 RfJg==
X-Gm-Message-State: AOAM530RkkXUxBG+GCxGozU4tqVFYwkiQcglH/KuHd+z/8EZHwZ6s0yJ
 A6k+72fQZkKUQtNJaImxiFj/aMJ9/ey4vw==
X-Google-Smtp-Source: ABdhPJyClolHQ6PyeRTikwxix6HWICd2XbiD96R2wmou3JenFhNoROo4WGqBskGO5VKgQGFHh58pug==
X-Received: by 2002:a63:cc53:0:b0:372:7d69:49fb with SMTP id
 q19-20020a63cc53000000b003727d6949fbmr2785119pgi.21.1645110865593; 
 Thu, 17 Feb 2022 07:14:25 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.253])
 by smtp.googlemail.com with ESMTPSA id z9sm8456884pgz.32.2022.02.17.07.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 07:14:25 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] fix overlapping table handle numbers with large memory
 vms
Date: Thu, 17 Feb 2022 20:44:07 +0530
Message-Id: <20220217151410.300210-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x533.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
v4: address Igor's comments on patch #2.
v3: addressed Igor's comment on v2. reworded the commit log and the
comments in code to more accurately reflect the fix.
v2: split up patches into separate patches to keep things clean.

Ani Sinha (3):
  hw/smbios: code cleanup - use macro definitions for table header
    handles
  hw/smbios: fix overlapping table handle numbers with large memory vms
  hw/smbios: add assertion to ensure handles of tables 19 and 32 do not
    collide

 hw/smbios/smbios.c | 61 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 15 deletions(-)

-- 
2.25.1


