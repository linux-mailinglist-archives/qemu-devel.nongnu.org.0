Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2561665F6E1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:34:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYgU-0002Ol-1N; Thu, 05 Jan 2023 17:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pDYgR-0002OA-MP
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:25:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pDYgP-0000LI-Gc
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:25:59 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305LZeZj018871
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 22:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=G7wqCMLl0+9M1zjDbYXz5e6wfn2mGS28yOcjeQ6K1Og=;
 b=YvC/OzpIPNEe50SbsMHR0YvJJ7vA6nvzr6hTRKTnygOq6fLbw3HILkKc2qcpk1Z3G5On
 2m+uafQSBkUnQPbNeg54XwwCsL0BXbcqD85ywQRkayCoX4TLLjgmABZ15hj6KhBIyBOW
 Th89LbU0iNQI3V3GLFnlYaQBgEVV8W4O7xCQe9gY/OE7EkrtkbSMTHbXHb/+qzzw9x9p
 qvMPWVAJ8tILVqTUEttEZYVBnkWugDiQviGhRCR0cYU5HqbALh/IgRQKxqPGWW0M7Rzx
 2fn90CWjRE+CV5nmyeULUu9S1Lk+vY1+Pm2VqZWBgst5TdZEcRzHmreCDxStH7TF72nj vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx4aumfer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 22:25:54 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305LsXvX001219
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 22:25:54 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx4aumfef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 22:25:54 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 305KJVmw025847;
 Thu, 5 Jan 2023 22:25:53 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3mtcq806gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 22:25:53 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305MPpPn65732894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 22:25:51 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84F3E58052;
 Thu,  5 Jan 2023 22:25:51 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CC075804E;
 Thu,  5 Jan 2023 22:25:51 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  5 Jan 2023 22:25:51 +0000 (GMT)
Message-ID: <a52287af-3489-a310-b9cd-08f73dc7f340@linux.ibm.com>
Date: Thu, 5 Jan 2023 17:25:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 2/2] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230105130020.17755-1-jejb@linux.ibm.com>
 <20230105130020.17755-3-jejb@linux.ibm.com>
 <789bd0bd-05ed-c413-272e-0204472f3e3b@linux.ibm.com>
 <387334f6a4d2cf54f2fbfbebe7a06b931adf797a.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <387334f6a4d2cf54f2fbfbebe7a06b931adf797a.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6sd9u5tY9A9tfebGfFLSiJGicqltWYaw
X-Proofpoint-GUID: NmTatxZ6CdQqeA3Kus2MCK8LEYr83NuH
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_12,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=837 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050173
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1/5/23 17:02, James Bottomley wrote:
> On Thu, 2023-01-05 at 11:20 -0500, Stefan Berger wrote:
>>
>>
>> On 1/5/23 08:00, James Bottomley wrote:
> [...]
>>> +The mssim backend supports snapshotting and migration, but the
>>> state
>>> +of the Microsoft Simulator server must be preserved (or the server
>>> +kept running) outside of QEMU for restore to be successful.
>>
>> My comments to v3 still apply here.
> 
> You didn't make any v3 comments on migration.

https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg03146.html

A user should be able to recreate, with today's code, what is claimed in the documentation regarding snapshotting for example.


   Stefan

> 
>> I also just tried migration and on the -incoming side it did not work
>> anymore. Did you test this?
> 
> Well, yes, as I said.  However, I seem to have left one change in my
> local tree which I forgot to sync to the patch:
> 
> diff --git a/backends/tpm/tpm_mssim.c b/backends/tpm/tpm_mssim.c
> index 75dce165b8..125c8d0b15 100644
> --- a/backends/tpm/tpm_mssim.c
> +++ b/backends/tpm/tpm_mssim.c
> @@ -66,7 +66,7 @@ static void tpm_mssim_instance_finalize(Object *obj)
>   {
>       TPMmssim *t = TPM_MSSIM(obj);
>   
> -    if (t->ctrl_qc && !runstate_check(RUN_STATE_INMIGRATE))
> +    if (t->cmd_qc && !runstate_check(RUN_STATE_POSTMIGRATE))
>           tpm_send_ctrl(t, TPM_SIGNAL_POWER_OFF, NULL);
>   
>       object_unref(OBJECT(t->ctrl_qc));
> 
> James
> 

