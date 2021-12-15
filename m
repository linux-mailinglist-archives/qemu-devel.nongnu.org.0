Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E8475D42
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:21:14 +0100 (CET)
Received: from localhost ([::1]:50856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxX1l-0004jd-Oa
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:21:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mxWbK-0000Oq-JU; Wed, 15 Dec 2021 10:53:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mxWbI-0008Bz-Bi; Wed, 15 Dec 2021 10:53:54 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFEASE030090; 
 Wed, 15 Dec 2021 15:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Sa/aIP84wBnYppxw+j62IKiwnFnJMwmiqzz4WKJn7Tg=;
 b=m5Y6fOvtBf3M5l/+NTKnTZnIjcjYDlygKK3OSvZ1KFRFdrC5HqjPasPYGfG7BvSwqDFl
 d4iYWoz0PazfwYNaBkkQWhr72RkgXvrErJVVG3EQLskb24QNB45vfN4V8/v2dCuVkOCY
 3FoyTYvVWl0soH9kuWxIvjzIqYDk7gYBVgEN21sdUmVF5kz9iNaPcTPgbW+naA44kI7/
 h4wxk4h6aIiasG9mvPV1sX2h2wPkRsmz4WVFjHAT3PmBaOdUlp2FqoRggar6kwEkMoJl
 n7hHkLzQ+NB0z05uScVjDGRCOccd6XiwO+I/sEyCNPoxKE7Uw/Db/N1zyBM7KUhbbVik 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cygtrv65c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 15:53:46 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFFEFCC030658;
 Wed, 15 Dec 2021 15:53:46 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cygtrv655-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 15:53:46 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFrEnT030423;
 Wed, 15 Dec 2021 15:53:45 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 3cy770hnch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 15:53:45 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFFrhHc13959676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:53:43 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 917006A051;
 Wed, 15 Dec 2021 15:53:43 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4807C6A05F;
 Wed, 15 Dec 2021 15:53:42 +0000 (GMT)
Received: from [9.211.79.24] (unknown [9.211.79.24])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 15 Dec 2021 15:53:42 +0000 (GMT)
Message-ID: <6103b709-f29d-16f2-7fe6-f9a25dd85b89@linux.ibm.com>
Date: Wed, 15 Dec 2021 10:53:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/12] s390x/pci: zPCI interpretation support
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20211207210425.150923-1-mjrosato@linux.ibm.com>
 <e1ba4cce-d6b9-bc86-9999-dc135046129d@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <e1ba4cce-d6b9-bc86-9999-dc135046129d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rZTakHygPATYXQMgPqBIpS7KJEG0lFFD
X-Proofpoint-GUID: JJzUQk76eFw-7sT_0yiC6hgY_bOoacpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, schnelle@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 2:35 AM, Pierre Morel wrote:
> 
> 
> On 12/7/21 22:04, Matthew Rosato wrote:
>> Note:  The first 3 patches of this series are included as pre-reqs, but
>> should be pulled via a separate series.  Also, patch 5 is needed to
>> support 5.16+ linux header-sync and was already done by Paolo but not
>> merged yet so is thus included here as well.
>>
>> For QEMU, the majority of the work in enabling instruction interpretation
>> is handled via new VFIO ioctls to SET the appropriate interpretation and
>> interrupt forwarding modes, and to GET the function handle to use for
>> interpretive execution.
>>
>> This series implements these new ioctls, as well as adding a new, 
>> optional
>> 'intercept' parameter to zpci to request interpretation support not be 
>> used
>> as well as an 'intassist' parameter to determine whether or not the
>> firmware assist will be used for interrupt delivery or whether the host
>> will be responsible for delivering all interrupts.
> 
> In which circumstances do we have an added value by not using interrupt 
> delivered by firmware?
> 

Disabling it can be a tool to debug and assist in problem determination, 
but that's about the only scenario I can think of where you would 
intentionally want to disable intassist.  Perhaps then it's not worth 
leaving in place.


