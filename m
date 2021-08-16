Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770483ED988
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:09:22 +0200 (CEST)
Received: from localhost ([::1]:48516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeEr-0006uD-J5
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1mFeDA-0005Rl-9f
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:07:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1mFeD8-0001aw-KS
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:07:36 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GF2oWa081059; Mon, 16 Aug 2021 11:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : references :
 subject : cc : from : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=ElC+X0ZF7nOSBN3bwaWcxMyEUwlqLEcqHdvchOPubOY=;
 b=KdEaNaKqHJZ7L72numDh6nNH4HKmQ3q/YhPj3MaPT62pD82gZoRLlekYpEbVtZ10SJ+9
 Jigq9SmvJAJic+bK1sJ8D1Cy+iBSHacOrYal4dc7jswQpWdlwEqrOQy+jlTSsrZtl2/D
 jVoZnKMGx7YLjakILDgzCC1fWcdduEXYYXZwZbYQ6cIWh2W7wm+9QQhDbb9/pka1UY1j
 OzOYGEy8yVGQOkvnXJRl1RrA+QKAhtJrxwJWB17qA5Uc/grNZ/vKDia5o77UlDE2xVq5
 u4vw/bK040IAwzu/eGK1s2EjsNktDvvueojPzMYQnXNGgAxzDpJibfIorivL146kI4Ls eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aetvv30ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 11:07:28 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17GF3HAm083773;
 Mon, 16 Aug 2021 11:07:27 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aetvv30mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 11:07:27 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17GF4Mmv021180;
 Mon, 16 Aug 2021 15:07:25 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3ae5fc369f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 15:07:25 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17GF7OSF51380648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 15:07:24 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 725CFAE060;
 Mon, 16 Aug 2021 15:07:24 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16866AE064;
 Mon, 16 Aug 2021 15:07:24 +0000 (GMT)
Received: from Tobins-MacBook-Pro-2.local (unknown [9.160.147.42])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Aug 2021 15:07:23 +0000 (GMT)
To: ashish.kalra@amd.com
References: 
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Message-ID: <340f9f9f-cc90-1b02-83e4-54a84d49667d@linux.ibm.com>
Date: Mon, 16 Aug 2021 11:07:23 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IdJ7JyKReMa-6bN4Sh9YMvhl2epsGmag
X-Proofpoint-ORIG-GUID: 68s1uD_LTCeEcLVD8xpa5WcH3xOP0jGR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_05:2021-08-16,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=880 bulkscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160096
Received-SPF: pass client-ip=148.163.156.1; envelope-from=tobin@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Brijesh Singh <brijesh.singh@amd.com>, ehabkost@redhat.com,
 kvm list <kvm@vger.kernel.org>, mst@redhat.com,
 James Bottomley <jejb@linux.ibm.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16 at 10:44 AM Ashish Kalra wrote:

 > I am not sure if we really don't need QEMU's MMIO logic, I think that 
once the>
 > mirror VM starts booting and running the UEFI code, it might be only 
during
 > the PEI or DXE phase where it will start actually running the MH code,
 > so mirror VM probably still need to handles KVM_EXIT_IO when SEC 
phase does I/O,
 > I can see PIC accesses and Debug Agent initialization stuff in SEC 
startup code.

The migration handler prototype that we are releasing in the near future 
does not use the SEC or PEI phases in the mirror. We have some support 
code that runs in the main VM and sets up the migration handler entry 
point. QEMU starts the mirror pointing to this entry point, which does 
some more setup (like switching to long mode) and jumps to the migration 
handler.

-Tobin

 > Addtionally this still requires CPUState{..} structure and the backing
 > "X86CPU" structure, for example, as part of kvm_arch_post_run() to get
 > the MemTxAttrs needed by kvm_handle_io().

 > Thanks,
 > Ashish


