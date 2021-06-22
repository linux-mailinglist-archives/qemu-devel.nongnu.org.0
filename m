Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8CC3B018B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:38:02 +0200 (CEST)
Received: from localhost ([::1]:37742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdn7-0000Hf-IN
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvdbw-0002JV-US
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:26:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvdbu-0002xP-G6
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:26:28 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MA4AQV079579; Tue, 22 Jun 2021 06:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NSLYdwUXRFlfTvLCoLt9vsjKBAb6gCPa9Ret3ZAPmMM=;
 b=GQQ5Fs8q4EN46eFByA7d5r5b9K8vO9bXMfsQqr9Epp8ln7ei+xp1ldnzBQqKikED3jdB
 nRzaFWnNbTj01hG84wxLo1H1Js3dsadNV9xl9UpaH780QIzXRDmu4gQfid3bgLZ2ICAR
 h94aDIMndlJmJlwwZ6SDXQEs14VuasCInjn1Ju8t3pYy74AxcfHpzT/AZaKRlpLYzDHx
 fQis0y3yXRrZETYhxw+7UN08yfTNlv398Ukj4Q4g/SyZZcq8c9dcbYvY2lsXowJ64JZk
 Ld+NXEeXyTi8h2INc6eW7HW7xAuZNLcjdaiKBM8+rVDtRjoIuT6t/1tyc1SjueAzCRLk Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bd2aj1bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 06:26:22 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15MA4aJS081446;
 Tue, 22 Jun 2021 06:26:22 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bd2aj1af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 06:26:22 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15MA71EH000541;
 Tue, 22 Jun 2021 10:26:20 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3998789cn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 10:26:19 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15MAQGnG31326620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 10:26:16 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 675C811C05E;
 Tue, 22 Jun 2021 10:26:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D98BE11C04C;
 Tue, 22 Jun 2021 10:26:11 +0000 (GMT)
Received: from [9.160.112.114] (unknown [9.160.112.114])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Jun 2021 10:26:11 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-2-dovmurik@linux.ibm.com>
 <89258a7b-fe24-4930-5af7-278b68d1f07c@redhat.com>
 <25b381ad-cdca-60dc-6fb1-1d97ea626843@linux.ibm.com>
 <d983dbc4-1d6b-c51e-aa1f-3d736ac0d154@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <c54bcaf2-e8df-79fc-3bca-de0212db6333@linux.ibm.com>
Date: Tue, 22 Jun 2021 13:26:10 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d983dbc4-1d6b-c51e-aa1f-3d736ac0d154@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0NEXneurbYUt_U81KhrTJF6DbdjDctd-
X-Proofpoint-ORIG-GUID: -s2Jh5G_b7pP1WepzyjfJi1qbMuvU-af
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_05:2021-06-21,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106220064
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L5=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 22/06/2021 12:49, Philippe Mathieu-Daudé wrote:
> On 6/22/21 11:44 AM, Dov Murik wrote:
>> On 21/06/2021 23:32, Philippe Mathieu-Daudé wrote:
> 

...

> 
>>>> +    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>>>
>>> If we never use the data_len argument, can we simplify the prototype?
>>
>> The current uses for the OVMF reset vector GUIDed table is for simple
>> structs with known length (secret injection page address, SEV-ES reset
>> address, SEV table of hashes address).  But keeping the length there
>> allows adding variable-sized entries such as strings/blobs.
> 
> OK. Good opportunity to document the prototype declaration ;)

Yep. I'll send as a separate standalone patch.


P.S.
In a previous version you mentioned you ran into issues with a qemu
build with SEV disabled.  I tried that by modifying
default-configs/devices/i386-softmmu.mak and uncommenting CONFIG_SEV=n
there.  Is there a friendlier way to create such a build?

I'm currently building with:

    cd build
    ../configure --target-list=x86_64-softmmu
    make


Thanks,
-Dov


