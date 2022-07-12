Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078C572983
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:52:21 +0200 (CEST)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOjs-00063G-3z
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oBOds-0004ZI-4X; Tue, 12 Jul 2022 18:46:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oBOdo-0006IM-Lr; Tue, 12 Jul 2022 18:46:07 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CLn9o3011486;
 Tue, 12 Jul 2022 22:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 reply-to : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=8+VjjJfBomgOhOygjq7G1lUDw3XZi2ydYi2R7gi9fxc=;
 b=Nv7hXKt+oHHS6qA5vkWmEfiVFNi1Do8eXTN+EuesDOw9xE23XI8f9Medzs3TiFuO2+73
 YFTvmtQDNsfMCkDcJHCOw7PnmNq3VFRxf9jgTBFFuLlCT1PgkFgAjxu71wEi8614LmBq
 c43Kb4JwlYF/c9US6pmBfcdtHtMGBGlRbJuNk5YdTJ84suxaH2adtTjfGsvFnYGyK90m
 LXrcHsCQIPvPRTPNDKIYs/1/X85vHK+7l4f6T1BzmsjBEuKnkVW6o2FJshH7zbKD42VS
 GJvJxetDnzNq3BhevQCFl3lUIJHcPD4VThPgvVTqnpNPX/p46urnkqit2LnT7csvacFy OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9akr4088-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 22:45:57 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26CMTviq036604;
 Tue, 12 Jul 2022 22:45:57 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9akr4080-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 22:45:56 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26CMaE6a006295;
 Tue, 12 Jul 2022 22:45:56 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 3h8mb9s2nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 22:45:56 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26CMjtYw14483780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 22:45:55 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0D4AAC05E;
 Tue, 12 Jul 2022 22:45:55 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0391AC059;
 Tue, 12 Jul 2022 22:45:53 +0000 (GMT)
Received: from [9.211.155.64] (unknown [9.211.155.64])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 12 Jul 2022 22:45:53 +0000 (GMT)
Message-ID: <880046ed-9048-da8e-1150-32bcfd938344@linux.ibm.com>
Date: Tue, 12 Jul 2022 19:45:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] target/ppc/kvm: Skip ".." directory in kvmppc_find_cpu_dt
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, mopsfelder@gmail.com,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220711193743.51456-1-muriloo@linux.ibm.com>
 <YszugDqguoCKti0j@yekko> <1c11f8ec-5635-9812-a091-d9a1e9f11ce5@gmail.com>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <1c11f8ec-5635-9812-a091-d9a1e9f11ce5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wjjWIHdvkyqHK3vkrMR-isxRSomJvq5I
X-Proofpoint-GUID: Sx6ht3UnZ2PdfNq4RbD3WWDYOTzHxy35
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_12,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=955
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120091
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Reply-To: muriloo@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Daniel, David.

On 7/12/22 10:03, Daniel Henrique Barboza wrote:
> 
> 
> On 7/12/22 00:46, David Gibson wrote:
>> On Mon, Jul 11, 2022 at 04:37:43PM -0300, Murilo Opsfelder Araujo wrote:
>>> Some systems have /proc/device-tree/cpus/../clock-frequency. However,
>>> this is not the expected path for a CPU device tree directory.
>>>
>>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>> ---
>>>   target/ppc/kvm.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>> index 6eed466f80..c8485a5cc0 100644
>>> --- a/target/ppc/kvm.c
>>> +++ b/target/ppc/kvm.c
>>> @@ -1877,6 +1877,12 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
>>>       buf[0] = '\0';
>>>       while ((dirp = readdir(dp)) != NULL) {
>>>           FILE *f;
>>> +
>>> +        /* Don't accidentally read from the upper directory */
>>> +        if (strcmp(dirp->d_name, "..") == 0) {
>>
>> It might not be causing problems now, but it would be technically more
>> correct to also skip ".", wouldn't it?
> 
> Given that the use of this function is inside kvmppc_read_int_cpu_dt(), which
> is used to read a property that belongs to a CPU node, I believe you're right.
> It's better to avoid returning "PROC_DEVTREE_CPU" as well.
> 
> Murilo, can you please re-send it skipping both ".." and "." ? Better be
> on the safe side.
> 
> 
> Daniel

I've sent v2:

     https://lore.kernel.org/qemu-devel/20220712210810.35514-1-muriloo@linux.ibm.com/

Thank you for reviewing.

-- 
Murilo

