Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043372A63D5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 13:01:50 +0100 (CET)
Received: from localhost ([::1]:33030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaHU5-0002qX-2R
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 07:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaHQ0-0006qx-Ty
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 06:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaHPz-0005an-4y
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 06:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604491054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwDUJFjz9JABmwe+3ZrGGChU+tAgL0zg4MdKFtTFkJg=;
 b=cBiwwy+JkPpqeHpw8YSODb8NyFHXFU4UXuHlVba15h+f9m+kJMgx/5J46r6HYD9o98YF24
 E6oZKchC7y52crsRk71zmImsDgYtAyKAS0T81vxEepX8XWIFmZqThIkyXL5fZBs8SAnbZk
 9YRBsIXTwROPOeZiAqz6hxyIPA4IIJI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-S5w8-6qTNFCr4cXV4mPTCw-1; Wed, 04 Nov 2020 06:57:33 -0500
X-MC-Unique: S5w8-6qTNFCr4cXV4mPTCw-1
Received: by mail-wm1-f72.google.com with SMTP id t201so1128970wmt.1
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 03:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZwDUJFjz9JABmwe+3ZrGGChU+tAgL0zg4MdKFtTFkJg=;
 b=HePRx2lgGfAVG1corqsRs/lchIPcxFcurldu2KL74XLWMPBORyR06C+AP340CgPMIQ
 WWmMKhW6sQa2i1U1NSirL5Heqnd75N2nE76HGikMqr5gMUCSf82gvrssd9/msRu5kAGJ
 7WQb89ctlIpVGc3AtA1RyzXIEuw+yXhCWAqe0qOX6tLpKVWnJEWcPGOQ3LtArI9viZC4
 anHlkGd1c2g5FC0D9GczksZ1e4pjzMs6TFB1x9sRVxhw5oVLY6uqQ4Xrt+WdiBnso1v1
 thFTExNl9R1w66LNAkccIQLIDRcgxNowWsIl7BS4Pq0xtvp21K7ySNhgk9DRG3xymVwT
 luZg==
X-Gm-Message-State: AOAM53354AthbyPpnbq3jqX0J16uFwfGL+la3H9okAT+ejrQnbSptBxy
 +fUvStVOlo/QMCSEFFHqU8dmtAheamE/SxpgDiZJbDAsSgMBLZUGhS8+JV0XLKuRb4Uhp9ms6zH
 lC5PtR6m0QYa2A1w=
X-Received: by 2002:a1c:205:: with SMTP id 5mr4055040wmc.7.1604491050557;
 Wed, 04 Nov 2020 03:57:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziBA+5s7BTeEF85JmFv8zKVn6FUHxJUnQ6TQPu/77v+uz7IIiY+LO/TzFayN5OjhansJtXIg==
X-Received: by 2002:a1c:205:: with SMTP id 5mr4055029wmc.7.1604491050435;
 Wed, 04 Nov 2020 03:57:30 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t1sm2219508wrs.48.2020.11.04.03.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 03:57:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v3 4/4] travis-ci: Remove the
 --without-default-devices job
Date: Wed,  4 Nov 2020 12:57:06 +0100
Message-Id: <20201104115706.3101190-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104115706.3101190-1-philmd@redhat.com>
References: <20201104115706.3101190-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We replicated the --without-default-devices job on GitLab-CI
in the previous commit. We can now remove it from Travis-CI.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .travis.yml | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index a3d78171cab..15d92291358 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -224,14 +224,6 @@ jobs:
         - ${SRC_DIR}/scripts/travis/coverage-summary.sh
 
 
-    # We manually include builds which we disable "make check" for
-    - name: "GCC without-default-devices (softmmu)"
-      env:
-        - CONFIG="--without-default-devices --disable-user"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-        - TEST_CMD=""
-
-
     # We don't need to exercise every backend with every front-end
     - name: "GCC trace log,simple,syslog (user)"
       env:
-- 
2.26.2


