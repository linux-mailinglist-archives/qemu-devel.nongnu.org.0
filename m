Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198C25D95F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 15:15:11 +0200 (CEST)
Received: from localhost ([::1]:50438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEBYb-0007sF-Lw
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 09:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kEBXc-0006RV-V7; Fri, 04 Sep 2020 09:14:08 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kEBXb-0002YM-Dn; Fri, 04 Sep 2020 09:14:08 -0400
Received: by mail-wr1-x429.google.com with SMTP id e16so6735624wrm.2;
 Fri, 04 Sep 2020 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWsaPz/fb0q6iRQyYoGc5v/wgaK0B986JMeqJ8E6udw=;
 b=lahY+otSCBVFtYZEaKEaTgw4JM2pNQQP8D/7lYVszmaUqr43vtL18qmPy9iTKlgcQv
 yORtQtq31B6Ao8q3yuKGjr2Wje2+U90D8fJ/AJB2HeFLoUswHMascnIYtJQoPUXMbdu1
 N24AkMXfFmpiJjJVrliN0cbgY26bYHal77n5WDDQ5YN8eO+dqdYV2UOtEs2F2vuLGr3u
 llGt2N3pdv8ZStpuSkbY1xE9P8xoaSaJA64/MH03/0JtrSk7C63iH6eXGZlB4Vfaw6Pa
 CIrIyVUPlcdA2FNRGqKXVw/B4/dJ/aW5aAaj9SwvsjBYBzCRM57aIexOj+gqEZyIC+gR
 IZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FWsaPz/fb0q6iRQyYoGc5v/wgaK0B986JMeqJ8E6udw=;
 b=tn3pjCyA3STr3Jq/ei2XJdrDkxVaafuRt6wASs/a045rcvYSX0W+HMIGuUYxoAv3Qz
 fkAB3PGry4P6yhQOUBm1IkVklN/z+7KI2lo+aGAz11+LninYu0LBGAaVNZER/w2uDAU0
 y4OinP7U60/EyNiOCfShSs9RP0MQdFjhS/ZoIhG2TcSJyNSYWo9EbLSBs7280MbuTWZd
 DMLO8ume1i6rKhQEijwJKe49OcHKDXeZYZVmIRHcUBS349F3yllXUjaoY2w3mAAdHru3
 PxdKVyVd4YtJNriNceLpJVNovMAmnJRp6EoJnqhGSG3WWhuEdZzuilSzj7cwx9dhNiYU
 aBOQ==
X-Gm-Message-State: AOAM532myfldh6wYMlNfrJvBxUo9u3nGJQtBLD26/BqhrmbvNnB5atXn
 dchwZPFbr/8PKoDLsk17HGyVbciBc8g=
X-Google-Smtp-Source: ABdhPJyAPTT7PDS2mlgTpbljX+o46ywWLh3xPaFVeqpkuc+XRJSr0HY4cgJHpcLh1C4uPRGic76oSA==
X-Received: by 2002:adf:9591:: with SMTP id p17mr7927818wrp.237.1599225244882; 
 Fri, 04 Sep 2020 06:14:04 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id b1sm11923559wru.54.2020.09.04.06.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 06:14:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/net/e1000e: Remove overwritten/duplicated register
 handlers
Date: Fri,  4 Sep 2020 15:14:00 +0200
Message-Id: <20200904131402.590055-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The STATUS and FLSWDATA registers have overwritten/duplicated
handlers. Remove them.

Philippe Mathieu-Daudé (2):
  hw/net/e1000e: Remove overwritten read handler for STATUS register
  hw/net/e1000e: Remove duplicated write handler for FLSWDATA register

 hw/net/e1000e_core.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.26.2


