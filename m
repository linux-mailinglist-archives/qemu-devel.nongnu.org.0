Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6C5420202
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:19:42 +0200 (CEST)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX2L7-0003Wx-Gu
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2Io-0001za-Bl; Sun, 03 Oct 2021 10:17:18 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2In-0004BA-2y; Sun, 03 Oct 2021 10:17:18 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s21so25231924wra.7;
 Sun, 03 Oct 2021 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rRBqmIvhytwoFrKW0Tm2AdnGPgrhSiNHLEeLN/2ysA4=;
 b=qQ62VTKUuIK78h8iGXjTKsIiWa0bqB40JviQrCRUDoFBZw7ndpQGCe9J5pGJF4ShNH
 3Lp2awRu9xBY7XaQ3PH88Xb9K5jnNRri0MMkGJByHSG/zHLH6obHPgOGSYHBpHE7H8Jq
 GNbtlEax7/89CiWnyDNZLdWyXGviHQ5euUtUapualeXNwET+7K6fqAesvZht0YSeq3oU
 kfpiBzoYeYnqNrvjkwl/d4RXVn2dcpZJVicQSzN5nDqNz4/QbCToA5hjON0sA+NP9JkM
 Jc9FxBYx4U3XXPaFwRBgFoESBAimk9+aoDw9Nb728xRFVykLj/v9y8dg5+dGGQhvKXEW
 KO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rRBqmIvhytwoFrKW0Tm2AdnGPgrhSiNHLEeLN/2ysA4=;
 b=SxyJ35dEUsPZWehDwVdXsh6M7SAdhx0rgCxinHDcm0kkJIEmb5XcsgUk2vWMCl5hQf
 DH6vCgB84pqpfsUxWItaGwgcZJIaXh2ZyfVrCOheqffVJRur5V9soJtYmL1AXLV1dImz
 jjSXb74JMRLZkqZ+YrTON9FCL8xVHOCsWPQeokV0O/JBl/5Xc8AsR3SqP8W44BlBBaE1
 XufwUxKFKkpp3qD0rikSfGdajjDoZGKjJv1TzPuJoaGvyipETxcbSLsrjsqnjtsqKkaY
 a03xeLA0xbt93vSFgD5Cja7qvkHUjc8LuSf+JLj7iOJ6SGXfU3cBRzrxbiGYXoemVvrV
 bAiw==
X-Gm-Message-State: AOAM530Olls+TqPwSAjOWgfkljaX32+DOQu3DkDR6kzQgf982qx3av/7
 ZLxlvhEZS0XPc3+GB0sdseP/QZvBXdk=
X-Google-Smtp-Source: ABdhPJwH7WzCwFr8CwPohCLximzhlNlHe9lZjiFXbgp9gugLAqyv4/YvZ8UjEbY1UAQfAydritLxDQ==
X-Received: by 2002:adf:bc12:: with SMTP id s18mr7741165wrg.328.1633270634058; 
 Sun, 03 Oct 2021 07:17:14 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 w23sm14198157wmi.6.2021.10.03.07.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:17:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/ppc: Use tcg_constant_*
Date: Sun,  3 Oct 2021 16:17:09 +0200
Message-Id: <20211003141711.3673181-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace temporary TCG registers by tcg_constant_*() when possible.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/ppc: Use tcg_constant_i32() in gen_setb()=0D
  target/ppc: Use tcg_constant_i64() in gen_brh()=0D
=0D
 target/ppc/translate.c | 16 +++++-----------=0D
 1 file changed, 5 insertions(+), 11 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

