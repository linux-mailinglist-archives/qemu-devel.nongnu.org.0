Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B13F4E5B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:29:26 +0200 (CEST)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICpB-0007gF-DB
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1mICoN-0006xc-RE
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:28:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1mICoL-0006Gj-OX
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:28:35 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NG2nc8177166; Mon, 23 Aug 2021 12:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Envgh1shC26UgCJP6Bb9m3IzkLDdYHPU0eAN6NLyMXk=;
 b=rR9EH1OCt4KsbePIHN3yImmfmOr7s4C/rbS9lcvl8/6KYypzFlL9U/G94v/u6EfeL68J
 31LNuIHDnpXKB8w75Tg23HEQ0ZRgb9ozZFFcfC6Mupnq7eIrVv+iLBWL+hFlkFkWK15t
 5iaOWeiujiTtvQMArlBkW8Bu4OCo7pOVz+80jUWBbNK1zaJXMGR933vKq+GytqbCBu6P
 0SjUBa7WwL/GfewvGd/p9QAwnawKp12iQ4kDh9lrkv55b9ng1Oj9eXMYNJgKgHAa8zhv
 cJepmhNn5fCA/TLYfKFvixsyWbb1q7AgoEdotbR1I1sr50475R7t1Nt6HdP8fx5Npeip tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akf28wqsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 12:28:29 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NG3Sqm180006;
 Mon, 23 Aug 2021 12:28:29 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akf28wqs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 12:28:29 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NGNDQm007687;
 Mon, 23 Aug 2021 16:28:28 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3ajs4btgqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 16:28:28 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NGSQN325362818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 16:28:26 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C86C9124060;
 Mon, 23 Aug 2021 16:28:26 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BB3712406C;
 Mon, 23 Aug 2021 16:28:26 +0000 (GMT)
Received: from Tobins-MacBook-Pro-2.local (unknown [9.160.190.1])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 16:28:26 +0000 (GMT)
From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>
References: <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
 <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
 <458ba932-5150-8706-3958-caa4cc67c8e3@linux.ibm.com>
 <YR1ZvArdq4sKVyTJ@work-vm>
 <c1d8dbca-c6a9-58da-6f95-b33b74e0485a@linux.ibm.com>
 <YR4U11ssVUztsPyx@work-vm>
 <538733190532643cc19b6e30f0eda4dd1bc2a767.camel@linux.ibm.com>
 <YR5qka5aoJqlouhO@work-vm>
 <d6eb8f7ff2d78296b5ba3a20d1dc9640f4bb8fa5.camel@linux.ibm.com>
 <YSOT87eg4UjCG+jG@work-vm>
Message-ID: <3d141f28-1abe-32ed-1f72-2cbec707a669@linux.ibm.com>
Date: Mon, 23 Aug 2021 12:28:25 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YSOT87eg4UjCG+jG@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 75ZlngP1WPAGLebF7lPS-dLpTQCgIgN-
X-Proofpoint-ORIG-GUID: IoOD8nALGipGQT9Pea8zgRt_HVwacQQ0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_03:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230110
Received-SPF: pass client-ip=148.163.158.5; envelope-from=tobin@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, Steve Rutherford <srutherford@google.com>, tobin@ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, frankeh@us.ibm.com,
 Paolo Bonzini <pbonzini@redhat.com>, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 8:26 AM, Dr. David Alan Gilbert wrote:

> * James Bottomley (jejb@linux.ibm.com) wrote:
>
>> (is there an attest of the destination happening here?)
>> There will be in the final version.  The attestations of the source and
>> target, being the hash of the OVMF (with the registers in the -ES
>> case), should be the same (modulo any firmware updates to the PSP,
>> whose firmware version is also hashed) to guarantee the OVMF is the
>> same on both sides.  We'll definitely take an action to get QEMU to
>> verify this ... made a lot easier now we have signed attestations ...
> Hmm; I'm not sure you're allowed to have QEMU verify that - we don't
> trust it; you need to have either the firmware say it's OK to migrate
> to the destination (using the existing PSP mechanism) or get the source
> MH to verify a quote from the destination.

I think the check in QEMU would only be a convenience. The launch 
measurement of the target (verified by the guest owner) is what 
guarantees that the firmware, as well as the policy, of the target is 
what is expected. In PSP-assisted migration the source verifies the 
target, but our plan is to have the guest owner verify both the source 
and the target. The target will only be provisioned with the transport 
key if the measurement checks out. We will have some more details about 
this key agreement scheme soon.

> [Somewhere along the line, if you're not using the PSP, I think you also
> need to check the guest policy to check it is allowed to migrate].

Sources that aren't allowed to migrate won't be provisioned with 
transport key to encrypt pages. A non-migrateable guest could also be 
booted with OvmfPkg firmware, which does not contain the migration handler.

-Tobin

> Dave
>
>> James
>>
>>

