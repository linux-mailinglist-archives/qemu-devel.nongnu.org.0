Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB27248242A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 14:23:36 +0100 (CET)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Hsd-0005lD-Ok
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 08:23:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLI-0006jB-8n
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLE-0000nj-77
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JX8D87/LEKsaXl8Ex10SP502prmszBQakHSaMn3/tI=;
 b=jJSyozcwTiZuKRR89To5AVKGGpRbkjPRgUQbiKujvh5jYtjUm4zkFhyiTIrSsxKkU9hxNW
 Tv/DjxlfIYdKWTBIgtMd+maHUWdiwaaaYTlNRAEPlUOP0ReoNBzjvuIfzLvy/kKQ3AgI3Q
 jmTlLjWizuruYY/ht58hLxoPNiafAlg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-j91n6NZONjCHTzJEBZvfLA-1; Fri, 31 Dec 2021 07:48:54 -0500
X-MC-Unique: j91n6NZONjCHTzJEBZvfLA-1
Received: by mail-wr1-f70.google.com with SMTP id
 c16-20020adfa310000000b001a2349890e1so7494546wrb.0
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9JX8D87/LEKsaXl8Ex10SP502prmszBQakHSaMn3/tI=;
 b=6RPpBEJRwxS4fecQ7M98VKkxVtscQiy2xBb6qa2xAX733q3gTxnR59aa8tCWwNS5hp
 pTzGdtpJP+6Evon3njH5S7DcO1lyK9WAfOG+SlZHUQQpSTCZBufoQMZrdjfKF2E3h+bS
 u1bAz7ENQ5cAODJW1dGrDhtRY1PJIQct/ntGiyX9RE+xKoixDxIP18p9qQVUuC/wsvkv
 GcmPyPRTVJEzmXs5SgE2TMM01WrY+t+1kksNLO8gJhPkW48StxcWiIHrKeLVVFJgpBVx
 4DQaacS86/ajJxMS3m9KEpIYMvRKQY64O+VBTZXY9PHM/H8ceTWrj9IAlNPUAKKSbBsN
 fqyA==
X-Gm-Message-State: AOAM532n/3tFm+j+sqTB38PGTpBoZw27nyhC+6NU+JRL0+MoPnOtuEl2
 /ZtV+UWZ8hry+BYUhCq4MwIdRC/aBezGRpktVgb3teYpkoa2+Flb8RCL0Ayzr0vYLAJN9CvDIU+
 AURSrUZjcfd5wwmociJFtF59O79JxXpxfbH78McBPelQCIQm9aOUG5wsM03x3IePo
X-Received: by 2002:a5d:6dac:: with SMTP id u12mr28656591wrs.233.1640954932715; 
 Fri, 31 Dec 2021 04:48:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzo8OWlah1bRgYua66cksuSvwH/bV8Mog7xAMHg3MPIkkDberGOMj4p6rumOE4S8s5Y+DfLEQ==
X-Received: by 2002:a5d:6dac:: with SMTP id u12mr28656571wrs.233.1640954932340; 
 Fri, 31 Dec 2021 04:48:52 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id m17sm26763398wrw.11.2021.12.31.04.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] qemu-options: Improve readability of SMP related Docs
Date: Fri, 31 Dec 2021 13:47:47 +0100
Message-Id: <20211231124754.1005747-14-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

We have a description in qemu-options.hx for each CPU topology
parameter to explain what it exactly means, and also an extra
declaration for the target-specific one, e.g. "for PC only"
when describing "dies", and "for PC, it's on one die" when
describing "cores".

Now we are going to introduce one more non-generic parameter
"clusters", it will make the Doc less readable and  if we still
continue to use the legacy way to describe it.

So let's at first make two tweaks of the Docs to improve the
readability and also scalability:
1) In the -help text: Delete the extra specific declaration and
   describe each topology parameter level by level. Then add a
   note to declare that different machines may support different
   subsets and the actual meaning of the supported parameters
   will vary accordingly.
2) In the rST text: List all the sub-hierarchies currently
   supported in QEMU, and correspondingly give an example of
   -smp configuration for each of them.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211228092221.21068-2-wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qemu-options.hx | 74 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 16 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 7d475109478..b39377de3fc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -207,14 +207,26 @@ ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
-    "                set the number of CPUs to 'n' [default=1]\n"
+    "                set the number of initial CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total CPUs, including\n"
     "                offline CPUs for hotplug, etc\n"
-    "                sockets= number of discrete sockets in the system\n"
-    "                dies= number of CPU dies on one socket (for PC only)\n"
-    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
-    "                threads= number of threads on one CPU core\n",
-        QEMU_ARCH_ALL)
+    "                sockets= number of sockets on the machine board\n"
+    "                dies= number of dies in one socket\n"
+    "                cores= number of cores in one die\n"
+    "                threads= number of threads in one core\n"
+    "Note: Different machines may have different subsets of the CPU topology\n"
+    "      parameters supported, so the actual meaning of the supported parameters\n"
+    "      will vary accordingly. For example, for a machine type that supports a\n"
+    "      three-level CPU hierarchy of sockets/cores/threads, the parameters will\n"
+    "      sequentially mean as below:\n"
+    "                sockets means the number of sockets on the machine board\n"
+    "                cores means the number of cores in one socket\n"
+    "                threads means the number of threads in one core\n"
+    "      For a particular machine type board, an expected CPU topology hierarchy\n"
+    "      can be defined through the supported sub-option. Unsupported parameters\n"
+    "      can also be provided in addition to the sub-option, but their values\n"
+    "      must be set as 1 in the purpose of correct parsing.\n",
+    QEMU_ARCH_ALL)
 SRST
 ``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
     Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
@@ -225,27 +237,57 @@ SRST
     initial CPU count will match the maximum number. When only one of them
     is given then the omitted one will be set to its counterpart's value.
     Both parameters may be specified, but the maximum number of CPUs must
-    be equal to or greater than the initial CPU count. Both parameters are
-    subject to an upper limit that is determined by the specific machine
-    type chosen.
+    be equal to or greater than the initial CPU count. Product of the
+    CPU topology hierarchy must be equal to the maximum number of CPUs.
+    Both parameters are subject to an upper limit that is determined by
+    the specific machine type chosen.
 
-    To control reporting of CPU topology information, the number of sockets,
-    dies per socket, cores per die, and threads per core can be specified.
-    The sum `` sockets * cores * dies * threads `` must be equal to the
-    maximum CPU count. CPU targets may only support a subset of the topology
-    parameters. Where a CPU target does not support use of a particular
-    topology parameter, its value should be assumed to be 1 for the purpose
-    of computing the CPU maximum count.
+    To control reporting of CPU topology information, values of the topology
+    parameters can be specified. Machines may only support a subset of the
+    parameters and different machines may have different subsets supported
+    which vary depending on capacity of the corresponding CPU targets. So
+    for a particular machine type board, an expected topology hierarchy can
+    be defined through the supported sub-option. Unsupported parameters can
+    also be provided in addition to the sub-option, but their values must be
+    set as 1 in the purpose of correct parsing.
 
     Either the initial CPU count, or at least one of the topology parameters
     must be specified. The specified parameters must be greater than zero,
     explicit configuration like "cpus=0" is not allowed. Values for any
     omitted parameters will be computed from those which are given.
+
+    For example, the following sub-option defines a CPU topology hierarchy
+    (2 sockets totally on the machine, 2 cores per socket, 2 threads per
+    core) for a machine that only supports sockets/cores/threads.
+    Some members of the option can be omitted but their values will be
+    automatically computed:
+
+    ::
+
+        -smp 8,sockets=2,cores=2,threads=2,maxcpus=8
+
+    The following sub-option defines a CPU topology hierarchy (2 sockets
+    totally on the machine, 2 dies per socket, 2 cores per die, 2 threads
+    per core) for PC machines which support sockets/dies/cores/threads.
+    Some members of the option can be omitted but their values will be
+    automatically computed:
+
+    ::
+
+        -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16
+
     Historically preference was given to the coarsest topology parameters
     when computing missing values (ie sockets preferred over cores, which
     were preferred over threads), however, this behaviour is considered
     liable to change. Prior to 6.2 the preference was sockets over cores
     over threads. Since 6.2 the preference is cores over sockets over threads.
+
+    For example, the following option defines a machine board with 2 sockets
+    of 1 core before 6.2 and 1 socket of 2 cores after 6.2:
+
+    ::
+
+        -smp 2
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.33.1


