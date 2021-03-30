Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19DB34E34F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 10:41:11 +0200 (CEST)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR9vy-0001ND-QA
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 04:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1lR9tY-0000pu-5P; Tue, 30 Mar 2021 04:38:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64776
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1lR9tQ-0004Dq-3k; Tue, 30 Mar 2021 04:38:39 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12U8XiDB047939; Tue, 30 Mar 2021 04:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=0JoidHTPm5NfLDH1D1lJOrNJURGsWcMZRA5qS3w0/ho=;
 b=Lr+lSVqVhi5VxSea+YGFHsiZoogyI7Q1yuk9fIsCSlkf0TvIHUTGyyQowhRUKSsk0T3r
 CT7P2S/7+ZEk5w16irzzLoKAupES9q9+x8Q1PBYkMJuylgIQXoS9OJHLGcFws8tdqzzy
 oiu3XjeEE3+h94kZJZvrqTF7KgrD7NoZXZfyKk5IwhY/RvB8M3X14OitcqEX2x7C0636
 y+pz8Iwyur3yXOHNm4Og1/BPwOjCD0RjrurIDdNoRiTgHrFN7OBjQwnt7mkvtTidhLpx
 94Hx37u0yynlTwVUtRltrsBJd0/shbA0Is0wGeHdG7QjBziKqs/OTtImhSc3O3ukaHAL zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37jjb5syut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 04:38:25 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12U8XhnJ047816;
 Tue, 30 Mar 2021 04:38:24 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37jjb5sytw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 04:38:24 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12U8bJas014958;
 Tue, 30 Mar 2021 08:38:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 37hvb8ahef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 08:38:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12U8cJBd49021234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 08:38:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE8BC11C054;
 Tue, 30 Mar 2021 08:38:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07BDE11C04C;
 Tue, 30 Mar 2021 08:38:15 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.111.7])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 30 Mar 2021 08:38:14 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Tue, 30 Mar 2021 14:08:14 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, qemu-devel@nongnu.org,
 kvm-ppc@vger.kernel.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au, mst@redhat.com, imammedo@redhat.com,
 xiaoguangrong.eric@gmail.com
Subject: Re: [PATCH] ppc/spapr: Add support for implement support for
 H_SCM_HEALTH
In-Reply-To: <ef44262e-907d-5200-022c-a26e16522ab0@linux.ibm.com>
References: <20210329162259.536964-1-vaibhav@linux.ibm.com>
 <ef44262e-907d-5200-022c-a26e16522ab0@linux.ibm.com>
Date: Tue, 30 Mar 2021 14:08:13 +0530
Message-ID: <87tuotox3e.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nwWq9ZXSkN3FuQVjvcY5ZsyGNJr0WvdK
X-Proofpoint-ORIG-GUID: 9nVRh3bMV186V7r0NV0O9HIZFqHfd8aE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_02:2021-03-26,
 2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300060
Received-SPF: pass client-ip=148.163.158.5; envelope-from=vaibhav@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: aneesh.kumar@linux.ibm.com, bharata@linux.vnet.ibm.com,
 shivaprasadbhat@gmail.com, ehabkost@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Shiva,

Thanks for reviweing this patch. My responses inline below;


Shivaprasad G Bhat <sbhat@linux.ibm.com> writes:

<snip>

>>   
>> +static target_ulong h_scm_health(PowerPCCPU *cpu, SpaprMachineState *spapr,
>> +                                 target_ulong opcode, target_ulong *args)
>> +{
>> +    uint32_t drc_index = args[0];
>> +    SpaprDrc *drc = spapr_drc_by_index(drc_index);
>> +    NVDIMMDevice *nvdimm;
>> +
>> +    if (drc && spapr_drc_type(drc) != SPAPR_DR_CONNECTOR_TYPE_PMEM) {
>> +        return H_PARAMETER;
>> +    }
>> +
>
>
> Please check if drc->dev is not NULL too. DRCs are created in advance
>
> and drc->dev may not be assigned if the device is not plugged yet.
>
>
Sure, will address that in v2

>> +    nvdimm = NVDIMM(drc->dev);
>> +
>> +    /* Check if the nvdimm is unarmed and send its status via health bitmaps */
>> +    args[0] = nvdimm->unarmed ? PAPR_PMEM_UNARMED_MASK : 0;
>
>
> Please use object_property_get_bool to fetch the unarmed value.
>
>
Sure I will switch to object_property_get_bool in v2. However I see
nvdimm->unarmed being accessed in similar manner in
nvdimm_build_structure_memdev() which probably needs an update too.

<snip>

-- 
Cheers
~ Vaibhav

