Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E687635A153
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:41:30 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsK9-0005TX-UR
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUsHn-00040T-7E
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:39:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUsHk-0005sM-5r
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617979138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/1Z1a79pHxMi8z+7raQlUIxCpa+oJP3YPAHEpVIdDI=;
 b=BfzCF+AWSgcEwtyP2ACBaXKA7fmr78qKgaZW/8yjts9agj9+A9Se1rbYiPScU7JRuaMCNd
 uuu7CX9Y/CmiGeGQ/SveOtiTF1DjmFWKTIFL7rpu9fYF7387toOb5A+5sZPCkyy51fISjX
 FgcJeZQfHCWzTb7sa4DzgglefTtllg0=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-YFoKeeNYNJiJmrZRljglEA-1; Fri, 09 Apr 2021 10:38:57 -0400
X-MC-Unique: YFoKeeNYNJiJmrZRljglEA-1
Received: by mail-ot1-f70.google.com with SMTP id a20so2726499otd.21
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 07:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/1Z1a79pHxMi8z+7raQlUIxCpa+oJP3YPAHEpVIdDI=;
 b=fM5dmVqluzjWB91wAS6NZ4AW9z97ObsMGGJTQ67a4dk9gPwJ9bTkJR9t6tYfALn+4L
 itB5UI+woXFw+yx5G4vnXPXwHAjTgZoClgD3KRyiqoYWJNSI3Z3FaPvfdrSkCRGmYGMm
 awidxSQ4IW4UFlh1xEjcBpaz4NaL9DM/fvotA1+gFlKNk4KZhBTOpUZuVt/QMgsMMF26
 SKWjSuHWZeg5ZUmzzpm86tIHZSv0AUXN3tFqwk0EMbczIuJMV+dOI/sgVhYDVipVfI+n
 ha8IHteT6zMzMoY58x8FbtqtB8s/MYfNMEJYvDDurFYazsIggsLvs8IsjpFcOppSRyHr
 koIg==
X-Gm-Message-State: AOAM5327XMQam44yiUeEsvqZjwr6Zj++dZ0YWS7tXZg7J/LPY3xsFb8G
 2H0kvidluzxilbH28RDcT+j4gHlGl9E8xCYi5txw317+6hUTohlrWMzdR8iVk9TT8PNTMrwKzS1
 JNZcKZleTdsPU2lM=
X-Received: by 2002:a9d:66c8:: with SMTP id t8mr12138553otm.173.1617979136819; 
 Fri, 09 Apr 2021 07:38:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTYKauvZXRpQEvHgcwpMLOue6K/Yhr80n14S1k1o8Aq7e7kkxW4PgcKA9GFFlfcI0nnDThgw==
X-Received: by 2002:a9d:66c8:: with SMTP id t8mr12138540otm.173.1617979136635; 
 Fri, 09 Apr 2021 07:38:56 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id e18sm647053otf.2.2021.04.09.07.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 07:38:56 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/2] iotests/231: Update expected deprecation message
Date: Fri,  9 Apr 2021 09:38:53 -0500
Message-Id: <20210409143854.138177-2-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210409143854.138177-1-ckuehl@redhat.com>
References: <20210409143854.138177-1-ckuehl@redhat.com>
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

The deprecation message in the expected output has technically been
wrong since the wrong version of a patch was applied to it. Because of
this, the test fails. Correct the expected output so that it passes.

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
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


