Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B05A9C9E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:10:02 +0200 (CEST)
Received: from localhost ([::1]:53502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTmlU-0005G1-Um
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oTmjv-0003pJ-Ie
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:08:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oTmjr-0007Bk-SO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:08:23 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281FbVqe000570
 for <qemu-devel@nongnu.org>; Thu, 1 Sep 2022 16:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=RWmy8hJd3IY/bWNDgzZsjfPk3hHiKWyeiYHL1NC4YO4=;
 b=MbVHMgjPh286SF5NLdcRfCjEk89cDBMNTAy6q8fH7DJ3yBksfHQjwCF2gxz0YXbA6S3e
 t6WlbR+oUsJz6EqGg+5ilxUXayFn5X7ZFwIeD/eesq4H2bTVNe6sPIKgQPHbj8E9+38D
 1+uyt3zXUXDQz0XiagIdeIAIXZK6ywJ6uGnHpjn05+Dk/TagZoHEU8TnqihxQleeY8kJ
 BlGhZ3dCxHjRKO7Zye0C3pFUIY7srF59BIGZRMCW3x/np+CTXBIw+6+9hx6OJ+nsG7sc
 fRJRJQY0qcjBqr1JNV4iO+gr4ldVOHKIf/AE3wIRKVyjaKRCL63vzgtCQR6r4/7sH2EB gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jaxvuasvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 16:08:16 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 281G2tji030558
 for <qemu-devel@nongnu.org>; Thu, 1 Sep 2022 16:08:15 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jaxvuasuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 16:08:15 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 281Fp7xd028184;
 Thu, 1 Sep 2022 16:08:14 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3j7aw9tbwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 16:08:14 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 281G8DG260948918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Sep 2022 16:08:13 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 738876A057;
 Thu,  1 Sep 2022 16:08:13 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 329986A04F;
 Thu,  1 Sep 2022 16:08:11 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  1 Sep 2022 16:08:10 +0000 (GMT)
Message-ID: <a21b2a0f-9a01-6499-552c-e3153cea2858@linux.ibm.com>
Date: Thu, 1 Sep 2022 12:08:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] tpm_emulator: Use latest tpm_ioctl.h from swtpm
 project
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20220826154602.362516-1-stefanb@linux.ibm.com>
 <20220826154602.362516-2-stefanb@linux.ibm.com>
 <CAJ+F1CK+Vk4zH_pejF_N3-H=2imOsen1u0NinoE7AW1cqLYM-A@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAJ+F1CK+Vk4zH_pejF_N3-H=2imOsen1u0NinoE7AW1cqLYM-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZCzdp3bKA__zrHQqubFTfF1I_20kOrpa
X-Proofpoint-GUID: hPCM8G0MMibUi2-EC8MsAXC11U2EckH4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_10,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010071
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/31/22 07:36, Marc-André Lureau wrote:

> 
> On Fri, Aug 26, 2022 at 7:52 PM Stefan Berger <stefanb@linux.ibm.com 
> <mailto:stefanb@linux.ibm.com>> wrote:
> 
>     Use the latest tpm_ioctl.h from upstream swtpm project.
> 
>     Signed-off-by: Stefan Berger <stefanb@linux.ibm.com
>     <mailto:stefanb@linux.ibm.com>>
> 
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com 
> <mailto:marcandre.lureau@redhat.com>>


Thanks. I had to rebase and modify it a bit now that the PR with the 
_WIN32 changes is merged and will post a v2 soon. Any comments on 2/2?

    Stefan

