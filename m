Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB9449CB4D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:49:21 +0100 (CET)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCifo-0002kJ-3D
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:49:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCiYZ-0004zx-Tt; Wed, 26 Jan 2022 08:41:52 -0500
Received: from [2607:f8b0:4864:20::231] (port=45701
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCiYY-0007wT-9g; Wed, 26 Jan 2022 08:41:51 -0500
Received: by mail-oi1-x231.google.com with SMTP id m9so23028590oia.12;
 Wed, 26 Jan 2022 05:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1aMDyXVNl+Q89TONDYyxxOTKb5/Fd8facUbPdhQo0Qw=;
 b=folZald2qvLI7Asa+UW1G4GXpSOre5mpiCa2tRS9OkH5nEg35ozFyHIVeoaridL5Q0
 aDMBpzUfQQHvEfArZvbrqWK/xhYBHu33upz/TYTYTLBp3SLG4ixcBguMqMYRAB2a1g0+
 VaZLzllAPWw0VI4HYb5fDx3cxgotV+d/eu67dKipkgc1fQ/B2t7SS59KApQHZMrmSv+w
 KQcQPAdaHztvhjtd6TnMdioFmg9sZQWnYw7/jB9nPM5k7sYyqYxIeyOBvIVRVnJaFugA
 NDr5H84yRsTs+JpS8WVsqtaTW7gfmIONdkj9NDAmSrrsMiaR7OQfvjOLQT64LQ8Lz0d9
 MuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1aMDyXVNl+Q89TONDYyxxOTKb5/Fd8facUbPdhQo0Qw=;
 b=TJUPGXU8SaoBUfKPMwVUT+L1+xHkUtvPkI1bCFrCrbowrP/namZ0IocgIesVia4qfE
 5L0YkwOykkDCljMVGnY+V6gtJ2U+Snb65z2GjKI9hpqf/ZGs1e5lySb7Yiw7LzL9fBZt
 lKoIGzmV/R9QFrn/eJf2NpvVQBnXj/s8DLRakh5P0nZhQFICL+1WoY4h7Uziy1O6iswA
 EMZHHgjwmHZJuLDmHxxZth8ar7PiCgYu/LjspvmD0Xpyzav2SrkHGF1P0Z4om6Ic/jfF
 vfUM7WEL0DCrAIv9qflHfRPHtfgz47yq6K/4kL+lsMtND1WL26N3Dsz+GzIcDhP/LFq3
 3AYg==
X-Gm-Message-State: AOAM532HnYHDfWpFHmBLiOhQ4O7/qoKkS9DH3UTZbyBfhBJWufmV6qK6
 SV/XPvJ5xp+9tLqQvhVatRo3fsnYyXg=
X-Google-Smtp-Source: ABdhPJyfcSX6TwHoQoYBmTCTlmVEwMYR9CDg9m4Ss3leWYCYSII7W9p6dv2Y5cxwOrUPDY03hmyyFQ==
X-Received: by 2002:a05:6808:238e:: with SMTP id
 bp14mr3808507oib.317.1643204508468; 
 Wed, 26 Jan 2022 05:41:48 -0800 (PST)
Received: from rekt.COMFAST (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id v26sm4939342ooq.20.2022.01.26.05.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 05:41:48 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] initialize 'taddr' in pnv_phbX_translate_tve()
Date: Wed, 26 Jan 2022 10:41:35 -0300
Message-Id: <20220126134137.791968-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

First patch aims to fix https://gitlab.com/qemu-project/qemu/-/issues/573.
Second patch is the same fix applied to pnv_phb4 code that presents the
same potential issue.


Daniel Henrique Barboza (2):
  ppc/pnv: initialize 'taddr' in pnv_phb3_translate_tve()
  ppc/pnv: initialize 'taddr' in pnv_phb4_translate_tve()

 hw/pci-host/pnv_phb3.c | 11 +++++++++++
 hw/pci-host/pnv_phb4.c |  8 ++++++++
 2 files changed, 19 insertions(+)

-- 
2.34.1


