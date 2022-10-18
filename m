Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DDF602BF8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:44:38 +0200 (CEST)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oklxV-0004m2-0l
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oklSM-0000MQ-90
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:12:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18340
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oklSI-0006uk-KN
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:12:25 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29IBoKgZ000900;
 Tue, 18 Oct 2022 12:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gM59cxAwS9cwBhGHL/zANwANFticNyUFD/iSN+Q0Cm0=;
 b=TN+Bs53ehlA16/sw3VQpjtqVxAek14MJFeC1QX+M6289ALT9Lu3dYJbe2IJlVrm0D0LI
 hfHeG2RInUEemx62k60v7T9vmLpm1TsjigDIAVa1/QGSUqr4egc19BkMe0gZeLncmmJN
 v/stCxSKTnsFg7JirjAh4Xvb6f44nPtrSm0Haiokm3l7oShYxZJr9XErQc9ReRRqrlrx
 oCEPVK994/QwjUEYmLwCxBQ6dW+fExH0gjeyc4b5yaR+xBVEsglSmH1+l31064BjRiXJ
 RbWUt25DQq7aQCzFrtXAPaPnenEQoniw1l3/RVUUrxvQRn1dRIyjO8snH8BVPnYM8dfL 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k9um7gjeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Oct 2022 12:12:17 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29IC79kW004379;
 Tue, 18 Oct 2022 12:12:17 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k9um7gjed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Oct 2022 12:12:17 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29IC6E87001300;
 Tue, 18 Oct 2022 12:12:16 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3k7mga0enn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Oct 2022 12:12:16 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29ICCFMN10289786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Oct 2022 12:12:15 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C667C58065;
 Tue, 18 Oct 2022 12:12:14 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23DDF58067;
 Tue, 18 Oct 2022 12:12:14 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 18 Oct 2022 12:12:14 +0000 (GMT)
Message-ID: <bdee0038-a29f-e517-0e12-be7a141f37b8@linux.ibm.com>
Date: Tue, 18 Oct 2022 08:12:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 23/28] qapi tpm: Elide redundant has_FOO in generated C
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-24-armbru@redhat.com>
 <752bcf6d-d37d-5605-d3bb-8e46c2e4b47c@linaro.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <752bcf6d-d37d-5605-d3bb-8e46c2e4b47c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GlzPI63jwHWgezTrxSfvzWBQFcm8OUE_
X-Proofpoint-GUID: KsESKsERWdAVFoU9g8mO0p9XHb2LBVvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_03,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210180069
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/18/22 08:01, Philippe Mathieu-Daudé wrote:
> On 18/10/22 08:28, Markus Armbruster wrote:
>> The has_FOO for pointer-valued FOO are redundant, except for arrays.
>> They are also a nuisance to work with.  Recent commit "qapi: Start to
>> elide redundant has_FOO in generated C" provided the means to elide
>> them step by step.  This is the step for qapi/tpm.json.
>>
>> Said commit explains the transformation in more detail.  The invariant
>> violations mentioned there do not occur here.
>>
>> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   backends/tpm/tpm_passthrough.c | 2 --
>>   monitor/hmp-cmds.c             | 8 ++++----
>>   scripts/qapi/schema.py         | 1 -
>>   3 files changed, 4 insertions(+), 7 deletions(-)
> 
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 8f8bd93df1..378f5b083d 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -885,10 +885,10 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
>>           case TPM_TYPE_PASSTHROUGH:
>>               tpo = ti->options->u.passthrough.data;
>>               monitor_printf(mon, "%s%s%s%s",
>> -                           tpo->has_path ? ",path=" : "",
>> -                           tpo->has_path ? tpo->path : "",
>> -                           tpo->has_cancel_path ? ",cancel-path=" : "",
>> -                           tpo->has_cancel_path ? tpo->cancel_path : "");
>> +                           tpo->path ? ",path=" : "",
>> +                           tpo->path ?: "",
>> +                           tpo->cancel_path ? ",cancel-path=" : "",
>> +                           tpo->cancel_path ?: "");
> 
> Or simply:
> 
>              monitor_printf(mon, "%s%s",
>                             tpo->path ? ",path=" : "",
>                             tpo->cancel_path ? ",cancel-path=" : "");
> 

this would never print any path...

