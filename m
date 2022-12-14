Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A7064C627
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 10:41:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5OET-0003q8-US; Wed, 14 Dec 2022 04:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5OER-0003px-Lu
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 04:39:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5OEP-000724-MC
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 04:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671010755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIc/lOtcKYdU+wWnEHhhixUuEoQIh4732XQj29+3bvM=;
 b=QEfxYpCoGBv6qqc3VScK7g5tIryCQ5tJLEhGwMJBWrRr0a9WWgEwoVDzyGWVppzg2ENwKH
 akpKNRCQCOQh7N3ulaIl4grhMefZu2m5k7Bq0xQq8o3w3oNzyk2MgYKDTy9fxuvvANvj/z
 OIrvQyGjzDhX15zAlWzpiI7bKzK8gfA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-PrzzzRlCOySZMRVLF7wfkw-1; Wed, 14 Dec 2022 04:39:14 -0500
X-MC-Unique: PrzzzRlCOySZMRVLF7wfkw-1
Received: by mail-wm1-f71.google.com with SMTP id
 a6-20020a05600c224600b003d1f3ed49adso3937829wmm.4
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 01:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tIc/lOtcKYdU+wWnEHhhixUuEoQIh4732XQj29+3bvM=;
 b=puWLFlRaOeT3+koXHpN3eZ4HK8KVOHi5QLttszsawUlJSgU9vcEPckHNfiXsD24yKs
 VRoPYG+4VwtBvvpCt0OIM5QFICP8jdX7WmOiKNbqgd8arjLcrg8mhd/xK5JkHZhuWfDk
 CRFumQfZsOF3PhdjB0C1QvVDYoDKt8D8Fbr9EDpR8+NapZYC0tSvSAoiVb2ltcnH2q8Z
 DLbh7rmtw6igNUGzzq9rfowvzlOx+6a9g+umIN4ok0W+MClKN67iln/TYY+viakMcXzP
 YjC4fNsKWjoaEmIxgWEMKI79RSYxgx5rR01tt/1dZl+DUA5GHz4VqYJ0+EzWW+TUOYhL
 NI1g==
X-Gm-Message-State: ANoB5pl8k8Awx3p/agcwyZUtgvqidmA2/0J6fGwlDeWA3VOGu+f9HJKh
 Z+St4OXhx5mLK2odIF//5K+3x/kXZoVk2e7jcnDe5udJUQWv9Aoy75pP0rE3mXlLwaZ4zKYIqHV
 mkRitwh0zUPVLEUA=
X-Received: by 2002:a5d:55c7:0:b0:242:bef:809e with SMTP id
 i7-20020a5d55c7000000b002420bef809emr13699971wrw.1.1671010753026; 
 Wed, 14 Dec 2022 01:39:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4HRiriPL3w/52qljTF84ZOGsmIEDu6hFSFTwkq94xGv8G5yqCWmUBeoiM8lT/2G1OA75bUnA==
X-Received: by 2002:a5d:55c7:0:b0:242:bef:809e with SMTP id
 i7-20020a5d55c7000000b002420bef809emr13699954wrw.1.1671010752829; 
 Wed, 14 Dec 2022 01:39:12 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-56.web.vodafone.de.
 [109.43.178.56]) by smtp.gmail.com with ESMTPSA id
 bq21-20020a5d5a15000000b002258235bda3sm2356875wrb.61.2022.12.14.01.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 01:39:12 -0800 (PST)
Message-ID: <073f7d3e-c7cc-084d-2848-c8a9490e6c69@redhat.com>
Date: Wed, 14 Dec 2022 10:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: "Wang, Wenchao" <wenchao.wang@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <DM6PR11MB4090F9D06DC171C4B9C7D97587E09@DM6PR11MB4090.namprd11.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] target/i386/hax: Add XCR0 support
In-Reply-To: <DM6PR11MB4090F9D06DC171C4B9C7D97587E09@DM6PR11MB4090.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 14/12/2022 10.15, Wang, Wenchao wrote:
> Hi, Thomas,
> 
> As HAXM v7.8.0 is released and it added XCR0 support, it needs this patch to 
> add corresponding support into HAX user space of QEMU. I have pushed this 
> merge request before and Philippe has reviewed it and he thought the change 
> is correct. If no one else raises any other opinion, could you help to merge 
> this patch for HAX? 

  Hi,

sorry, I don't have a stake in the target/i386 code ... but you're listed as 
maintainer for the hax/ folder, so if no other x86 maintainer picks this up, 
I think you could send a pull request for this patch on your own. See:

  https://www.qemu.org/docs/master/devel/submitting-a-pull-request.html

  HTH,
   Thomas


> 
> ---------------------------------
> 
>  From b1789f2523d06798b8883664bfa9a9df797bfccf Mon Sep 17 00:00:00 2001
> 
> From: Wenchao Wang <wenchao.wang@intel.com <mailto:wenchao.wang@intel.com>>
> 
> Date: Fri, 25 Nov 2022 18:37:34 +0800
> 
> Subject: [PATCH] target/i386/hax: Add XCR0 support
> 
> Introduce extended control register XCR0 to support XSAVE feature set.
> 
> Note: This change requires at least HAXM v7.8.0 to support.
> 
> Reviewed-by: Hang Yuan <hang.yuan@intel.com <mailto:hang.yuan@intel.com>>
> 
> Signed-off-by: Wenchao Wang <wenchao.wang@intel.com 
> <mailto:wenchao.wang@intel.com>>
> 
> ---
> 
> target/i386/hax/hax-interface.h | 2 ++
> 
> 1 file changed, 2 insertions(+)
> 
> diff --git a/target/i386/hax/hax-interface.h 
> b/target/i386/hax/hax-interface.h index 537ae084e9..1d13bb2380 100644
> 
> --- a/target/i386/hax/hax-interface.h
> 
> +++ b/target/i386/hax/hax-interface.h
> 
> @@ -201,6 +201,8 @@ struct vcpu_state_t {
> 
>       uint64_t _cr3;
> 
>       uint64_t _cr4;
> 
> +    uint64_t _xcr0;
> 
> +
> 
>       uint64_t _dr0;
> 
>       uint64_t _dr1;
> 
>       uint64_t _dr2;
> 
> --
> 
> 2.17.1
> 


