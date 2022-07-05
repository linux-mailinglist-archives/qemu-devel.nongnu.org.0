Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701B56750A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:02:02 +0200 (CEST)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8lw1-0006du-4h
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1o8lON-0005g4-7J
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:27:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1o8lOK-0007nS-Td
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:27:14 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265GGaMB027923;
 Tue, 5 Jul 2022 16:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XXAVemh+hF96bLYe9YwoMvJEGghjHYpd1Dr02iEbIbI=;
 b=ZB8V9G1/a1/TcCwDm4HdiCZqzmhFA+g4tkWMWusfTPZukzU6Q3U/a4ALw77ieY8y0vP7
 dJ1HfH+M9GCe5lUxc2llhRaScfo/iDnFCzTwmUkh04mrBjQ54+xyECxDRsBP98y3zf8n
 98nA/VIEIM1zmSEjvvn1E8+9V/BUrDXgvcjloyTB6YoD5S78HFyx4BNSzTkH68Rj8Qkc
 q4eu8bTbSaA/1jVG0KD1DVYxKkT7XmsSXWpTQgrQK5eh8QPmHPUfYv6G8LVuvft8rSGb
 sTG3dHfsOFwyF/lUo4ya8dtczwEjsciH/PKgn2FeEgt2VLxOhDQA5mPLIzGmEN+TckUb 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4rp8078v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 16:27:08 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 265GJGs0013737;
 Tue, 5 Jul 2022 16:27:08 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4rp8077m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 16:27:08 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 265GLi9W029188;
 Tue, 5 Jul 2022 16:27:05 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3h2dn936xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 16:27:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 265GR3No23724300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Jul 2022 16:27:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FABC4C046;
 Tue,  5 Jul 2022 16:27:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B7214C040;
 Tue,  5 Jul 2022 16:27:03 +0000 (GMT)
Received: from [9.171.5.147] (unknown [9.171.5.147])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Jul 2022 16:27:02 +0000 (GMT)
Message-ID: <43b4a7ce-28d1-3f1e-96cd-273dec0e4bcb@de.ibm.com>
Date: Tue, 5 Jul 2022 18:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org
References: <20220704164112.2890137-1-iii@linux.ibm.com>
 <CAFEAcA-PU-iXKRKd_0rYzyq3o4DZEbzU4OqJ=8qq+cxNA64O+w@mail.gmail.com>
 <YsRj0DMhs65WRqMP@work-vm>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <YsRj0DMhs65WRqMP@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QyKAHrxoTU9kJ1D-Yjw2HS2M38L-Dngr
X-Proofpoint-ORIG-GUID: 3lvT1sBs1pzB54CeJjrVBJqmdI6dGtai
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_13,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050069
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

Am 05.07.22 um 18:16 schrieb Dr. David Alan Gilbert:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Mon, 4 Jul 2022 at 17:43, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>>>
>>> zlib_send_prepare() compresses pages of a running VM. zlib does not
>>> make any thread-safety guarantees with respect to changing deflate()
>>> input concurrently with deflate() [1].
>>>
>>> One can observe problems due to this with the IBM zEnterprise Data
>>> Compression accelerator capable zlib [2]. When the hardware
>>> acceleration is enabled, migration/multifd/tcp/plain/zlib test fails
>>> intermittently [3] due to sliding window corruption. The accelerator's
>>> architecture explicitly discourages concurrent accesses [4]:
>>>
>>>      Page 26-57, "Other Conditions":
>>>
>>>      As observed by this CPU, other CPUs, and channel
>>>      programs, references to the parameter block, first,
>>>      second, and third operands may be multiple-access
>>>      references, accesses to these storage locations are
>>>      not necessarily block-concurrent, and the sequence
>>>      of these accesses or references is undefined.
>>>
>>> Mark Adler pointed out that vanilla zlib performs double fetches under
>>> certain circumstances as well [5], therefore we need to copy data
>>> before passing it to deflate().
>>>
>>> [1] https://zlib.net/manual.html
>>> [2] https://github.com/madler/zlib/pull/410
>>> [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
>>> [4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
>>> [5] https://gitlab.com/qemu-project/qemu/-/issues/1099
>>
>> Is this [5] the wrong link? It's to our issue tracker, not zlib's
>> or a zlib mailing list thread, and it doesn't contain any messages
>> from Mark Adler.
> 
> Looking at Mark's message, I'm not seeing that it was cc'd to the lists.
> I did however ask him to update zlib's docs to describe the requirement.


Can you maybe forward the message here?

