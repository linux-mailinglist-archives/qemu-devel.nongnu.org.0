Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60128352146
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 23:03:48 +0200 (CEST)
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS4Tj-0008Gw-BC
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 17:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS4S0-0007FH-Js
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS4Rw-0003BW-BD
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617310915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rLdh25TWVseATfPielzouNj9MghUXWv4cq/clewmuw=;
 b=cblWpYWaP0fL/h6SP+2/wdUSMs+0cfK45PYhLt0AHNXGpbHmTtg3KljKyVHlcVoaXbzkQa
 L7GFz+gE03ccJNp3f/lSgqq923Tyv3E2tSCtiFYte3ZrWQqu36sEVay5KATFRHwY8m6T5Y
 LF9syHAegYYxRsi7J57o30Hife0rP2w=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-l23FMQfSPaexNVBUC3ciqg-1; Thu, 01 Apr 2021 17:01:53 -0400
X-MC-Unique: l23FMQfSPaexNVBUC3ciqg-1
Received: by mail-ot1-f70.google.com with SMTP id v24so3071063ota.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 14:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1rLdh25TWVseATfPielzouNj9MghUXWv4cq/clewmuw=;
 b=ka+URsXkalzY39CsLUOGIRlqok2q+nrAKPXrbkp6eSyl6dQsjxjFBhGQNk06uRo4zE
 8NnvFDP83J1fMcEzaOjyun7m06MCg8Dn+AruHitTFbrB9rszXdqsBHjlZSK6rP5CJBkI
 7Dxmdi1gFTVtDOow/5HFpxd4DT8rAhkB7pL8s4pKqgjyL+HFwv4wnZLWMazVtNBVbl2d
 bhfUIS1Z+m1AbNA3XNsgrmrNyvToiO86DaSUhm8H1dFYnzNOSqf8tslo3lFOHhNSaLqB
 K3AT4oQDnSPOnZ9mwTDH4OpbpBpcgS0hYfUzyxIWDOPm2sTTid669TjInnHUCR1ZYamq
 5fqA==
X-Gm-Message-State: AOAM53228HyUtJ7hXrxBV9JRtO0Hn/gwdesSjSduCbKIujw5RTX8k5yM
 pwGL+WaMX+IElrs34n8UMUfH8ulE4MI3DXskYrPcoLqJMOfi/0rZzwpfee0o9j3wtnnUNqR1zYZ
 lgeWKeME+8idyG0g=
X-Received: by 2002:a9d:4e05:: with SMTP id p5mr8549603otf.264.1617310913268; 
 Thu, 01 Apr 2021 14:01:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztxXcvkr3VRozYA9s0F8r/2TXqBVARj9PpLU6tLgLc6/Jv4j2JnxcaUuN3fYxBJnCcw8zBng==
X-Received: by 2002:a9d:4e05:: with SMTP id p5mr8549590otf.264.1617310913098; 
 Thu, 01 Apr 2021 14:01:53 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id g2sm1377891otn.32.2021.04.01.14.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 14:01:52 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/2] iotests/231: Update expected deprecation message
Date: Thu,  1 Apr 2021 16:01:49 -0500
Message-Id: <20210401210150.2127670-2-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401210150.2127670-1-ckuehl@redhat.com>
References: <20210401210150.2127670-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
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
Reworded the commit log and added Max's R-b.

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


