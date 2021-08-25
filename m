Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E99A3F778D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:41:14 +0200 (CEST)
Received: from localhost ([::1]:53400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIu5Z-0001Mr-15
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4L-0007by-Nv; Wed, 25 Aug 2021 10:39:57 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:46774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4K-00070f-2A; Wed, 25 Aug 2021 10:39:57 -0400
Received: by mail-qk1-x735.google.com with SMTP id m21so27307468qkm.13;
 Wed, 25 Aug 2021 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yHNKCCrSFOaZ61dWRzeirEEmRpCNXGzXmuX4TNAvNJI=;
 b=fz8pYAXAJsB33GPQbMo7DMD7Hjocij4+Ae87adfgLOwoK8DEoX8HUAyYA/R61Uj7JN
 7/FvYiKg0mHJNJELlDwh9PyB8CGRYTUb6bps6U4sGJt+6lNTVLtETwPls2x9ddRn232J
 yiARDxc7ALTpAzwQh0fMPFojWeY+d0vRIWnKhcZFnfMqcPzzRBsa5EZ3H2LcX5r9AX8g
 LohwoIyOTUzy62fWTDjoJxObGYhypkiu3cRmEAFNGQBV748nfq5nS87k9aN762AJFBpg
 zvLJXbr7joIoFXZIlfNcovP4hdtptCuVnh/Sij3UbqFppIW3gQPbA0uSJKm/qJVd1+Df
 iy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yHNKCCrSFOaZ61dWRzeirEEmRpCNXGzXmuX4TNAvNJI=;
 b=SJqzjqkvgpL5JHABTbCD5uDkTjjYbneJQ2083BskQPXPfuVb/WzuHa/U28yXFTF7d6
 OpRqT0azFP4+mr92K3D8YL4vCdwskIf/pUlbhFxKhGjKc6bHlZfx0qD8CHG2nJCFJpUI
 mJ618Nl1RXoGCbEdY4nkJh4bvliOC0kb/uVOWSntU3R+b/A8FV5/5jBAgk18OdVLhEmr
 kow3CBFWW5LWu0TeLtYykQL4mQhS835nEftBVYf8SyxbibCgz9H1zgdQX7BnB+mBhzaw
 pdx+DUkDPiPuj8qizdSIyORxQH85r8DdhRM0QI4jF7W/b/0X/cWkjY+A0u4p3MDpW7Ks
 o1pQ==
X-Gm-Message-State: AOAM533kLcuI0geAAeyfACvNncDSzCkn/nJOx6ZZl42yXdMLWPs7aYEy
 yQgYn4/SP1kmhu/IIby5HPiwfnONWmQ=
X-Google-Smtp-Source: ABdhPJwQyPrmis5Jgm6p+Oots2EKt/aLPJQumqxZW3joozwN7fklbJxFTTSMNQn4KiL+nn+70Plzvg==
X-Received: by 2002:ae9:ed17:: with SMTP id c23mr31821450qkg.462.1629902394397; 
 Wed, 25 Aug 2021 07:39:54 -0700 (PDT)
Received: from rekt.ihost.com ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id 69sm129819qke.55.2021.08.25.07.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 07:39:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH v3 0/5] pSeries FORM2 affinity support
Date: Wed, 25 Aug 2021 11:39:38 -0300
Message-Id: <20210825143943.529733-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x735.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a repost of RFCv3 [1] rebased using current David's ppc-for-6.2.

The reason of this repost is that the kernel side changes got accepted
in the maintainer's tree [2], meaning that this series is now an implementation
of the future FORM2 kernel support in the pseries kernel.

In a POWER9 host with Annesh's patches from [2] and a QEMU with this
series, and a guest with the following NUMA distances:

(...)
-object memory-backend-ram,id=mem0,size=4G -numa node,memdev=mem0,cpus=0-1,nodeid=0 \
-object memory-backend-ram,id=mem1,size=4G -numa node,memdev=mem1,cpus=2-3,nodeid=1 \
-object memory-backend-ram,id=mem2,size=4G -numa node,memdev=mem2,cpus=4-5,nodeid=2 \
-object memory-backend-ram,id=mem3,size=2G -numa node,memdev=mem3,cpus=6-7,nodeid=3 \
-numa node,nodeid=4 \
-numa dist,src=0,dst=1,val=22 -numa dist,src=0,dst=2,val=22 \
-numa dist,src=0,dst=3,val=22 -numa dist,src=0,dst=4,val=22 \
-numa dist,src=1,dst=0,val=44 -numa dist,src=1,dst=2,val=44 \
-numa dist,src=1,dst=3,val=44 -numa dist,src=1,dst=4,val=44 \
-numa dist,src=2,dst=0,val=66 -numa dist,src=2,dst=1,val=66 \
-numa dist,src=2,dst=3,val=66 -numa dist,src=2,dst=4,val=66 \
-numa dist,src=3,dst=0,val=88 -numa dist,src=3,dst=1,val=88 \
-numa dist,src=3,dst=2,val=88 -numa dist,src=3,dst=4,val=88


This is the output of 'numactl -H' in the guest:

# numactl -H                                                                                       
available: 4 nodes (0-3)                                                                                             
node 0 cpus: 0 1                                        
node 0 size: 3987 MB                                                                   
node 0 free: 3362 MB                       
node 1 cpus: 2 3                                 
node 1 size: 4090 MB                                    
node 1 free: 4071 MB                                 
node 2 cpus: 4 5                                      
node 2 size: 4090 MB                      
node 2 free: 4075 MB                      
node 3 cpus: 6 7                       
node 3 size: 2027 MB                                                                                                 
node 3 free: 2010 MB                                                                                                 
node distances:                                                                                                      
node   0   1   2   3                                                                                                 
  0:  10  22  22  22
  1:  44  10  44  44
  2:  66  66  10  66
  3:  88  88  88  10


We're now able to set asynchronous distances between nodes while also
not being constrained to any fixed values (10, 20, 40, 80 ...) like we
currently are when using FORM1.


[1] https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg03622.html
[2] https://lore.kernel.org/linuxppc-dev/20210812132223.225214-1-aneesh.kumar@linux.ibm.com/


Daniel Henrique Barboza (5):
  spapr_numa.c: split FORM1 code into helpers
  spapr: move NUMA data init to post-CAS
  spapr_numa.c: base FORM2 NUMA affinity support
  spapr: simplify spapr_numa_associativity_init params
  spapr: move memory/cpu less check to spapr_numa_FORM1_affinity_init()

 hw/ppc/spapr.c              |  60 ++++------
 hw/ppc/spapr_hcall.c        |   4 +
 hw/ppc/spapr_numa.c         | 224 +++++++++++++++++++++++++++++++++---
 include/hw/ppc/spapr.h      |   1 +
 include/hw/ppc/spapr_numa.h |   3 +-
 include/hw/ppc/spapr_ovec.h |   1 +
 6 files changed, 236 insertions(+), 57 deletions(-)

-- 
2.31.1


