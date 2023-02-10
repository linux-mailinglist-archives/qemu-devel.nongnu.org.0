Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1A691CBE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 11:32:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQQg8-0004Tc-R8; Fri, 10 Feb 2023 05:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQQfu-0004SN-8j
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:30:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQQfr-0005Ik-8L
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:30:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676025034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/bTZ9Nj85HV4IqSU+a1aYHVbNgBRHmxC1pu5vwz6yk=;
 b=TGzfdqvCB9iRn+bERCVpfqECrwyW4RkDgFigViXldaLVhmCKWCHGp86PKGAq0qyGWdVQYE
 nna0iCqe4nMa9U9+8ozna+uFUwao5JEq2wK0XTgThKTWaYBBOt2pT4xFY7xSoioJpzSrQt
 yl9oE44CXK7HRjyJk6u0G3Q6A0FIlGU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-1fk2PgojOZGnl1p0E6jYRg-1; Fri, 10 Feb 2023 05:30:32 -0500
X-MC-Unique: 1fk2PgojOZGnl1p0E6jYRg-1
Received: by mail-ej1-f69.google.com with SMTP id
 wu9-20020a170906eec900b0088e1bbefaeeso3409492ejb.12
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 02:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1/bTZ9Nj85HV4IqSU+a1aYHVbNgBRHmxC1pu5vwz6yk=;
 b=bSGa01A/OS2TrxojcpLQcScAA5KCJF+hoBYWxzvh+NjB7KLYeVQU9WE6ZmUf+IMZ81
 4Gqy/Ux0ZxgYwXU74IbWT++mGEQ7aGuC4qUiTOS5/Xl9PYV+gj8RYCgAV7d9ZL/vk5s+
 qjUcTastu7UTeQEW+OmWl1S7iXU303ZFxAaJM2f7oxlQeorW9ee19v8WDjCeYwRioJwH
 nr6cKCb+G1i5UONSJl79rIss2r+IQb4x08h5bEmNCb0f2jmorWGx6XlHc4xGLYwJI48d
 qWzCcuWeW/MvKBHQXIfr6slRz32mrtCWXIazoiTMbjTgCPGMIoEmHp5iz1wppDGkcakA
 DSwg==
X-Gm-Message-State: AO0yUKWzbzMUQodupu4CCdr4bEAemvKh6dFBg8S2GrHr91v1ybmVw+Bt
 aKZQj7pFH+XcZC2YmFPqXInAaw30/38hGTuWTyH0QU9NnkRPa/A+q4BMT0p+JmeNzxqSsklI3/X
 oD6juIlm0GtlNTAQ=
X-Received: by 2002:a50:d54f:0:b0:49c:fdd2:a47d with SMTP id
 f15-20020a50d54f000000b0049cfdd2a47dmr15850179edj.37.1676025031637; 
 Fri, 10 Feb 2023 02:30:31 -0800 (PST)
X-Google-Smtp-Source: AK7set8LAPjSyNTqO2LRl8beO4QNcGqY4os/YsZlGPpjPJGFyvEUMPqzWbV8mFLiL/f+jKUKeDypvg==
X-Received: by 2002:a50:d54f:0:b0:49c:fdd2:a47d with SMTP id
 f15-20020a50d54f000000b0049cfdd2a47dmr15850164edj.37.1676025031430; 
 Fri, 10 Feb 2023 02:30:31 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 z64-20020a509e46000000b004a21c620266sm2001332ede.83.2023.02.10.02.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 02:30:30 -0800 (PST)
Message-ID: <86b31d9a-88f1-05db-3f4a-be7cc0762047@redhat.com>
Date: Fri, 10 Feb 2023 11:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 6/7] CI: Stop building docs on centos8
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Daniel Berrange
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-7-jsnow@redhat.com>
 <CABgObfZ3taU=6=JB4MGeLfDsg6MhkLSUuYNH9unO0UjMSF4ciA@mail.gmail.com>
 <CAFn=p-b=RiZvOHOVYMByn1-awhO_cniSW4LVZ+h+fDMWHH7Crw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-b=RiZvOHOVYMByn1-awhO_cniSW4LVZ+h+fDMWHH7Crw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/10/23 00:32, John Snow wrote:
>> It's possible to teach lcitool to use pip instead to install
>> docutils, sphinx and sphinx-rtd-theme
> 
> I will say that once upon a time, Peter Maydell expressed a
> preference to use the version(s) of sphinx managed by the distro
> instead of swallowing it into the python-managed parts of the
> codebase. It seemed like a reasonable request at the time.

Note that this is not about using pip in a venv set up by e.g. 
configure; simply, lcitool falls back to pip if a package is not 
available as an RPM/DEB/APK, so it's a matter of telling it that the 
python3.8 runtime in CentOS 8 does not have either docutils or sphinx.

In other words, since lcitool takes care of building the container 
dockerfile, this "pip install" would be done in the container phase and 
configure in general cannot care less whether sphinx comes from an RPM 
or a "pip install".

Paolo

> We can
> revisit it once I get the patches in to add a venv at configure time.
> (Which I was intending to visit next.)


