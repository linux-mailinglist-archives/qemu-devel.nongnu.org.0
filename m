Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C403DBE10
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:03:49 +0200 (CEST)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9WrL-0003Cs-Fw
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1m9Wq4-0002Vg-72
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:02:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38472
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1m9Wq2-0001n0-AK
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:02:27 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UHWtNc131038; Fri, 30 Jul 2021 14:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cT/gtDirpVxuYsUT69i/r+3M6Gesl9DLyTodtGeKqTE=;
 b=FcaPhCsX0yezXjmMbJeIqOSJD82SZ1CrbfbuxI+j5y8bbCBJCAJp/IhnyO3iRpLgQ6rn
 mhQRcDOcM4VyHdE4lPZ19GW5oNSIkBew928sYVrHSzsDmg7tVskXN4jpT0T2rEGO7Kks
 qmwAfEv+Ob4mXyd4Qs2ZHmKRYVN9fEeyUyqnx59+bt2ojn2lyz2VG6s6wlBZZiIX5UI3
 1DjWkBV//To5PYqLm/u8nxaJ5PWIRxDhFv52yA2vUgWt1y0dHe/7IJPjyIZGSRB0ccJI
 lx2xUrPB01Gfhw3WjTGF0N+o0e5GE/V90MD1FHaZJlg39rxyVkr20QsLi1lG6L+yABQE 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a4npnh0jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 14:02:23 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16UHjbxd194027;
 Fri, 30 Jul 2021 14:02:23 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a4npnh0jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 14:02:22 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16UHrEUa005478;
 Fri, 30 Jul 2021 18:02:22 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3a235rk4yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 18:02:21 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16UI2Kam27656470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 18:02:20 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FB976A05D;
 Fri, 30 Jul 2021 18:02:20 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBA946A061;
 Fri, 30 Jul 2021 18:02:16 +0000 (GMT)
Received: from [9.160.123.143] (unknown [9.160.123.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Jul 2021 18:02:16 +0000 (GMT)
Subject: Re: [PATCH v3 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
To: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
 <2dc6c60e-48f8-7c6f-6131-0bc1020e106f@redhat.com>
 <fbf2dd1f-150e-beb5-bf17-fc5dc787ab0d@redhat.com>
 <05d0ae90-a45f-157b-d37c-942bc0442449@redhat.com>
 <203b655c-809b-b418-f61c-982e587fa9f2@linux.ibm.com>
 <CD6K1W4R8HRF.3G3JJ2YD4C8I3@fedora>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <8af634e5-34be-1532-3afb-75ec4306fc87@linux.ibm.com>
Date: Fri, 30 Jul 2021 21:02:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <CD6K1W4R8HRF.3G3JJ2YD4C8I3@fedora>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PMmfKgp4-znZHuuwLGs1T2FZO_51oQvI
X-Proofpoint-GUID: 97Mly4WLztR7FPZU9CA4GfuFUK66Nk2E
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_11:2021-07-30,
 2021-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300117
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 30/07/2021 17:47, Connor Kuehl wrote:
> On Thu Jul 29, 2021 at 2:31 PM CDT, Dov Murik wrote:
>> The OVMF companion series has been reviewed by the new OVMF maintainer
>> and merged to edk2 master branch as of edk2 commit 514b3aa08ece [1].
>>
>> [1] https://github.com/tianocore/edk2/commit/514b3aa08ece
> 
> Awesome! Unfortunately, it's looking like we'll have to wait[1] for QEMU to
> thaw before this series goes in.
> 

Thanks for explaining this.  Do I need to do anything after 6.1 is
released? Ping? Rebase and re-send?

-Dov


> Connor
> 
> [1] https://wiki.qemu.org/Planning/6.1
> 

