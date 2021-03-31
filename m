Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6513502F8
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 17:08:50 +0200 (CEST)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRcSf-0006bD-F5
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 11:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRcQP-0005Is-7M
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:06:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRcQM-0003Pt-3X
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617203182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+7gkFIi1N91FLCYUWSZN++c5zJzTjszVD3mr3Eri16g=;
 b=H6tQeSHtZLAG4ruBWb+NQQTRWuJWdhMFCwDRSKBIPaF0miBqPXjRxEiQqtf3SLJBjIB4mu
 lqxylmHeGP0sLOoo9oWGlGun5izr8x5EXBscab+WzEYz46hsF5IQeR0NEqb+8yRSn0ei1a
 5R044mOpYnHYGB7H+Xuj+v9o2n4PCEI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-J_PqMhsYNAOE5bHVQog7mw-1; Wed, 31 Mar 2021 11:06:20 -0400
X-MC-Unique: J_PqMhsYNAOE5bHVQog7mw-1
Received: by mail-wm1-f70.google.com with SMTP id a17so647597wme.4
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 08:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+7gkFIi1N91FLCYUWSZN++c5zJzTjszVD3mr3Eri16g=;
 b=Xo9ofhs8HMrENJQHx7hSd3UykGCpdGgINnKichl9YP1DSyemXOFcdqYizL/UkBBsxz
 BgU3YC9PrRy4og19bXGQx8tWBW4KW0UUTQLDaPTK8hL1LEercuJwv711aFmXq/c+mHnH
 8tDFH78Bhd/dd5P2EY1QpK0pY4Q/LuAuo/1RXTuqQs8r6Nz+vFf0tCl18CSXCODl1xpS
 ByVGNZoO92n+Z36SWybgEGkW2HgUW8h3a5voFjzXIdAr5+CeFavxMPFCZPHAPRLwaV1m
 HN+cSzJVTwkAJN1rD2LKODVnzd5g9ZbcwXpfBaHPzSgjYGjxqkzqmtFD8qd8+gZXY/+p
 B9iw==
X-Gm-Message-State: AOAM531LGg9jPUtRxluoflAIXKlkSd5AIB7BABB3H2qkaKTKZMAktMFe
 jHBsHd5h4eK7L8Flojbd04jsBmRWGtw55xmwXMUiuTFchBrHXVllQlov22EHpBc8Klb2cBSU5sM
 2GlhJ0iiMfH0lvOE=
X-Received: by 2002:a5d:4281:: with SMTP id k1mr4197935wrq.374.1617203178557; 
 Wed, 31 Mar 2021 08:06:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0c0EekwhWdf8bUSNXbJsN8J8ub0016HUPqtJZhGfGnYNmTmw9OET1chcMO8r7mT0J1+4Fzg==
X-Received: by 2002:a5d:4281:: with SMTP id k1mr4197917wrq.374.1617203178378; 
 Wed, 31 Mar 2021 08:06:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e8sm4490559wme.14.2021.03.31.08.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 08:06:16 -0700 (PDT)
Subject: Re: [PATCH] configure: Do not use default_feature for EXESUF
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <20210331081845.105089-1-mrezanin@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8187ce64-4060-5a3c-8aee-af69f48584c0@redhat.com>
Date: Wed, 31 Mar 2021 17:06:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210331081845.105089-1-mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/21 10:18, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Commit "c87ea11631 configure: add --without-default-features" use
> default_feature to set default values for configure option. This value
> is used for EXESUF too.
> 
> However, EXESUF is not option to be tested, it is just append to any
> binary name so using --without-default-features set EXESUF to "n"o and
> all binaries using it has form <name>no (e.g. qemu-imgno).
> 
> This is not expected behavior as disabling features should not cause
> generating different binary names.
> 
> Reverting back to setting EXESUF to empty value unless needed otherwise.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 535e6a9269..8275df1506 100755
> --- a/configure
> +++ b/configure
> @@ -365,7 +365,7 @@ tcg_interpreter="false"
>   bigendian="no"
>   mingw32="no"
>   gcov="no"
> -EXESUF="$default_feature"
> +EXESUF=""
>   HOST_DSOSUF=".so"
>   modules="no"
>   module_upgrades="no"
> 

Queued, thanks.

Paolo


