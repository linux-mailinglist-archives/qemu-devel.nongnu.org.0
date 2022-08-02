Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0DB587821
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 09:46:12 +0200 (CEST)
Received: from localhost ([::1]:34060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oImbS-0002zF-Sy
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 03:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oImY1-0008RH-L1
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:42:38 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oImXv-0004dz-WC
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:42:34 -0400
Received: by mail-pj1-x102b.google.com with SMTP id t22so4975475pjy.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 00:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1GqABwlpgY3JcYc+/IbYYgl7A7bdRXU6rDhwYHNzbc=;
 b=BZyssAnuzK4MiUXicqpZXrnJXQ7R5/R1Vdl4i0kZnYTtSxUZt76amwWpVvF6nLgcYu
 ShjuACCBu7Q+LsCTRHuqtZi5rmMP4+2Zw6xSle4kxU4sfNUNq63x4g93UpLUKf9egxgX
 BpEVZW9f/Y6gePqDksRl2xwZq4Rck9xaIpUrsGWlFe9ri5bJwfKnGIMYu4VRwvoPcMC9
 8yIinlYkfysVHFOLtymr/hi27XFuCd09DehrMGoZ0TrELcylWZq7rAXwUCqxfr2Bfzvn
 USxhcNzwzyMd5uut8vB5m+Q7Tv0aI42J9mKvcO/cxJqQ2zk3bKPdWrqxJzFXaMSQHkW/
 JTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1GqABwlpgY3JcYc+/IbYYgl7A7bdRXU6rDhwYHNzbc=;
 b=5zWvVHT3FD/CtIW+TGkBHe/eFkpm7AINq6uHhpdylxmtVDS30wAJpFRUPCHgAmPk1k
 jMq/nfbsGiQ63UgCSCv/JGFkONLit2QS40Wvj+w9zMexJ347H9KoA2fSE4QUVFe+kz0n
 9Z4NeTTnkmXxKZ3uMqGpUi57SX1q/J4yMRToLTewswy0v7tn32lAM6F/MCW9N2mfRLI4
 hlU2GMGSbcyZmHIeh5Rw0H4V2I6nUMps7RikMzNVw58ACMaWFQ4mChqQJTaPoEpC4gIE
 AZh8glKAK4AR3qTWU2ehwGz4cMioMyB8Jq1x+RHnDAS6gGBNS39Am18rEfBAYtMp+vsu
 Iqig==
X-Gm-Message-State: ACgBeo15npxsuuUd5Wo/eu65dSoH0oPyKQAJBJeNh7311DyZ5fB4jp+2
 2DWJwytdl7JN/0+9AuB+TvwRLQ==
X-Google-Smtp-Source: AA6agR4NzZdmkzMNtQohpbtEXmZDabDFicx12sZKOUfSx6EHOuYMAGZiUoQB3hQzyBX6MSAa+jSp+g==
X-Received: by 2002:a17:90b:1644:b0:1ef:88c6:6e39 with SMTP id
 il4-20020a17090b164400b001ef88c66e39mr23210210pjb.122.1659426149701; 
 Tue, 02 Aug 2022 00:42:29 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a17090301c800b0016dc44459a8sm10996623plh.12.2022.08.02.00.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 00:42:28 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: dgilbert@redhat.com,
	armbru@redhat.com
Cc: qemu-devel@nongnu.org, darren.kenny@oracle.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 0/1] monitor: Support specified vCPU registers
Date: Tue,  2 Aug 2022 15:37:19 +0800
Message-Id: <20220802073720.1236988-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3 -> v4: 
- Tweake a few document and output '\n' prefix.

v2 -> v3: 
- Add more document in help info.
- Use 'qemu_get_cpu()' to simplify code.

v1 -> v2: 
- Typo fix in commit message.
- Suggested by Darren, use '[-a|vcpu]' instead of '[-a] [vcpu]',
  becase only one of these may be specified at a time.

v1:
- Support specified vCPU registers for monitor command.

Zhenwei Pi (1):
  monitor: Support specified vCPU registers

 hmp-commands-info.hx |  8 +++++---
 monitor/misc.c       | 10 ++++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.20.1


