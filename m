Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A9A606006
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:20:08 +0200 (CEST)
Received: from localhost ([::1]:39830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUWs-0008Me-7N
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:20:06 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUFU-0007sZ-Dw
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1olTM0-0001ww-Ut; Thu, 20 Oct 2022 07:04:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52334
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1olTLy-0002Ty-Il; Thu, 20 Oct 2022 07:04:48 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KAWsTg020667;
 Thu, 20 Oct 2022 11:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aj0rkl0cyh/AIUSvUNnLXqCO2uzJoQx2AKSwzOU9AA0=;
 b=HucOoGH8JlWHs77Obu46QRJWFAQRcLFygJTQpGVAz9YVLMo8mwlR2Zhg2V0Q1L2udpYI
 C5VsnGmUpOc/yYKD/T3wcBb07pxTpfZZTQ1xVQ6sN2FNx7ppWYCCrsjUSZaGTeaUyDZN
 cDoME5ztU6EVNTguDNpoyKmlYJrM/2AvXNoLaf78JBiQldZSD3+EWz4l1IxxWe5QtYoe
 zxMWaQYCDVa4pQJtxX3rs5kLl8JWpYv5e+nEewHDpyOIlsN4zq7t+h8Cg89whz1+HTUt
 c45TqF4atK44m6eDdSdOAM9r/ZGZ8dgRo9xv36IyYMcBnxrIt2ZLBE7t8z5Wwphr05h6 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kb4nx8vcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 11:03:40 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29KAWuUW020706;
 Thu, 20 Oct 2022 11:03:39 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kb4nx8v5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 11:03:39 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29KApVKj016313;
 Thu, 20 Oct 2022 11:03:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3k7mg98qaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 11:03:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29KB3s3652953366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Oct 2022 11:03:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70387A405B;
 Thu, 20 Oct 2022 11:03:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1412BA4054;
 Thu, 20 Oct 2022 11:03:21 +0000 (GMT)
Received: from [9.152.224.253] (unknown [9.152.224.253])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Oct 2022 11:03:21 +0000 (GMT)
Message-ID: <b9032f7d-bce5-b614-4ad9-62b11908c6af@linux.ibm.com>
Date: Thu, 20 Oct 2022 13:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 10/10] s390x: pv: Add dump support
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 scgl@linux.ibm.com
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-11-frankja@linux.ibm.com>
From: Steffen Eiden <seiden@linux.ibm.com>
In-Reply-To: <20221017083822.43118-11-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aAIsiHcX-MxeaU83WajDQRCkPJ2L8_nP
X-Proofpoint-GUID: bRzLGzsHnG6tGLYsLox0bufgmWCOYcqU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_03,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210200066
Received-SPF: pass client-ip=148.163.158.5; envelope-from=seiden@linux.ibm.com;
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



On 10/17/22 10:38, Janosch Frank wrote:
> Sometimes dumping a guest from the outside is the only way to get the
> data that is needed. This can be the case if a dumping mechanism like
> KDUMP hasn't been configured or data needs to be fetched at a specific
> point. Dumping a protected guest from the outside without help from
> fw/hw doesn't yield sufficient data to be useful. Hence we now
> introduce PV dump support.
> 
> The PV dump support works by integrating the firmware into the dump
> process. New Ultravisor calls are used to initiate the dump process,
> dump cpu data, dump memory state and lastly complete the dump process.
> The UV calls are exposed by KVM via the new KVM_PV_DUMP command and
> its subcommands. The guest's data is fully encrypted and can only be
> decrypted by the entity that owns the customer communication key for
> the dumped guest. Also dumping needs to be allowed via a flag in the
> SE header.
> 
> On the QEMU side of things we store the PV dump data in the newly
> introduced architecture ELF sections (storage state and completion
> data) and the cpu notes (for cpu dump data).
> 
> Users can use the zgetdump tool to convert the encrypted QEMU dump to an
> unencrypted one.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
> ---
>   dump/dump.c              |  12 +-
>   include/sysemu/dump.h    |   5 +
>   target/s390x/arch_dump.c | 262 +++++++++++++++++++++++++++++++++++----
>   3 files changed, 246 insertions(+), 33 deletions(-)
> 
[ snip ]

