Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99098519775
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 08:39:45 +0200 (CEST)
Received: from localhost ([::1]:58148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm8fi-0005J4-Rq
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 02:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nm8Xx-0003Ub-Q0
 for qemu-devel@nongnu.org; Wed, 04 May 2022 02:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nm8Xu-00023Z-9n
 for qemu-devel@nongnu.org; Wed, 04 May 2022 02:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651645889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwKJx/JpnfwJPBe6dS3N4QtVrcvNyKmCdhuD49TDTrI=;
 b=CB47v749j4bsTy1zKMoN2YqdcbgdaxPwMPq41Bqz8AWRbLlZ9w5MkV48dQSUNgKV2VtU/E
 OiGzjWANKo4V4SEtxksaXp6X9jXSr7P4dr3zVxsPEZRQOHjae4rsykAvviFUvl/D92dD4L
 h5N5jMupVA1UXcuME87ZNgriPC2G7Vc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-r7PGE4J-OkWGZP-mZR2G3g-1; Wed, 04 May 2022 02:31:28 -0400
X-MC-Unique: r7PGE4J-OkWGZP-mZR2G3g-1
Received: by mail-wr1-f70.google.com with SMTP id
 m8-20020adfc588000000b0020c4edd8a57so58756wrg.10
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 23:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GwKJx/JpnfwJPBe6dS3N4QtVrcvNyKmCdhuD49TDTrI=;
 b=1AgrNQ+bqmv4ua0aHzaEB0JGhWlC7OCQfn1F4f0IKjDST2vQONalqiHvnPUR1KuJUD
 SqwNStH7VXs9ZNUHnX7IIAFtYaQKPvJikF4cPll5dEm4cotjDZOYTqeR6UFhZprm8R0y
 30lODNl6iPDiw3BbAg9/SSX+jNx91YhSTFWVCPfcpJkdr8qEOSuFpoq9TXEDdAIey/gE
 cNavo7oSI0EVUkpFJRhmWkMKLbALFSr952Sy1NMrGY+6yI1Ng17TEzjjpsv238uVe2vJ
 I3mo/er/FbzhJDWA52Y0gEpHpKcjndBIryEFfoyeMsLuFla7kLVqMKatPYQykGMZIts/
 aHIA==
X-Gm-Message-State: AOAM533LyvFTH6Ub+nprP4njWQfok1iDC/X2XqSDqFZZkgHYutKQZEJC
 638H7cxjHZzJ9PGITYfm/3Hdb7N3bX61SkPKvJ3MmL5WYS882w0AvdgQXipYlhxByWF79zYjAlU
 lmeYPzXvJPVTtbYE=
X-Received: by 2002:a05:600c:3003:b0:393:fbf6:8040 with SMTP id
 j3-20020a05600c300300b00393fbf68040mr6156827wmh.104.1651645886992; 
 Tue, 03 May 2022 23:31:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMHkLPXOZBt/t7bOm4qFTrrifnwRVKjhnfQJItQ2X6Ty8xUmUBI6Hy2XmN1mmspOzl5VlpGA==
X-Received: by 2002:a05:600c:3003:b0:393:fbf6:8040 with SMTP id
 j3-20020a05600c300300b00393fbf68040mr6156801wmh.104.1651645886721; 
 Tue, 03 May 2022 23:31:26 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-177-80.web.vodafone.de.
 [109.43.177.80]) by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c338400b003942a244ec2sm3518308wmp.7.2022.05.03.23.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 23:31:26 -0700 (PDT)
Message-ID: <4c9c3404-59b3-8806-76a6-ead94e7f2581@redhat.com>
Date: Wed, 4 May 2022 08:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [qemu-web PATCH] Add public key for tarball-signing to download
 page
Content-Language: en-US
To: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, stefanha@redhat.com
References: <20220504002129.286001-1-michael.roth@amd.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220504002129.286001-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/05/2022 02.21, Michael Roth wrote:
> We used to have public keys listed on the SecurityProcess page back
> when it was still part of the wiki, but they are no longer available
> there and some users have asked where to obtain them so they can verify
> the tarball signatures.
> 
> That was probably not a great place for them anyway, so address this by
> adding the public signing key directly to the download page.
> 
> Since a compromised tarball has a high likelyhood of coinciding with a
> compromised host (in general at least), also include some information
> so they can verify the correct signing key via stable tree git tags if
> desired.
> 
> Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>   _download/source.html | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/_download/source.html b/_download/source.html
> index 8671f4e..c0a55ac 100644
> --- a/_download/source.html
> +++ b/_download/source.html
> @@ -23,6 +23,7 @@ make
>   </pre>
>   	{% endfor %}
>   
> +	<p>Source tarballs on this site are generated and signed by the package maintainer using the public key <a href="https://keys.openpgp.org/vks/v1/by-fingerprint/CEACC9E15534EBABB82D3FA03353C9CEF108B584">F108B584</a>.

I'd maybe rather use 3353C9CEF108B584 instead of just F108B584 between the 
<a> and </a>, since short key IDs are a no-go nowadays.

Apart from that:

Reviewed-by: Thomas Huth <thuth@redhat.com>


