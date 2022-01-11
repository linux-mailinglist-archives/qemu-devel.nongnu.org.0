Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4822E48AE65
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:26:38 +0100 (CET)
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HAb-0000U5-Bc
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:26:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n7GaO-0007YM-Ut; Tue, 11 Jan 2022 07:49:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n7GaM-0003NJ-PR; Tue, 11 Jan 2022 07:49:12 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BCIhHw000996; 
 Tue, 11 Jan 2022 12:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=hvP1aryGDKJW7g+YI+a17zlGCImNs9GI6VnYqpzO8ks=;
 b=RNVOc6FzGEuM2JPKa5ye+FiGSHGDmFR2PBBSu99VIrw8ubCEiwUOJdqrh9SX3y42C1Uv
 AMdH64orBprvwNi3Iap2mPlGPUO/BmLHwk+aNBwmc1Rvv0u8c9NFSwYCThcAbasqkjdT
 Kz3yDWW/ntnFm7UEa9fmoR3MRUMF99DIfZq67uFxqOXTbTlyQG7CFIgqFehXwI5K7wBW
 g/uIkQjfYuWJLD2S3FB9w/QCQpwiqxgCM2ZJl2e6OR+jSHwCc1AYHImDH9HMzulI+I+w
 Wf1jTTPf7l1l4+bVPd1DyS51I0peQWfo43AFQ1wCwZVtRrW8+Gt21syrbWLUeD/7AJER jA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dh2qsjfrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 12:48:56 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20BCgbq5018419;
 Tue, 11 Jan 2022 12:48:56 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dh2qsjfr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 12:48:55 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20BCmFSv009747;
 Tue, 11 Jan 2022 12:48:54 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 3df28a33x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 12:48:54 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20BCmraT34800074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 12:48:53 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80E09BE07A;
 Tue, 11 Jan 2022 12:48:53 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDFE5BE05A;
 Tue, 11 Jan 2022 12:48:52 +0000 (GMT)
Received: from localhost (unknown [9.163.2.124])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 11 Jan 2022 12:48:52 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 8/8] target/ppc: 405: System call exception cleanup
In-Reply-To: <Ydzr+ecnNSik9N/C@yekko>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-9-farosas@linux.ibm.com> <Ydzr+ecnNSik9N/C@yekko>
Date: Tue, 11 Jan 2022 09:48:50 -0300
Message-ID: <87zgo28mkt.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S_wgyseToWIfi7dZlcdxeDZPjiGoSJ6W
X-Proofpoint-ORIG-GUID: yfe7U_oXssqg-yfoNWlMAp5YEBH026bH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=939 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201110075
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Jan 10, 2022 at 03:15:46PM -0300, Fabiano Rosas wrote:
>> There's no sc 1.
>> 
>> We also only used env->nip because of the vhyp code, so change to
>> 'vector' now.
>
> I don't think this is right.  The point with the env->nip change is
> changing the PC as it appeared *before* saving it to SRR0, so that
> we'll eventually return to the right place.  'vector' is the address
> for the interrupt vector itself.

Ugh, In the RFC version I introduced a 'nip' that holds env->nip. So it
would be correct to use 'nip' instead of 'env->nip' here. I knew
'vector' was looking off... Thanks for catching that.


