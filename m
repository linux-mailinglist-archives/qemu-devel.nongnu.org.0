Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FBB402DED
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 19:47:36 +0200 (CEST)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfC2-00011u-Ts
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 13:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mNf90-0006f1-3T
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:44:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mNf8y-0003CQ-5w
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:44:25 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 187HXxBu142688; Tue, 7 Sep 2021 13:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sFD+dQPTw69DjL1ZFGz49VYicjn5stdn6/UoTurDxH4=;
 b=IXAohVKGFccxtLO4fDoo/4rpwEUrJdcl08ymn1NfVYDUEYR8ldzpBlUolAxpbhvfCv3f
 a/vzubk1qPutr82IS0oeuviPWutSlqQgsIQnR5vKy/DV7OiTjBugXYsf29ZblyESIClo
 elO3DTndBjawEG0wJy2ZJ7KGAf+d/9iWL/cILr6YKf7uhZoyZ7H3s/cCX+yyo53Pb7Ir
 l+/Q0FMVYpNhvbh6ctcYHxmvvIcw5qdW45XCukE4Z27AVc9nBPFQbSpIUxOAorOpk5i/
 dSIyWcpKqljSllZEuyXJuJchhan0TmwzLkMBDFcXT1kU3OMMJ2UDFHuDR5xjORbJgKD2 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3axc4h1445-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 13:44:13 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 187Hav2s153372;
 Tue, 7 Sep 2021 13:44:13 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3axc4h143e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 13:44:13 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 187HcHXW023877;
 Tue, 7 Sep 2021 17:44:12 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3axcnh87v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 17:44:12 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 187HiAUQ29688154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 17:44:10 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF73BC606C;
 Tue,  7 Sep 2021 17:44:10 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3157C605B;
 Tue,  7 Sep 2021 17:44:06 +0000 (GMT)
Received: from [9.65.84.185] (unknown [9.65.84.185])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Sep 2021 17:44:06 +0000 (GMT)
Subject: Re: [RFC PATCH v2 11/12] i386/sev: sev-snp: add support for CPUID
 validation
To: Michael Roth <michael.roth@amd.com>
References: <20210826222627.3556-1-michael.roth@amd.com>
 <20210826222627.3556-12-michael.roth@amd.com>
 <8c89a4e7-8d3e-645e-c2a8-16f3c146ef32@linux.ibm.com>
 <20210907165033.56bkajbopc3zchl4@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <fff74b1a-3a49-6279-1e76-62f42e9e3d1a@linux.ibm.com>
Date: Tue, 7 Sep 2021 20:44:04 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907165033.56bkajbopc3zchl4@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zf3fh7BIbZ7SXGXssrRrrtceMb53LQrl
X-Proofpoint-GUID: r01gM27ZnTbDyfw70h6ejq7xS3p2uoph
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_06:2021-09-07,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109070114
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/09/2021 19:50, Michael Roth wrote:
> On Sun, Sep 05, 2021 at 01:02:12PM +0300, Dov Murik wrote:
>> On 27/08/2021 1:26, Michael Roth wrote:

[...]

>>> +    for (i = 0; i < old->count; i++) {
>>> +        SnpCpuidFunc *old_func, *new_func;
>>> +
>>> +        old_func = &old->entries[i];
>>> +        new_func = &new->entries[i];
>>> +
>>> +        if (memcmp(old_func, new_func, sizeof(SnpCpuidFunc))) {
>>
>> Maybe clearer:
>>
>>     if (*old_func != *new_func) ...
> 
> Not 2 structs can be compared this way, maybe I'll just compare the
> individual members.
> 

Oops, my bad; I was confusing it with struct assignment.  I guess memcmp
is fine as-is in this case.


-Dov


