Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720CB2B18FF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:25:31 +0100 (CET)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWGo-0000lL-Hg
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdWAT-0001cp-F3
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:18:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdWAO-0004Ks-Of
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605262728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DSvNypulfzFb4G8OOiDimZwMz83U4fHIKacjt61sjQ=;
 b=AVPCaVPyNNblpHWpbmm1SnTLNala6zz60ze7GyI28kvQQWULKrSwHsrRH9dliu7aEZDimg
 0lgXhCZLDgBdb5lUlB8lWeSMpqjCKeCoTsozwU71oo50zDl1JGpD+re2pdfZyDOOKx2Wtx
 hBGYuA6Y3mMFKMg0o7xeTB5Imklgucc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-S7KUQUMXMeWDiu7Xp-x6Lw-1; Fri, 13 Nov 2020 05:18:46 -0500
X-MC-Unique: S7KUQUMXMeWDiu7Xp-x6Lw-1
Received: by mail-wr1-f70.google.com with SMTP id g5so2175414wrp.5
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 02:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0DSvNypulfzFb4G8OOiDimZwMz83U4fHIKacjt61sjQ=;
 b=m4ecP4pDzCmmnmUcbmxHTQOr41ulVZPtN5LXLJI4k5MBpM3dFcCkAaC4EDczsiJVLO
 24wFa11dfAmAqcglw/DoJr/v8MmEEcsqW7gxuFY8CWABF66B7rC+2O/VqNOVbyEvrd8U
 8eUlgJFeLwf5K6mYPW4G2HAEwWn2Om6LqLZGZB111IiefTbtQ88gDG76MMwT0U2+mbfr
 dVAUa8F929cQcl3SZRM5xFY/c7n77aO1kmSSIOTRecEVH5ABqYp+yynkMqACK3BhfadU
 z+zm/r82vQOFlL8qmOJQ61TLu0m1lIA0z4CkKfDBz5qtMWYKMuaCG83lmCu2MMt7shdj
 EEnA==
X-Gm-Message-State: AOAM5315ydljQaSOeShMbNM/5vCFb8ZHao4rGSVwDyg6DRH1oPjnK//z
 kjxmKzNWs8qNCn9rDo6Vf9iUGqCec3LbXRU3o7GF+zUtaqfCzmehlW0dnhkl16ByF3GV0r4KUpg
 mcvttjEUrSsYm7Ws=
X-Received: by 2002:a5d:474d:: with SMTP id o13mr2647169wrs.178.1605262725358; 
 Fri, 13 Nov 2020 02:18:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4pmH3eu3rw104S45eaaaIECV/iTvIq7bl/eWXnpIrOZt3uRqy5rlpQbhZhD5sU4vnRicUMg==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr2647150wrs.178.1605262725168; 
 Fri, 13 Nov 2020 02:18:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t17sm9592920wmi.3.2020.11.13.02.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 02:18:44 -0800 (PST)
Subject: Re: [PATCH v2] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
To: Bin Meng <bmeng.cn@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1605261378-77971-1-git-send-email-bmeng.cn@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4e7e41c4-ce96-05c7-f2cf-27f926639d49@redhat.com>
Date: Fri, 13 Nov 2020 11:18:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1605261378-77971-1-git-send-email-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/11/20 10:56, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Per the SDM, when returning to outer privilege level, for segment
> registers (ES, FS, GS, and DS) if the check fails, the segment
> selector becomes null, but QEMU clears the base/limit/flags as well
> as nullifying the segment selector, which should be a spec violation.
> 
> Real hardware seems to be compliant with the spec, at least on one
> Coffee Lake board I tested.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - clearing the DESC_P bit in the segment descriptor
> 
>   target/i386/seg_helper.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
> index be88938..d539573 100644
> --- a/target/i386/seg_helper.c
> +++ b/target/i386/seg_helper.c
> @@ -2108,7 +2108,10 @@ static inline void validate_seg(CPUX86State *env, int seg_reg, int cpl)
>       if (!(e2 & DESC_CS_MASK) || !(e2 & DESC_C_MASK)) {
>           /* data or non conforming code segment */
>           if (dpl < cpl) {
> -            cpu_x86_load_seg_cache(env, seg_reg, 0, 0, 0, 0);
> +            cpu_x86_load_seg_cache(env, seg_reg, 0,
> +                                   env->segs[seg_reg].base,
> +                                   env->segs[seg_reg].limit,
> +                                   env->segs[seg_reg].flags & ~DESC_P_MASK);
>           }
>       }
>   }
> 

Queued, thanks.  It would be nicer if the commit message explained how 
the guest can notice the difference.

Paolo


