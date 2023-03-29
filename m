Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B26CD95E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 14:34:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phUyr-00035E-Oc; Wed, 29 Mar 2023 08:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phUyq-00033n-34
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:32:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phUyo-0007oh-6X
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680093160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lLhUb81GxxJ0zNBAvuMDcrm6Iu+WxURtndtoNIk6aE=;
 b=PX2d781NX+OphC3AK926+8tQymePSgFWMGGOoQgnHlp9kgpS4GvFLJtCbPMCoJJw1B5ai5
 eKmQftBuTo6v3grkcp5+5+hIvhYgUaeIwzTHAwTfloNM2j7Ua7leAXPcEHl/v7SdiHrG+q
 cI7xDd6HCw5TxLgrkHquFSslxmxvpBc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-rjwhPkRUOXi8f0nU_Gjncw-1; Wed, 29 Mar 2023 08:32:38 -0400
X-MC-Unique: rjwhPkRUOXi8f0nU_Gjncw-1
Received: by mail-ed1-f71.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so21988824eda.2
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 05:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680093157; x=1682685157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5lLhUb81GxxJ0zNBAvuMDcrm6Iu+WxURtndtoNIk6aE=;
 b=enRyHavxl7IunvLsmNBiyvkS9NgJcVPN0cRPoN92JPXTTn51mqTULIjvRA0IgSSf3o
 6bIEAxz1omttEAnfcyG/2J5idvKyM/LqcEzDQ7NG5bPGW4DJt+cp2itKKlgPF+W5ihrE
 gxZx9QW322jjfXo/ndr4kRwx3iVyQdhb+WMDZ/SWGKVvOKsuG09sA1cfgxlRmEB/Gw8X
 9ODjFWuWYbVv/HoRB3iVNtLFQ1OMUkza24vF7EiNYDgqzeqHsRJ9OKNKAIFkfYw0V3Sq
 A+DU442wErAP8/86h5dyOB7SF/BFx/jLqh/snSx7BXNXWAkEzPYfIQ3yMPQ99HFVXuNW
 jHKw==
X-Gm-Message-State: AAQBX9cXS6k9dIphv+/lxIJXLiqydpg54nyhf2qmMLhGjZXgI8VuyQ/x
 xxscuva7RfeNq63bByoYLlhOcHHbfW0xBOEiiPmjbAD0JP3y030mYnXfd4DmJ0kr55DDdnDR2Br
 YQ+6NSlWRP7s2EnA=
X-Received: by 2002:aa7:cfd8:0:b0:4fd:1cf1:b7b0 with SMTP id
 r24-20020aa7cfd8000000b004fd1cf1b7b0mr16555790edy.7.1680093157830; 
 Wed, 29 Mar 2023 05:32:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350aoqSP5WrbQCOFXGl+snLD8HGjHeGWxJ1wRv1uRodUWoG+Xli726nZQZN5G7SIxjiP8dvRNyA==
X-Received: by 2002:aa7:cfd8:0:b0:4fd:1cf1:b7b0 with SMTP id
 r24-20020aa7cfd8000000b004fd1cf1b7b0mr16555775edy.7.1680093157576; 
 Wed, 29 Mar 2023 05:32:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 v25-20020a17090606d900b008e22978b98bsm16447444ejb.61.2023.03.29.05.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 05:32:36 -0700 (PDT)
Message-ID: <bad65749-96be-be2d-70ff-98d856459cfb@redhat.com>
Date: Wed, 29 Mar 2023 14:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 3/3] configure: install meson to a python virtual
 environment
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <20230328211119.2748442-4-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230328211119.2748442-4-jsnow@redhat.com>
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

On 3/28/23 23:11, John Snow wrote:
> +        # Is it a problem if we front-load this now and run it again later?

I would just move all the "pip install" bits after configure has called 
out to git-submodule.sh.

> +    # --no-build-isolation was added to pip 10.0.
> +    # --no-use-pep517 was added ... sometime after 18.1?
> +    pip_flags='--no-build-isolation'
> +    if $python -m pip install --help | grep 'no-use-pep517' > /dev/null 2>&1 ; then
> +        pip_flags="${pip_flags} --no-use-pep517"
> +    fi
> +    if ! pip_install $pip_flags "${source_path}/meson" ; then
> +        exit 1
>       fi
>   fi

Hmm, I'm not a huge fan of using this flag to cover (essentially) an 
implementation detail of pip.  I would really keep on using either 
meson.py here, though I appreciate that this patch is effective in 
showing off the venv concept, without getting into downloading packages 
and adding flags to the configure script.

> 
> +# Smoke tests: these shouldn't fail, but I have little faith in esoteric
> +# platforms I've never used to not do something Deep Strange when I am
> +# not looking.
> +if ! test -e "$meson" ; then
> +    error_exit "??? pyvenv/bin/meson not found, somehow ???"
> +fi
> +echo "Meson $($meson --version) found: $meson"
> +if ! version_ge "$($meson --version)" 0.61.5; then
> +    error_exit "??? Meson version is too old ???"
> +fi

I think this can go away in the final version, since the version is 
checked against the project() invocation of meson.build.

Paolo


