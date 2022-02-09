Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5E4AF28E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 14:21:40 +0100 (CET)
Received: from localhost ([::1]:33004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHmuh-0000F5-2o
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 08:21:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nHmSP-0003Be-0s
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:52:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nHmSB-00020T-HE
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644411070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4y+LaeBEOf4ypukL5Fx/VzaxbxsptN4V1G5zScusAsM=;
 b=MhRa1pK4OgIQMyh0dvBSXgDCmmsszJ3xrExXFll4WXdfJkK4K/p8d8iNmdtgHd/4NkHJJ+
 /OkDOtMR7TcgnF6Gg1rx4ANw8H0aBPBzUQf6lUquLMmTlnCohdjKl4MD1ThnWwDClchhzI
 ur2V37omIrM6qMbBlThuZmusNCKK/vY=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-NeakoE1MNYWko7IASyYzRw-1; Wed, 09 Feb 2022 07:51:05 -0500
X-MC-Unique: NeakoE1MNYWko7IASyYzRw-1
Received: by mail-oo1-f70.google.com with SMTP id
 b26-20020a4ac29a000000b002dac1c5b232so1464824ooq.2
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 04:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4y+LaeBEOf4ypukL5Fx/VzaxbxsptN4V1G5zScusAsM=;
 b=VqmkHwLCAu1Uqafo/gnqvrMq2HK8u8IFy6jBXwJY0Pa/5F31XNBHhoOvj808GGljKj
 LAnqmjBzrzxO6NqEC9KNY7vN0n5sl6+4jSUyo+IWIEl9Jp1bbFliXt5riGoSmXw2Hs8J
 qYvGWpd7nfNBGmdeRbccNMB/7xFjAIty3whRPt3R0E/kWutMf91N7iGOLoejavA+pPpB
 m15is6rCvmj088MlYobOFLXUI7JoZIdJt61jURJfPcgd5Vcg8B7kXJ8PEt14Ndv6ABJq
 kePmNdlip1XDtxnYvyCcOhEevbEgqpQxlm0S6IsIGtunLuscOkY7eaCwZ3kap9LlCCXn
 6UIg==
X-Gm-Message-State: AOAM531SyQtCmPmmD7FtdNy3SJYAY25h9KNe81nxdhsMgRk6PqL0Qkdw
 Vl2rq56SPQBNCuNXJjGV93DdPM/tcJrFfuN7JTS7+qU7gRom75CTQePgpBoY1rjaGQcLTlwIR4K
 pbmPGa8Kd1+TAOZk=
X-Received: by 2002:a05:6808:1a1a:: with SMTP id
 bk26mr1233706oib.283.1644411064359; 
 Wed, 09 Feb 2022 04:51:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3z9C/h/sO55TDqFZrTAiA+HENElQzZIQo9jlEFb4ISOFdr4sJp35tIKjEXKwdiQ6yJMf1xA==
X-Received: by 2002:a05:6808:1a1a:: with SMTP id
 bk26mr1233696oib.283.1644411064190; 
 Wed, 09 Feb 2022 04:51:04 -0800 (PST)
Received: from localhost ([191.181.58.94])
 by smtp.gmail.com with ESMTPSA id a15sm6704923oil.13.2022.02.09.04.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 04:51:03 -0800 (PST)
Date: Wed, 9 Feb 2022 09:51:01 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] Python: discourage direct setup.py install
Message-ID: <20220209125101.lgyd3gdmrzugwsoe@laptop.redhat>
References: <20220207213039.2278569-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220207213039.2278569-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 04:30:39PM -0500, John Snow wrote:
> When invoking setup.py directly, the default behavior for 'install' is
> to run the bdist_egg installation hook, which is ... actually deprecated
> by setuptools. It doesn't seem to work quite right anymore.
> 
> By contrast, 'pip install' will invoke the bdist_wheel hook
> instead. This leads to differences in behavior for the two approaches. I
> advocate using pip in the documentation in this directory, but the
> 'setup.py' which has been used for quite a long time in the Python world
> may deceptively appear to work at first glance.

+1 for that. Using setup.py directly is no longer a good practice. All
direct invocations of setup.py are deprecated.

> ---
>  python/setup.py | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/python/setup.py b/python/setup.py
> index 2014f81b75..c5bc45919a 100755
> --- a/python/setup.py
> +++ b/python/setup.py
> @@ -5,9 +5,26 @@
>  """
>  
>  import setuptools
> +from setuptools.command import bdist_egg
> +import sys
>  import pkg_resources
>  
>  
> +class bdist_egg_guard(bdist_egg.bdist_egg):
> +    """
> +    Protect against bdist_egg from being executed
> +
> +    This prevents calling 'setup.py install' directly, as the 'install'
> +    CLI option will invoke the deprecated bdist_egg hook. "pip install"
> +    calls the more modern bdist_wheel hook, which is what we want.
> +    """
> +    def run(self):
> +        sys.exit(
> +            'Installation directly via setup.py is not supported.\n'
> +            'Please use `pip install .` instead.'
> +        )
> +
> +
>  def main():
>      """
>      QEMU tooling installer
> @@ -16,7 +33,7 @@ def main():
>      # https://medium.com/@daveshawley/safely-using-setup-cfg-for-metadata-1babbe54c108
>      pkg_resources.require('setuptools>=39.2')
>  
> -    setuptools.setup()
> +    setuptools.setup(cmdclass={'bdist_egg': bdist_egg_guard})
>  
>  

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


