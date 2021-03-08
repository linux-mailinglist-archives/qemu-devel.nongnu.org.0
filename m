Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF833118C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:00:40 +0100 (CET)
Received: from localhost ([::1]:58782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHN9-0000kj-NY
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lJHLQ-0007s3-UZ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:58:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lJHLN-0005xC-9V
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:58:52 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128EwA9m086080
 for <qemu-devel@nongnu.org>; Mon, 8 Mar 2021 09:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Sa+laA3haRc9JaTiUnd1YeCeI3JUoSBUgKKjD1ECShs=;
 b=FoSGu13ZDCit8sOiOtmlxysc0CMdVlLzc1Vegtk9u3mzixJ/y3FWqvt4b72f6txdISnq
 bKV/N1FWMGbeIBNR8LBilBvzMpx14jUnantLxvhlMmrJtT3sMNXqwau5VV267HQEHhTr
 sWGjZt0AVSjFJML7NvNGMThFRsqI6NRa4mqMYJoLRhvSvsvBjqChmvWe8rOISXmHZh4O
 ROZgrbZLOfZG/I57HDopVBr8pZ1ODThaQADYNd1+NXISWSOM7jeQPoDqxNDLM7Rsdjlx
 xkRWOA9eL1GnV+FJmYwZ21MLt2GJnMPMbitgiqNrQVOcLDCa5vam6gTqdV0hQbOVVfav Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375p5gg0hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:58:45 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 128EwSHI086661
 for <qemu-devel@nongnu.org>; Mon, 8 Mar 2021 09:58:44 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375p5gg0ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 09:58:43 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128ErH0n012732;
 Mon, 8 Mar 2021 14:58:39 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3741c9b7a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 14:58:39 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128Ewcai24314164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 14:58:38 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E2DE6A051;
 Mon,  8 Mar 2021 14:58:38 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15E776A05A;
 Mon,  8 Mar 2021 14:58:37 +0000 (GMT)
Received: from [9.211.86.147] (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 14:58:37 +0000 (GMT)
Subject: Re: [PATCH] meson: Stop if cfi is enabled with system slirp
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
 <YEC4Rk/eAStVIFU7@redhat.com>
 <771f3a7b-f42d-fbd9-5bdc-bce5d354278a@linux.vnet.ibm.com>
 <YEYISUuI49rphmDe@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <8fb3e88a-845f-d328-d39c-24878a39afdb@linux.vnet.ibm.com>
Date: Mon, 8 Mar 2021 09:58:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEYISUuI49rphmDe@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_08:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103080080
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 3/8/2021 6:19 AM, Daniel P. Berrangé wrote:
> My concern is that libslirp is just showing us one known example of
> the problem. QEMU links to many more external libraries, which might
> exhibit similar issues. If we need to rebuild all the dependancies
> with CFI too, to be confident that the combined work will operate
> correctly, then this is quite a significant implication. Overall I
> think this is going to be a problem for the changes of distros adopting
> the use of CFI, especially if they're not using CLang as their toolchain.

In my opinion, there's no need to rebuild everything with CFI. There
will be libraries that will benefit more from CFI, such as libslirp
IMHO. But that still doesn't even mean that we need a CFI-enabled
version to operate correctly.

 From a functional point of view, there are plenty of ways to have a CFI-
enabled binary work with shared libraries that do not support CFI (or
cross-dso CFI).

 From a security point of view it will be a trade-off. So I think we
should study it on a per-library case to find out the best way forward.
I believe in most cases, an approach like the one discussed with Paolo
will be more than enough to get a good security level in QEMU,
especially if the feature provided by the library is not used at
runtime.

> 
> Regards,
> Daniel

