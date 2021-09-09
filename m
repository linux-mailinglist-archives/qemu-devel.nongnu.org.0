Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F80D405A86
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 18:12:02 +0200 (CEST)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOMef-0001jH-JF
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 12:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOMdW-0000Tm-KH
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:10:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOMdT-000298-Cr
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631203845;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=q7PFWHEC2YCRHRP0DTBDbDO8ypuKDIGBWZ6rKPLn29E=;
 b=I6msOpB8MG2vP8DPybZXVdZ6aLgZsBS5N72NNJNLdhIGqggcpiCRVEyXwyCl90hsOYZTb0
 Yhu/yNRAyj9DUNLYvVwbLdgbrGUnLMBrsJ+pXb4h+MaDnWkY6kzx0GsgBNvJzKidsxawIk
 PnPoR6Sjflmloq4WOdZL06pnrlaS+M8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-sHdpfMAXPr6KvoUfW_TnZg-1; Thu, 09 Sep 2021 12:10:42 -0400
X-MC-Unique: sHdpfMAXPr6KvoUfW_TnZg-1
Received: by mail-wr1-f71.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso675895wrn.19
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 09:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=q7PFWHEC2YCRHRP0DTBDbDO8ypuKDIGBWZ6rKPLn29E=;
 b=5KIs0ePOI5HvjbJPehOX3BNSW6lCOYzL2Dr4kC/lcTRhmqQO0JYQXd47dm4ROrfRPI
 OgLJ8gfpJ+mArKclj61dN9nlVZ5yXa1LPkdqixBTcsjfRLbVJIarazZlKUF9oXkyF1tZ
 tqMt1VKep3BwJRlttgGF60NZWqrPoseYE+QW44Kb6CjNNPwwVs5AaAMAoIjxQ3aw0kHQ
 +bhspxqlxEho8yDc975jLDQpBWOA/EdQJ5DJshgM/9DbLi180tQM4Bfc317GG80L3rnK
 JG0kCcWTHAC65gle0KLB5+QrPIT8m6aJAXLIsXBayAwqDZW1UlaBgbDT9tUto5kYXiQn
 TtKQ==
X-Gm-Message-State: AOAM531a/7KKnhxtFM9Q9P7gC9+rtOmiLwsh0IAoC84goI9bGXtTp1L2
 wMzt91NsBFfkiSTaiPgVKYbORk6EHV2y4yzED0Yg/h3EJ/Omopbj3IA7C3qrZeSvdzjH1k1Rtap
 gxStmJOaFM/ojv2E=
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr4522036wrf.312.1631203840829; 
 Thu, 09 Sep 2021 09:10:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkhMJlAYaVxwvWI/PQDlmiMziGoCGd1NFpK+9gZ39qcgb0WlBUicISdgDlv1oTEziE/E0IHQ==
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr4522011wrf.312.1631203840565; 
 Thu, 09 Sep 2021 09:10:40 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id c14sm2184174wrr.58.2021.09.09.09.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 09:10:40 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Li, Zhijian" <lizhijian@cn.fujitsu.com>
Subject: Re: [PULL 0/7] Migration.next patches
In-Reply-To: <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com> (Zhijian
 Li's message of "Thu, 9 Sep 2021 22:48:22 +0800")
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
 <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 09 Sep 2021 18:10:39 +0200
Message-ID: <87fsudn30g.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Second try.  I can't see an example where they search for:
a symbol on the header file
  and
a function in a library

so I assume that if you have the symbols, you have the function.

How do you see it?

Trying to compile it on vm-build-freebsd, but not being very sucessfull
so far.

Later, Juan.

From e954c1e0afc785a98d472201dafe75a7e7126b1d Mon Sep 17 00:00:00 2001
From: Juan Quintela <quintela@redhat.com>
Date: Thu, 9 Sep 2021 17:07:17 +0200
Subject: [PATCH] rdma: test for ibv_advise_mr API

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 meson.build      | 3 +++
 migration/rdma.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meson.build b/meson.build
index 7e58e6279b..c2eb437df4 100644
--- a/meson.build
+++ b/meson.build
@@ -1375,6 +1375,9 @@ config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
 config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
                      cc.has_member('struct stat', 'st_atim',
                                    prefix: '#include <sys/stat.h>'))
+config_host_data.set('CONFIG_RDMA_IBV_ADVISE_MR',
+                     cc.has_header_symbol('infiniband/verbs.h', 'IBV_ADVISE_MR_ADVICE_PREFETCH') and
+                     cc.has_header_symbol('infiniband/verbs.h', 'IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE'))
 
 config_host_data.set('CONFIG_EVENTFD', cc.links('''
   #include <sys/eventfd.h>
diff --git a/migration/rdma.c b/migration/rdma.c
index 6c2cc3f617..f0d78597fb 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1142,6 +1142,7 @@ static void qemu_rdma_advise_prefetch_mr(struct ibv_pd *pd, uint64_t addr,
                                          uint32_t len,  uint32_t lkey,
                                          const char *name, bool wr)
 {
+#ifdef CONFIG_RDMA_IBV_ADVISE_MR
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


