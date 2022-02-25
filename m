Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C74C4A5E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:17:12 +0100 (CET)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdHL-0002e6-9E
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:17:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNd97-0001n9-6W; Fri, 25 Feb 2022 11:08:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNd95-0003sS-Av; Fri, 25 Feb 2022 11:08:40 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PFp4Pn011683; 
 Fri, 25 Feb 2022 16:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=zE/juH4SnkJ4q4jtI2Ha/ne+kNW3r68NcX0HY3/RZSI=;
 b=IWWEydfy4mDHLzpnFq/nlPRNRoSY1imEjreFPUy7DLZhnF4JElVM2sKtIFc9Vau7A16t
 VcLbcmyMFFWWvjaoWkZXxGnc3k8y2eoG0BHDYBWUGZ9p2X2VR1JPEoF1srn9GGhBNzNc
 0iEXiA2PFgSEnKCNyG8c/zP4wv7hBDSEyjOGu3qnGwxErWrVo4q5D8UKHyhJo2/Kj837
 3Guws+vi3XZGZkka0GuDxh7geOKMErYO0m7WyIslqK1C9YgL5iM32k3Wa1QjIfc6olfi
 sZSMI2Kto4HflwziWrqqB/49+XgVKa2j+obb4r1XqFVoGgKmAMxqjLHdYWyJqKG44Hwl Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ef2440gpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:08:27 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21PFq9Yo021733;
 Fri, 25 Feb 2022 16:08:27 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ef2440gny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:08:27 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21PFwQYp007962;
 Fri, 25 Feb 2022 16:08:25 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 3ear6br9p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:08:25 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21PG8Pkd43123180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 16:08:25 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE56B112065;
 Fri, 25 Feb 2022 16:08:24 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D310511206E;
 Fri, 25 Feb 2022 16:08:23 +0000 (GMT)
Received: from localhost (unknown [9.211.119.70])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 25 Feb 2022 16:08:23 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 2/4] spapr: TCG: Migrate spapr_cpu->prod
In-Reply-To: <YhhKMWU4TAuW+W+N@yekko>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-3-farosas@linux.ibm.com> <YhhKMWU4TAuW+W+N@yekko>
Date: Fri, 25 Feb 2022 13:08:21 -0300
Message-ID: <871qzr3p56.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s49X6eT78J8eIelKVl9UKMgOmdQYxzBv
X-Proofpoint-GUID: KTy4spaY4I1IOYcZP6dANKV50vRmBHro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_09,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202250095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 npiggin@gmail.com, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Thu, Feb 24, 2022 at 03:58:15PM -0300, Fabiano Rosas wrote:
>> I'm seeing some stack traces in the migrated guest going through cede
>> and some hangs at the plpar_hcall_norets so let's make sure everything
>> related to cede/prod is being migrated just in case.
>
> This is a poor approach in general.  Migration becomes even harder to
> maintain than it already is if you don't pare down the set of migrated
> data to something minimal and non-redundant.
>
> If you want to migrate prod, you have to give a case for why you
> *need* it, not "just in case".

Ah yes, I'm not actually trying to merge stuff without a good
explanation. I haven't even delineated the problem properly. But I know
little about migration so I need to do some probing, bear with me
please.

> Also, you have to put this in a subsection with a needed function in
> order not to break compatibility.
>
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  hw/ppc/spapr_cpu_core.c         | 1 +
>>  include/hw/ppc/spapr_cpu_core.h | 2 +-
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
>> index ed84713960..efda7730f1 100644
>> --- a/hw/ppc/spapr_cpu_core.c
>> +++ b/hw/ppc/spapr_cpu_core.c
>> @@ -179,6 +179,7 @@ static const VMStateDescription vmstate_spapr_cpu_state = {
>>      .version_id = 1,
>>      .minimum_version_id = 1,
>>      .fields = (VMStateField[]) {
>> +        VMSTATE_BOOL(prod, SpaprCpuState),
>>          VMSTATE_END_OF_LIST()
>>      },
>>      .subsections = (const VMStateDescription * []) {
>> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
>> index b560514560..2772689c84 100644
>> --- a/include/hw/ppc/spapr_cpu_core.h
>> +++ b/include/hw/ppc/spapr_cpu_core.h
>> @@ -45,7 +45,7 @@ typedef struct SpaprCpuState {
>>      uint64_t vpa_addr;
>>      uint64_t slb_shadow_addr, slb_shadow_size;
>>      uint64_t dtl_addr, dtl_size;
>> -    bool prod; /* not migrated, only used to improve dispatch latencies */
>> +    bool prod;
>>      struct ICPState *icp;
>>      struct XiveTCTX *tctx;
>>  

