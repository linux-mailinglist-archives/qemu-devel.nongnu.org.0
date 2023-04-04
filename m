Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD176D693D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:49:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjjq1-0008UD-Qt; Tue, 04 Apr 2023 12:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjjpu-0008Tg-Aj
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjjps-0005XZ-TQ
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680626924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P06sqGkL4+CuF/lyo/2BERiikW0X1JwNsZQQesyx0Tg=;
 b=XbxH6sDKGtK33f9KWa2dnRWH9Mxc6fWwZU19h3AdgEJLukWuibP4QGpCHtU3doLhxCyEHy
 b5JQiJVUkinjElj9pEzBcBtNm3aJSipysAyPyACBpurkkFD/1JokBmO7EVa0C8Pp9rcPBH
 mBYKSB6Q5iQ35cnvl9dPsjT2U2urFGM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-iPlKZtfaPaijYEO5LY8Rqw-1; Tue, 04 Apr 2023 12:48:43 -0400
X-MC-Unique: iPlKZtfaPaijYEO5LY8Rqw-1
Received: by mail-ed1-f71.google.com with SMTP id
 b6-20020a509f06000000b005029d95390aso10388123edf.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 09:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680626921; x=1683218921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P06sqGkL4+CuF/lyo/2BERiikW0X1JwNsZQQesyx0Tg=;
 b=4g2fQs6VJL/+2BTZGc8IWYCDd9KuVwbDoVdu8mkTv9YhGQC+ERh5q+5FHe2U9Qo+XZ
 Gqi3UJCugAwz+Bncc6azJUeRDp2ee/qAdlXO4OCSkJ+PlPEz4xooM8JnqHQlOACAIliI
 eESAU11jIMKZdoLr/iBbOPyddkHBT2ZGuB5KtMsxBxHFgcYRf+Khj6Dq8R2EaJi9BtGZ
 8JvOuf4cUjgeHYYzcU0jHmmTn1W1Yf73bVrq/IyO9JzzyoFs2DB5ngLeQ9bnnI3ihF7/
 HLJIMmWoDRMR9NaaKuVXpu0A16/iotZBlb+TWZz0ZTqDlDau9sYoVciXyTtUOYV6K/K7
 QkDA==
X-Gm-Message-State: AAQBX9cAoJBS4FTIh3aA0uhzFcSgm0wLom1icW/4t/Y1nmwn1JCV8YAU
 AXnb+xlxz3ilSUCa6OGiZFaTEI9/gv781jdqn4SuyJvFhg8PpghOt729ck6eCU4XbVTeJvrAXkS
 Vkhs4FvNXu7uqZVfmJv6sSFCE3ixjRkxx8j1UJND90eP/rJkCmf/SvTkgcbU6r00jYlG7HDdo54
 s=
X-Received: by 2002:a17:906:1252:b0:86a:316:d107 with SMTP id
 u18-20020a170906125200b0086a0316d107mr161694eja.72.1680626921415; 
 Tue, 04 Apr 2023 09:48:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZR0uZQfcNcqF+jS7+rQZoXCdUzinqLAvLvo+cqbi4xQ41eRt7eG5+9KWCDzyU4ex58F94WkQ==
X-Received: by 2002:a17:906:1252:b0:86a:316:d107 with SMTP id
 u18-20020a170906125200b0086a0316d107mr161670eja.72.1680626921037; 
 Tue, 04 Apr 2023 09:48:41 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 sz22-20020a1709078b1600b00948da767832sm1885203ejc.152.2023.04.04.09.48.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 09:48:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-8.0? 0/1] Bug fix for QEMU 8.0-rc4
Date: Tue,  4 Apr 2023 18:48:38 +0200
Message-Id: <20230404164839.455941-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit f00506aeca2f6d92318967693f8da8c713c163f3:

  Merge tag 'pull-tcg-20230328' of https://gitlab.com/rth7680/qemu into staging (2023-03-29 11:19:19 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 56adee407fc564da19e49cfe18e20e3da92320be:

  kvm: dirty-ring: Fix race with vcpu creation (2023-04-04 18:46:46 +0200)

----------------------------------------------------------------
Fix race condition that can cause a crash at startup.

----------------------------------------------------------------
Peter Xu (1):
      kvm: dirty-ring: Fix race with vcpu creation

 accel/kvm/kvm-all.c | 9 +++++++++
 1 file changed, 9 insertions(+)
-- 
2.39.2


