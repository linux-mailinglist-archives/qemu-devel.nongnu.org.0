Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F18402622
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:24:18 +0200 (CEST)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXKz-0002ns-KC
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mNXJe-0001KU-DI; Tue, 07 Sep 2021 05:22:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11452
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mNXJc-0003by-Pb; Tue, 07 Sep 2021 05:22:54 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 18793nLM165134; Tue, 7 Sep 2021 05:22:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VivueFLkQty4qH81yTvIJv9Bvx7g9gOKCMYPg4AcRl4=;
 b=tlgQ2HDhx1yoiCFpIAt44tBdo41OZHD9tmTiGspOAH7hGyj1vVFWFe4NI9TabDy95iH+
 OuimzuLzupdh1OLdXKpgDNY77dUxWIwkANMo8zpC7BdFz08xAcjrLf51jKb1AQFwrx5B
 tZ1RQ4uDyDTni+AQ9+cuC/oRZAp4KMjLyNJxY0EtO8HOMiwHH7z1V3EWIKy6iSP46uCR
 kqr/eJHXPA/6zBKGsIXUhphFdFEXIgimhEucVUrzvIwnUwZzjq4HaA/Q16t04JpHcLCH
 LOK2dpQEuwuSC1yr7zCL6qtOKGSiz21Bwz+lAH1UZGUOfegQTrOXEdU0Pzd+KCi6qLF/ kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3awucwk3cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:22:50 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18793rFr165507;
 Tue, 7 Sep 2021 05:22:50 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3awucwk3bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:22:50 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1879C9f0030152;
 Tue, 7 Sep 2021 09:22:48 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3av02jc02e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 09:22:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1879MjXq57737586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 09:22:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B162A406D;
 Tue,  7 Sep 2021 09:22:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0376A4054;
 Tue,  7 Sep 2021 09:22:44 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.80.237])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Sep 2021 09:22:44 +0000 (GMT)
Subject: Re: [PATCH] s390x/cpumodel: Add more feature to gen16 default model
To: Thomas Huth <thuth@redhat.com>
References: <20210907091128.25051-1-borntraeger@de.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <b28c3f9b-609c-b412-4a73-86b72b222fa3@de.ibm.com>
Date: Tue, 7 Sep 2021 11:22:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907091128.25051-1-borntraeger@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 76iM9CdSkfiJe4TuO59LzMYaWhAzz9MW
X-Proofpoint-GUID: RPnJqGLqYNyoKY8jyjc22WkGtvrhGoyf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_03:2021-09-03,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070060
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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



On 07.09.21 11:11, Christian Borntraeger wrote:
> Add the new gen16 features to the default model and fence them for
> machine version 6.1 and earlier.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>   hw/s390x/s390-virtio-ccw.c  | 5 +++++
>   target/s390x/gen-features.c | 8 +++++++-
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 4d25278cf20e..72573ec66e84 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -803,6 +803,11 @@ DEFINE_CCW_MACHINE(6_2, "6.2", true);
>   static void ccw_machine_6_1_instance_options(MachineState *machine)
>   {
>       ccw_machine_6_2_instance_options(machine);
> +    s390_cpudef_featoff_greater(12, 1, S390_FEAT_NNPA);
> +    s390_cpudef_featoff_greater(12, 1, S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2);
> +    s390_cpudef_featoff_greater(12, 1, S390_FEAT_BEAR_ENH);
> +    s390_cpudef_featoff_greater(12, 1, S390_FEAT_RDP);
> +    s390_cpudef_featoff_greater(12, 1, S390_FEAT_PAI);

It does not hurt, but the 12 should be 16 of course.
Will fix.

