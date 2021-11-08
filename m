Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF54496D8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:53:36 +0100 (CET)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk61g-0006mM-2z
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:53:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk5zg-0005Fh-0T
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:51:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk5zd-0006CG-Kh
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:51:31 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8D2VHU020794; 
 Mon, 8 Nov 2021 14:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3xBNGjdDAPdm/mTuVVu9NO5F2moko7myUpfky/21i8E=;
 b=h63SAx7fDfpkRK9nMLS0mI0Qi0J3lW2ZytAhjIuRjywI61thHUl1j52+WMtboXh1VEZz
 ZLZ89zoYOQWxYVrpp04QzyI1gEAFGdY1j3BxDI+fS7sEFln7Is9WRf9r2nX85pHKL5lr
 6BFCxFeLI6ot7254rDYdB4RA8uX924YRY6p60HAZdxp53VzOGnHS3OdjJUcPzSgESg8+
 +GgHBTm4AGUn7sKpd9wwms/gk6/fal2JMu0MHWsoLtgDpPXA5Hiys3GK5SxYiwKRHC/l
 YRNwOUTPeIQQ1pXA0FYaC/AcY+D+sVu8Ddr3DaaaT9SgWAM16Hj4E0dUB7t62ByY12u6 Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6b56ec6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 14:51:26 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8EohYI028528;
 Mon, 8 Nov 2021 14:51:25 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6b56ec5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 14:51:25 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8En1FE006910;
 Mon, 8 Nov 2021 14:51:23 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3c5hb9wvv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 14:51:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A8EpMcc20316562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 14:51:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F4FE7806E;
 Mon,  8 Nov 2021 14:51:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF8057808D;
 Mon,  8 Nov 2021 14:51:17 +0000 (GMT)
Received: from [9.160.77.174] (unknown [9.160.77.174])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 14:51:17 +0000 (GMT)
Message-ID: <ad8ba33a-4d33-48d3-bec3-7300a7a24387@linux.ibm.com>
Date: Mon, 8 Nov 2021 16:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 3/6] target/i386/sev: Rephrase error message when no
 hashes table in guest firmware
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
 <20211108134840.2757206-4-dovmurik@linux.ibm.com>
 <YYkr4ei7i2xfR+mD@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YYkr4ei7i2xfR+mD@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UwX7uL3iisvB3NrvVSxBFfh5FntT0ard
X-Proofpoint-ORIG-GUID: Fo9uDkSeZOSgq2Z9zq9RC_avkM9MFLmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080090
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/11/2021 15:53, Daniel P. Berrangé wrote:
> On Mon, Nov 08, 2021 at 01:48:37PM +0000, Dov Murik wrote:
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> ---
>>  target/i386/sev.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>> index e3abbeef68..c71d23654f 100644
>> --- a/target/i386/sev.c
>> +++ b/target/i386/sev.c
>> @@ -1232,7 +1232,8 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>>      }
>>  
>>      if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>> -        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
>> +        error_setg(errp, "SEV: -kernel specified but guest firmware "
>> +                         "has no hashes table GUID");
> 
> Don't refer to "-kernel" as that's just one way to specifying it. The
> user might have used
> 
>    -machine ....,kernel=/path/to/vmlinux
> 
> Simply "kernel" as the original text has, is fine.
> 

OK, good point. Thanks.

-Dov

