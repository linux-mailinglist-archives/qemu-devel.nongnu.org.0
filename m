Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170044AB191
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 20:04:01 +0100 (CET)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGmpL-0002vN-LQ
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 14:03:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1nGmTD-0000sb-JW; Sun, 06 Feb 2022 13:41:10 -0500
Received: from [2a00:1450:4864:20::430] (port=42568
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1nGmT4-0006cJ-An; Sun, 06 Feb 2022 13:41:07 -0500
Received: by mail-wr1-x430.google.com with SMTP id h6so2440317wrb.9;
 Sun, 06 Feb 2022 10:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:signed-off-by
 :content-transfer-encoding;
 bh=spjgzVubc5usm9XSuLd7P6qivAQqGr2OOPaSftBQs4Q=;
 b=XfMRPta4RCA9Nx9dw0MObhDfCJgTIB8z/PjsR8FL889WIxH+ZfFDAgvlyvAtspn2Lr
 Fg3bsZ85A32gEarM6ELsz3su46eklh0tcc8TUfdtfOwC//LPul8XIDbW6GkERLpyEI1t
 UgboM9yhmUUgrdUy/6dJas+OOw9APJJTNxgfq7KlpZTU3jOPJaWd4guD1ArUL26PefbO
 l6rsmc9gDJolY/cb8sJokE24fcYHp+KOKAm4J3Z4x0IhDtgFmZ+AqVoZBBjG7YShrwbC
 ow3NHsyOcGhv6UmHqjTu58mlRnKKotJ1MJpV8VO7MrIl5Zo4AuIxBCrJH0Tz7c5WQqS2
 Jmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :signed-off-by:content-transfer-encoding;
 bh=spjgzVubc5usm9XSuLd7P6qivAQqGr2OOPaSftBQs4Q=;
 b=B3ybdwSPkK5YzB2ZU+rKbCY25mchPdEJoynv3JwbA1KF6c3WeTbL0pJgS/IxAukHuk
 6ILv6sINITWTg1QGhoQsDbib3ZheO2yfFowk1naMQV1tiNFj1Pw1xc1WdmfX4DApNtCn
 AQP4wE1UZ0YlZ+TaBvV6OOU3tnzVIxzdPu2xrMdk9bXOgnHqeKQFWZqs5QWGsK6HVeGk
 BkyPCyP9e6g/0KyaSTj35HH3kISv4EUg92XStMsFHS02k7nqFM0FMBBRzPCCNKooMjhj
 HzHr84IhG8BQnGsKSnpT+Nn6Ui5T5Cz4J2MNK3nTC+uCz+27V8dI0zCoV6ws3pX/Cn9J
 c+1g==
X-Gm-Message-State: AOAM530j44DtzuGe4Rq2QknvoeLS6/BXHXQ4pyHeNj8Ivv3+5s4/o9/W
 CEHQ9KSOejS5lmuO0IT7bC3/PC1tWEY=
X-Google-Smtp-Source: ABdhPJzIFnmzx/G9s3Vztg+1RjXT6CwS+pRuT+D/lOZGD5j1J+bkLEF3ax64cSB2zV5AE/moV/ah5g==
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr6506199wry.195.1644172799080; 
 Sun, 06 Feb 2022 10:39:59 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id y8sm8695566wrd.32.2022.02.06.10.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 10:39:58 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] use trace events and fix garbled output
Date: Sun,  6 Feb 2022 18:39:54 +0000
Message-Id: <20220206183956.10694-1-carwynellis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset supersedes earlier submissions and incorporates feedback
from Laurent Vivier, Gerd Hoffmann and Philippe Mathieu-Daudé.

There are two patches addressing the following in the vmware vga display
code

 - use of fprintf to log debug output to STDERR

   This has been replaced with trace events.

 - garbled display due to lost display updates

   This prevents an issue that can cause garbled display output when
   a high number of screen updates are being requested.

   The queue is now flushed when it reaches capacity.

   The code traversing the queue when updates are being applied to the
   display has also been simplified, since we always start the traversal
   at the beginning of the queue to ensure that all updates are applied.

Carwyn Ellis (2):
  hw/display/vmware_vga: replace fprintf calls with trace events
  hw/display/vmware_vga: do not discard screen updates

 hw/display/trace-events |  4 +++
 hw/display/vmware_vga.c | 71 ++++++++++++++++++++++++-----------------
 2 files changed, 45 insertions(+), 30 deletions(-)

-- 
2.35.1


