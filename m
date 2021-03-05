Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE4932F079
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:59:09 +0100 (CET)
Received: from localhost ([::1]:44672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDnA-0000SO-E4
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lIDhY-0004tq-67
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:53:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lIDhQ-000601-2Q
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:53:19 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125Gi3eA037758
 for <qemu-devel@nongnu.org>; Fri, 5 Mar 2021 11:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y+mAXkEpG4YxjYsr659k7p8zIke2knlMGF4/sMz/jUQ=;
 b=CGChEMFRN4edTg0il1qiuYSZ8CXb4IEvReMWz3+DsAMNTIf+LA1/ZZXqEbhmca3QXN+Y
 gd1L/lbI0u24XkXeYE4GDR+V6Ar03ue2R5CipEY6KCJ896+g2LNA4263b5Wnp7db7+2h
 cd+Mg4AtYDhZspUOg5QgI+ms05x8At952jsl0ucacwyEp1oOclxZVI/NRFiE5WAW0orA
 XC4sMfH9E3ppex83Mivl33vgRUTb/PzBe4Wu1iGwouhaPA/rh8lwuxsIC/PUWY55deLC
 5Wq0+gteNmfWlgonWqzyJgo7TsYzwvIFRyFRnL5tJ7QtN4AAiHJU7pLs/V8wC1WwtkT0 RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373rdug82c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 11:53:11 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 125GjvJ7049991
 for <qemu-devel@nongnu.org>; Fri, 5 Mar 2021 11:53:10 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373rdug822-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 11:53:10 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 125Gffso021137;
 Fri, 5 Mar 2021 16:53:10 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3711dxhbjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 16:53:10 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 125Gr9mC44368140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 16:53:09 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69B716A04F;
 Fri,  5 Mar 2021 16:53:09 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A2FA6A054;
 Fri,  5 Mar 2021 16:53:09 +0000 (GMT)
Received: from [9.211.86.147] (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  5 Mar 2021 16:53:08 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH] meson: Stop if cfi is enabled with system slirp
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
 <YEC4Rk/eAStVIFU7@redhat.com>
Message-ID: <771f3a7b-f42d-fbd9-5bdc-bce5d354278a@linux.vnet.ibm.com>
Date: Fri, 5 Mar 2021 11:53:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEC4Rk/eAStVIFU7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_10:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103050083
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/2021 5:37 AM, Daniel P. Berrangé wrote:
> Is there work being done, or at least an active plan, for fixing this ?
> 
> Distros generally won't want to static link slirp to QEMU when there is
> a shared slirp available. It increases the security burden to maintain
> slirp twice, especially as slirp has a history of CVEs.
> 
> IOW, the inability to use shared slirp may well prevent CFI from being
> used in distros.

Daniel,
Adoption is a very good point. We don't want to have multiple versions
of the same library hanging around the O.S., unless strictly necessary.

The problem (if I wear my security hat) is that, as you pointed out,
slirp is known to have a history of CVEs, and it also rely heavily on
callbacks and function pointers. So it would be one of the best
candidates for CFI support.

A (long-term) solution could be to compile libslirp as a shared library,
WITH Control-Flow Integrity. Clang does have an experimental support for
Cross-DSO CFI. However, it is not viable at the moment because:
1. It is still considered Experimental
2. It is not compatible with pointer type generalization (which we need
because of Glib and other uses in QEMU).
Cross-DSO CFI also have some performance implications but I think that
would be a very small price to pay, and only in corner-case conditions.

I don't want to bore anyone too much with the details of the 
implementation... Yet. I'd be happy to explain the Cross-DSO mechanism 
implemented by Clang if it is considered interesting here.
The details can also be found here:
https://clang.llvm.org/docs/ControlFlowIntegrity.html#shared-library-support
And
https://clang.llvm.org/docs/ControlFlowIntegrityDesign.html
(Section "Shared library support")

I think this would be the best long-term solution to improve security
because it would allow to use CFI virtually on every library we consider 
security-sensitive, but not on the others. But it would require some
help and work from/to the Clang community.

In the short term, we should work out something similar to Paolo's
approach. I'll add a few comments to his email.

