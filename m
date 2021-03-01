Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FBF329227
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:41:59 +0100 (CET)
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGpMc-0006Kp-3V
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lGpKZ-00050k-3r
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:39:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64354
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lGpKW-0006Pc-GD
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:39:50 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 121KY5Cq131855
 for <qemu-devel@nongnu.org>; Mon, 1 Mar 2021 15:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Fyy7bg6Sb5KRG9TmoKlrp2RnghKCRvPztd1nphJYFrI=;
 b=XFAEQJBlAYcZgLXFVMz/WRfmmCHtgNbvaLSXsUAMfE3CbbhdtZWuWpU5LbL3tzJMib4V
 VsPzsBSZMA0PKa6rlzx0cpsAbBDGyfs79/QMyAXomxrX0KhZ4GDrbulB4Q9At9FJ3Q42
 vpF2kkVho2Wg/xEyPZcnXJyVI7IJ4zXMYtVpymzPbd6pq2GssImQ1DzitBlhEQoh7FeE
 QGYWMwct2hWjuBqdF3sNuCjwIn3/xKJKjlQK8QqcU5Gh+zo89j7k95DzVKcn/fun85pV
 eQRcMHH24VIa+Yb8LxM3mpo12GczxliGdinEoVs58BfG2BWmm6T2jw18mdV06zN2KAMO gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3717cf05gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 15:39:47 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 121KaXkh136155
 for <qemu-devel@nongnu.org>; Mon, 1 Mar 2021 15:39:46 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3717cf05g0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 15:39:46 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 121KWW0P027509;
 Mon, 1 Mar 2021 20:39:46 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3710sqbduu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 20:39:46 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 121KdiDi27394538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Mar 2021 20:39:45 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6FCF6A04F;
 Mon,  1 Mar 2021 20:39:44 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 960466A047;
 Mon,  1 Mar 2021 20:39:44 +0000 (GMT)
Received: from [9.211.86.147] (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  1 Mar 2021 20:39:44 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
 <YDy8qsRRR3FmWr1D@redhat.com>
 <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
 <YD0Day/wGawuWdpi@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <950b36a4-ec19-84df-9292-c88c390ce5fc@linux.vnet.ibm.com>
Date: Mon, 1 Mar 2021 15:39:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD0Day/wGawuWdpi@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_13:2021-03-01,
 2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010166
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

Hi Daniel,

On 3/1/2021 10:08 AM, Daniel P. Berrangé wrote:
> What are the unique failure scenarios for CFI that these jobs are
> likely to expose ? Is it likely that we'll have cases where
> CFI succeeds in say, x86_64 target, but fails in aarch64 target ?

For CFI to fail (even if it shouldn't) you'll need code that is calling 
a function pointer that was not well defined at compile time. Although
unlikely, that could happen everywhere in the code.

So by just testing one (or few) targets we are are not covering the code 
in the TCG frontend used to compile the target ISA to tcg ops, which 
should be the in target/, and the architecture-dependent code in linux-user.

That code seems unlikely (at least to me) to cause a false positive with 
CFI. Examples that I've seen in QEMU so far are:
- Calling code that was JIT-ed at runtime
- Callbacks to functions that were loaded from shared libraries
- Signal Handlers
And none of those should happen there IMHO. But you know, corner cases 
are still possible, and it's quite difficult to predict what new code 
may bring.

We could also consider always testing one or two targets, and keep an 
optional job to test them all when deemed necessary. I'm thinking for
example full testing when code in target/ or linux-user/ is considered, 
or for testing pre-release code. Would be nice to have this automated 
but I am not sure that's possible.

Regards,
Daniele

