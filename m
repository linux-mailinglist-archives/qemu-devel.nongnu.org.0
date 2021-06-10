Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3923A341A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 21:33:36 +0200 (CEST)
Received: from localhost ([::1]:36578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrQQq-000626-07
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 15:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lrQPr-0005L0-Gh
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lrQPo-0004XZ-QI
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623353551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wcXKEaTIdCIvfXn+VOxnk1/20ZXvRhgmYs9zKCkfmhs=;
 b=cYvHxUaOrCBkVza49jIQFcfHcWwd5xX6aQPcL3ZR67rw5wSg7vanpZRPntUFiHW8eGdq6R
 9a+2AjpCdbKsapoiluK4jRyOEIIqkSImc2dco23vYONnxxNpbMbwUmON8S6sKQCeGyduz9
 D+DjPBX3HHXsIcbr5EM+Vb+41CMymu8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-07tNLFP-P46R5XRgiocncQ-1; Thu, 10 Jun 2021 15:32:29 -0400
X-MC-Unique: 07tNLFP-P46R5XRgiocncQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 i6-20020a0cd8460000b029022689c68e72so14268614qvj.5
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 12:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wcXKEaTIdCIvfXn+VOxnk1/20ZXvRhgmYs9zKCkfmhs=;
 b=jh8NJljTZPZRb173bgbEIsMuV4Fh9157LEmm34LB9sOSHtl8D9iYYGL2UgnlyCx+gB
 JJ96XLLi2nCgpYhVUQbDGkc9bAjp3cSxztO4rJPZDO+Ln+j97k0l/wk+d6HIP2aHLL97
 K7p5mki47s+84R6BoDpcRdYcZO8Fa7gMnSZcvgx7XgI9t/Q9GNyzuHhCYwurZYpMn2zO
 fbEUxdDtfAjdpA3rEQ3ojCf6SFJK6B3ZNlIxfpRnVFcBeUJY4NwxokANb1vZuMYOgDZ5
 +/TQxqnYO/ufOTCLaANZweES77zp1hh9Mepfaw3orK16h8urRuNvN6fn9ZkhqsiaVehw
 sj9A==
X-Gm-Message-State: AOAM532t6nUKT1YA9AJjymcGDhR/ZgeE9922DUeGR/kc7mrAvTid64MJ
 pJBKjqnzsEqZW8qFxsklZ5YItAkFYZcApuqI27XO/ymLNgMUiWLUcb4gm88DoObIY2A7KuQrr9M
 zmxP3dvFg5pybdvE=
X-Received: by 2002:a37:911:: with SMTP id 17mr201870qkj.436.1623353549302;
 Thu, 10 Jun 2021 12:32:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLZK1yvchW7rAuHBuzWoD/Gy3WIuw/iIAKd2Jrsaly5GyhohXE97X/Bp0mHZkZYWbdKnZP4Q==
X-Received: by 2002:a37:911:: with SMTP id 17mr201852qkj.436.1623353549066;
 Thu, 10 Jun 2021 12:32:29 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id 7sm2938822qkb.86.2021.06.10.12.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 12:32:28 -0700 (PDT)
Date: Thu, 10 Jun 2021 15:32:27 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/2] tests: migration-test: Add dirty ring test
Message-ID: <YMJoy7rPDNNJpyVr@t490s>
References: <20210610005239.265588-1-peterx@redhat.com>
 <20210610005239.265588-3-peterx@redhat.com>
 <YMJhmOXglbMlX5P6@work-vm>
MIME-Version: 1.0
In-Reply-To: <YMJhmOXglbMlX5P6@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 08:01:44PM +0100, Dr. David Alan Gilbert wrote:
> > +#include <linux/kvm.h>
> 
> Does that get you the system headers, which may or may not have
> KVM_CAP_DIRTY_LOG_RING if you're on an old host, or does it get you
> qemu's linux-headers which definitely does?

I tested it and it's using the linux-headers/ file even if I also got the other
/usr/include one.  So I think the qemu one just has higher priority in the "-I"
paths.

Btw, IIUC quotting with <> or "" should be the same here for headers, so I'm
thinking maybe I should switch to "" like the rest headers.

> 
> What happens on a BSD or the like?

Ah, good point..

How about I squash this into the patch?

---8<---
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index cc6e396d1a2..9ef6b471353 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 
-#include <linux/kvm.h>
 #include "libqos/libqtest.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
@@ -28,6 +27,10 @@
 #include "migration-helpers.h"
 #include "tests/migration/migration-test.h"
 
+#if defined(__linux__)
+#include "linux/kvm.h"
+#endif
+
 /* TODO actually test the results and get rid of this */
 #define qtest_qmp_discard_response(...) qobject_unref(qtest_qmp(__VA_ARGS__))
 
@@ -1392,6 +1395,7 @@ static void test_multifd_tcp_cancel(void)
 
 static bool kvm_dirty_ring_supported(void)
 {
+#if defined(__linux__)
     int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
 
     if (kvm_fd < 0) {
@@ -1407,6 +1411,9 @@ static bool kvm_dirty_ring_supported(void)
     }
 
     return true;
+#else
+    return false;
+#endif
 }
 
 int main(int argc, char **argv)
---8<---

Thanks!

-- 
Peter Xu


