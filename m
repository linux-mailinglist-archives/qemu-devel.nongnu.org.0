Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A053493E2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:19:48 +0100 (CET)
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQpv-0005DA-D6
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPQom-0004f9-MW; Thu, 25 Mar 2021 10:18:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPQoj-0003Hj-Sj; Thu, 25 Mar 2021 10:18:36 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F5nFW1t79zpVSK;
 Thu, 25 Mar 2021 22:15:43 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 22:18:05 +0800
Subject: Re: [PATCH v3 6/7] hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <mst@redhat.com>, <jean-philippe@linaro.org>, <peterx@redhat.com>,
 <jasowang@redhat.com>, <pbonzini@redhat.com>
References: <20210309102742.30442-1-eric.auger@redhat.com>
 <20210309102742.30442-7-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <7fdc3340-51b5-3a89-7d41-2eac2c768829@huawei.com>
Date: Thu, 25 Mar 2021 22:18:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20210309102742.30442-7-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yuzenghui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/3/9 18:27, Eric Auger wrote:
> If the whole SID range (32b) is invalidated (SMMU_CMD_CFGI_ALL),
> @end overflows and we fail to handle the command properly.
> 
> Once this gets fixed, the current code really is awkward in the
> sense it loops over the whole range instead of removing the
> currently cached configs through a hash table lookup.
> 
> Fix both the overflow and the lookup.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Not much to do with this patch, but maybe we can take the fix a little
further. We now take StreamID as the start of the invalidation range,
regardless of whatever the Range is, whilst the spec clearly states that
"the StreamID parameter (of *CMD_CFGI_ALL* command) is IGNORED". If
there are some random bits in the StreamID field (who knows), we'll fail
to perform the full invalidation but get a strange range (e.g.,
SMMUSIDRange={.start=1, .end=0}) instead.

And having looked at the spec again, 4.3.2 CMD_CFGI_STE_RANGE:

  - "Invalidation is performed for an *aligned* range of 2^(Range+1)
     StreamIDs."

  - "The bottom Range+1 bits of the StreamID parameter are IGNORED,
     aligning the range to its size."

which seems to be some bits that we had never taken into account. And
what I'm saying is roughly something like below (compile tested), any
thoughts?


diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b87324ce2..8705612535 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -980,16 +980,20 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
          }
          case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
          {
-            uint32_t start = CMD_SID(&cmd);
+            uint32_t sid = CMD_SID(&cmd), mask;
              uint8_t range = CMD_STE_RANGE(&cmd);
-            uint64_t end = start + (1ULL << (range + 1)) - 1;
-            SMMUSIDRange sid_range = {start, end};
+            SMMUSIDRange sid_range;

              if (CMD_SSEC(&cmd)) {
                  cmd_error = SMMU_CERROR_ILL;
                  break;
              }
-            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
+
+            mask = (1ULL << (range + 1)) - 1;
+            sid_range.start = sid & ~mask;
+            sid_range.end = sid_range.start + mask;
+
+            trace_smmuv3_cmdq_cfgi_ste_range(sid_range.start, 
sid_range.end);
              g_hash_table_foreach_remove(bs->configs, 
smmuv3_invalidate_ste,
                                          &sid_range);
              break;

