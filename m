Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5713F351670
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:55:16 +0200 (CEST)
Received: from localhost ([::1]:37766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzf9-0007Je-DS
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lRzcL-0004yg-JE
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:52:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lRzcF-0007lj-UU
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617292335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Zt2U+rlMa9VuCgVf/rHyKTbY+ZUK4QYDedZmczriAk=;
 b=bR7AFOlD7JKubkjzxDPqPTLi8wTlqgH5Y5ZD4Obc6RKS5+5hFeZtafhcwi5bkI4JhGsNmd
 Pe39EGn93/k+Qyyee5OWjmMX56tpNAdSHAWiKUOMOjBQfMdfRsIERJIv4iLw8j4DKFNv5Q
 AtmnEGJD+8fc46wLzU9RTeD+mYfWcQo=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-k_SJC8vvNnigU18cJFGQsQ-1; Thu, 01 Apr 2021 11:52:14 -0400
X-MC-Unique: k_SJC8vvNnigU18cJFGQsQ-1
Received: by mail-oo1-f71.google.com with SMTP id u30so2962201ooj.22
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 08:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Zt2U+rlMa9VuCgVf/rHyKTbY+ZUK4QYDedZmczriAk=;
 b=Cm/Vef3hawgnBDCD+kccCSkujU60onItfN8EN0+2dH7UOT/Jdbi0s3NrZ08JzOHSXb
 E9usZm9E2eGCHkBFBWpymuFrQ9KQ+Ag6yvaemuQ2Kg7UFlj/TS+fyIIUoaDDCcpKiFgw
 b8lIqYKQG8q/apR+9VmqYG++DvulioupAkuKd0KpL590Xb2VThSqoanOep3plbZhwBRi
 o4oBrQUvPTGsRXl7Uqw2VbPGNgrt5VcZaLVs6PaNzQwG0vmk8sf4kAarEf83cjQbzd+L
 4ZBgOl1XoaiqvSfLd1Y25cGa4t7D/c3csWG34C3WzdxOMs54DK7MYh+FavK0JFoqc8jo
 FEwQ==
X-Gm-Message-State: AOAM533ddsK93AkJXi4BFI70QWJWStpvmc9LK6vnAgDqd/UoFkwLzQeJ
 7WN4sSGN64jMfS1lcAIYqS2XkNhAp2NZnrjSU1kcT4LJLfQMzVG6tsyfVKPp6rCO0K+O8AYOSDQ
 SGEarElP9xZTGZGI=
X-Received: by 2002:a05:6808:ab0:: with SMTP id
 r16mr6178877oij.34.1617292333485; 
 Thu, 01 Apr 2021 08:52:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtiiklR7qRY20k0t+XHTBI7qGXeAImnTjcc0x9BkTzT+wrnBgQ66XajL0EnJW3cgZLPiqPGw==
X-Received: by 2002:a05:6808:ab0:: with SMTP id
 r16mr6178864oij.34.1617292333310; 
 Thu, 01 Apr 2021 08:52:13 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id d21sm1093357oic.54.2021.04.01.08.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:52:13 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] iotests/231: Update expected deprecation message
Date: Thu,  1 Apr 2021 10:52:10 -0500
Message-Id: <20210401155211.2093139-2-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401155211.2093139-1-ckuehl@redhat.com>
References: <20210401155211.2093139-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
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

The deprecation message changed slightly at some point in the past but
the expected output wasn't updated along with it; causing it to fail.
Fix it, so it passes.

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 tests/qemu-iotests/231.out | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/231.out b/tests/qemu-iotests/231.out
index 579ba11c16..747dd221bb 100644
--- a/tests/qemu-iotests/231.out
+++ b/tests/qemu-iotests/231.out
@@ -1,9 +1,7 @@
 QA output created by 231
-qemu-img: RBD options encoded in the filename as keyvalue pairs is deprecated.  Future versions may cease to parse these options in the future.
+qemu-img: warning: RBD options encoded in the filename as keyvalue pairs is deprecated
 unable to get monitor info from DNS SRV with service name: ceph-mon
-no monitors specified to connect to.
 qemu-img: Could not open 'json:{'file.driver':'rbd','file.filename':'rbd:rbd/bogus:conf=BOGUS_CONF'}': error connecting: No such file or directory
 unable to get monitor info from DNS SRV with service name: ceph-mon
-no monitors specified to connect to.
 qemu-img: Could not open 'json:{'file.driver':'rbd','file.pool':'rbd','file.image':'bogus','file.conf':'BOGUS_CONF'}': error connecting: No such file or directory
 *** done
-- 
2.30.2


