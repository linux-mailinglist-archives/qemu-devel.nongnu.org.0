Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89F468EE61
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 12:59:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPj5V-0000uQ-Mu; Wed, 08 Feb 2023 06:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPj5P-0000u7-Jg
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:58:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPj5N-0001I1-5r
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:58:02 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318BgELS017705; Wed, 8 Feb 2023 11:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Jiv3xI4Hmg6TOU94I6/CsAG8vQnM2vt0IHIJIb8U2KU=;
 b=TNEzanET7c3qR3L/ujHHkmQDJt4Z5o62IKSOrVrM5IEpVY/sxEoQFbCCFFO0HpBI8SiP
 UDAOCe4IxKKhbXj9ms5kJs0WeP+86pN4RL662rwU4WvDxS2sn8TiDh7V6EySEptglM+U
 Ptr2Hg4f4NY5uLSUKgEyg7JVdlrIDsJ4x4UTQ3+82HJRkDEJoYnuLDNI6cVFazM9zzTN
 P/Ly881jm/ZWkvliXQJ6O6YWAu8ZR97QT9Tfe7FYqf6c6MeBz2CQOFBc8QOYMP7RIc7N
 TMYBzw98ekzgYzjo0bY4BFq7ejRl6iE3D8ZAYpr+OvqlGQ9Vyd6U0MgD3ksSMo5uhdZJ Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmb3d0abb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 11:57:42 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318Bho17025192;
 Wed, 8 Feb 2023 11:57:41 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmb3d0aau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 11:57:41 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 318BIQj3020153;
 Wed, 8 Feb 2023 11:57:40 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3nhf07d70p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 11:57:40 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 318BvcAF9634402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Feb 2023 11:57:38 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 793F85804E;
 Wed,  8 Feb 2023 11:57:38 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD6605805E;
 Wed,  8 Feb 2023 11:57:34 +0000 (GMT)
Received: from [9.160.93.69] (unknown [9.160.93.69])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  8 Feb 2023 11:57:34 +0000 (GMT)
Message-ID: <cff3f507-8e2d-0bf2-cf27-ffc0d6541120@linux.ibm.com>
Date: Wed, 8 Feb 2023 13:57:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Dov Murik <dovmurik@linux.ibm.com>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <23f28bd4-7adb-3bb1-7148-7dfbb57871d5@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <23f28bd4-7adb-3bb1-7148-7dfbb57871d5@amd.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cuDfWa_Z3Mh3XJOCrs7JQDVjiNGzRFwA
X-Proofpoint-ORIG-GUID: EXkQpGYt5lOC_PxzvrDM0BIpMDQ8aFCv
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_04,2023-02-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080104
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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



On 08/02/2023 1:21, Tom Lendacky wrote:
> On 2/7/23 15:45, Michael S. Tsirkin wrote:
>> On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
>>> Recent feature to supply RNG seed to the guest kernel modifies the
>>> kernel command-line by adding extra data at its end; this breaks
>>> measured boot with SEV and OVMF, and possibly signed boot.
>>>
>>> Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
>>> which has its own way of getting random seed (not to mention that
>>> getting the random seed from the untrusted host breaks the confidential
>>> computing trust model).
>>
>> Nope - getting a random seed from an untrusted source should not break
>> anything assuming you also have some other randomness source.
>> If you don't then you have other problems.
>>
>>> Disable the RNG seed feature in SEV guests.
>>>
>>> Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image
>>> clobber setup_data")
>>> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>
>>> ---
>>>
>>> There might be a need for a wider change to the ways setup_data entries
>>> are handled in x86_load_linux(); here I just try to restore the
>>> situation for SEV guests prior to the addition of the SETUP_RNG_SEED
>>> entry.
>>>
>>> Recent discussions on other (safer?) ways to pass this setup_data entry:
>>> [1]
>>> https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
>>>
>>> Note that in qemu 7.2.0 this is broken as well -- there the
>>> SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
>>> modifies and breaks the measurement of the kernel in SEV measured boot).
>>> A similar fix will be needed there (but I fear this patch cannot be
>>> applied as-is).
>>
>> So it's not a regression, is it?
> 
> SEV kernel hash comparison succeeded with Qemu v7.1.0, but fails with
> v7.2.0, so I think that is a regression.
> 

I see the same behaviour.


Also this was observed by the Confidential Containers project, which
uses kata-containers with QEMU to start SEV guest VMs; they downgraded
[1] from 7.2.0 to 7.1.0 until the issue is solved.

[1] https://github.com/kata-containers/kata-containers/pull/6191


They said they can backport a patch once it's upstream in qemu, but
since the RNG-seed code has changed a lot since 7.2.0, the patch that
we'll add in master will not be applicable as-is to 7.2.0.

I'm not sure if there's intention to release a 7.2.1 or who decides
about this.

-Dov

