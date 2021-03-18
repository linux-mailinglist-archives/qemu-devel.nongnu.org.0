Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15BC340EDC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 21:11:29 +0100 (CET)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMyzQ-00014Z-LH
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 16:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lMyxz-0008HE-Bc
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:10:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lMyxt-0001ml-Pw
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616098192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qsgLPb/zF/jbyif5h3bZUc4fQpNap1o4n6/hx5I4dRM=;
 b=Hf+2UlvQK6y47at8DIMqCf4uHSuUcumpmDrHhDYm3PxzbhnNvGRVdf+9fq9UtH+POvSdmd
 kxUXg+supToRreBxdALEp8xJ5PhB6Swn+YOaiicRBUnGsStxNomopwSeeFV1lJSN4/nwSh
 8kK3R2c09kBbUNTI4pn4gwTbXPNSVqE=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-qfEJli4MM76AMV23D_h4Uw-1; Thu, 18 Mar 2021 16:09:51 -0400
X-MC-Unique: qfEJli4MM76AMV23D_h4Uw-1
Received: by mail-oi1-f197.google.com with SMTP id s26so13739518oij.6
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 13:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsgLPb/zF/jbyif5h3bZUc4fQpNap1o4n6/hx5I4dRM=;
 b=npBVsE6aVMr2nf0OgvsasqwSu1wmxvLLEcPZB/FDRDARudZxFY2nlihdujRYrVpixq
 DsYaWxQ/DaONSmJsR1hCQD/igJAcFiMCStG5TpvsCvpHZghF2lVx6GmzNoAHjp7FjwHh
 ysq8riQm4PJMKE8/XpFz8zutoAtSZ9Lj2koiknYzM5VXLBHBvumPug5vseelIhVBicKv
 tt+tILgiCeJuLsxbpW+9pE1X43ZUNfVwf4uJXB1aA+YQRI2YUMx6FRGvBzodnvaeu3iw
 iGRrcyCm9Tv3UaQce2KAmifBuxLu1DhyU356rtfMXxB4TsU+h8QsPhfo5UTRNSS/NUvn
 +RIg==
X-Gm-Message-State: AOAM533ZIp4DQ5uTnH97sItGdxRx6Qn7A3h+rfbeg/JQ7qs8uaUMCwzL
 xcKBOieHjmwbu51FkC5hgKyHkIzotC18nrE0YcMdAk3WwFhAzMy9YmfwLdbMW5WgKtiqSrP38Tw
 eY0+iM0MMmNtHbNU=
X-Received: by 2002:a54:4891:: with SMTP id r17mr4363352oic.1.1616098190607;
 Thu, 18 Mar 2021 13:09:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB4d+HTkP3zZzNSbXVZyeIvN2o8qVmkFMWTCo8rqaoy47cPQkPx8Vd84RkcgXqZ4+ZXCH9SA==
X-Received: by 2002:a54:4891:: with SMTP id r17mr4363341oic.1.1616098190454;
 Thu, 18 Mar 2021 13:09:50 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id o23sm697833otp.45.2021.03.18.13.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 13:09:50 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/1] iotests: fix 051.out expected output after error
Date: Thu, 18 Mar 2021 15:09:48 -0500
Message-Id: <20210318200949.1387703-1-ckuehl@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Oops, sorry about the churn. I can see why this would have caused a
failure but I'm surprised I can't reproduce this when I run the test
locally.

Christian, would you be willing to test this patch out as a quick sanity
check too?

Connor Kuehl (1):
  iotests: fix 051.out expected output after error text touchups

 tests/qemu-iotests/051.out | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.30.2


