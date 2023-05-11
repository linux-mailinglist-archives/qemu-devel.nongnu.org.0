Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2C6FEC0E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 08:58:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px0F1-0007o5-D5; Thu, 11 May 2023 02:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px0Ek-0007nr-QR
 for qemu-devel@nongnu.org; Thu, 11 May 2023 02:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px0Ej-00065g-Di
 for qemu-devel@nongnu.org; Thu, 11 May 2023 02:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683788232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13dtnekb6JSsTqXbWeocc8623/zvvq2thhQTXEDPY20=;
 b=PzdXCc4F0XbmmS0XyGci6gLFFn/lDfS75FLKk78wkODDrfYSFQH0cSLsHyR0bsPHYPC+YC
 IVkv2ydf3jyTY8+Z6kZeHkTqEa7dq2vEDNv+5bueDagoX30YqbkY886xKY31xheJgJlT4J
 j2luJ/GlFYRhz4UrmFDnEGpFjWROufk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-1_nDm8GiMuS4KVFt1CVlaw-1; Thu, 11 May 2023 02:57:10 -0400
X-MC-Unique: 1_nDm8GiMuS4KVFt1CVlaw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-307897bc279so3454439f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 23:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683788229; x=1686380229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=13dtnekb6JSsTqXbWeocc8623/zvvq2thhQTXEDPY20=;
 b=JGoRYmc4CACr4P5J+ABFKqJUCSNLqXMbCmAfJzIkBJ2ZqvEL0KKT4lhrhwNz+GklvS
 iqZH+/NWEWFJjpgxo8JHEAyAmwSnFEkauKRpi0xYJUxcp8y+cmBtJdMVXZS6u9HrN1KI
 6uuZQvgtmUXjZpNRHC4kt23kouEaY/0t/+iE5vjoUKdoJidc4Cfch30UcKTatTR/oxpk
 PJ/VoIttoEDmRah9pVzTM7I6M64tVH6gZAG0643o+PU5uCxIWtMY9RVX9zEnvvFFCmDn
 TWLjIFbMh1vWUYvwXho0Q0Oq/WUkWbiOcbKQnjrYkB23fhrDVDe9bt1wm6ek6oWsVzJ7
 BbIg==
X-Gm-Message-State: AC+VfDwdhrvQMkDeG8txdlFAQ6K/aU6jETldg9iqb7K2opVm1+prwTF2
 JsHZ7DmyojN/KghMrPj+mm6viHcesrXDR2S2OJ9sa4eQ0P1WONozCZwoRsK5/kf1Lz4xm00Sy5B
 FoI3QrDCRTp2SBRg=
X-Received: by 2002:adf:f946:0:b0:306:32fa:6750 with SMTP id
 q6-20020adff946000000b0030632fa6750mr12752980wrr.33.1683788229555; 
 Wed, 10 May 2023 23:57:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6FfKfU0/HuEcyboPeUdwb8wq/MkLShGeKDnpoQv+BsFo9igQEViXR4wWSyY3LybUAPthzZQg==
X-Received: by 2002:adf:f946:0:b0:306:32fa:6750 with SMTP id
 q6-20020adff946000000b0030632fa6750mr12752961wrr.33.1683788229247; 
 Wed, 10 May 2023 23:57:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 i14-20020a5d558e000000b003079f2c2de7sm8097989wrv.112.2023.05.10.23.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 23:57:08 -0700 (PDT)
Message-ID: <3ca1e2ef-5e06-758a-6737-d62c3faad9aa@redhat.com>
Date: Thu, 11 May 2023 08:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 27/27] mkvenv.py: experiment; use distlib to generate
 script entry points
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kyle Evans <kevans@freebsd.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Michael Roth <michael.roth@amd.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
 <20230511035435.734312-28-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230511035435.734312-28-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/11/23 05:54, John Snow wrote:
> This is an experiment: by using pip's internal vendored distlib, we can
> generate script entry points for Windows, Mac and Linux using distlib's
> mechanisms. This is the same mechanism used when running "pip install",
> so it will be consistent with the most common method of package
> installation on all platforms. It also allows us to delete a good bit of
> vendored/borrowed code from inside of mkvenv.py, so there's less to
> maintain and the license might be more straightforward.
> 
> As a downside, if we're not willing to actually add a distlib
> requirement, we have to piggy-back on pip's vendored version, which
> could have downsides if they move our cheese in the future.

I think the downsides are limited since you're trying both the "real" 
distlib and pip's.  Overall I like this, though I haven't made up my 
mind if it should be split and squashed earlier in the series.

Paolo


