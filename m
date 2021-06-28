Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91EC3B6988
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 22:13:12 +0200 (CEST)
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxxd1-0001Tf-EM
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 16:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxxc0-0000cc-7v
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxxbx-0001YP-10
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624911123;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gU9lksgDMtRona/Qy2Yd4u+4qDmFPxEETMB6nqXTGkM=;
 b=gKGZgWp2Q9FVq0nLsmo/dOv+mXqcOazH7aLStpEVEqcJirPuj8+JXrKI2yfNsNAmgfPVMN
 33j6zY311xvXDN3WmbXvnseAPo4SVWfQtTpsyN116JzDsaH/4EATScNQr8C/KEzCgIk0A5
 adLmBboqZtvViqSPlCEjPgEzhFwcE+s=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-HdTLXjPvMEqBZqk6Enj5Jg-1; Mon, 28 Jun 2021 16:12:00 -0400
X-MC-Unique: HdTLXjPvMEqBZqk6Enj5Jg-1
Received: by mail-pj1-f72.google.com with SMTP id
 om5-20020a17090b3a85b029016eb0b21f1dso670893pjb.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 13:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=gU9lksgDMtRona/Qy2Yd4u+4qDmFPxEETMB6nqXTGkM=;
 b=DZtWi59ZZbdrCNK6B3xhz7Qozg+1gu7aZtgZYPiPKyvJRlF925uXj7KVRF6iQzKBvA
 4YkerGjuffSgEivRrG724o1vysElSp2EQo63eI4SP2tsOQwx5cfga8oLg2ca0c5bOSpm
 vRKirrw4tL8oqk8vZ0W1N7k2rDxEOzqoeUDlHBEzl6sjKF3MINKHs3qFREFcdumMonZa
 u5MxBXRJaud03d2hx5U/Bbrv0uEOW3aA39U0IrlCl7Ka1G6mKH9Cyr4JGqTviy/H9+ye
 7JNH4uCGMtf+GncAI8Lq6ggiU0KsKEDhw9nYCgs9uF2EMKE1+ZKeNm7oe46dax0yP149
 urjg==
X-Gm-Message-State: AOAM533FtIbDqvhJxE5qOP8wZ8VxWAAO32iyjsvovEyIuztnBuBVbCny
 VA+eyxE/x0BYCylWkQHWsRYArl1BU/0wQHAgO4wnolsnx7DAvXiymtWyTiWhA0+nlMSgHHrkWfb
 BNgemgSpcGtQLaXU=
X-Received: by 2002:a63:5d52:: with SMTP id o18mr24935154pgm.440.1624911119036; 
 Mon, 28 Jun 2021 13:11:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy43KmTI9ywkST2l4C63QSaqKVw38ZIPNgGxS1VLDprBlF6l2yc8BY3iPBXDZDyytFRkVSBcg==
X-Received: by 2002:a63:5d52:: with SMTP id o18mr24935136pgm.440.1624911118703; 
 Mon, 28 Jun 2021 13:11:58 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id 135sm16314012pgf.20.2021.06.28.13.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 13:11:58 -0700 (PDT)
Subject: Re: [PATCH 01/11] python: expose typing information via PEP 561
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-2-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <0550dc79-de0a-f6e4-8e85-38a22a0e19da@redhat.com>
Date: Mon, 28 Jun 2021 17:11:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625154540.783306-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/25/21 12:45 PM, John Snow wrote:
> https://www.python.org/dev/peps/pep-0561/#specification
> Create 'py.typed' files in each subpackage that indicate to mypy that
> this is a typed module, so that users of any of these packages can use
> mypy to check their code as well.
>
> Note: Theoretically it's possible to ditch MANIFEST.in in favor of using
> package_data in setup.cfg, but I genuinely could not figure out how to
> get it to include things from the *source root* into the *package root*;
> only how to include things from each subpackage. I tried!
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine/py.typed | 0
>   python/qemu/qmp/py.typed     | 0
>   python/qemu/utils/py.typed   | 0
>   python/setup.cfg             | 4 ++++
>   4 files changed, 4 insertions(+)
>   create mode 100644 python/qemu/machine/py.typed
>   create mode 100644 python/qemu/qmp/py.typed
>   create mode 100644 python/qemu/utils/py.typed

Just double-checking that you did not add a single py.typed on the root 
"python" dir, so that all modules inherit from it, because this is a 
namespace package. Right?

Anyway,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/python/qemu/machine/py.typed b/python/qemu/machine/py.typed
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/python/qemu/qmp/py.typed b/python/qemu/qmp/py.typed
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/python/qemu/utils/py.typed b/python/qemu/utils/py.typed
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 85cecbb41b..db1639c1f2 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -19,6 +19,7 @@ classifiers =
>       Programming Language :: Python :: 3.8
>       Programming Language :: Python :: 3.9
>       Programming Language :: Python :: 3.10
> +    Typing :: Typed
>   
>   [options]
>   python_requires = >= 3.6
> @@ -27,6 +28,9 @@ packages =
>       qemu.machine
>       qemu.utils
>   
> +[options.package_data]
> +* = py.typed
> +
>   [options.extras_require]
>   # Run `pipenv lock --dev` when changing these requirements.
>   devel =


