Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E373601D9
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 07:44:55 +0200 (CEST)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWuoA-0002Xh-S2
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 01:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWumB-0000e8-Ny; Thu, 15 Apr 2021 01:42:51 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWumA-0007Fb-4l; Thu, 15 Apr 2021 01:42:51 -0400
Received: by mail-pl1-x632.google.com with SMTP id d8so11422580plh.11;
 Wed, 14 Apr 2021 22:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UYHdp3roBbGfrs5+hnQTtW9qE9UqGDVkLemcGjwD4ps=;
 b=ips+uAg7ahpeyPdHlfKI+ec6edbOUFcFQzlPbPgUEBIaJlXlSIqE1u7uExQcY0mc76
 YBwqJR5qPiHjZkvCHQT1fUSlW9w15AP52dVx1aWot3sbrCg3aoygHNLWy0ji9NO02J/n
 i+DurgG8xT36dG2S8h1uoY0B/lLqKpXe45tfnD26I6VO6YtIj9yeLlxq/FTs1vXyw1/B
 efVUHZtpsRQKa6pkZG9s2Wg/jdkMmhDX1U3USz6SYmNKa5r50iltur/fNfYLYnO4wUdt
 PGGEdPP0f2jTLxTKEi1G2Wwvt2Dt+6D4NFTI6PfU+3ZG9pkN0Y6oAXZPR43Tx04OgqnJ
 cpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UYHdp3roBbGfrs5+hnQTtW9qE9UqGDVkLemcGjwD4ps=;
 b=iK+Q4OVNGkaS6azucdlhDv9gf8JsID6VXWTZIZAeElPL59R9SARhyEBRqGrOROsHxd
 AxdPlPSX7vWX2pSRMoKCK6J59EWPXxelIG/G7tolLOW54DXJaVFB1m83VJyrFbU+gQ7m
 k8c3UIa1NlUF9FddpVkjqs7MFl9Q/NvCVAbj/nMXowi7bRBMmgL04drDr+aS/Sbb13F6
 AElyHRZBv87cE4gwtOVMQianaLWp72nU4ke6tle6jhS9yNO/dZnKWzEvAJhmhr+XFhPJ
 kldkk55UsEgs5ii4mg5w2yI7MYi231bNalD7Y5b2Jcz4dCaskWKGMEjJBCBCZR0JeBvh
 NHxw==
X-Gm-Message-State: AOAM530f+AxpgEeG7uz9E8XFYcT/MkeUH8V1h4DfCYYdMt9uzrBTuAMi
 mmd5oGNVemLCAgN8RaEC2K6ePvTltk0=
X-Google-Smtp-Source: ABdhPJyjQIgHPW06Vp7dsU6a7Duw469NN69Yu5EvHTCntnSlIK6G1Pn3nKBfjgbU1N6jE//ky+r0JA==
X-Received: by 2002:a17:902:e793:b029:eb:5dfc:2386 with SMTP id
 cp19-20020a170902e793b02900eb5dfc2386mr1983794plb.48.1618465367927; 
 Wed, 14 Apr 2021 22:42:47 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id c5sm946151pfp.183.2021.04.14.22.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 22:42:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 0/4] ppc: rework AIL logic, add POWER10 exception model 
Date: Thu, 15 Apr 2021 15:42:23 +1000
Message-Id: <20210415054227.1793812-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's a rollup of where this ended up, hopefully it suits everyone's
preference. Thanks for the review and catching several issues.

Patches 1-3 are unchanged except for minor comment and changelog tweaks,
patch 4 contains fixes for the issues Cedric noticed.

Thanks,
Nick

Nicholas Piggin (4):
  target/ppc: Fix POWER9 radix guest HV interrupt AIL behaviour
  target/ppc: POWER10 supports scv
  target/ppc: Rework AIL logic in interrupt delivery
  target/ppc: Add POWER10 exception model

 hw/ppc/spapr_hcall.c            |   8 +-
 target/ppc/cpu-qom.h            |   2 +
 target/ppc/cpu.h                |  13 +--
 target/ppc/excp_helper.c        | 199 +++++++++++++++++++++++---------
 target/ppc/translate.c          |   3 +-
 target/ppc/translate_init.c.inc |   6 +-
 6 files changed, 163 insertions(+), 68 deletions(-)

-- 
2.23.0


