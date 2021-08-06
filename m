Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A1E3E2DDC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:40:54 +0200 (CEST)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC1xs-000603-KE
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mC1x3-0005Ew-2A
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:40:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mC1x0-0004Mm-1a
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628264396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a4jl/0w21A5JmjAkdVBuXyRNt7WCrQOLQ3GXBOy3DSw=;
 b=JgYTrbWHiztKPK1LnBb7VGLgvHPfYdjlxRNQtfZKkJeoj3yjYeTMdrD9juSdKtPmMRLw8J
 LEYgINzSgCVDMTNa+anm0/2wNK0+WCWEj4qzlB/GAES7JeTU2IVJVkt4Ep88bzTSULQH+9
 C203tPO4fBxcoFxGzesohGzRNSN28Yw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-ksGVzgrjOfm-mncWR8vdLQ-1; Fri, 06 Aug 2021 11:39:53 -0400
X-MC-Unique: ksGVzgrjOfm-mncWR8vdLQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a9-20020a0560000509b029015485b95d0cso3280960wrf.5
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 08:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a4jl/0w21A5JmjAkdVBuXyRNt7WCrQOLQ3GXBOy3DSw=;
 b=TWdTI8sxxdDLoLvAkZ9KlNBNlp9k2ms8xfTajEKHwVOL7vCoPLNoHY4StTXLYkSESK
 pRNAUggJpyg6SOLcOqlZ/jFbTTpG1RsEBhzKfKbx61adg+0xZEUjHFHy4hTmLJqIkRFx
 LNpc2/G477Uz9rIgzEcGbm27Ctze+MekEqgu+cHb6ZzcoWqLtQ/aYn1K4selFsI9nQFL
 iRmjA6Um6ogMyn0UN7IYn1mDOhyiJe1jpy/jd5k5kL2Yjp2DbHmjoyPQT5kOcxzd9gd8
 pCot7jU/18DhAaJ573e/xCO+q3PZSQEUVt4Zrgnz7DK3kYNav7znyprrVzw/eG5Jrlxb
 sAcg==
X-Gm-Message-State: AOAM5320mRr/lPnX9SZqoZCjhcV4DEuf6XPZ8fdbdIIKlOYNkMzMuUSy
 nOtNYsb1sByOKMBAglGtsFN2k2kdEELyiyCUkEgd43B+wh70d6Seg3rNPGBzVndDoKpg+lZnUIe
 5vSu4+0o/cBCtRF4=
X-Received: by 2002:a5d:424d:: with SMTP id s13mr11505142wrr.356.1628264391945; 
 Fri, 06 Aug 2021 08:39:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoSWf45OSFiq1gNrjvuiemR2zLE6oJw50DoPHOCKC4GIa+7N+HVMpWWgb4RZT5z/CijAOc/Q==
X-Received: by 2002:a5d:424d:: with SMTP id s13mr11505123wrr.356.1628264391740; 
 Fri, 06 Aug 2021 08:39:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j5sm9494482wrs.22.2021.08.06.08.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 08:39:50 -0700 (PDT)
Subject: Re: [PATCH] meson: fix logic for gnutls check
To: Alyssa Ross <hi@alyssa.is>, qemu-devel@nongnu.org
References: <20210806144947.321647-1-hi@alyssa.is>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e3c2433c-eb41-164e-12a3-e7cfc67fd4cd@redhat.com>
Date: Fri, 6 Aug 2021 17:39:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806144947.321647-1-hi@alyssa.is>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/21 16:49, Alyssa Ross wrote:
> The logic before was
> 
> 	if not get_option('gnutls').auto() or have_system
> 
> Which is equivalent to
> 
> 	if get_option('gnutls').enabled() or get_option('gnutls').disabled() or have_system
> 
> This means that the check for gnutls is performed even if gnutls is
> disabled, which means that the build system will insist on having
> libtasn1 if gnutls is found, even if gnutls support is disabled.
> 
> When gnutls is disabled, the check for gnutls shouldn't be performed,
> to ensure that further build system logic (like the check for
> libtasn1) doesn't make decisions based on the presence of gnutls,
> rather than the gnutls option.
> 
> After making this change, I can successfully ./configure --disable-gnutls
> on my system with gnutls installed, but not libtasn1.
> 
> Signed-off-by: Alyssa Ross <hi@alyssa.is>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index af9bbb83db..b3e7ec0e92 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -824,7 +824,7 @@ endif
>   
>   gnutls = not_found
>   gnutls_crypto = not_found
> -if not get_option('gnutls').auto() or have_system
> +if get_option('gnutls').enabled() or (get_option('gnutls').auto() and have_system)
>     # For general TLS support our min gnutls matches
>     # that implied by our platform support matrix
>     #
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Right now I am not planning to send another pull request for -rc3, but 
the patch certainly has to be included.

Thanks,

Paolo


