Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9B94B4420
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:31:10 +0100 (CET)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWlJ-0008Q3-0P
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:31:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nJWWB-00066A-JS
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:15:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nJWW9-0000pV-4n
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:15:31 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E7aumu018310; 
 Mon, 14 Feb 2022 08:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=vXAIBZayCPPu4kFbUYduH5nQP5RaAbC3ZpNwF3RRX3w=;
 b=laNYWwBp/9UKhWGa+9iADEq0YbhEeMNFr7j8iLU5zTYlUjr+DWIDRUtPLlBE1KdUnzuc
 7Fgynckzt4QFNaWx8+ERwpCG/DaKt63dgV2dcj4yX+q06mw5mKg6jOE+S2WnfFOr1xgV
 /oLg9sLxFqkfZg+p7Iv0+yMOUB1/2lOsSCIhlxsJZNPfBphaJ5wzZ3J3x0f/h/tOvVWG
 /D+jFveGPhyWyWXcpcC88Y1dQVU6zUzB7Red7pS+WoSLx3d2cRMR5JePeU498aEQz505
 1lQyUuehxre3QQNonTMYhxRiriQ1UxgNwpRbRBiZgWKt4Q7PR4dViFWFEf1XRXJNOT+D nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e785sukdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 08:15:24 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21E87wiR007491;
 Mon, 14 Feb 2022 08:15:24 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e785sukd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 08:15:24 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E8Dobh011618;
 Mon, 14 Feb 2022 08:15:23 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3e64ha1d2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 08:15:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21E8FLCd35783078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 08:15:21 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D82BC6061;
 Mon, 14 Feb 2022 08:15:21 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7EC5C605D;
 Mon, 14 Feb 2022 08:15:18 +0000 (GMT)
Received: from [9.65.240.79] (unknown [9.65.240.79])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 08:15:18 +0000 (GMT)
Message-ID: <3df428b3-b5d7-aacc-9639-d2c2dfca6ed7@linux.ibm.com>
Date: Mon, 14 Feb 2022 10:15:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] qapi, i386/sev: Add debug-launch-digest to launch-measure
 response
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220131111539.3091765-1-dovmurik@linux.ibm.com>
 <YffLgx48+mM2SiIX@redhat.com>
 <5f08d6d3-0279-50ed-5223-a9f3217e555d@linux.ibm.com>
 <YffxpK99EibxdXG4@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YffxpK99EibxdXG4@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1QZ8exmIJmYLqaYzTMP_DE3-0Df-PxNH
X-Proofpoint-ORIG-GUID: MbZ9s7XoZfm2Htvb-LAdrOpudBz3VrW6
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140049
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 31/01/2022 16:26, Daniel P. Berrangé wrote:
[...]
> 
> IOW, I think there's only two scenarios that make sense
> 
> 1. The combined launch digest over firmware, kernel hashes
>    and VMSA state.
> 
> 2. Individual hashes for each of firmware, kernel hashes table and
>    VMSA state
> 


Just one more data point relevant to this discussion: in SNP the guest
asks the PSP for a signed attestation report (MSG_REPORT_REQ).  The
returned report (ATTESTATION_REPORT structure; see section 7.3 of [1])
includes a MEASUREMENT field which is the measurement calculated at
launch (it's a SHA384-based chain of hashes and not a hash of the entire
content as in SEV-ES; and GPAs are also included. Details in section
8.17).  The entire report is signed with the signature appearing in a
separate SIGNATURE field.



Mimicking that in QEMU for SEV-ES would be in my opinion closer to
option (1) above.

Again, the proposed patch here doesn't yet include the VMSAs in the
GCTX.LD and therefore is lacking.  Dave mentioned adding ioctl in KVM; I
think that Daniel once suggested adding a virtual file like
/sys/kernel/debug/kvm/617063-12/vcpu0/launch_vmsa with the 4KB VMSA content.


Note that AFAIK measured direct boot with -kernel is not yet supported
in SNP but we plan to add it (with similar hashes table) after the SNP
patches are accepted in OVMF.


[1] https://www.amd.com/system/files/TechDocs/56860.pdf


-Dov

