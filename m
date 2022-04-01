Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138164EE8AB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 08:57:13 +0200 (CEST)
Received: from localhost ([::1]:42328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naBDb-0005dD-I3
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 02:57:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1naAzI-0008T2-Mh; Fri, 01 Apr 2022 02:42:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1naAz5-00016H-4m; Fri, 01 Apr 2022 02:42:13 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2316M3qB007955; 
 Fri, 1 Apr 2022 06:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=m15TPFNFDP/4DrleczJ5eotHLzJ7VYqKgx7/2D+j3W8=;
 b=YHVLQmSftiuZP1k2vdmjgNci7xAImE5uWxZ44NO9FckDSiKwsD2Jw3lg2TgqTSGI3GGg
 wY/njnbuxCnAPm3sXYCDX6lpJIExf80Z/Mjb45vR7eiq09ST9qWN+knNWhsZ4AL2k7nI
 9HWbzu9kPKHkSW+UvScR96skx7n7EoB2bi5UE2eEOdGx9GCk/ZHwE6LBuNgpO5OwULH3
 3K8mL+Vq4M7jBh+0zoSZkfFkCGEuHAVUc7URP/uRfhhOWdaIEZFjHHdOm5JI3XAZ1Z6Z
 nTT6kqyNz3xtXVgz6811y9+WwiHj7qVqyScw7C2GEGhYeamdPimcQtziSYg3Yom/Fmqa AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f52nt6fy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 06:42:06 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2316Maqh015068;
 Fri, 1 Apr 2022 06:42:06 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f52nt6fxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 06:42:06 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2316Irkx031455;
 Fri, 1 Apr 2022 06:42:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3f1tf94bw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 06:42:03 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2316g0Ku49676560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Apr 2022 06:42:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A03911C06F;
 Fri,  1 Apr 2022 06:42:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E422811C052;
 Fri,  1 Apr 2022 06:41:59 +0000 (GMT)
Received: from [9.171.29.62] (unknown [9.171.29.62])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 Apr 2022 06:41:59 +0000 (GMT)
Message-ID: <58110f3f-3190-7af4-6839-9a30fce05855@linux.ibm.com>
Date: Fri, 1 Apr 2022 08:41:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, Thomas Huth <thuth@redhat.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
 <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
 <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
 <95ad366c-509d-d41f-209b-dc66054de4b8@redhat.com>
 <CAEgyohVUHa+yd-inLOv3zTf143-_2Z35+K_XatUz74bqxDK9CA@mail.gmail.com>
 <CAEgyohWR6C1z8OyuGwkv8LT-P5fR9eVsCFw4LmGUxZCDNszoSg@mail.gmail.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <CAEgyohWR6C1z8OyuGwkv8LT-P5fR9eVsCFw4LmGUxZCDNszoSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YEDeYzBfkZOesH-O6yi8O4vOzClby2fx
X-Proofpoint-ORIG-GUID: w21bbPFeXwyEq1f-fLgT5I_ZCJFdC6zJ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxlogscore=938
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010030
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 cohuck@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 01.04.22 um 04:15 schrieb David Miller:
> Hi,
> 
> There is some issue with instruction sub/alt encodings not matching,
> but I worked around it easily.
> 
> I'm dropping the updated patch for the tests in here.
> I know I should resend the entire patch series as a higher version
> really, and will do so.
> I'm hoping someone can tell me if it's ok to use .insn vrr  in place
> of vri(-d) as it doesn't match vri.
> [https://sourceware.org/binutils/docs-2.37/as/s390-Formats.html]
> 
> .insn doesn't deal with sub encodings and there is no good alternative
> that I know of.
> 
> example:
> 
>      /* vri-d as vrr */
>      asm volatile(".insn vrr, 0xE70000000086, %[v1], %[v2], %[v3], 0, %[I], 0\n"
>                  : [v1] "=v" (v1->v)
>                  : [v2]  "v" (v2->v)
>                  , [v3]  "v" (v3->v)
>                  , [I]   "i" (I & 7));
> 
> Patch is attached

Yes, vri sucks and does not work with vrsd. Maybe just use .long which is probably
better than using a "wrong" format.
Opinions?

