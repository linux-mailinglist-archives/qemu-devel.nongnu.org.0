Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16915405A28
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:25:07 +0200 (CEST)
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLvG-000512-4a
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOLtg-0003LJ-N5
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOLtT-0003bX-Gx
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631200994;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2rTnDyQ9gcKAwXiLaDQRcAjN42lCHVzMyy2J2OZ5o9E=;
 b=TGqhCmv69ykasEXyQqiRl4NHKQDI8VGMwM1gDWMYKz4oxxONFKS3vxVd/rfiACHYt0XYPN
 KIAOqe9DabK//Fxa0VLjNcmB/bheapVn5LA9hCqQJyh0NWQFwJOFkCmw7xGjHXZKWD6bvV
 5bo2wgucSIFqyo8lCq97j7Vfo+bHY9k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-e0sy8uTnNK28GZQVhM8qVw-1; Thu, 09 Sep 2021 11:23:12 -0400
X-MC-Unique: e0sy8uTnNK28GZQVhM8qVw-1
Received: by mail-wr1-f72.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso623636wrn.19
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 08:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=2rTnDyQ9gcKAwXiLaDQRcAjN42lCHVzMyy2J2OZ5o9E=;
 b=zUTwXeWVIMt9idG+YAXIplZ5vPBX+f+iRu525lUXErzTaKgv3SfmKg/xxYRGlItg7p
 aHNEq8Axcx/wNGgTOcxqRYnu9e+Yzz3/whfk7rpeV2HorwGuYdbbI4rI8exenUY3MNRe
 HZ9EAjDXrhQPhubHxP/HfP2cuq24E2c6KsKMq5pfeNbIuniK38gpUu6W1MjDRhMFqjIt
 mFR330A9OfkBkkEeOvp0+suVqyVqnaDXZpdYo0fJwOL1xcaYeoYN7QJQyNUEoHvLgzFu
 6Mrz7gtdrpsM6kTX7s0ruH0kglF427ZQb3TOmySjI/g+txYTWmWjx3F+m9QK5BO7BNRd
 q8DA==
X-Gm-Message-State: AOAM532JOSAXaGhxvrrstdvfnFnrfBr/Nxe44DxiDKk9gFY5EDAlDY2y
 5jHNqBWFg32BUInrbLeV6TKMXLJLQOA3TFiaDJEalDnOe1XhN2XI6h1LC5+APFpMOj8IsM/jjR5
 oYO65AJ13jvbg1lc=
X-Received: by 2002:a5d:5490:: with SMTP id h16mr4271194wrv.170.1631200991371; 
 Thu, 09 Sep 2021 08:23:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC4TKbtWzkGAGNBfE2SwgjZE1/8oMxlPxM2Mk7esKEPz4DcFT3DvH90QBOdcdFlwAPkBhO4A==
X-Received: by 2002:a5d:5490:: with SMTP id h16mr4271174wrv.170.1631200991164; 
 Thu, 09 Sep 2021 08:23:11 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id d29sm2213579wrc.6.2021.09.09.08.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 08:23:10 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Li, Zhijian" <lizhijian@cn.fujitsu.com>
Subject: Re: [PULL 0/7] Migration.next patches
In-Reply-To: <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com> (Zhijian
 Li's message of "Thu, 9 Sep 2021 22:48:22 +0800")
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
 <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 09 Sep 2021 17:23:09 +0200
Message-ID: <87k0jpn57m.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Li, Zhijian" <lizhijian@cn.fujitsu.com> wrote:
> on 2021/9/9 21:42, Peter Maydell wrote:
>> On Thu, 9 Sept 2021 at 11:36, Juan Quintela <quintela@redhat.com> wrote:
>> Fails to build, FreeBSD:
>>
>> ../src/migration/rdma.c:1146:23: error: use of undeclared identifier
>> 'IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE'
>>      int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
>>                        ^
>> ../src/migration/rdma.c:1147:18: error: use of undeclared identifier
>> 'IBV_ADVISE_MR_ADVICE_PREFETCH'
>>                   IBV_ADVISE_MR_ADVICE_PREFETCH;
>>                   ^
>> ../src/migration/rdma.c:1150:11: warning: implicit declaration of
>> function 'ibv_advise_mr' is invalid in C99
>> [-Wimplicit-function-declaration]
>>      ret = ibv_advise_mr(pd, advice,
>>            ^
>> ../src/migration/rdma.c:1151:25: error: use of undeclared identifier
>> 'IBV_ADVISE_MR_FLAG_FLUSH'
>>                          IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
>>                          ^
>>
> it's introduced by [PULL 4/7] migration/rdma: advise prefetch write for ODP region
> where it calls a ibv_advise_mr(). i have checked the latest FreeBSD, it didn't ship with this API
> May i know if just FressBSD reports this failure? if so, i just need filtering out FreeBSD only

The other way around I think.
What about:

It compiled on my Linux machine, but it *should* work on any (famous
last words).  Finishing compilation 

Later, Juan.

From 964e436bdb8aef7dbebc28415e4ac3c5822b552e Mon Sep 17 00:00:00 2001
From: Juan Quintela <quintela@redhat.com>
Date: Thu, 9 Sep 2021 17:07:17 +0200
Subject: [PATCH] rdma: test for ibv_advise_mr API

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 configure        | 28 ++++++++++++++++++++++++++++
 migration/rdma.c |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/configure b/configure
index 8adf2127c3..70054fd702 100755
--- a/configure
+++ b/configure
@@ -339,6 +339,7 @@ whpx="auto"
 nvmm="auto"
 rdma="$default_feature"
 pvrdma="$default_feature"
+rdma_ibv_advise_mr="no"
 gprof="no"
 debug_tcg="no"
 debug="no"
@@ -2918,6 +2919,29 @@ EOF
     fi
 fi
 
+# Let's see if enhanced reg_mr is supported
+if test "$rdma" = "yes" ; then
+
+cat > $TMPC <<EOF &&
+#include <infiniband/verbs.h>
+
+int
+main(void)
+{
+    int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
+                 IBV_ADVISE_MR_ADVICE_PREFETCH;
+    struct ibv_sge sg_list = {.lkey = lkey, .addr = addr, .length = len};
+
+    ibv_advise_mr(pd, advice, IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
+    return 0;
+}
+EOF
+    if ! compile_prog "" "-libverbs"; then
+	rdma_ibv_advise_mr="yes"
+    fi
+fi
+
+
 ##########################################
 # xfsctl() probe, used for file-posix.c
 if test "$xfs" != "no" ; then
@@ -4802,6 +4826,10 @@ if test "$rdma" = "yes" ; then
   echo "RDMA_LIBS=$rdma_libs" >> $config_host_mak
 fi
 
+if test "$rdma_ibv_advise_mr" = "yes"; then
+  echo "CONFIG_IBV_ADVISE_MR=y" >> $config_host_mak
+fi
+
 if test "$pvrdma" = "yes" ; then
   echo "CONFIG_PVRDMA=y" >> $config_host_mak
 fi
diff --git a/migration/rdma.c b/migration/rdma.c
index 6c2cc3f617..aac343253f 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1142,6 +1142,7 @@ static void qemu_rdma_advise_prefetch_mr(struct ibv_pd *pd, uint64_t addr,
                                          uint32_t len,  uint32_t lkey,
                                          const char *name, bool wr)
 {
+#if CONFIG_IBV_ADVISE_MR
     int ret;
     int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
                  IBV_ADVISE_MR_ADVICE_PREFETCH;
@@ -1155,6 +1156,7 @@ static void qemu_rdma_advise_prefetch_mr(struct ibv_pd *pd, uint64_t addr,
     } else {
         trace_qemu_rdma_advise_mr(name, len, addr, "successed");
     }
+#endif
 }
 
 static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
-- 
2.31.1


