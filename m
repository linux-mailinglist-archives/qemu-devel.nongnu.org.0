Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DE73901CC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:12:11 +0200 (CEST)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWqw-0003LN-JP
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1llWpg-0002JD-3z
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:10:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1llWpd-0000zT-8k
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:10:51 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PD42ju042060; Tue, 25 May 2021 09:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZSS4nCGar/loq1G7jtVM4S8x/XuTggcmFtAMm1EuhPU=;
 b=e7Oo55tqwy4M8zHPSTRRTqMNEneTkGFB2xZ4z2iVCsxRpnojBcZKxWxm8DPtvmYpVRXF
 wUNUOjGYs7JqOl+ZBVno8My0HkTYLc5qvKeC6eyn9u6YvwRTJIbxGCx8hwSzHMCMwQke
 ol6rpD6zzesmyONJQcn4HdRvQhj/CNOvKdmeKt5gmyGoH8HQ6U03LvuD2hO7fRM+Rz4/
 SDSqwJPrNReAZ+keKnXYZ3OQPbWefHaHpzjvH245S18aygR8/oeo4jZngi6rIcHl+quz
 kYRyIExirj9fbxTyTIEkgVCwtB2Cw762bf/ATYVmiM/7K6BlJmE0liyQvaTSVTqXqIMR sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38s1gth0qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 09:10:45 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14PD4i2i045807;
 Tue, 25 May 2021 09:10:44 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38s1gth0nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 09:10:44 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PD8pnb009073;
 Tue, 25 May 2021 13:10:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 38s1r5003m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 13:10:41 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PDAcMh26804654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 13:10:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66EFB42045;
 Tue, 25 May 2021 13:10:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D6344203F;
 Tue, 25 May 2021 13:10:34 +0000 (GMT)
Received: from [9.65.213.35] (unknown [9.65.213.35])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 13:10:33 +0000 (GMT)
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
To: qemu-devel@nongnu.org
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <47bcf1ab-37a6-f329-0017-673b6aa21979@linux.ibm.com>
Date: Tue, 25 May 2021 16:10:32 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a1gnM1yEqRvWv_4_911QkhQonEBhq4rt
X-Proofpoint-ORIG-GUID: 8J5wf7UEmBIP71KGBSJ-v39xgESQ7fBe
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_06:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105250081
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S . Tsirkin" <mst@redhat.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25/05/2021 9:59, Dov Murik wrote:
> From: James Bottomley <jejb@linux.ibm.com>
> 
> If the VM is using memory encryption and also specifies a kernel/initrd
> or appended command line, calculate the hashes and add them to the
> encrypted data.  For this to work, OVMF must support an encrypted area
> to place the data which is advertised via a special GUID in the OVMF
> reset table (if the GUID doesn't exist, the user isn't allowed to pass
> in the kernel/initrd/cmdline via the fw_cfg interface).
> 
> The hashes of each of the files is calculated (or the string in the case
> of the cmdline with trailing '\0' included).  Each entry in the hashes
> table is GUID identified and since they're passed through the memcrypt
> interface, the hash of the encrypted data will be accumulated by the
> PSP.
> 
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> [dovmurik@linux.ibm.com: use machine->cgs, remove parsing of GUID
> strings, remove GCC pragma, fix checkpatch errors]
> ---
> 
> OVMF support for handling the table of hashes (verifying that the
> kernel/initrd/cmdline passed via the fw_cfg interface indeed correspond
> to the measured hashes in the table) will be posted soon to edk2-devel.
> 


OVMF support was submitted to edk2-devel (patch series "Measured SEV
boot with kernel/initrd/cmdline"), which starts here:

https://edk2.groups.io/g/devel/topic/patch_v1_0_8_measured_sev/83074450

-Dov

