Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38B04B9236
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:21:52 +0100 (CET)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQoB-0008BH-Ld
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:21:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKQgM-0002Dv-BN
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:13:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKQgK-00028w-9m
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645042423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8OURdM9mj9zyWgkME6U961SlJ21Hyhl2PfU0DsJjXw=;
 b=BkfgmVrD1EQdNrzwA7fucTcoV5Noe8dF4757okual1ZfLP1KZMstSNhYdWO1T1XY6KpEMu
 O13h7aqvF/6xdzFUadS5jOhvG1TsEC1vURv5KWxyl+qmRj2xlQWwSpKIoa8woENhiSwa8U
 zlGCltokUdCJr8Hfs5ZIeByxPAcIif8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-9cLQ4ZVZMbifenNnShspdQ-1; Wed, 16 Feb 2022 15:13:42 -0500
X-MC-Unique: 9cLQ4ZVZMbifenNnShspdQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 a8-20020a7bc1c8000000b0037bc4c62e97so846545wmj.0
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 12:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q8OURdM9mj9zyWgkME6U961SlJ21Hyhl2PfU0DsJjXw=;
 b=xpVsKbJzjljuV0wUNisalChAERf4BzCQTLSggmaCtMCqxYNpBPX32I/9mRjnj75Q4T
 M5DLYsqWqmiPpChlQ81YArecLYjOV+621MxDAWYXdCpojxHpwi7HQOqQjvW3GRa865q5
 XDjOa9VLRlkDl10NzvS33Dyqp5UvEJh+UgDF2gT0JeJHh0QX2HP/mZ1gU31mCrXNC6ki
 NrzvPNjpuWTTGNt2u4FiMNFbcixXywh4gikIkQg4U6J2wTi4RqC+uc5bo+7MvMDGQmCN
 uTtBv2MuqiEyAXqWsTNuDHsSwD/gDu+uCjPMxJPs8y/YpNqwzsSqvw5VrsueX7K5GBAM
 F1CQ==
X-Gm-Message-State: AOAM533Ug3+J64az6kxzNnuPr+X3gciqqSliUt/GS3EFilqPo+7/cd1U
 9+1H+T/ka2NQpa2BUOPK839ZRuvnSr2rNXdfjPAjZhcL+p/nOj6imjw5wFLSJxDHFXN8noK97pk
 rTdcao4QZQXp1De8=
X-Received: by 2002:a5d:452a:0:b0:1e2:eb44:8803 with SMTP id
 j10-20020a5d452a000000b001e2eb448803mr3618594wra.29.1645042421342; 
 Wed, 16 Feb 2022 12:13:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/Vj39Skp4LI48ULrCaVVGsw+DAhkLsZfS6eyGkFm2pUgkPFHYT9use+/+tJ9Js5w2Oz7clQ==
X-Received: by 2002:a5d:452a:0:b0:1e2:eb44:8803 with SMTP id
 j10-20020a5d452a000000b001e2eb448803mr3618586wra.29.1645042421141; 
 Wed, 16 Feb 2022 12:13:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id z10sm18329706wmi.31.2022.02.16.12.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 12:13:40 -0800 (PST)
Message-ID: <12b765a8-f443-19de-0ddb-95182debcf3c@redhat.com>
Date: Wed, 16 Feb 2022 21:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 3/3] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220216200355.128731-1-dmiller423@gmail.com>
 <20220216200355.128731-4-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220216200355.128731-4-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 21:03, David Miller wrote:
> tests/tcg/s390x/mie3-compl.c: [N]*K instructions
> tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
> tests/tcg/s390x/mie3-sel.c:  SELECT instruction
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> ---
>  tests/tcg/s390x/Makefile.target | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 1a7238b4eb..54e67446aa 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -1,12 +1,15 @@
>  S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>  VPATH+=$(S390X_SRC)
> -CFLAGS+=-march=zEC12 -m64
> +CFLAGS+=-march=z15 -m64
>  TESTS+=hello-s390x
>  TESTS+=csst
>  TESTS+=ipm
>  TESTS+=exrl-trt
>  TESTS+=exrl-trtr
>  TESTS+=pack
> +TESTS+=mie3-compl
> +TESTS+=mie3-mvcrl
> +TESTS+=mie3-sel
>  TESTS+=mvo
>  TESTS+=mvc
>  TESTS+=shift

404, tests not found :)

-- 
Thanks,

David / dhildenb


