Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F74752F9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 07:29:06 +0100 (CET)
Received: from localhost ([::1]:43444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxNmj-0004l0-Es
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 01:29:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mxNjP-0003zy-M7; Wed, 15 Dec 2021 01:25:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5736
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mxNjN-00054n-69; Wed, 15 Dec 2021 01:25:39 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BF5qHXu018276; 
 Wed, 15 Dec 2021 06:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wWP6ryuwhvDwZetQfuN7bWQygk6n1VO/zcmuOVyS7SY=;
 b=bPCufy2NrOq35n0n8k6Q7cVGtWjgU5xLmy5F0AeDp/UPnArPic88vG62ceormjSHR8zS
 Ur4qI53kAUrW8I7KQRZeOb5mv0f32Lct/++CLYi04ZoxC/yhUYFYAmrxb2J5GChalnI5
 H4zJQ5OqGxs47YtdJE6q4pGMlhOarevIfgfPvTHBzwKw0dVDtZLKP0AuNVDEq8wWpTjY
 XVLFZH2p4gS6h5ZD28Upc5EasEret3XvqaE0fl0pNyAY7OM7nF4nH3BcU1kJQck/IApA
 e9BSjwMwThgtkwZLXrrHDJvpWDmP3mFVfSIYgQwMHQ6Tr2GiN5LQXIlgBO0wHLLYyjbD LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cx9r9rcxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 06:25:34 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BF67qWe000798;
 Wed, 15 Dec 2021 06:25:33 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cx9r9rcwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 06:25:33 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BF6LcZ8031506;
 Wed, 15 Dec 2021 06:25:31 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3cy7k91h65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 06:25:31 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BF6PSVE43188520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 06:25:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48ADEA4057;
 Wed, 15 Dec 2021 06:25:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 840D3A4040;
 Wed, 15 Dec 2021 06:25:27 +0000 (GMT)
Received: from [9.171.24.181] (unknown [9.171.24.181])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Dec 2021 06:25:27 +0000 (GMT)
Message-ID: <1ace94df-f9ab-9561-3704-a6a9e6819b4c@linux.ibm.com>
Date: Wed, 15 Dec 2021 07:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 08/12] s390x/pci: don't fence interpreted devices without
 MSI-X
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20211207210425.150923-1-mjrosato@linux.ibm.com>
 <20211207210425.150923-9-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20211207210425.150923-9-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -eousFFjCXar7ctriw1iOO6vjvXrdVHs
X-Proofpoint-GUID: IwRzPc1L-KtjKdAIdeqtNEUTDAIsItov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_06,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150035
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, schnelle@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/7/21 22:04, Matthew Rosato wrote:
> Lack of MSI-X support is not an issue for interpreted passthrough
> devices, so let's let these in.  This will allow, for example, ISM
> devices to be passed through -- but only when interpretation is
> available and being used.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 451bd32d92..503326210a 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -1096,7 +1096,7 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>               pbdev->interp = false;
>           }
>   
> -        if (s390_pci_msix_init(pbdev)) {
> +        if (s390_pci_msix_init(pbdev) && !pbdev->interp) {
>               error_setg(errp, "MSI-X support is mandatory "
>                          "in the S390 architecture");
>               return;
> 

Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>

-- 
Pierre Morel
IBM Lab Boeblingen

