Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12869351656
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:53:29 +0200 (CEST)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzdQ-0005oI-3i
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lRzcI-0004w4-CM
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lRzcF-0007l3-FL
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617292334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dn7ZVmnbbuHuTtNR74GNYiuQjiiqo16JWi6LZKzXjpE=;
 b=BJSFgePGGPgjyFdTNQgcIfIWqnOL82O70Dh1yIy93Mwc+3Mmkh/FBIojYL2SqPgXA2rWsN
 xOifst3PsEw+FVIkEBnVh1+TprcWuLKk1bjPZejrEmi5RhG6cPlv0fqo7vxFHjy8Wofv/F
 8UoGgx89GamuKvd/JfOQI+++NDwPx44=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-TzDiO0GSOQWOWjVgNxKe3Q-1; Thu, 01 Apr 2021 11:52:13 -0400
X-MC-Unique: TzDiO0GSOQWOWjVgNxKe3Q-1
Received: by mail-oo1-f72.google.com with SMTP id p23so2981737oov.9
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 08:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dn7ZVmnbbuHuTtNR74GNYiuQjiiqo16JWi6LZKzXjpE=;
 b=oX5EINVTAn71FJ7sELtPHMgNj/d3ecBN7lVSBeEekXa5fb+svTgHdqD4AZ/CxgoVFx
 5M5S8DgkclWTrNTDEOIG/WD9B7vWdXfkVXXD3uCr8Nrq1Xwxpy/Sa8W7nBdirw1UunfB
 5sBdZfeZXWjjvk5cWZRpCPu0S5IImTs4mr2xa7MRVz9avPeilOVFFZikPA6++bmsKFxz
 rCs9U1S6rS82w2+bvxFqH6QgCIAs2TUm3QWnWhW4ppxNNmy2+B7YuTY0HAAl/KDzz0Mw
 roP1jSPk4SFVIUppFSs4PlwU1lQtY+9UJB9QXxD5tlWYH5xlBor5luQBbv1cwsSZq+Nb
 IjTg==
X-Gm-Message-State: AOAM533HqC52Zizav2V9dBytkr3XSPlAaaM38aej65Bn4r/LFFdKIPvz
 zUNYNy9skLMDyAK3MaBmDN38ln5rzOdEa995CbZwiCA/GXX1+NX186fdlfAgjw+EqbOct99xMEN
 aDJPNnPu9o7BmnGE=
X-Received: by 2002:a05:6830:1282:: with SMTP id
 z2mr7617893otp.30.1617292332553; 
 Thu, 01 Apr 2021 08:52:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8twDhsowuNeGL9p3gUjOCSylNWHhh2Z7KLrlV+sRyi27rXdX+ZxXM7g/o5NElBiGW0yARIQ==
X-Received: by 2002:a05:6830:1282:: with SMTP id
 z2mr7617883otp.30.1617292332413; 
 Thu, 01 Apr 2021 08:52:12 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id d21sm1093357oic.54.2021.04.01.08.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:52:11 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] Fix segfault in qemu_rbd_parse_filename
Date: Thu,  1 Apr 2021 10:52:09 -0500
Message-Id: <20210401155211.2093139-1-ckuehl@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
  block/rbd: Don't unescape in qemu_rbd_next_tok()

 block/rbd.c                | 3 ---
 tests/qemu-iotests/231     | 4 ++++
 tests/qemu-iotests/231.out | 7 ++++---
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.30.2


