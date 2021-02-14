Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB67A31B0BB
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 15:29:34 +0100 (CET)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBIOz-0007GH-TM
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 09:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lBINj-0006NW-3d; Sun, 14 Feb 2021 09:28:15 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lBINh-0004L7-7O; Sun, 14 Feb 2021 09:28:14 -0500
Received: by mail-pj1-x1035.google.com with SMTP id z9so2350350pjl.5;
 Sun, 14 Feb 2021 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vjMKhGehUA8e98uGRMLjUKnyChZhtOBycMgsQRLSF0A=;
 b=VQUymDzF3CBgIwqh920egofCMpLD1qDEWL+RxPcBsUMFStTwBSNinXof30uDo0pdRG
 S0SHad6+Uc+FGArr8l63IXteSXWgz2ykBxtSyL3WgmNfg3bOerrWFpIevvweHtGUHiam
 qzPBn0owoLALLjaFWdtMzct7u+kfxsnKPzeGUAaGTfwATp7Q++LrUwdmZcQBBoHStser
 lIuX5WiK1ILXnUmEPUOSSdRf8kpVJ3elYuiNMtIl/hZYacQIUXnH8sAc0tvLWkSEsUu2
 uJ2rGecys3WEK9ENpbpXQaiAb/FBzMbWYDtLZNZnClaywSkEkh2cNkJigblvDa3AGeB9
 Pr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vjMKhGehUA8e98uGRMLjUKnyChZhtOBycMgsQRLSF0A=;
 b=lPhf0q2oH7SIjqYsOasRebLmcBzOzn09b6kfggD3DvGlDDffMZMgLN5OaUd7kHiddy
 D1eCMVEjq3H7HSOzwv3VYL5mPqwXrgK/pF1a9QH+qP0HKDNosjyHiFY8JcsHGrrqpjYO
 F3wlGeveRmGj85chBTkJWJM9KkuedqSmyJEkl1KwayNvuGlNEsSK+CXbu0okrntpVDhQ
 6NTXjmncw99zjyS9R5xQ/yg5B2GHRMLXOIkBjFQzQ4TJy0n0gKyVM+K1aw1gT22Zpm5T
 YjPZ5FOHdURPF864HAxWSOxeFLS0AZIZ2EeLJk6BxwYHBtrHXiB6jrK2xMTSln88z/kD
 J7KA==
X-Gm-Message-State: AOAM530/72SInAI26eAfX+5+RuPwj18aB+4LPHhowRYerbPWM1sXhhAa
 fIA/lv6WdxoasTAKljtjEpG8Qf+bs1dFZQ==
X-Google-Smtp-Source: ABdhPJzVyfp2Sl6KC/yTKeI70RtuCu1uf47W6oVMAU7frdnDHJMQklqphUemLj7N3Y5tATOfvc0vBQ==
X-Received: by 2002:a17:902:d510:b029:de:72a4:ebf1 with SMTP id
 b16-20020a170902d510b02900de72a4ebf1mr11285396plg.11.1613312891147; 
 Sun, 14 Feb 2021 06:28:11 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id r68sm15502224pfc.49.2021.02.14.06.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 06:28:10 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V2 0/1] hw/block/nvme: support command retry
Date: Sun, 14 Feb 2021 23:28:04 +0900
Message-Id: <20210214142805.21534-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1035.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series has been discussed and reviewed in [1].  This is the second
series to support Advanced Command Retry Enable(ACRE).

At the first shot, It was designed to provide HMP commands to inject
artificial state to the NVMe device.  But, as discussed, rather than
making a device with a artificial state, more natural way is needed:
Some states triggered by lower layer of the command processing like
AIO errors.  Therefore, rather than providing HMP command, This version
just checks the NVME_DNR bit from the status, then it will enable the
retry delay field(CRDT).

Since RFC V1:
  [Klaus, I didn't put your review tag due to the following changes ;)]
  - Remove [1/3] patch because there are already !NVME_DNR error cases
    in nvme_aio_err(). (Klaus)
  - Remove [3/3] patch to trigger retry status situation more naturally
    not injecting the intended state to the NVMe device. (Keith)
  - Remove nvme_should_retry() by not considering the status code,
    especially NVME_COMMAND_INTERRUPTED.
  - Change `cmd-retry-delay` param type to uint32_t because we don't
    need to check if it's given or not.  So, zero can be started with.

[1] https://lists.nongnu.org/archive/html/qemu-block/2021-02/msg00843.html

Minwoo Im (1):
  hw/block/nvme: support command retry delay

 hw/block/nvme.c      | 68 +++++++++++++++++++++++++++++++++++++++++++-
 hw/block/nvme.h      |  2 ++
 include/block/nvme.h | 13 ++++++++-
 3 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.17.1


