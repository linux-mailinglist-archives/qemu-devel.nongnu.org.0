Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546635A155
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:42:07 +0200 (CEST)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsKk-0006rI-9P
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUsHp-00044I-HO
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUsHk-0005sP-6V
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617979138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e860xFWVNMiE4rKQEIlyWbc++w/9s6DvQOl8eIkXLK0=;
 b=TN7MfHzjxXZItovfVi7V7xaN1ChUbe6A2jbynsLtL7NYC9gKIpyMmoK5SwlAw1RkSBc1Rs
 ovnNXQRwp1tlP/UJqYT8FBG+5bf1WQGjO9CpJlhVNxQKTkHTyiGXLLiL0IicDz0Nq54Ggf
 agRWBngB+h9JqTlHYEUevqBWbFxoFB0=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-eIiYM0HIPmu5LUgAyKQrAw-1; Fri, 09 Apr 2021 10:38:56 -0400
X-MC-Unique: eIiYM0HIPmu5LUgAyKQrAw-1
Received: by mail-oi1-f199.google.com with SMTP id t186so1397908oih.1
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 07:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e860xFWVNMiE4rKQEIlyWbc++w/9s6DvQOl8eIkXLK0=;
 b=Yh3SNEhHI6NMnI1Id3tDDbGoaINpElQz/BfUU/GE6xF5L2fIYb603oggExtZp0Vz77
 XMb8CCSaVni4aWMH596noefOmcdVdAmDvNTGTXumtRNNKYu4ukH616oQqbu9P/ka7Caa
 gPrySe9SBv5YjUDZsSNq1aOzgJnlzk5wf+vgzkJ3b0EkmFNrwWUYrmM7QrzaDDzsRBPB
 4MM/TAYFuFu8IqzNG5O61MCQS0Cf0rgJeU1sTqQeC4l/rUdpFkXMH9n0M9lxvYmgv3Db
 SyrIWvGJsyrIQ/PpPsdlefLag88d8vkc7Ki6GKm0fL68dTDEFklp2qroJ+VGBRnfuxk7
 9TUg==
X-Gm-Message-State: AOAM533nbkLLNiH2Xp+Zc6/J6LVwKz+U5zXdo3Hm7PfhSVJGo0Co+2bX
 csBiWH5OBOczJeuhuAMJQRMppaMNdBzgS+yN6RNTMOO8aPxPuu3D/tcJFp1KM5TcG48PdC68p7i
 TmvJ6wte2BatdiOA=
X-Received: by 2002:aca:37c1:: with SMTP id e184mr4755992oia.136.1617979135950; 
 Fri, 09 Apr 2021 07:38:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+5yvVLvI7UesXFqPUdyvFTR22lZUM5bUeXQxNgFKsZX4y7edLZ9y8z7H4OIZ55A17DlQejg==
X-Received: by 2002:aca:37c1:: with SMTP id e184mr4755983oia.136.1617979135824; 
 Fri, 09 Apr 2021 07:38:55 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id e18sm647053otf.2.2021.04.09.07.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 07:38:55 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/2] Fix segfault in qemu_rbd_parse_filename
Date: Fri,  9 Apr 2021 09:38:52 -0500
Message-Id: <20210409143854.138177-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connor Kuehl (2):
  iotests/231: Update expected deprecation message
  block/rbd: Add an escape-aware strchr helper

 block/rbd.c                | 20 ++++++++++++++++++--
 tests/qemu-iotests/231     |  4 ++++
 tests/qemu-iotests/231.out |  7 ++++---
 3 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.30.2


