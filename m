Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C269255B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 19:29:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQY7i-0006Gn-TR; Fri, 10 Feb 2023 13:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQY7g-0006GW-Nz
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 13:27:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQY7e-00058J-Kh
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 13:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676053665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TLd8KOUJkW/i7z0mbaVJSAm1UrgcE6YRM5I3DDHoic=;
 b=jCSODv72qNR4TOV2P1MUeTMSeD1/NnTONgqgCzHVTeRKiBB0QjBpdWG59u3ldoLoRqlWUf
 jmjwaRw53BAutIk1/JYCGDhOCOSR+frR4SfrCCNZlEkqTUAajjMIY7kgvLMZAJpkbBBmcV
 c33Tzo4PZWrZI96eVCrGdySvk4HfrtY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-9_2znNyjP0SHG6QLh_nnUw-1; Fri, 10 Feb 2023 13:27:44 -0500
X-MC-Unique: 9_2znNyjP0SHG6QLh_nnUw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y11-20020a056402440b00b004aae9da824aso4021173eda.18
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 10:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9TLd8KOUJkW/i7z0mbaVJSAm1UrgcE6YRM5I3DDHoic=;
 b=JTAkXHvt/xSR9yJTtT8yk7XmlmKT8QqhNJnGhgKadMWSZPDD2QGgoMvQf//LcIm90O
 +A7gReRX+Lzeqvw/NiCd62ZqlP4P7VQ5fJ6iNxUym2zm49s1IHwUnxbOuydD5rbAZMWq
 qWSMD+4/X79+dRP80URDZLLgeAr25lBY2XziY3hskR81CVHuv/Wt9Th7cRbpGhaEDTl0
 O2OKfqhUjC/7TewkI5Cs6iXHEKIEnDibK3tBYVlEg3upMOJfhZ+OcwtjEuIc8sMovAbK
 hG4pjMtrc9y56FTrNdOwvNlgGu/D9E2/GivK7xyiYpq0/jUrU2JP10XgfdyPPvqU1/am
 JOfg==
X-Gm-Message-State: AO0yUKVmA5EypbIJr1n4KuBRjodGWC29te2yqobOje7PC4gB6FdlRRdo
 5Sqq9jQygSjxMupFJsU7D9pWiFzdC3/gAT0vgKnWPHUG32acYKz9D/3r8Xk/fn+v9gSubsbIpyb
 P/RYhwQ8sQDEsZmU=
X-Received: by 2002:a17:906:5013:b0:883:5b33:e019 with SMTP id
 s19-20020a170906501300b008835b33e019mr15795868ejj.61.1676053663272; 
 Fri, 10 Feb 2023 10:27:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/7L333dI7JhFIOjZg0PH7YdZ4R9C6AB9+HjlOy1k8zBKG10usnkYLMP9rjBC30k9/pv1VGlw==
X-Received: by 2002:a17:906:5013:b0:883:5b33:e019 with SMTP id
 s19-20020a170906501300b008835b33e019mr15795844ejj.61.1676053663061; 
 Fri, 10 Feb 2023 10:27:43 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 x2-20020a170906296200b0084ce5d5d21bsm2690070ejd.22.2023.02.10.10.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 10:27:42 -0800 (PST)
Message-ID: <dc989fbd-14ec-4a62-d227-826c6244dfcb@redhat.com>
Date: Fri, 10 Feb 2023 19:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com>
 <CAFEAcA-Gi_hn7uSGMpgMhwgw-e3yjX8DjUNcqwu2MJFem4P0MQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-Gi_hn7uSGMpgMhwgw-e3yjX8DjUNcqwu2MJFem4P0MQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/10/23 18:15, Peter Maydell wrote:
> Right. All of these things together seem to say:
>   * Python is not an unreasonable thing for the project
>     to depend on
>   * CentOS 8 is not an unreasonable distro for us to
>     want to continue to support
>   * Therefore we should continue to work with the Python
>     that ships with CentOS 8...
> 
> [snip]
> 
>> We don't have to drop python 3.6. It is a choice because
>> of a desire to be able to use some shiny new python
>> features without caring about back compat.
>>
>> Similarly we don't have to use the new meson which drops
>> support for python 3.6, it is again a choice because we
>> want to rely on some new meson features.
>>
>> QEMU could easily carry on supporting python 3.6 until
>> the affected distros drop out ofo our support matrix, but
>> we would have to opt out of using certain new features,
>> or put more effort into back compat.
>>
>> Personally I'm still on the side of carrying on supporting
>> 3.6 per our distro support policy, but if broad consensus
>> is to drop 3.6 I'm not going push back anymore.
> 
> This is really where I'm at as well -- we set our distro
> support policy, and we know that means that sometimes
> we have to deal with continuing to support older versions
> of dependencies even when it might be easier for us if we
> could require newer versions.

There are four possibilities:

* we change the support policy and stop supporting CentOS 8 and SLE 15, 
not a good idea since a lot of people have not migrated to CentOS 9 yet.

* we keep supporting Python 3.6 until CentOS 8 and SLE 15 stop being 
supported.  This means several more years since SLE 16 hasn't even been 
released.

* we support Python 3.6 just for building documentation, i.e. we are 
careful not to use Python 3.7+ features in our Sphinx extensions but are 
free to use them elsewhere.  CentOS 8 users can install sphinx from 
either RPMs (which will use Python 3.6) or pip (which will use Python 3.8).

* we only support Python 3.7+, which means CentOS 8 CI and users have to 
either install Sphinx from pip or disable documentation.

The only difference between the last two is documentation and CI 
configuration.  The code is exactly the same.

> I'm reluctant to say that
> Python gets a special derogation from that policy.

Note that its not the Python runtime but the Python dependencies, for 
which we already install avocado and some Python development tools in a 
virtual environment.  So, the questions are:

* to what extent can we rely on pip packages (preinstalled by the user) 
instead of the distro packages?

* to what extent should QEMU install its own dependencies via pip in a 
virtual environment instead of requiring the user to preinstall them?

Right now the answers for both are "avocado gets an exception for 
tests/, Python development tools such as mypy get an exception for python/".

The Python 3.7+ series (not this one by John) currently adds "sphinx 
gets an exception to the first answer only".

In the future I would like to unify virtual environment generation for 
tests/ and python/ and move it to configure.  If desirable, this would 
make it possible to implement something like "the user need not care 
about Python dependencies, configure can (but need not) install them all 
via pip".  Distros would still package the dependencies, but users would 
have a slightly easier time building QEMU.

Thanks,

Paolo


