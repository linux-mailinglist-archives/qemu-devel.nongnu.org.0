Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3B65FD2C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:55:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDi6D-0002ZE-O2; Fri, 06 Jan 2023 03:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi63-0002WD-HD
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi62-0005US-1E
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672993741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOu604Z5UFAJTAsQ53c878BA+fal4cCtG/JMpcQgNcs=;
 b=GY++GEBOS4ABmlSX9ZeOj9I3RHLgi3yDIMlWrby7rROJ4Nc4i4vEkGchNTvFqdItz+KpRE
 esV2YtydT93u2kO/C8OZ5BEw1+qL2q5tFNiQ43oLW6f7+nGPGpSdMH1WW4Y+3nk06DcEyG
 VBd9QmmePtum3ZO7qadIt9bfYkZX2To=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-tQfkrrY2O6iXtcoRpeWvuw-1; Fri, 06 Jan 2023 03:29:00 -0500
X-MC-Unique: tQfkrrY2O6iXtcoRpeWvuw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFE63101A52E;
 Fri,  6 Jan 2023 08:28:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91492492B06;
 Fri,  6 Jan 2023 08:28:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL 02/15] tests/vm: Update get_default_jobs() to work on
 non-x86_64 non-KVM hosts
Date: Fri,  6 Jan 2023 09:28:40 +0100
Message-Id: <20230106082853.31787-3-thuth@redhat.com>
In-Reply-To: <20230106082853.31787-1-thuth@redhat.com>
References: <20230106082853.31787-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

On non-x86_64 host, if KVM is not available we get:

  Traceback (most recent call last):
    File "tests/vm/basevm.py", line 634, in main
      vm = vmcls(args, config=config)
    File "tests/vm/basevm.py", line 104, in __init__
      mem = max(4, args.jobs)
  TypeError: '>' not supported between instances of 'NoneType' and 'int'

Fix by always returning a -- not ideal but safe -- '1' value.

Fixes: b09539444a ("tests/vm: allow us to take advantage of MTTCG")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221209164743.70836-1-philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/basevm.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 2276364c42..23229e23d1 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -569,8 +569,7 @@ def get_default_jobs():
                 # more cores. but only up to a reasonable limit. User
                 # can always override these limits with --jobs.
                 return min(multiprocessing.cpu_count() // 2, 8)
-        else:
-            return 1
+        return 1
 
     parser = argparse.ArgumentParser(
         formatter_class=argparse.ArgumentDefaultsHelpFormatter,
-- 
2.31.1


