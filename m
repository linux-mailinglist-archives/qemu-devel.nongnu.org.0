Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1D673E2F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 17:05:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIXPD-0003FA-UQ; Thu, 19 Jan 2023 11:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIXP9-0003E1-5Z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIXP6-00011z-UK
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674144279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZJeOKj81SVz7HyFlV2hokWUai1A0tIbGL1n/jfJwHw=;
 b=ZemqU698BEHJm6n0nyffJKO8r8MpPYf7h0X9o3S/kaxjeI7JkEKvjIsVY75jGG0niGgNaJ
 SvFc/IZLRozOqBEwDI/9rzVv/x406d8/A+5s48ROXManzTZVynPqss7Rcsawz/zJRCmk16
 wzc958yLIlDvL3y0RPfvorgbjV1wRhE=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-2THZBMATMYi9rWJjOBLQ3A-1; Thu, 19 Jan 2023 11:04:38 -0500
X-MC-Unique: 2THZBMATMYi9rWJjOBLQ3A-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-15ecc9b2f9eso1234981fac.6
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 08:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ZJeOKj81SVz7HyFlV2hokWUai1A0tIbGL1n/jfJwHw=;
 b=TtOLIwj1EYgAiAK14MQbS5Ha+VjpOs/E9zFYtaaYJC0lJxUO2gDbJBMVQfpVJU3aK5
 wTRrVyL+Lc4atHQJOeIsKOAhxEqyW7HWyhxEGETU3eWxCWOuxK8n/NNmnO8GWZWxN3pp
 HadVvmsGEfSh3j5eD+/Ar/oY+hRPqJwLQy/Vs+rhj9b+lRLpH6ZhmCrEqT6fzJqHPFmM
 BGhVbs9uMOVgn9PSjqJbAYXJNHJiwtcc82aGOz36NuVB9d/XqbyVZVS13WBZcZDsI8pt
 1019p5bgzz6NkGfWxbYJiIbcXNUSGFYSLddzSYRKTEsfjdanrWSU3zy1KRw09Vzw2EgK
 t1Uw==
X-Gm-Message-State: AFqh2kridjskgEq1o2OQFEASCmvAcXie1ec2RcQvWVJOcypJLxTz4kq4
 8D1MB85j+FGQceT0jVCgz7q+EV3me+fFbxrpOVoMlySCqk4hiHct5E8gGXE2YiPI8Ls+exzy4Jq
 4KGYguNN3/2O5Md4=
X-Received: by 2002:a05:6808:b0a:b0:363:b22:6553 with SMTP id
 s10-20020a0568080b0a00b003630b226553mr5369599oij.14.1674144277376; 
 Thu, 19 Jan 2023 08:04:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuXb5bMUmZ3uPoan0u0UZCL1OFltCh6SFq7DJEUtAJPcw3X8Py5XuTUzkNsZP+bc3uLPwtayA==
X-Received: by 2002:a05:6808:b0a:b0:363:b22:6553 with SMTP id
 s10-20020a0568080b0a00b003630b226553mr5369574oij.14.1674144276957; 
 Thu, 19 Jan 2023 08:04:36 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 de19-20020a05620a371300b006fa16fe93bbsm24318873qkb.15.2023.01.19.08.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:04:35 -0800 (PST)
Message-ID: <a79c2b30-3bdf-56a8-3735-913a29c50c2a@redhat.com>
Date: Thu, 19 Jan 2023 17:04:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230119135512.2040062-1-thuth@redhat.com>
 <5760dc61-4ab1-eec8-4f54-d0bf750c66b7@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] travis.yml: Use the libfdt from the distro instead of the
 submodule
In-Reply-To: <5760dc61-4ab1-eec8-4f54-d0bf750c66b7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19/01/2023 16.03, Philippe Mathieu-Daudé wrote:
> On 19/1/23 14:55, Thomas Huth wrote:
>> No need to compile-test third party submodules over and over again if
>> we can simply use the pre-build library from the distribution instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .travis.yml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/.travis.yml b/.travis.yml
>> index fb3baabca9..e24c99fdb9 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -128,6 +128,7 @@ jobs:
>>             - libbrlapi-dev
>>             - libcacard-dev
>>             - libcap-ng-dev
>> +          - libfdt-dev
>>             - libgcrypt20-dev
>>             - libgnutls28-dev
>>             - libgtk-3-dev
> 
> Could we remove cloning the submodule in the 'enabled' case now?
> See ./configure:
> 
> 1518  case "$fdt" in
> 1519    auto | enabled | internal)
> 1520       # Simpler to always update submodule, even if not needed.
> 1521       git_submodules="${git_submodules} dtc"
> 1522       ;;
> 1523  esac

I think currently "enabled" still means either "internal" or "system" ? ... 
so since we cannot know here yet whether there is a usable libfdt installed 
available or not, we cannot remove this yet.

If we want to avoid the unnecessary git cloning, we have to explicitly use 
--enable-fdt=system ... which would make sense here, indeed. I'll send a v2 
with that added.

  Thomas


