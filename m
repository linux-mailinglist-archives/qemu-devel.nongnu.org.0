Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD60472B38
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:22:43 +0100 (CET)
Received: from localhost ([::1]:40700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjPm-0007Dt-RD
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:22:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJV-0008WG-Vc
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:15 -0500
Received: from [2a00:1450:4864:20::531] (port=39836
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJS-0007FQ-EX
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:13 -0500
Received: by mail-ed1-x531.google.com with SMTP id w1so50655171edc.6
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tcy7w82Xek+qCwwIDIGTA5uHT+rhsP1JaipQYEHlTxQ=;
 b=WN7db/MBa5RGrOL66We0/5uw4NC/vkfqvf6Kn4rC+pkZTW0Rxg4oflF8RTCl3Zp/hU
 SS+Ivh4aQfuQt7j8kY9ovVDxZo9ZKjhA93CYhr4ykR2agOZ/SRzPMwAiD1gTtjX3nkPz
 Q4ajDyKd32uAQMnHXOC0vSko2MK0Gl8rg2+qfey6XpPhgr34qBsmvAzuJIR9gU8jmJH7
 v60UFgHNqBRVKqME4qAFBASkQWZosuuO22wImFWnFcQFfQTUXZZPqvY+ROL7HhICWm+p
 nGKCg4HCTKqSHQS6Y9bSrDL2Yq0qtFw/FFsWQWWDTNZTmtrnezX/18y4HiXhz0Bl7bJ+
 1veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tcy7w82Xek+qCwwIDIGTA5uHT+rhsP1JaipQYEHlTxQ=;
 b=7r00EFuw3tgeJ06UETYtOt9JvN/Z1iAa0BaRUn9a4YM87unPgrJaQMTv02yMmRtqBG
 yP5wOABptS/dpWiUmbS+MiD0IugNOOj5oY6aCXd39FKm9OPQfRdNoL/F3o1X7r6xeKIl
 hyv8Iz7SxALpTo+oI1KYMcScUkzBtjLqT+Z3KOp8bf7QorIO5IyFjvsi6PisYnaPeS/V
 kqvZeKU8pht14NRB/AAx0QYnx9Jetze4zszzMWLjmfpRfPvBCxnkMa1UcyMxb369yWln
 eVt8gL93IJaFbbdp/MkLsUB1RHYW1S3mfZ/c/qLkMYiCrhWeDroUAxKqZMz77kR1UT1X
 /q/g==
X-Gm-Message-State: AOAM5330tn/PsPXFSRLA8aTmWJEawLd3S06vhUXK6qAwwiCGMfdvcIlk
 ejhSU76hc9RS0ASbPoj1OQNXLWZp37KWGg==
X-Google-Smtp-Source: ABdhPJwJEeKwq7Dl363C+I1D717cV2vh4+6lXfIFf4oGZGjT+8NB3kqrzJW1qBAjQd30Sm+KG+an1Q==
X-Received: by 2002:a17:906:5d0b:: with SMTP id
 g11mr43203910ejt.295.1639394165274; 
 Mon, 13 Dec 2021 03:16:05 -0800 (PST)
Received: from kostyanf14nb.Dlink ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id a13sm6139384edk.29.2021.12.13.03.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:16:04 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/5] gqa-win: get_pci_info: Fix memory leak
Date: Mon, 13 Dec 2021 13:15:49 +0200
Message-Id: <20211213111554.62394-1-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

This set of patches fixes memory leaks in the get_pci_info function when it fails
to get parent device data. In this case the parent_dev_info and the parent_dev_id
variables will be initialized, but not freed.

Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1958825

Kostiantyn Kostiuk (5):
  gqa-win: get_pci_info: Clean dev_info if handle is valid
  gqa-win: get_pci_info: Use common 'cleanup' label
  gqa-win: get_pci_info: Free parent_dev_info properly
  gqa-win: get_pci_info: Replace 'while' with 2 calls of the function
  gqa-win: get_pci_info: Add g_autofree for few variables

 qga/commands-win32.c | 74 ++++++++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 27 deletions(-)

--
2.25.1

