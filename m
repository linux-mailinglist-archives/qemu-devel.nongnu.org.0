Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CFB39A1E5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:10:54 +0200 (CEST)
Received: from localhost ([::1]:59206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lon7d-0002aW-SK
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lon4d-0006ka-R1; Thu, 03 Jun 2021 09:07:47 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lon4a-0004Jj-RJ; Thu, 03 Jun 2021 09:07:47 -0400
Received: by mail-ej1-x634.google.com with SMTP id k25so3635401eja.9;
 Thu, 03 Jun 2021 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PiNTM2c384SSv/ytr4y+ww2bjjfzFNNy9ENY+1sZIGs=;
 b=jsUJmaVZlAIxv2HctHoZADAC4jrgZnir9fd6DS8e/raRo6NLz6Lj9akLxLY7z+QcNO
 UKfj8VrP9n5pUfZqovg61PY167ys7QjRJSOaf4gejP6gXXO2oVLdrilYpiUi0wSiOg4e
 bX9JO0Pn++zDdp14+GCjgmDcNvHuahp98a1fEPQP2fX0VHfaJFbqLJFDRp/+Odjed/rH
 DIdOPcM8zkcsOcC9BxpaQdYhnWvcCgabOC9aRrptBRPa1Qb2DNTu5tmOo0rkzjlmxkll
 LCc6F2d66hy7ROy5ZyD0XTeLsFuabwj/0nz06k8xu3xtoIK2MPRcCCgUDvWszjruGvhW
 Ji/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PiNTM2c384SSv/ytr4y+ww2bjjfzFNNy9ENY+1sZIGs=;
 b=A47KgojUuwFhJ4WL3AbRHtuVQcVgAFVKL7aL/vMxo1u4X7+PQ9YzRUypH/FGmfog0T
 FDagrhVMjIv1gnaQAsfO7UiHY7QIt4ylZegR2YpQJPJypN5+cLYktujtYEEfQMnQTsUe
 W0dy3sF8vh6+j9mIcw4xXhulyejguUhnQjtdgzRsTi8WigkVF5z9uEKy1r8WjPCg+kZ0
 s2pgCDn1VWdM+S0BxGq3PK+K+1cuvG23D87FOH9pWSsJfvr9IXcJcNchMQkRDdxo8+AU
 Dkn9eHGzrqHpEu2XDwcCEo3FvhjEAmngh/1aWCS53xgy44NTdlD3Xxw9g9gW+3YUbegd
 JIUQ==
X-Gm-Message-State: AOAM531YB9QBgff8zJw7YtG8h5RUz3bcMJJuWZ6DPW0KE+0GA/dbkrbv
 n4Q2InfJJuhRbNw17dvmRU4jsiyAAIfQ6A==
X-Google-Smtp-Source: ABdhPJxjHhOX554KU780kDggGqza4sjJPwK9i3FlWEj/5BhQAHnuv5Q2wcQt3dO63p8DVN4mdQSx1g==
X-Received: by 2002:a17:906:1444:: with SMTP id
 q4mr39050924ejc.459.1622725661767; 
 Thu, 03 Jun 2021 06:07:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dh18sm1734855edb.92.2021.06.03.06.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:07:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] iscsi: always link libm into the module
Date: Thu,  3 Jun 2021 15:07:30 +0200
Message-Id: <20210603130732.208065-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the configuration of QEMU, some binaries might not need libm
at all.  In that case libiscsi, which uses exp(), will fail to load.
This series makes sure that libm is linked in the module explicitly.

Paolo

Paolo Bonzini (2):
  meson: allow optional dependencies for block modules
  iscsi: link libm into the module

 block/meson.build | 18 +++++++++---------
 meson.build       |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.31.1


