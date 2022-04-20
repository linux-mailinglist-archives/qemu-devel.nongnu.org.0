Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937FE50849E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 11:12:55 +0200 (CEST)
Received: from localhost ([::1]:60546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh6OM-0006Or-Oe
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 05:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh6Fq-0000jY-0G; Wed, 20 Apr 2022 05:04:06 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:51270 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh6Fo-0001eO-GQ; Wed, 20 Apr 2022 05:04:05 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 533B445969;
 Wed, 20 Apr 2022 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1650445437; x=
 1652259838; bh=ZOleknc79ZwamUw+Ku18mDJNy6M7OzVhvizsN70o7kw=; b=C
 cVtsFwZQ9DzRjbiDNADVkcb+9LNsUP/B51GwvmHJ5bT9Focjent5DQzBsFa5SbOk
 hEPTU5qHHgU+EMCbf/RX78jT8hj+I7JtUnP7XiO1VUfSoEXf9WbaHxlOZVuhHgN4
 zzvgIDkg0gbK2w3Gz/4TpGa+bZTLy+27aWePDsf/OE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuHFEV-iuNm2; Wed, 20 Apr 2022 12:03:57 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2A86F42A76;
 Wed, 20 Apr 2022 12:03:57 +0300 (MSK)
Received: from localhost.yadro.com (10.178.113.54) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 20
 Apr 2022 12:03:56 +0300
From: Dmitry Tikhov <d.tihov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] Fix nvme copy command with pi metadata
Date: Wed, 20 Apr 2022 12:03:34 +0300
Message-ID: <20220420090336.10124-1-d.tihov@yadro.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kbusch@kernel.org, its@irrelevant.dk, ddtikhov@gmail.com,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current implementation of copy command, for namespace with end-to-end
data protection enabled, always returns data integrity field check
errors.
For example, issuing with nvme-cli:

    nvme copy --sdlba=25 --blocks=2,1,3 --slbs=1,37,50 --prinfow=5
    --prinfor=5 --ref-tag=25 --expected-ref-tags=1,37,50 /dev/nvme0n1

Always returns End-to-end Reference Tag Check Error.
To reproduce you may need to use upstream version of nvme-cli since
there was a bug which prevented passing prinfow to a command, fixed in
2cf9825 commit.

This patch set attempts to fix copy command for data protection enabled
namespaces.

Dmitry Tikhov (2):
  hw/nvme: refactor check of disabled dif
  hw/nvme: fix copy cmd for pi enabled namespaces

 hw/nvme/ctrl.c       |   5 ++
 hw/nvme/dif.c        | 186 +++++++++++++++++++++++++++++++++----------
 hw/nvme/dif.h        |   3 +
 hw/nvme/trace-events |   4 +-
 4 files changed, 155 insertions(+), 43 deletions(-)

-- 
2.35.1


