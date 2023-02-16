Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F07699273
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:59:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbyb-0006y8-UW; Thu, 16 Feb 2023 05:58:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSbyZ-0006xW-OI
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSbyY-0003sC-7z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:58:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676545133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tLNezMXOvq9+ETclF+omt3Fri1KFGt6glcu6mekpEyw=;
 b=PRV6J6XhFE3aIi6wUsemd85dR/6KZCOn3K4YhpXI4BesB4xa8+l1HXg7aDhTaBcdFD2JVQ
 Vx5zh5XJBwnKI4+xYEqJS1gN3cmpwDPzyesMUQ36nuPch0G5i2/wAsGSpKmSfT8yWaj7ZO
 8heXGcSwgufhQgOwAWfyjTgUtOeLG1w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-hXSctTehN7Ct_0Zf5_aY0w-1; Thu, 16 Feb 2023 05:58:51 -0500
X-MC-Unique: hXSctTehN7Ct_0Zf5_aY0w-1
Received: by mail-qk1-f197.google.com with SMTP id
 c9-20020a05620a11a900b0072a014ecc4aso925080qkk.18
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 02:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tLNezMXOvq9+ETclF+omt3Fri1KFGt6glcu6mekpEyw=;
 b=3xmeVAhBo9j4GqwzMKkkKjauV0SdI6Ioz/2pATExJOkn0CKSlC8EQQhAca7NSJg2bU
 itTX5oHxtzg5KGOBRbgI1xb9DkwvDG9kTAKQjMz7ex77dqXXDfMJ+mLH6PKcFC+YcnUO
 GmXr9mqHlYqh30QQECFiQ20O0mC+b+StrKCKTkFLwwiE9U0DE36GF76T4aceJbomnN8/
 OiMzHJVPwVIpcesRbHuOkG537EDeRvWPFqeut75HtBovxnss+D4l0kioEmxKRTcUlbpC
 9Fq+762j+YvlGVdroDwaVPxAzbBUJLAkXa23eW3FWL/GCGkch571BZCBmSCAg9IWrBxX
 InXA==
X-Gm-Message-State: AO0yUKURVIZd0qBq5AOYgFdh/ldQIkBxEVb1YPWyZqchX7yBuiRJkv5F
 iR4B6/Su0OZxkdxL8kBsefLU4y9Xl5aEkYKVq0gJo25bLA6PHpMtQ+yPlDr+RMBqg5AhaGtfW/Z
 wtx/KTxqkQdM8w8M=
X-Received: by 2002:ad4:5fcc:0:b0:56e:8d51:1013 with SMTP id
 jq12-20020ad45fcc000000b0056e8d511013mr10311156qvb.37.1676545131239; 
 Thu, 16 Feb 2023 02:58:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8BlSJWR7g0ATVi8Uhd+5db45LTB69LKhw8EYqGipo44gg8EOFH20AFqVq8+5JMXoNv+KCjDA==
X-Received: by 2002:ad4:5fcc:0:b0:56e:8d51:1013 with SMTP id
 jq12-20020ad45fcc000000b0056e8d511013mr10311126qvb.37.1676545130941; 
 Thu, 16 Feb 2023 02:58:50 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 t22-20020a05620a0b1600b0073917fae4f8sm978402qkg.25.2023.02.16.02.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 02:58:50 -0800 (PST)
Message-ID: <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com>
Date: Thu, 16 Feb 2023 11:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
In-Reply-To: <87v8k2ycjb.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15/02/2023 20.05, Markus Armbruster wrote:
> The discussion under PATCH 6 makes me think there's a bit of confusion
> about the actual impact of dropping support for Python 3.6.  Possibly
> because it's spelled out in the commit message of PATCH 7.  Let me
> summarize it in one sentence:
> 
>      *** All supported host systems continue to work ***
> 
> Evidence: CI remains green.

The CI remains green since one of the patches disabled the building of the 
docs on CentOS 8. That's not how I'd describe "continue to work", at least 
not in the same extend as before.

> On some supported host systems, different packages need to be installed.
> On CentOS 8, for instance, we need to install Python 3.8.13 or 3.9.16
> instead of 3.6.8.  Let me stress again: same repository, different
> package.  No downsides I can see.
> 
> The *one* exception is Sphinx on CentOS 8.  CentOS 8 does not ship a
> version of Sphinx that works with Python 3.7 or newer.  This series
> proposes to simply stop building the docs there, unless the user
> provides a suitable version of Sphinx (which is easy enough with pip).

I think we've all understood that. The thing that you obviously did not 
understood: This breaks our support statement.
I'm pretty sure that you could also build the whole QEMU suite successfully 
on an ancient CentOS 7 or Ubuntu 18.04 system if you manually install a 
newer version of GCC and some of the required libraries first. But that's 
not how we understand our support statement.

Sure, you can argue that you can use "pip install" to get a newer version of 
Sphinx on RHEL 8 / CentOS 8 to continue building the docs there - but is 
that really that much different from installing a newer version of GCC and 
libraries on an ancient distro that we do not officially support anymore? 
I'd say no. You also have to consider that not every build host has access 
to the internet, maybe some companies only have an internal mirror of the 
distro packages in their intranet (I remember some discussion about such a 
case in the past) - so while you were perfectly fine to build the whole of 
QEMU on a CentOS 8 there before this change, you could now not build parts 
of QEMU anymore there due to the missing possibility to run "pip install" 
without full internet connection.

And sure, you can argue that it's "just" the documentation. But IMHO that's 
still an essential part of the QEMU build, and it used to work before, so it 
feels wrong to cut that now out. And also, if we start with the 
documentation now, what's next? If for example scripts/shaderinclude.py 
stops working with Python 3.6, do we then simply say: "Oh, it's fine, you 
can still build all the other targets that work without this script, just 
not the ones anymore that need it"?

> All the angst about CentOS falling off the end of our "supported build
> platforms" list is not actually warranted by this series :)

Using the term "angst" for the concerns of your fellows here is quite 
cheeky. It's not about "angst", it's about a discussion that our support 
policy might need to be adjusted if we do this step. So instead of writing 
such sentences, I'd rather would like to see you posting a patch for 
docs/about/build-platforms.rst for constructive further discussion instead.

  Thanks,
   Thomas


