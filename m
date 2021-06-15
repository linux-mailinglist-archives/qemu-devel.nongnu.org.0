Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D13A7348
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:34:58 +0200 (CEST)
Received: from localhost ([::1]:46652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsxyi-0001pJ-Qr
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxP-000850-9O; Mon, 14 Jun 2021 21:33:35 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:41596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxN-0002PW-7g; Mon, 14 Jun 2021 21:33:34 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id x2so20857228qvo.8;
 Mon, 14 Jun 2021 18:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUYJPuF6sFgluZ0JLW6HfTToa3W+QfD4/lLH5qU78QI=;
 b=ErzGCldtIG6qceIpY6yemhPRtwFfDE6fy8v1XfRsXn8GtavAVzMSKBY/YdcFA0X9mZ
 5xOWtrgqaZso2dQd6AwwDFaYsYp1pQrBN0LWq10nmDe8OrmZqkfIkaLMnNrTh6pMLUKP
 9e5hVtEJnCjwUtZXz6EL+KiZuoejUYbirhNiz5FLROUW+zS+H7bOXWezvb4suWB0vENM
 E8CzbOkIrgoTbLEqNQqtgzX4fYMnxyYNNTMjyJW7eU4C4kGGljrrOPWKKQOM1l7B9MCL
 oTVdwA+xGEGb4Wuh4YalESvMib3M5RgVuXA2FYQu1gUz+xb3EPs4CU9fACLb0G+/GBYr
 6tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUYJPuF6sFgluZ0JLW6HfTToa3W+QfD4/lLH5qU78QI=;
 b=BUxPzGEFbMWm2IstwKhAZWEHsLwQTVpPK23ouaRMF941iTX1RCMAg5KWjo5w1qPvKX
 26UNFcU1VBMFW5vvE2JxhyRAyeko0TLl0unHFw/A8iHqoU0UJpp+2Wimt3u5HBrjn3YW
 dFHnMhOoslFv8qcx2e7E60eQP1b4BcIv6seq7/dixTxTLH6O/PKb4Lzu836WtPXJxtFq
 kiyXENG18dda/zx32fIQpXERd84Ia5gGeMYcu9SMkPiAiAPPkV2VS9MM9MNxg5foTqYZ
 df7hEKIcnCqkj0kNgzKiRr5yD6qQbMMIxLkQ4N/2XFdnqF+n7vlURga13/RFirv3NnIp
 mU7g==
X-Gm-Message-State: AOAM533BNWZ+ojzCbJreC0ZOIGhmeqY09i8C7mY0rPchb3qFiH0CF4ck
 6HT4QYbFj8yyFJm0U4QMPTZ7AtZJOMLxJQ==
X-Google-Smtp-Source: ABdhPJxy9B3zhkvm973cJ4ys5pKNxvP7QUd0pxD+oN9zb2ir0G3OdhbJqFozjyIfhaHl9ry4mFGTLg==
X-Received: by 2002:a0c:e88b:: with SMTP id b11mr2211659qvo.59.1623720810831; 
 Mon, 14 Jun 2021 18:33:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id h2sm11639320qkf.106.2021.06.14.18.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:33:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/8] pSeries base FORM2 NUMA affinity support
Date: Mon, 14 Jun 2021 22:33:01 -0300
Message-Id: <20210615013309.2833323-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This RFC series implements FORM2 NUMA associativity support in
the pSeries machine. This new associativity format is going to
be added in the LOPAR spec in the near future. For now, the preview
of the specification can be found in Aneesh kernel side patches that
implements this support, specially the documentation patch [2].

For QEMU, the most drastic change FORM2 brings is that, at long
last, we're free from the shackles of an overcomplicated and bloated
way of calculating NUMA distances. This new affinity format promotes
separation from performance metrics such as distance, latency,
bandwidth and so on from the ibm,associativity arrays of the
devices. This also allows for asymmetric NUMA configurations.

FORM2 is set by ibm,architecture-vec-5 bit 2 byte 5. This means that
the guest is able to choose between FORM1 and FORM2 during CAS, and
we need to adapt NUMA internals accordingly based on this choice.
Patches 1 to 5 implement the base FORM2 support in the pSeries
machine. 

Patches 6-8 deal with NVDIMM changes. FORM2 allows NVDIMMs to declare
an extra NUMA node called 'device-node' to support their use as persistent
memory. 'device-node' is locality based an can be different from the
NUMA node that the NVDIMM belongs to when used as regular memory.


With this series and Aneesh's guest kernel from [1], this is the
'numactl -H' output of this guest:

-----

sudo ppc64-softmmu/qemu-system-ppc64 \
-machine pseries,accel=kvm,usb=off,dump-guest-core=off \
-m size=14G,slots=256,maxmem=256G -smp 8,maxcpus=8,cores=2,threads=2,sockets=2 \
(...)
-object memory-backend-ram,id=mem0,size=4G -numa node,memdev=mem0,cpus=0-1,nodeid=0 \
-object memory-backend-ram,id=mem1,size=4G -numa node,memdev=mem1,cpus=2-3,nodeid=1 \
-object memory-backend-ram,id=mem2,size=4G -numa node,memdev=mem2,cpus=4-5,nodeid=2 \
-object memory-backend-ram,id=mem3,size=2G -numa node,memdev=mem3,cpus=6-7,nodeid=3 \
-numa dist,src=0,dst=1,val=22 -numa dist,src=0,dst=2,val=22 -numa dist,src=0,dst=3,val=22 \
-numa dist,src=1,dst=0,val=44 -numa dist,src=1,dst=2,val=44 -numa dist,src=1,dst=3,val=44 \
-numa dist,src=2,dst=0,val=66 -numa dist,src=2,dst=1,val=66 -numa dist,src=2,dst=3,val=66 \
-numa dist,src=3,dst=0,val=88 -numa dist,src=3,dst=1,val=88 -numa dist,src=3,dst=2,val=88 


# numactl -H 
available: 4 nodes (0-3)
node 0 cpus: 0 1
node 0 size: 3987 MB
node 0 free: 3394 MB
node 1 cpus: 2 3
node 1 size: 4090 MB
node 1 free: 4073 MB
node 2 cpus: 4 5
node 2 size: 4090 MB
node 2 free: 4072 MB
node 3 cpus: 6 7
node 3 size: 2027 MB
node 3 free: 2012 MB
node distances:
node   0   1   2   3 
  0:  10  22  22  22 
  1:  44  10  44  44 
  2:  66  66  10  66 
  3:  88  88  88  10 


The exact user NUMA distances were reflected in the kernel, without any
approximation like we have to do for FORM1.


[1] https://lore.kernel.org/linuxppc-dev/20210614164003.196094-1-aneesh.kumar@linux.ibm.com/
[2] https://lore.kernel.org/linuxppc-dev/20210614164003.196094-8-aneesh.kumar@linux.ibm.com/


Daniel Henrique Barboza (8):
  spapr: move NUMA data init to do_client_architecture_support()
  spapr_numa.c: split FORM1 code into helpers
  spapr_numa.c: wait for CAS before writing rtas DT
  spapr_numa.c: base FORM2 NUMA affinity support
  spapr: simplify spapr_numa_associativity_init params
  nvdimm: add PPC64 'device-node' property
  spapr_numa, spapar_nvdimm: write secondary NUMA domain for nvdimms
  spapr: move memory/cpu less check to spapr_numa_FORM1_affinity_init()

 hw/mem/nvdimm.c             |  28 ++++
 hw/ppc/spapr.c              |  53 +++-----
 hw/ppc/spapr_hcall.c        |   4 +
 hw/ppc/spapr_numa.c         | 250 +++++++++++++++++++++++++++++++++---
 hw/ppc/spapr_nvdimm.c       |   3 +-
 include/hw/mem/nvdimm.h     |  12 ++
 include/hw/ppc/spapr_numa.h |   6 +-
 include/hw/ppc/spapr_ovec.h |   1 +
 8 files changed, 299 insertions(+), 58 deletions(-)

-- 
2.31.1


