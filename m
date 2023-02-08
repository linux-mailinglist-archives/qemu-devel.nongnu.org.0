Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7068EDDC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 12:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPiYc-0000j6-4h; Wed, 08 Feb 2023 06:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPiYY-0000iu-R5
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:24:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPiYW-0001Qu-Fu
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:24:06 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318BL3NO025403; Wed, 8 Feb 2023 11:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wZBmu+30OZVcw8mq9TqwFjP4+Eq/ObEn49xtFgNlOmg=;
 b=bbXTaYmuLyA4U0sHQ1yr5VykpCiZXRuvur+UOPKiwfNo3iKDlKyib58UapMtOzSCgSEf
 z33T2ym204t0vTZAEzmFCPg9DHb/YpgrZBjjNIEzhD48D5tq8JiBk8L+VtJXY0dTf+pV
 eyytWlTzgn4ke9kNRRhJ6fb2ZO0Vo0iQ6Azdi0GHleTfsVeUi5XEsVGN8jxxAGlsk4uS
 X8kumpepW8i7rREYIFVVijMUpCnoa6VC2yNKGDHlnAiFTj8t2DKU/4ix8syw7DbULTr3
 ccGB9SxUuHonHNy97xMEopZmRCM/6D8EU3PAEhobaB3lWzwmHgevcELfCBYYA7B7WjiF 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmasfr1tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 11:23:55 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318BMJY8027981;
 Wed, 8 Feb 2023 11:23:55 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmasfr1sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 11:23:55 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31885PG3001056;
 Wed, 8 Feb 2023 11:23:54 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3nhf07d3gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 11:23:54 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 318BNqhs65864126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Feb 2023 11:23:53 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB8935804E;
 Wed,  8 Feb 2023 11:23:52 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5CDA5805A;
 Wed,  8 Feb 2023 11:23:49 +0000 (GMT)
Received: from [9.160.93.69] (unknown [9.160.93.69])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  8 Feb 2023 11:23:49 +0000 (GMT)
Message-ID: <0f824626-cc06-c497-b9e4-6ee75986f52a@linux.ibm.com>
Date: Wed, 8 Feb 2023 13:23:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Tom Lendacky <thomas.lendacky@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org> <Y+LOFgCuC9wjKpsL@zx2c4.com>
 <20230207173008-mutt-send-email-mst@kernel.org>
 <CAHmME9pUe48qQRDwhWSK5ba=3Jj-qNYS8ZV9ZFEZeTi=MvEm6w@mail.gmail.com>
 <20230208041042-mutt-send-email-mst@kernel.org>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <20230208041042-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D8V4xwVb_KQ70z5_fuCe3euZBPKmwIjX
X-Proofpoint-ORIG-GUID: lCTgzGGdIT45B6Rpl0yxap0zRj1wWtKe
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_04,2023-02-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080100
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Hi Michael,

On 08/02/2023 11:11, Michael S. Tsirkin wrote:
> On Tue, Feb 07, 2023 at 07:33:09PM -0300, Jason A. Donenfeld wrote:
>> On Tue, Feb 7, 2023 at 7:31 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>
>>> On Tue, Feb 07, 2023 at 07:17:58PM -0300, Jason A. Donenfeld wrote:
>>>> On Tue, Feb 07, 2023 at 04:45:19PM -0500, Michael S. Tsirkin wrote:
>>>>> On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
>>>>>> Recent feature to supply RNG seed to the guest kernel modifies the
>>>>>> kernel command-line by adding extra data at its end; this breaks
>>>>>> measured boot with SEV and OVMF, and possibly signed boot.
>>>>>>
>>>>>> Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
>>>>>> which has its own way of getting random seed (not to mention that
>>>>>> getting the random seed from the untrusted host breaks the confidential
>>>>>> computing trust model).
>>>>>
>>>>> Nope - getting a random seed from an untrusted source should not break
>>>>> anything assuming you also have some other randomness source.
>>>>> If you don't then you have other problems.
>>>>>
>>>>>> Disable the RNG seed feature in SEV guests.
>>>>>>
>>>>>> Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
>>>>>> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
>>>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> There might be a need for a wider change to the ways setup_data entries
>>>>>> are handled in x86_load_linux(); here I just try to restore the
>>>>>> situation for SEV guests prior to the addition of the SETUP_RNG_SEED
>>>>>> entry.
>>>>>>
>>>>>> Recent discussions on other (safer?) ways to pass this setup_data entry:
>>>>>> [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
>>>>>>
>>>>>> Note that in qemu 7.2.0 this is broken as well -- there the
>>>>>> SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
>>>>>> modifies and breaks the measurement of the kernel in SEV measured boot).
>>>>>> A similar fix will be needed there (but I fear this patch cannot be
>>>>>> applied as-is).
>>>>>
>>>>> So it's not a regression, is it?
>>>>
>>>> I think that note is actually wrong. There prior was the sev_enabled()
>>>> check elsewhere, which should have worked. I remember we originally had
>>>> that problem with 7.1 and fixed it. So this is a new issue. I'll take
>>>> care of it.
>>>>
>>>>>
>>>>>> ---
>>>>>>  hw/i386/x86.c | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>>>>>> index eaff4227bd..e65a83f8df 100644
>>>>>> --- a/hw/i386/x86.c
>>>>>> +++ b/hw/i386/x86.c
>>>>>> @@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
>>>>>>          load_image_size(dtb_filename, setup_data->data, dtb_size);
>>>>>>      }
>>>>>>
>>>>>> -    if (!legacy_no_rng_seed && protocol >= 0x209) {
>>>>>> +    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
>>>>>>          setup_data_offset = cmdline_size;
>>>>>>          cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
>>>>>>          kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
>>>>>>
>>>>>> base-commit: 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b
>>>>>
>>>>> I am beginning to think we have been hasty here. no rng seed
>>>>> should have been then default and requested with a flag.
>>>>> Then we'd avoid all this heartburn - and SEV might not be the
>>>>> only workload broken.
>>>>> Maybe not too late. Jason - objections?
>>>>
>>>> Yes, highly object. If it's not here by default, it's completely useless
>>>> from my perspective and I'll just stop working on this feature. There's
>>>> no reason we can't make this work. It's turned out to have a lot of
>>>> technical landmines, but that doesn't mean it's infeasible. I'll keep
>>>> hammering away at it.
>>>>
>>>> Anyway, I'll send a v2 of this patch, and also address another thing
>>>> left out of the previous fix.
>>>>
>>>> (And meanwhile, James and hpa@ seem to be having some discussion about
>>>> introducing an even better mechanism; we'll see if that materializes.)
>>>>
>>>> Jason
>>>
>>>
>>> OK I guess ... objections to a reverse flag disabling this?
>>> Will at least allow a work-around for sev and friends ...
>>
>> I think we should generally try to make this work right as-is, without
>> needing to introduce knobs. The SEV stuff seems really simple to fix.
>> I'll have a 2 patch series for you in the next 20 minutes if all goes
>> well.
> 
> Absolutely. A knob can be a fallback though in the likely case
> we missed something else. I'm inclined to
> an on/off/auto knob which can either force it or let qemu
> decide. Objections?
> 

There's already a workaround for SEV: starting QEMU with
'-machine pc-q35-7.1' (instead of '-machine q35').

The pc-q35-7.1 model sets

    pcmc->legacy_no_rng_seed = true;

which prevents the modification of the cmdline (or modification of the
kernel, in 7.2) -- and this allows the SEV kernel hashes to match.

Of course this means that you don't get any other features of 7.2 or
8.0, if you need them.  If we want to allow that, we'll need a special
knob for turning off RNG seed.

-Dov

