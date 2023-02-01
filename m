Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DEA686BF4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 17:41:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNGAq-0001dC-1I; Wed, 01 Feb 2023 11:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pNGAn-0001cw-Tw
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:41:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pNGAm-00069F-1X
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:41:25 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311FhIF6029945; Wed, 1 Feb 2023 16:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Fqm+skdaCQejf4XugH0wst/pi5AlTY8Xm7xF0wPGKVg=;
 b=TEI4PavzNL/P/7bxsd43hhDvNShwO+gGw89R/KopMCyv6Hx5U89crq7oCQqk0NGZukRS
 QqFI+2h4aMq0qhvq98uzCLsuIYVHAbETsC66qHuS01E73N11h0IKjzMRaTA0Rj4v50Gu
 4tIZzqxQHs1EnbpZv+XGXa/IpTg6CnO0sT10DQewDt7EGAOCtCaCjH7chEzmdiPkVjZi
 wLQZxBb1U34FgYR79/IoEanvwJwtXKDvR4XG0LQHJLhFVzQtaCUy3zsRHbZSBri6s2d/
 au6XvYjYQGvcYPIA58fE3Z+OD31/Pr96CfeTtnrNowrU8FVy94FqSoTSJkQ+6fJQ5vGJ Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nftrw2b62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 16:41:20 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311Fa7Wv028595;
 Wed, 1 Feb 2023 16:41:20 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nftrw2b5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 16:41:19 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311Da7il007776;
 Wed, 1 Feb 2023 16:41:18 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3ncvtexs3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 16:41:18 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311GfFVd65733112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 16:41:16 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 925F258055;
 Wed,  1 Feb 2023 16:41:15 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A00E85803F;
 Wed,  1 Feb 2023 16:41:13 +0000 (GMT)
Received: from [9.65.241.24] (unknown [9.65.241.24])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 16:41:13 +0000 (GMT)
Message-ID: <581c0a1c-c08b-4ab8-a135-6077bec269da@linux.ibm.com>
Date: Wed, 1 Feb 2023 18:41:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
Content-Language: en-US
To: jejb@linux.ibm.com, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, DOV MURIK <Dov.Murik1@il.ibm.com>,
 Dov Murik <dovmurik@linux.ibm.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IS13H9gt-qqP0iVdPEELp96MLYbkNYtb
X-Proofpoint-GUID: Zat2ipSwR4sA5JOWiPvbTQDBj6GGtuZE
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010141
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jason, James,


On 01/02/2023 17:24, James Bottomley wrote:
> On Wed, 2023-02-01 at 10:10 -0500, Jason A. Donenfeld wrote:
>> This is already fixed via the patch that MST just sent in his pull.
>> So wait a few days for that to be merged and it'll be all set.
>>
>> No need for this patch here. Do not merge.
> 
> If it's not a secret, would it be too much trouble to point to the
> branch so we can actually test it?  It does seem that the biggest
> problem this issue shows is that there wasn't wide enough configuration
> testing done on the prior commits before they were merged.
> 

I assume it is:

----
... are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to f5cb612867d3b10b86d6361ba041767e02c1b127:

  docs/pcie.txt: Replace ioh3420 with pcie-root-port (2023-01-28 06:21:30 -0500)
----

I checked out this branch and started an SEV guest with measured boot
and it fails during hash verification in OVMF:

BlobVerifierLibSevHashesConstructor: Found injected hashes table in secure location
VerifyBlob: Found GUID 4DE79437-ABD2-427F-B835-D5B172D2045B in table
VerifyBlob: Hash comparison succeeded for "kernel"
VerifyBlob: Found GUID 44BAF731-3A2F-4BD7-9AF1-41E29169781D in table
VerifyBlob: Hash comparison succeeded for "initrd"
VerifyBlob: Found GUID 97D02DD8-BD20-4C94-AA78-E7714D36AB2A in table
VerifyBlob: Hash comparison failed for "cmdline"


(before that patch it was failing on the "kernel" hash.)

I haven't yet examined the suggested fix patch
("[PULL 10/56] x86: don't let decompressed kernel image clobber setup_data") -
just ran the simple test above.


-Dov

