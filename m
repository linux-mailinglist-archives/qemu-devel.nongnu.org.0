Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C996E55C8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 02:25:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poZ9V-0004as-UJ; Mon, 17 Apr 2023 20:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poZ9U-0004ae-8j; Mon, 17 Apr 2023 20:24:56 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poZ9S-0005Fn-Pd; Mon, 17 Apr 2023 20:24:56 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1a66e7a52d3so7931485ad.0; 
 Mon, 17 Apr 2023 17:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681777493; x=1684369493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r+x/xa7lvEVaub6vFrNHCWKmAJlLghtfnSoqICQcnfc=;
 b=QE/as9jPQCDgUDyUyPaA+Joe2ehDMdOZtZyZ7F3o6BkjDAdC4g9u8xVUlPDGxyV/7N
 NVmqsdHgaa1gdbBWX7dmscnKpgJknM5nmnOZIvVX7RIz+q2D0tMCM32eyMT3HmPZlJa/
 7Ommdy8H+380ZkFMuDBJTSk6Qwm0a5z7e6nwLbPsM0SdxKCslvPKh9ZU3Bkgvq+a0qBg
 zhE5cLkndRom6tJdzShwFQLTDPTf0To78ILodvaLhs3tRFhtRyibx3bfnbERpZP2QAp0
 1W0RuEwK/GqQIaAx/Tjibeia1s0MNf24gqESWB9kt7zJBO89dnirH8TBPK6RblaRyuxG
 E6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681777493; x=1684369493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r+x/xa7lvEVaub6vFrNHCWKmAJlLghtfnSoqICQcnfc=;
 b=FkfnyuSGCSt4A1wpDj84GswhJHXs0cDREED6VE2pys3GUaJHjtXaSh4fE+E0Davwc6
 7S99sj9YLci1uNJg/RnhEbFeecxNAcvJAo6I7cpSG0xuqoXZZryOU2p5sdjlqP0/XUqc
 S6eYdQPSy4eLQUw2b/JyQsRgZjPyJfvjd5b25OQxoj8kvF9jUZccbu5sRPcuLIjZten9
 rCIERqllcF18GNJq7lNAshw23CBD9nRM8LcCf9UZxwooUw8lZ71PFWVrQLkOyBEKdpqa
 vLZOcsvV20rtwdCkd6ar8Gh0sy5KCAgq7FWi+F5YB0VuVLFpB3XBH7lVn6VDAQCwPf5u
 76iw==
X-Gm-Message-State: AAQBX9dU3IczSn97Z6gXSyzUjFJBvVKwdhBdx935hQUfxkuQvEIsAz00
 Y5VfmKn8VQjvk9dw0wiRXsVsbUTyd5I=
X-Google-Smtp-Source: AKy350Zy8Tq/Bw3gpDqmlJ+kI72E+jiRHThEa12ac9Gbyl2L+5aIo/3XoFaf2jxcxh9wecYm4QUwvQ==
X-Received: by 2002:a17:902:c412:b0:1a6:e583:80ef with SMTP id
 k18-20020a170902c41200b001a6e58380efmr455914plk.18.1681777492751; 
 Mon, 17 Apr 2023 17:24:52 -0700 (PDT)
Received: from localhost ([1.230.133.98]) by smtp.gmail.com with ESMTPSA id
 b24-20020a170902b61800b001a67a2dae7fsm8224592pls.266.2023.04.17.17.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 17:24:52 -0700 (PDT)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>
Subject: [PATCH RESEND 0/2] hw/nvme: COPY fixes
Date: Tue, 18 Apr 2023 09:24:41 +0900
Message-Id: <20230418002441.29664-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix status code overwritten issue in the COPY command and a trivial
patch to check the Maximum Copy Length (MCL) for COPY command.

Minwoo Im (2):
  hw/nvme: consider COPY command in nvme_aio_err
  hw/nvme: check maximum copy length (MCL) for COPY

 hw/nvme/ctrl.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

-- 
2.34.1


