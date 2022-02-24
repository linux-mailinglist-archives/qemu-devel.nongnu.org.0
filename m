Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510614C2456
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 08:06:45 +0100 (CET)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN8D5-0006BZ-Vk
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 02:06:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nN8Ao-0004un-7q; Thu, 24 Feb 2022 02:04:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1nN8Am-0000jb-6Z; Thu, 24 Feb 2022 02:04:21 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21O3xREG028640; 
 Thu, 24 Feb 2022 07:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=zXdKqkMxj9prYSHDVa9RKanhRS4ARFmSxgm2K8UUD6o=;
 b=gzJZFE/aSRJEcI/xYHa+mN/D/qOYTwTGbvtWerbN5MPdeT53EnrcSUqvE156cEdCPU96
 KtThiYcQhOwuLzVM+bPeHdDjk9EHPU5JLu/2EYaOtwudAL/JyvQx7EF1J/cjtJ2ngJBK
 vtu1mX03WF0490JJabNMFdoH3++Urp0CD6biT9keqepgxte/y9DAiNDe6b14T0xCNTfb
 cS6PoqyMjPTj2RHMlZJMmQAO6W9Lte3P6bwT1hTQb1gCyFDWBF1u2EXwGVw+3f68kNzJ
 RSsuu2n7agDQ0fyTbxTQA+2YBpwDapWaZwNHRKdS5y1E8Svk8ewR1gUAaUrFDbw4CsTY Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edtyj40nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 07:04:14 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21O717xf005340;
 Thu, 24 Feb 2022 07:04:14 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edtyj40mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 07:04:14 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21O72kR4006459;
 Thu, 24 Feb 2022 07:04:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3ear69f2mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 07:04:11 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21O748FO38076710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 07:04:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9979FA4068;
 Thu, 24 Feb 2022 07:04:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CC7FA4062;
 Thu, 24 Feb 2022 07:04:08 +0000 (GMT)
Received: from [9.171.78.174] (unknown [9.171.78.174])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 07:04:08 +0000 (GMT)
Message-ID: <250d6ddd-eb43-0b92-e596-6f8aed435712@linux.ibm.com>
Date: Thu, 24 Feb 2022 08:04:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/4] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-2-dmiller423@gmail.com>
 <3db47aeb-a57e-55e3-92f2-620845fe00df@linux.ibm.com>
 <CAEgyohWaRVAfaFcoEBzgps-=u1UiTWLeHs6M7gLp_ONjLDpNmQ@mail.gmail.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <CAEgyohWaRVAfaFcoEBzgps-=u1UiTWLeHs6M7gLp_ONjLDpNmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FBuRl-M1cQKRQ2H6XSEcgaqQSjj7uOHY
X-Proofpoint-GUID: TcswrPYH7Le5n-D1SWGu_gvuQwgb28Ud
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=881 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202240041
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
Cc: thuth@redhat.com, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.02.22 um 23:29 schrieb David Miller:
> Yes I'm adding to this patch,  I haven't quite figured out where to
> put them,  they are inline to various things in the patch themselves
> so I'm putting in the cover letter under the patch they go to.
> I hope that's correct.

You usually put it under your Signed-off-by: line in the patch.
I think Thomas can fixup when applying.

> 
> Thanks
> - David Miller
> 
> On Wed, Feb 23, 2022 at 8:40 AM Christian Borntraeger
> <borntraeger@linux.ibm.com> wrote:
>>
>>
>> Am 18.02.22 um 00:17 schrieb David Miller:
>>> resolves: https://gitlab.com/qemu-project/qemu/-/issues/737
>>> implements:
>>> AND WITH COMPLEMENT   (NCRK, NCGRK)
>>> NAND                  (NNRK, NNGRK)
>>> NOT EXCLUSIVE OR      (NXRK, NXGRK)
>>> NOR                   (NORK, NOGRK)
>>> OR WITH COMPLEMENT    (OCRK, OCGRK)
>>> SELECT                (SELR, SELGR)
>>> SELECT HIGH           (SELFHR)
>>> MOVE RIGHT TO LEFT    (MVCRL)
>>> POPULATION COUNT      (POPCNT)
>>>
>>> Signed-off-by: David Miller <dmiller423@gmail.com>
>>
>> For your next patches, feel free to add previous Reviewed-by: tags so that others
>> can see what review has already happened.

