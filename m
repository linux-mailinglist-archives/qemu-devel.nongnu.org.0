Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5644865F6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:23:03 +0100 (CET)
Received: from localhost ([::1]:43414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TfS-0002Az-8m
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:23:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n5TCZ-0005LI-Rh
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:53:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57436
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n5TCX-0001RS-AB
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:53:10 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206DcT8p027218; 
 Thu, 6 Jan 2022 13:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9X0fDMfmeRoNkHuGRAgtStqPT+zku8tCzA0Xea4Q5Fo=;
 b=TA0DOqtxhuCE8T535fgJ3AeQc8yjTqwokAPW6zryEZ6zLJope0fngTBO/6qJwKhukA7D
 nQwi7Fm3L5JXLgykdVXoC+Tfa4gMrQuy4s2uoNu5atQq9tRFiuHqgEr7j+Kuq3OAenLp
 jm1Cg0puCn/wQ+dizxQfi/eOtb/9CF6FwbohCg8tJ8XRaxEvcwfXTE3x0iu9qBIeMERO
 4EdWPVt/jNi3woWTqK1+aDq9hErzrMtPfYcETUzrB6FG35xuOQgCSwwgWuLav11vZXAs
 bNWkJnho+HZ95bcCtRnKuzb3Rc9xep9lWQ0bwegmNijsqNEMHC5g1a58ex48Hwv5u007 +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ddyyb215w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 13:53:05 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 206DfmM5006964;
 Thu, 6 Jan 2022 13:53:05 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ddyyb215g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 13:53:05 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206Dq91Y012893;
 Thu, 6 Jan 2022 13:53:04 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3ddms3ergc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 13:53:04 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206Dr2sm14287556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 13:53:02 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A35F36A04D;
 Thu,  6 Jan 2022 13:53:02 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FB6B6A04F;
 Thu,  6 Jan 2022 13:53:01 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 13:53:00 +0000 (GMT)
Message-ID: <6096f301-4c39-e39c-eb5f-9f7d22ba1260@linux.ibm.com>
Date: Thu, 6 Jan 2022 08:53:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 2/3] acpi: tpm: Add missing device identification
 objects
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220104175806.872996-1-stefanb@linux.ibm.com>
 <20220104175806.872996-3-stefanb@linux.ibm.com>
 <20220106093636.7fc7755f@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220106093636.7fc7755f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uwRRxPs5vwFfLQ3JMh1OxAP6IDKKRMDY
X-Proofpoint-GUID: bfmd8DZw41bnkSmGnoni001oCL6LplYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_05,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/22 03:36, Igor Mammedov wrote:
> On Tue,  4 Jan 2022 12:58:05 -0500
> Stefan Berger <stefanb@linux.ibm.com> wrote:
>
>> Add missing TPM device identification objects _STR and _UID. They will
>> appear as files 'description' and 'uid' under Linux sysfs.
>>
>> Following inspection of sysfs entries for hardware TPMs we chose
>> uid '1'.
> My guess would be that buy default (in case of missing UID), OSPM
> will start enumerate from 0. So I think 0 is more safer choice
> when it comes to compatibility.
>
> Can you smoke test TPM with Windows, and check if adding UID doesn't
> break anything if VM actually uses TMP (though I'm not sure how to
> check it on Windows, maybe install Windows 11 without this patch
> and then see if it still boots pre-installed VM and nothing is broken
> after this patch)?
>
I smoke tested it with the posted patches applied to v6.2.0 and started 
3 VMs with it:

- Linux shows uid = 1 and the description "TPM 2.0 Device" in sysfs

- Win 10 and Win 11 tpm.msc tool are both showing that the TPM is 'ready 
for use'

     Stefan



