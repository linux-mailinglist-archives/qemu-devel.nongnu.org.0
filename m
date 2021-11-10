Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5EC44CA9B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 21:27:00 +0100 (CET)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkuBP-00063A-1C
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 15:26:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mku9w-0004XG-UG; Wed, 10 Nov 2021 15:25:29 -0500
Received: from [2607:f8b0:4864:20::935] (port=38706
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mku9u-0004x6-Py; Wed, 10 Nov 2021 15:25:28 -0500
Received: by mail-ua1-x935.google.com with SMTP id o26so7424212uab.5;
 Wed, 10 Nov 2021 12:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCfASwU9VsrNlNXfjJIWpHILpq5Y8sdhb69oamNNBfY=;
 b=WRMUwJZObGe+LGF8jLtgEJK2BvrSD4+EIpc6WbLZisRjHhhxogiE/aukfWOXt0n527
 JIeGfhVcgp1H92GsaOk6G6uSbKpP03JgAwdOfkOb1wEBHkT1WPOJajVXUnKyONsHpVax
 6If3Xx2Qd/COqquJDkIKNJf1QQS3r4mHytvxYvQGP3+DXPoECMigLOUzmFuvxN4UVE6E
 Meof4gux+nGoNj3S/bopTY5YzcBZAtQvHK5lkcjEgog0tI6RlKtoWwwEPurTTPpFyLPQ
 QYcLRiySa5/HPFmWxFFm8trZkCbIYI7q5YR6ZP3CSfAfsx8QisIyWHDMgZDV+72PJJXZ
 Tsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCfASwU9VsrNlNXfjJIWpHILpq5Y8sdhb69oamNNBfY=;
 b=uJoqMEHXq8WiemLQmDCidS9Sw2nq8uvNTS7qBbRpXLPNMYVfOpOT2RMlxu01CtyBoJ
 bhdXiuTdkCs5Gk/sS2XoKDMWTtcAR4bqn2G3rd5qgYrRNN85+UqwRjSugHfVwSB9KcU7
 w+VGy5m7rpGaFGPayNZD+VoWxnhQYOibSz2aUKVigCeLLjE7b10WYqjfxFXao+Rlttyg
 q8rSIAskqwv9e+I2T+rSvM9R/Nn+QajTj+YVTnEOm27FZulRr9ShVlrx3dm7B3WPhC2Z
 ul6RfUr4nzc5ID3Owczh3WZJCM2s0/Uf7CxrGE37/lDSHlLAsTTQ7Y/KvVnGcPqsAUVu
 M+jg==
X-Gm-Message-State: AOAM530jmR9Ko/5UI5OrnJiSC2ySPeY7lcy4FBpN4Ftr4pFb3J78NmbJ
 EyQXhix5APfMthdQ0foEu59XYZ2ZLBM=
X-Google-Smtp-Source: ABdhPJyLExoSE7a5uBOP2MshYofnM82RoUPnGR3lA/9SteRrvXhePK+sCirfKVCsyNPqmA0EDUSBuQ==
X-Received: by 2002:a67:dd12:: with SMTP id y18mr3160206vsj.56.1636575925190; 
 Wed, 10 Nov 2021 12:25:25 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id u125sm679029vsb.4.2021.11.10.12.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 12:25:24 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] ppc/mmu_helper.c: do not truncate 'ea' in
 booke206_invalidate_ea_tlb()
Date: Wed, 10 Nov 2021 17:25:15 -0300
Message-Id: <20211110202516.1993815-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, f4bug@amsat.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

In this version, 'ea' is being changed to 'vaddr' instead of
'target_ulong' as suggested by Philippe.

v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg02438.html


Daniel Henrique Barboza (1):
  ppc/mmu_helper.c: do not truncate 'ea' in booke206_invalidate_ea_tlb()

 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.31.1


