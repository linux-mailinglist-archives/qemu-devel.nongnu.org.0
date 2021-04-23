Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C0368E75
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 10:07:15 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZqqI-0000ta-7x
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 04:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZqod-0000KR-Rz; Fri, 23 Apr 2021 04:05:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZqoc-000115-1T; Fri, 23 Apr 2021 04:05:31 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13N84nQN121877; Fri, 23 Apr 2021 04:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=63OoSKqiXj51nxdAjVGrvrwvpm1sOyzOTnSC+6uyZnA=;
 b=tHC7u++tti05b60B7DwQbtKqXQdy9fwQo8Mq+S0nYXinUjr+ThQtoVboufgKUqKM5c0a
 tJa0FKgUp4UGuLiGAnG2kjQhrF47fQwfG97mQ/N1hmigUXfFW+Y0/sqsnOv0sxJKiiRL
 MMh8lfhgvVqXLvFfkV/7s8ZTSBvvuDYMd7p0GaITMBhZX/f9YefW6u73e9ZReEyNL+4o
 Ex3ZtXIgIRBPFvEykHS52tPYzU9PrMnU7YvkyYxBYwno04+YVRx4j0hvU7e4jjZHOX+g
 gdtH8JmjNey+rF7E/e6Ib8r7xz9eCYuyC27fJN/ulFiiXAL6Lbd/J6ES7jfFcL26ZQcR QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3835fbhmmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 04:05:26 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13N85L17126024;
 Fri, 23 Apr 2021 04:05:26 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3835fbhmkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 04:05:26 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13N83Lxt026794;
 Fri, 23 Apr 2021 08:05:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 37yqa8k8t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 08:05:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13N85LvO30802386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 08:05:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CC5142047;
 Fri, 23 Apr 2021 08:05:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA8E842042;
 Fri, 23 Apr 2021 08:05:20 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.57.182])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 23 Apr 2021 08:05:20 +0000 (GMT)
Subject: Re: Compiling the s390-ccw bios with clang
To: Thomas Huth <thuth@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
 <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
 <e4116908-7172-fd9c-1837-82c489b61620@redhat.com>
 <c95369e4-ffc9-d01d-45c1-4daad0ead6a5@redhat.com>
 <20210422155238.kak7tl3xnup5vod7@steredhat>
 <da8f7353-8e2a-82f9-c324-18321649ccb5@redhat.com>
 <fb127bc3-aa4a-dc04-484a-d747c3aa503e@redhat.com>
 <20210423064001.fjouibdcwadtgijy@steredhat>
 <b167616b-1908-1a76-a2af-35b87c05d570@de.ibm.com>
 <8abfb851-a5d2-8608-fe96-2eb3014adb96@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <637bfd21-9db5-15c7-4dcd-0f883041063e@de.ibm.com>
Date: Fri, 23 Apr 2021 10:05:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <8abfb851-a5d2-8608-fe96-2eb3014adb96@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: F8uDsZUB7y4ztZ9t1tpA3iKXSmKbWmwk
X-Proofpoint-GUID: nx4_PcFysz3m7AOPxwUTJqFCiT3s3CZe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_15:2021-04-22,
 2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 suspectscore=0 mlxlogscore=982 clxscore=1015 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104230049
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 23.04.21 09:57, Thomas Huth wrote:
> On 23/04/2021 08.52, Christian Borntraeger wrote:
> [...]
>> We can of course discuss if we compile the BIOS for z10 instead of z900. TCG
>> in the mean time can handle up to z13 and z10 is now also 13 years old.
> 
> I'd really like to see us supporting Clang in the s390-ccw bios, too, since it provides additional useful compiler warnings ... but switching the -mz900 to -mz10 here also means that we could not boot VMs anymore that use a CPU that is older than the z10...
> 
> Is anybody still using such old CPUs? Should we maybe deprecate all CPUs that are older than the z10 in QEMU? Alternatively, we could try to detect Clang in the Makefile, and only use -mz10 in that case and continue to use -mz900 in the other case...?

If we can make it "non-ugly" this is certainly the most unproblematic variant.

