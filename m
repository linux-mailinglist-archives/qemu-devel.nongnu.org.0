Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C78248B8C1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:40:56 +0100 (CET)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Nws-0003mz-3R
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:40:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7NL8-0007aT-Rj; Tue, 11 Jan 2022 15:01:55 -0500
Received: from [2607:f8b0:4864:20::92a] (port=35697
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7NL3-00018S-04; Tue, 11 Jan 2022 15:01:50 -0500
Received: by mail-ua1-x92a.google.com with SMTP id m90so723343uam.2;
 Tue, 11 Jan 2022 12:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oN1WRMN6ljPymAGtIfzbWl04XWTvtX2WU0N8dOQ+aGE=;
 b=SM+de+vJpYlZAAd/ZWL4OCS8opCtTJTzYeNgMrnxqlvWYNedTPgnCn/39XkpNIPGPS
 2uYTv5Ho/Y+g7HLIOyrnBc3hqqYuWM0bDynnHQklZ4n5Imyg91XDoIiqMR5n54Wg6AlV
 7LgkPuQSTLqxtsJ/MUX1/N0C3B0GCl2azzuCxvogfyhkN8m+q34B/TlwciUsuQNg0Lxh
 Ff4IfiD21ROFm1DL9+fd0a+9rC9pQ4qkF8RlXBniSXYWeLPVkUlu77PrEyuysYQ3NEFc
 kjholeOpzMRlb7QGUkiwhnO2adS/5N4SUSmDk1NSfgYpWyPp+NtC9UnwocUZLq0R68Yt
 X7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oN1WRMN6ljPymAGtIfzbWl04XWTvtX2WU0N8dOQ+aGE=;
 b=JQp1/WyexH2yVaCU0msQACXBmfFFy+cuDQ8wBrZnjJ0F7hJ2gwAnH/PWY0CG3sn7qs
 l/XJfg8Z/4qKCFpKqed9PODkuG7untaulibvN5A4FiHAPDDfK01CQ+m9GqshTefb/50F
 lkDzDulDPKqn3l3zkoHMN7Wl6WdW+1Qax9DBNOhXjFwqyRkD3uLb8h+mCPo2dbwDaF2v
 ZSC0Ce38KfTIfA/3J+XLt1H8EToI+uqiK6cAesM5Z26WkIp7zZmKhKP5j9dQiv5gXFYX
 ujGvhFTM5yrcWqywFvW6/7sBD95MTHH7zdB2x5qw1gf3oC+I5wKeQFid+S0o4HcJ+jXj
 QkqA==
X-Gm-Message-State: AOAM531dbR8H3Uev13Aa7lp1gWQUDtN/AC9OXNvIqpAwNXof4TKVJCKI
 eX9usj7EysmLl64VKpSTRLGIyTy2k9eFyS4Y
X-Google-Smtp-Source: ABdhPJzzzyAXGiw62aLkJ3dkU1K5U0fo/mhbzlXjNGxOtaa4gignNvk9RH7N793OC6uFdjVLLXnlKA==
X-Received: by 2002:a05:6102:e8f:: with SMTP id
 l15mr2785734vst.30.1641931301748; 
 Tue, 11 Jan 2022 12:01:41 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id u33sm6430734uau.7.2022.01.11.12.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 12:01:41 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] ppc/pnv: use stack->pci_regs[] in
 pnv_pec_stk_pci_xscom_write()
Date: Tue, 11 Jan 2022 17:01:31 -0300
Message-Id: <20220111200132.633896-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is something that caught my eye when I was looking into the
instances where we need stack properties versus phb4 properties.

I tested this fix and it doesn't seem to impact the boot process
whatsoever. Tracing pnv_pec_stk_pci_xscom_write() shows that the writes
are being done at early boot and then nothing else. There might be a
future bug that we're fixing beforehand with this patch as well.

At the very least the code now makes more sense, at least in my
estimation.

Daniel Henrique Barboza (1):
  ppc/pnv: use stack->pci_regs[] in pnv_pec_stk_pci_xscom_write()

 hw/pci-host/pnv_phb4.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

-- 
2.33.1


