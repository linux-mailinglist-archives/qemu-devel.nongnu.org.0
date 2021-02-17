Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF8931D49E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 05:33:08 +0100 (CET)
Received: from localhost ([::1]:50862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCEWR-0007vs-0M
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 23:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCEUr-00073H-KD
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:31:29 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCEUp-0001UC-Kv
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:31:29 -0500
Received: by mail-pl1-x62a.google.com with SMTP id ba1so6777437plb.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 20:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N6pj39nxOm/hD9wE5n5G3h5e5SA24fTi52m3/eAVafU=;
 b=rUoOIt7SYjw9jP94xnXyYC2TohweZ4OChkpmR3JCukrrQjYglwCTKDyZLwL13dZdn3
 eFKhKMoQQEukM9mdVDZc/qIS6VzH7hdVjpgzqFTadlio4EHap0Kh+N1+fobzRMCkK9ht
 eMnI/0Fw/+kUVUSAm8yEAj2mdXJXpNWgAUZtqdUWRMMjhAdql4iRlOekrP/xdsUdf2IG
 dnJ/IhNEzRbvS4K2A9avDG2dpbHWeJdM2eVWNy71tar2aBSqsDqz3KdhINfSjNQOhC5V
 ZTCbX+NSG8U+cI0jsfI9z9Bzs7hYlG5gGL7vVRyVm+GA1A+bFs3f2Eii0pfNHL9W88Nj
 GO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N6pj39nxOm/hD9wE5n5G3h5e5SA24fTi52m3/eAVafU=;
 b=m9lp1n7Xyjkgu1YxYActSMZdF0AdRpLxQ4Du1ba1v2r/d0u1FT6hvUF9h30SOmu76q
 lwDwu4kHvKxSDs2y87vciMs1Xmpvtj4KmHVF7TAkzhQPFwbWXgHbPIJQiPMmsgecIfZc
 I3pvVv0KsVwb43koS3FojL4WpYb3dHt6ogCNqbr80IY47jTLpA/M2HC1oRYT7KmrIDW6
 3pgm6sUEVkbzGTIN9fCkyu1oPvfSDuvNNIEkZMx9TTsZSZ1PBCIcOfQm7Qq3NDNZmlpS
 XjRGBcDmxG6FBmjzSswLBa5uhsTskIFPA5ZDwNT2X1X0q88CzFtaHr4LAPcvprDirfeQ
 tF+A==
X-Gm-Message-State: AOAM5311SmPHIPJqLOyMbhV/iY0V5E5DnVa3vhB7kZhR5WNduexKbCF5
 tPuaPJJROTrul+WWt7shdP0nVg==
X-Google-Smtp-Source: ABdhPJxdrLPeeQJNF/RG4lyEFJD4SCbUS4Dn4prmBWpnTJ4YiZoROd03J5fNXVfhhrGD/UL3h7O6kQ==
X-Received: by 2002:a17:90a:f498:: with SMTP id
 bx24mr1452086pjb.40.1613536286139; 
 Tue, 16 Feb 2021 20:31:26 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id s5sm662307pgv.55.2021.02.16.20.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 20:31:25 -0800 (PST)
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
To: Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
References: <20210216110056.1228582-1-thuth@redhat.com>
 <20210216154010.3691880f.pasic@linux.ibm.com>
 <72e9a5b3-dd88-85de-e4a8-88a6a9c45099@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c37f1f1-5538-cd06-55a2-e266cc9a972c@linaro.org>
Date: Tue, 16 Feb 2021 20:31:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <72e9a5b3-dd88-85de-e4a8-88a6a9c45099@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 8:15 AM, Thomas Huth wrote:
> On 16/02/2021 15.40, Halil Pasic wrote:
>> On Tue, 16 Feb 2021 12:00:56 +0100
>> Thomas Huth <thuth@redhat.com> wrote:
>>
>>> According to the virtio specification, a memory barrier should be
>>> used before incrementing the idx field in the "available" ring.
>>> So far, we did not do this in the s390-ccw bios yet, but recently
>>> Peter Maydell saw problems with the s390-ccw bios when running
>>> the qtests on an aarch64 host (the bios panic'ed with the message:
>>> "SCSI cannot report LUNs: response VS RESP=09"), which could
>>> maybe be related to the missing memory barriers. Thus let's add
>>> those barriers now. Since we've only seen the problem on TCG so far,
>>> a "bcr 14,0" should be sufficient here to trigger the tcg_gen_mb()
>>> in the TCG translate code.
>>>
>>> (Note: The virtio spec also talks about using a memory barrier
>>> *after* incrementing the idx field, but if I understood correctly
>>> this is only required when using notification suppression - which
>>> we don't use in the s390-ccw bios here)
>>
>> I suggest to the barrier after incrementing the idx field for two
>> reasons. First: If the device were to see the notification, but
>> not see the incremented idx field, it would effectively loose
>> initiative. That is pretty straight forward, because the
>> notification just says 'check out that queue', and if we don't
>> see the incremented index, miss the buffer that was made available
>> by incrementing idx.
> 
> I was just about to reply that this is certainly not necessary, since
> the DIAGNOSE instruction that we use for the notification hypercall
> should be serializing anyway ... but after looking at the PoP, it
> actually is not marked as a serializing instruction! (while e.g.
> SVC - supervisor call - is explicitly marked as serializing)
> 
> So maybe that's worth a try: Peter, could you please apply this patch
> on top an see whether it makes a difference?
> 
> diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
> --- a/pc-bios/s390-ccw/virtio.c
> +++ b/pc-bios/s390-ccw/virtio.c
> @@ -54,6 +54,7 @@ static long kvm_hypercall(unsigned long nr, unsigned long
> param1,
>      register ulong r_param3 asm("4") = param3;
>      register long retval asm("2");
>  
> +    virtio_mb();
>      asm volatile ("diag 2,4,0x500"
>                    : "=d" (retval)
>                    : "d" (r_nr), "0" (r_param1), "r"(r_param2), "d"(r_param3)

This is patching the wrong thing, IMO.  You're adding barriers to the guest
that I think ought not be architecturally required -- memory accesses on s390x
are strongly ordered, with or without diag/svc/whatever.

With

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1376cdc404..3c5f38be62 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1622,6 +1622,8 @@ static void tcg_out_tlb_read
     TCGType mask_type;
     uint64_t compare_mask;

+    tcg_out_mb(s, TCG_MO_ALL);
+
     mask_type = (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32
                  ? TCG_TYPE_I64 : TCG_TYPE_I32);

which is a gigantic hammer, adding a host barrier before every qemu guest
access, I can no longer provoke a failure (previously visible 1 in 4, now no
failures in 100).

With that as a data point for success, I'm going to try to use host
load-acquire / store-release instructions, and then apply TCG_GUEST_DEFAULT_MO
and see if I can find something that works reasonably.


r~

