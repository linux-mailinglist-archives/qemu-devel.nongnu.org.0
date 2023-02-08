Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D4C68F25E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:50:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmhr-0002lQ-3u; Wed, 08 Feb 2023 10:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPmho-0002kA-D8
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:49:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPmhl-0006OX-TH
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:49:56 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318FQI8I025971; Wed, 8 Feb 2023 15:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+uHosPpoRsi1ZJApuRY5OiKBZZSFiej3ClP16X9l0mM=;
 b=sDUnEdYAupVBj9pfw4qJdyKI3mpQdc2QMcMhjWS+WyrH/g4XP9KovHycIdELCi2oWAGz
 P0YYzhXjDsiMLXldYL9Ai/jULui9eL7m7DHNMk9n+hnkpGjsqwCa36yBalgxMSRI2Ems
 fFY3dOyOk4b853gfiONduohKAFBeQ06uGmg7l9CIcq/VCXu6HJe5D2e2mggCCiUYqlZh
 sPkslUNXs2z/LC54tpTh18eAjll6tjwi0cUhf0uZ2Cmh56UK8kQDD2W2EURxqEfzPYOZ
 vfD75oCVVlZ0pwuE+OEiu1IGgTzr6bB1ykIYnjgcu1ccEQLA8joSOE7wve1QbBdMTUt6 Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmd9p2y6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 15:49:48 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318EDC0S029417;
 Wed, 8 Feb 2023 15:49:47 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmd9p2y6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 15:49:47 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 318EvEaJ003016;
 Wed, 8 Feb 2023 15:49:46 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3nhf07uggh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 15:49:46 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 318Fnj7466978284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Feb 2023 15:49:45 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FC165804E;
 Wed,  8 Feb 2023 15:49:45 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 296CD58056;
 Wed,  8 Feb 2023 15:49:42 +0000 (GMT)
Received: from [9.160.93.69] (unknown [9.160.93.69])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  8 Feb 2023 15:49:41 +0000 (GMT)
Message-ID: <7c4e3018-2f0f-1fd8-45b2-6d72221e9452@linux.ibm.com>
Date: Wed, 8 Feb 2023 17:49:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
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
 <CAHmME9rrqRY0gOVBav4LjMypmu6uicx3vD9kozApyFoytNg84Q@mail.gmail.com>
 <5ac2a4bc-a7a3-49ca-67c7-96df7e152dd7@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <5ac2a4bc-a7a3-49ca-67c7-96df7e152dd7@amd.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8HJ8mfr0ZwvDXq6aefgmw8AfhkLuv0gx
X-Proofpoint-ORIG-GUID: T9xVc8ke7wdyKtew7beN612LeCFlqe1s
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_06,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080138
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146, SPF_HELO_NONE=0.001,
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



On 08/02/2023 17:26, Tom Lendacky wrote:
> On 2/7/23 17:24, Jason A. Donenfeld wrote:
>> Hi Tom,
>>
>> On Tue, Feb 7, 2023 at 8:21 PM Tom Lendacky <thomas.lendacky@amd.com>
>> wrote:
>>>
>>> On 2/7/23 15:45, Michael S. Tsirkin wrote:
>>>> On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
>>>>> Recent feature to supply RNG seed to the guest kernel modifies the
>>>>> kernel command-line by adding extra data at its end; this breaks
>>>>> measured boot with SEV and OVMF, and possibly signed boot.
>>>>>
>>>>> Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
>>>>> which has its own way of getting random seed (not to mention that
>>>>> getting the random seed from the untrusted host breaks the
>>>>> confidential
>>>>> computing trust model).
>>>>
>>>> Nope - getting a random seed from an untrusted source should not break
>>>> anything assuming you also have some other randomness source.
>>>> If you don't then you have other problems.
>>>>
>>>>> Disable the RNG seed feature in SEV guests.
>>>>>
>>>>> Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image
>>>>> clobber setup_data")
>>>>> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
>>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>>>
>>>>> ---
>>>>>
>>>>> There might be a need for a wider change to the ways setup_data
>>>>> entries
>>>>> are handled in x86_load_linux(); here I just try to restore the
>>>>> situation for SEV guests prior to the addition of the SETUP_RNG_SEED
>>>>> entry.
>>>>>
>>>>> Recent discussions on other (safer?) ways to pass this setup_data
>>>>> entry:
>>>>> [1]
>>>>> https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
>>>>>
>>>>> Note that in qemu 7.2.0 this is broken as well -- there the
>>>>> SETUP_RNG_SEED entry is appended to the Linux kernel data (and
>>>>> therefore
>>>>> modifies and breaks the measurement of the kernel in SEV measured
>>>>> boot).
>>>>> A similar fix will be needed there (but I fear this patch cannot be
>>>>> applied as-is).
>>>>
>>>> So it's not a regression, is it?
>>>
>>> SEV kernel hash comparison succeeded with Qemu v7.1.0, but fails with
>>> v7.2.0, so I think that is a regression.
>>
>> Please let me know if this series fixes it:
>> https://lore.kernel.org/all/20230207224847.94429-1-Jason@zx2c4.com/
> 
> I applied this series and it did fix the problem.
> 
> For SEV, there were two problems associated with the RNG seed support:
> 
> - The first is that it becomes part of the SEV LAUNCH measurement and
> therefore makes it impossible for the guest owner to be able to validate
> the measurement because the guest owner won't know the value of the RNG
> seed that was included in the LAUNCH measurement.
> 
> - The second problem is that the RNG is set and measured as part of the
> kernel-hashes support in x86_load_linux(), but it is changed via
> reset_rng_seed() before actually booting the first time. So the
> measurement taken in x86_load_linux() will never be the same when
> measured by, for example, OVMF.
> 
> So the addition of the !sev_enabled() check is definitely appropriate
> for the RNG seed support check for SEV.
> 
> However, is the change to the DTB check appropriate? Does the DTB vary /
> get updated before booting? If the DTB file is "constant" then the above
> two problems that face the RNG seed support shouldn't affect SEV. @Dov,
> does that make sense?
> 

Even if the DTB itself doesn't change and the Guest Owner could somehow add
it to the expected cmdline to calculate the hash, the current implementation
adds both the SetupData entry and the dtb itself to the cmdline.  The SetupData
entry contains pointers which may be harder to predict (even though currently 
I assume that .next=0 and the rest are known, so it should be possible (but ugly)).


But I now think there's another bug with the current patches: 


  /*
   * Add the NUL terminator, some padding for the microvm cmdline fiddling
   * hack, and then align to 16 bytes as a paranoia measure
   */
  cmdline_size = (strlen(machine->kernel_cmdline) + 1 +
                  VIRTIO_CMDLINE_TOTAL_MAX_LEN + 16) & ~15;
  /* Make a copy, since we might append arbitrary bytes to it later. */
  kernel_cmdline = g_strndup(machine->kernel_cmdline, cmdline_size);


This code at the beginning of x86_load_linux() will make the cmdline longer.
So the measurement of the cmdline will change (currently we expect it to be
the exactly value of the '-append' argument with a terminating '\0' byte).
This means that the SHA256 that QEMU and OVMF calculate is not the same as
what the Guest Owner will calculate for a given cmdline.

(this might be another argument for not pushing stuff at the end of the
cmdline and finding other dedicated pieces of memory for DTB / RNG_SEED / etc.).



> In any case, you'll need a version of the patch(es) that can be applied
> to the Qemu v7.2.0 tree to fix the regression.

Indeed.


-Dov


