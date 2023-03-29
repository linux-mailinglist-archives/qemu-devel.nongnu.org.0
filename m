Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85826CD9DD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:03:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVS1-00052e-KY; Wed, 29 Mar 2023 09:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phVRx-0004rH-1O
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phVRs-0006Er-1t
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680094962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvMTEdXU8FiMymY+++krt3LUpfM3qpmtClf0fIB5HQQ=;
 b=ccEJIEhcHS8+3NAMezFLle6YdhV5WoqZSWGOlJJLNAlVXWvqQHEbXw2lHg+Ev5arU2mVj+
 e2ZZq8x7BPdXQh+ol6owpaOJ6H7kaoFcBHomHfe+0Rxyn5Jm+M00mJeg9oVf1OOaJ7X3/K
 52P0mCnbkc2hptukVmEfFnaLLO3ppUg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-DEtzUKXfNhK7JsUJ-6Ushg-1; Wed, 29 Mar 2023 09:02:41 -0400
X-MC-Unique: DEtzUKXfNhK7JsUJ-6Ushg-1
Received: by mail-ed1-f71.google.com with SMTP id
 t14-20020a056402240e00b004fb36e6d670so22147585eda.5
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 06:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680094960; x=1682686960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vvMTEdXU8FiMymY+++krt3LUpfM3qpmtClf0fIB5HQQ=;
 b=UewoUqYL8svcB7VKKA/m1vDt+rlS/GpNLBOOMjJaJl+XU2796WgxUcVy09XdbwFz4F
 1LttGm4OMT2nL3ZBbzx6mk7ZrVXaSdSBLVvYBQOWKOYYv5m6dCu7m6Om87GaApOcmIbS
 i+Y0zUJhdRJ+/ND5KXsaROdlPnJqqMtOhMG2NTB4uaXUJlDfCUNo0USPJFca+zGQoYkb
 +UI9ZUM6M83JR3qlMMAz3Q5OzPAH5WVtDsXVZjoVN3oYhU0/fzU1ZwTcEEyHxdvYprqh
 1mHltzV3zCzuvYxb6e4yATAIXSv08Zz/j+e3RnEBu4WBLAm1ODBaG01Sk3tpaXCoQaym
 iMMg==
X-Gm-Message-State: AAQBX9fj/WFYTFoyH0qEMMlzLs25m8AJC2RSdYyJuQTkFaMsKYyI55lE
 OE+1gCQjcVcP/w1t7W6bcxKuSVdcwCmp63J3kQftT2TladkaY3mytxR9eJXtSDbYwr1ikorqBQI
 3fIi4A4MBUJmtNjI=
X-Received: by 2002:aa7:de92:0:b0:4fe:9374:30cb with SMTP id
 j18-20020aa7de92000000b004fe937430cbmr18034519edv.37.1680094960231; 
 Wed, 29 Mar 2023 06:02:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zc11k8mRKNY3ikXKreU4eCofhlLaxuxIFTQQAINenwvj0o1eslakRI0YcjRJOQ5UX6X0gxJw==
X-Received: by 2002:aa7:de92:0:b0:4fe:9374:30cb with SMTP id
 j18-20020aa7de92000000b004fe937430cbmr18034500edv.37.1680094959942; 
 Wed, 29 Mar 2023 06:02:39 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 x92-20020a50bae5000000b004fa19f5ba99sm17091110ede.79.2023.03.29.06.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 06:02:39 -0700 (PDT)
Message-ID: <44ed710a-f897-2be6-4f07-928ba4cb535e@redhat.com>
Date: Wed, 29 Mar 2023 15:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 0/3] configure: create a python venv and install meson
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20230328211119.2748442-1-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230328211119.2748442-1-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Thanks for posting this!

On 3/28/23 23:11, John Snow wrote:
> This series is in RFC state; some notable things:
> - So far, only meson is included in this setup.
> - There's a ton of debugging prints everywhere. It's extremely chatty right now.
> - Sphinx and qemu.qmp are not yet included in this venv.
>    (qemu.qmp isn't able to be removed from the tree yet.)
> - Testing isn't yet*fully*  switched over.
> - There is no online functionality yet, this series is *100% offline* -
>    it's the harder option, so I tackled it first.
> 
> Some known bugs as of now:
> - venv-in-venv setups are not yet handled.
> - python3.7 setups without setuptools/pip in the host environment may be
>    unable to generate script file shims; a workaround is in development
>    but wasn't ready today. I decided to exclude it.

I don't think that's needed at all---requiring setuptools on those older 
Python versions is good enough and can be mentioned in either an error 
message or the release notes.  But out of curiosity what was the workaround?

I think the steps for the first working version should be:

* fix venv-in-venv using the .pth trick

* undo the meson parts from PATCH 3; make patch 3 create the venv + 
subsume the MKVENV parts of the Makefiles + always set 
explicit_python=yes (so that at this point the in-tree meson is always 
used).

* add a patch that starts rejecting --meson=/path/to/meson and drops 
explicit_python (instead using pyvenv/bin/meson to check whether a 
system meson is usable)

* make Meson use a sphinx-build binary from the virtual environment 
(i.e. pass -Dsphinx_build=$PWD/pyvenv/bin/sphinx-build)

These are the bare minimum needed to drop Python 3.6 support in QEMU 8.1.

Paolo


