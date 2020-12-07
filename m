Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD192D124B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:40:25 +0100 (CET)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGkZ-0004Nj-1I
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmFuN-0006Yv-3w
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:46:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmFuC-00016b-8B
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607345174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyOz5Tc9PqhiNlZWIQPWc0O+She1E1/qQZR6bIJl32A=;
 b=OdGR1+eRT2ixn5viD6dt9HLVUz7sjIQhnmM8BiFgW9SD/bgwOmyJPky8zWxoB6CUJ4ip+P
 FXQUV95rq773T2t2YXl2eBOtli7t+heivkLTGmmaTYyoyOacwHurzLaBhmtfX/G3oHtuDW
 M+2i/rYWNZYayQ7a8IzFuf58b2vWv6M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-Z746MSLtPKu5UnSzG3GIhw-1; Mon, 07 Dec 2020 07:46:12 -0500
X-MC-Unique: Z746MSLtPKu5UnSzG3GIhw-1
Received: by mail-wr1-f70.google.com with SMTP id w17so4758634wrp.11
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 04:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tyOz5Tc9PqhiNlZWIQPWc0O+She1E1/qQZR6bIJl32A=;
 b=AfPAuc9QDrCO7oiyyND5zGEEF6fyihQFcUrEbCEJr0uwq6q6Fey/0EMLEeN4IWEOdg
 OeJyPRPxx91E1UOrfBuY7iBrzEmj+VtqieThzXJbBfvBFntrUrI1/hSgEkarhKRNMijN
 coPzqUhANEl5CaqPV1E/XaLEO0bMRHgi36Sazxfj3htUKYUPwkQXDPR9pHwpOyNIwVET
 MWFVpLkH23aXc/TTLcXzrx+lcns9E4gx4dxpotE7AgvcI0Es+xX3cnQYLI6rrHanPunV
 03EDbEGgNF2Rf2dGNAnEOu5UBZwkHmfSHUrbK84qNJO/yD9I9Pp2n0la3xiqqF3vuQ9F
 8qAw==
X-Gm-Message-State: AOAM530VaqEJRu/sbcKhetBylTi1Gxm5j1ILMEE7n8RNWAPsls4fUeZH
 V01v8IIXOPCz/DAWYSy9Bx16VhU5pfNfS/aBXgD1N01/p2TamkjunTfwTYcPkkbSRwnv7GRb/fZ
 DlhRqcDMh/9yjYoE=
X-Received: by 2002:a1c:9d8b:: with SMTP id
 g133mr18420816wme.189.1607345170872; 
 Mon, 07 Dec 2020 04:46:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxp1cQ0YqyVCzSrPnn6i9/5M4B45ElmdNAkkARQoGv3NPSs4feaDlLXpquqrHa2sqmKk3jUew==
X-Received: by 2002:a1c:9d8b:: with SMTP id
 g133mr18420802wme.189.1607345170698; 
 Mon, 07 Dec 2020 04:46:10 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h20sm13745748wmb.29.2020.12.07.04.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 04:46:10 -0800 (PST)
Subject: Re: [PATCH v2 5/5] gitlab-ci: Add Xen cross-build jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201207112353.3814480-1-philmd@redhat.com>
 <20201207112353.3814480-6-philmd@redhat.com>
 <9bfd1ed4-baa2-ece8-5b96-ec8fc7a8c547@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c335d1f5-e8cb-a9c2-9718-822dc0248fda@redhat.com>
Date: Mon, 7 Dec 2020 13:46:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9bfd1ed4-baa2-ece8-5b96-ec8fc7a8c547@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 12:51 PM, Thomas Huth wrote:
> On 07/12/2020 12.23, Philippe Mathieu-Daudé wrote:
>> Cross-build ARM and X86 targets with only Xen accelerator enabled.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 7a94a66b4b3..31f10f1e145 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -135,3 +135,18 @@ cross-win64-system:
>>    extends: .cross_system_build_job
>>    variables:
>>      IMAGE: fedora-win64-cross
>> +
>> +cross-amd64-xen:
>> +  extends: .cross_accel_build_job
>> +  variables:
>> +    IMAGE: debian-amd64-cross
>> +    ACCEL: xen
>> +    TARGETS: i386-softmmu,x86_64-softmmu
>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>> +
>> +cross-arm64-xen:
>> +  extends: .cross_accel_build_job
>> +  variables:
>> +    IMAGE: debian-arm64-cross
>> +    ACCEL: xen
>> +    TARGETS: aarch64-softmmu
> Could you please simply replace aarch64-softmmu by arm-softmmu in the
> target-list-exclude statement in this file instead of adding a new job for
> arm64? That should have the same results and will spare us one job...

Ah, I now see my mistake, this is not the job I wanted to add,
I probably messed during rebase. I'll respin with the proper
xen-only config.

> 
>  Thanks,
>   Thomas
> 


