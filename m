Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908AF45A666
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 16:19:31 +0100 (CET)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpXZx-00018f-VY
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 10:19:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1mpXYc-0000Pa-8y; Tue, 23 Nov 2021 10:18:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1mpXYa-000113-2w; Tue, 23 Nov 2021 10:18:06 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ANEFx6T039189; 
 Tue, 23 Nov 2021 15:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lTpuCrExSzvs7uYurAKEF8k/dX/jJCSn5TnXz9T/LgI=;
 b=nGzjKEgJ0idrHPjEKRDv0e9WEJziuCE6DdiRX3oG36wLLA93R76VIiHw5NtSBpYJBD3g
 dtKDd0+Om1E1j06nZUwDB56TGsCIXD0D5zItxjeUE5CoyNz6qQkvT5CgZQ0XHp8of2XP
 EAQEeJwzx2Fn8qlQZHBDyXHROUC/UQMBflj6E8AZHdpet3rSNYGrvBIFbawOFsTEbQr4
 s++15iBk7FY9hTttQ4fBskRJVgZD4KUofyw6qfqkJZgcOQbOedLLPjjxao7QRw6MhP8m
 eGJnwm21T87KKbEfbAlUSEtVvmobwkVd7IacIjkyyI7aXIsMPwAchLbhC860RgVdej5y 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ch1wp9gua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 15:17:59 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ANFEP1l015682;
 Tue, 23 Nov 2021 15:17:59 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ch1wp9gtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 15:17:59 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ANFCKRK027422;
 Tue, 23 Nov 2021 15:17:56 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3cern9rbbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 15:17:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ANFHrf721299518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 15:17:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F8F442049;
 Tue, 23 Nov 2021 15:17:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3D9242041;
 Tue, 23 Nov 2021 15:17:52 +0000 (GMT)
Received: from [9.171.17.161] (unknown [9.171.17.161])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Nov 2021 15:17:52 +0000 (GMT)
Message-ID: <bc047f32-4c79-da4b-4684-908c92a53439@linux.ibm.com>
Date: Tue, 23 Nov 2021 16:17:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/1] MAINTAINERS: update email address of Christian
 Borntraeger
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
References: <20211123095511.132810-1-borntraeger@linux.ibm.com>
In-Reply-To: <20211123095511.132810-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6i9GS4DjVv6gF9b3xval5naifwuVQ706
X-Proofpoint-ORIG-GUID: l-DEZHGaeZ6XIdYfuFQMR_Usxc2luwGw
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_05,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111230079
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
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
Cc: Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 23.11.21 um 10:55 schrieb Christian Borntraeger:
> My borntraeger@de.ibm.com email is just a forwarder to the
> linux.ibm.com address. Let us remove the extra hop to avoid
> a potential source of errors.
> 
> While at it, add the relevant email addresses to mailmap.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>

This should have been the new adress I think. Want me to resend?

> ---
>   .mailmap    | 1 +
>   MAINTAINERS | 6 +++---
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 8beb2f95ae28..c45d1c530144 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -50,6 +50,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
>   Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
>   Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
>   Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
> +Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
>   Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
>   Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
>   Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d3879aa3c12c..e19d88ca9960 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -393,7 +393,7 @@ F: target/ppc/kvm.c
>   
>   S390 KVM CPUs
>   M: Halil Pasic <pasic@linux.ibm.com>
> -M: Christian Borntraeger <borntraeger@de.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
>   S: Supported
>   F: target/s390x/kvm/
>   F: target/s390x/ioinst.[ch]
> @@ -1527,7 +1527,7 @@ S390 Machines
>   -------------
>   S390 Virtio-ccw
>   M: Halil Pasic <pasic@linux.ibm.com>
> -M: Christian Borntraeger <borntraeger@de.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
>   S: Supported
>   F: hw/char/sclp*.[hc]
>   F: hw/char/terminal3270.c
> @@ -1541,7 +1541,7 @@ T: git https://github.com/borntraeger/qemu.git s390-next
>   L: qemu-s390x@nongnu.org
>   
>   S390-ccw boot
> -M: Christian Borntraeger <borntraeger@de.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
>   M: Thomas Huth <thuth@redhat.com>
>   S: Supported
>   F: hw/s390x/ipl.*
> 

