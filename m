Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9063A11E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 07:20:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozXU9-0002sn-QN; Mon, 28 Nov 2022 01:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1ozXTz-0002sL-R0; Mon, 28 Nov 2022 01:19:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1ozXTx-0007Ma-JU; Mon, 28 Nov 2022 01:19:11 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AS5si7s028330; Mon, 28 Nov 2022 06:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+wsnw95yRx++5NeHSfOM34OuFvLKXXPbvSmx2MFcj8o=;
 b=jBxU5AKZxNWnQF2KeQBcPHNp3XAPDRmZGJiDMkCv0ZN9Eo0ssx+p6C38nJ107pTNTAd1
 nfPuh5wGZr6XBl/t0Yj77lxfgQ3OyalcuYzGR/oAd8Fz9k7xEwfyB+GSpXmc4eQWiTrk
 cCDrIxEyymfELMTf0sufuHElzLUe5oAjUWN78Dmoak1o3cBTe86eeA60BrVk//NPNzfR
 y4o3MT11WLAgTa7TCxXjGPVHlKuirl3PVd4MFcFoT1Say4YzuEuiLNqk8aAGgbig/qxY
 zrZfzUU8Atrih1tLgnMePvlQKcYDwt7zhlKMiSXKbtSX5Hq4YFoq+z9EsrnZEt7092Sn Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vn6y4mv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 06:19:05 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AS67HTn026674;
 Mon, 28 Nov 2022 06:19:05 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vn6y4me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 06:19:04 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS67iEq001079;
 Mon, 28 Nov 2022 06:19:03 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3m3ae91fdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 06:19:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AS6IxRN63111660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 06:18:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A24B111C04C;
 Mon, 28 Nov 2022 06:18:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D2B111C04A;
 Mon, 28 Nov 2022 06:18:59 +0000 (GMT)
Received: from [9.171.30.10] (unknown [9.171.30.10])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 28 Nov 2022 06:18:59 +0000 (GMT)
Message-ID: <f761e76b-ab11-a1d2-956e-c38167e3bbc2@de.ibm.com>
Date: Mon, 28 Nov 2022 07:18:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Add `sigreturn` to the seccomp
 whitelist
Content-Language: en-US
To: German Maglione <gmaglione@redhat.com>,
 Marc Hartmayer <mhartmay@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Stefan Liebler <stli@linux.ibm.com>,
 virtio-fs@redhat.com, qemu-s390x <qemu-s390x@nongnu.org>,
 Sven Schnelle <svens@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
 <CAJh=p+7igBB9CMTUi--HCpcuxdHgveqgkw5dY7frE7Wqf==04w@mail.gmail.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <CAJh=p+7igBB9CMTUi--HCpcuxdHgveqgkw5dY7frE7Wqf==04w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tzQXGDcS22V-BqLInnXZ0qWhkB2yRjyK
X-Proofpoint-ORIG-GUID: tgToyl2gxBLH7aKvS-UerPpoxF5hNhlO
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_05,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280043
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Am 25.11.22 um 17:32 schrieb German Maglione:
> On Fri, Nov 25, 2022 at 3:40 PM Marc Hartmayer <mhartmay@linux.ibm.com> wrote:
>>
>> The virtiofsd currently crashes on s390x. This is because of a
>> `sigreturn` system call. See audit log below:
>>
>> type=SECCOMP msg=audit(1669382477.611:459): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=system_u:system_r:virtd_t:s0-s0:c0.c1023 pid=6649 comm="virtiofsd" exe="/usr/libexec/virtiofsd" sig=31 arch=80000016 syscall=119 compat=0 ip=0x3fff15f748a code=0x80000000AUID="unset" UID="root" GID="root" ARCH=s390x SYSCALL=sigreturn
>>
>> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
>> ---
>>   tools/virtiofsd/passthrough_seccomp.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
>> index 888295c073de..0033dab4939e 100644
>> --- a/tools/virtiofsd/passthrough_seccomp.c
>> +++ b/tools/virtiofsd/passthrough_seccomp.c
>> @@ -110,6 +110,7 @@ static const int syscall_allowlist[] = {
>>   #endif
>>       SCMP_SYS(set_robust_list),
>>       SCMP_SYS(setxattr),
>> +    SCMP_SYS(sigreturn),
>>       SCMP_SYS(symlinkat),
>>       SCMP_SYS(syncfs),
>>       SCMP_SYS(time), /* Rarely needed, except on static builds */
>> --
>> 2.34.1
>>
>> _______________________________________________
>> Virtio-fs mailing list
>> Virtio-fs@redhat.com
>> https://listman.redhat.com/mailman/listinfo/virtio-fs
>>
> 
> Reviewed-by:  German Maglione <gmaglione@redhat.com>
> 
> Should we add this also in the rust version?, I see we don't have it
> enabled either.

this is probably a good idea.

