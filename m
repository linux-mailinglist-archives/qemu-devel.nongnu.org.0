Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F3048C644
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:43:18 +0100 (CET)
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eqL-0000Xn-EE
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:43:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7dxp-0001Im-Il
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:46:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7dxn-0000nt-NB
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641995215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GKm7MaxTBQiqoe0HcemIMWfMCauBneTtxwD3mV/3aQc=;
 b=GIHAZDak98zzl5gs9JyM9U2sHS6+EpyxyHM89JaygS3zuzLgllXTJPHyBijMgoHI++nOZz
 O0f0yMPmbiQTtH6waFTU5b7pOlEPTN9p5PYDXIb4VOprf5CnEQMZDMnWGNSeut7ARhAQWY
 FJVfElUnWgz9IujLiRFKxoSCJiRA/aA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-4q_OrjvYN6KNcf5lm02Ogw-1; Wed, 12 Jan 2022 08:46:52 -0500
X-MC-Unique: 4q_OrjvYN6KNcf5lm02Ogw-1
Received: by mail-qk1-f199.google.com with SMTP id
 u17-20020a05620a431100b004765c0dc33cso1776372qko.14
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GKm7MaxTBQiqoe0HcemIMWfMCauBneTtxwD3mV/3aQc=;
 b=621R+0lNwAHmzejPMz+Ea+XJvGBLp6tQmPhItdmlibkdb+E197QBArESTdYlvaxDDa
 hoybMVch/oHNwECafWiuyQE1hSZMYcqvXa+1Kilin0w6LFC6FumrGPdRQ4KfVuynubiD
 6FMgeGbrmWfjPmXWXkRYDyZESnQI707U1763J53GyL+bPhgTvBeTMXQyh2IbVvBK5tBO
 92gIYJYE3X5NrO1dexgPpGlD6PGzHMBPG8wqV0FR0qj3jIrNvoSN+RwIf0KTJdhW3XYx
 fA765AvIglSUeoZTLNiZwM2+eu6kuWghExE8HfoWXP2w9av3l6Cvp0gsrkbycnx2bsYY
 w7lA==
X-Gm-Message-State: AOAM530pcw9dsFc06HQbRJq0DROKZozuefF8fzmTMdqdTu5NM5rmdoKU
 MP8XMcTK7rYpCj8w5U3LZLlPFAmtcvvipskvVoDZiHKQ8hQpURAHQRWK63trd6qYkgKVgCuLDEe
 tH/rBUgj9BXtjNyk=
X-Received: by 2002:a37:e105:: with SMTP id c5mr6296197qkm.777.1641995211617; 
 Wed, 12 Jan 2022 05:46:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/z0qeB0qwIhs0OWFWiOCVM9znt8ty0Jk2XucBUd4oqsIwlq5KUGNoaBMBPmY2BT4NB/GbAw==
X-Received: by 2002:a37:e105:: with SMTP id c5mr6296180qkm.777.1641995211360; 
 Wed, 12 Jan 2022 05:46:51 -0800 (PST)
Received: from localhost ([2804:18:8ca:405a:c209:ac99:1eeb:4fa6])
 by smtp.gmail.com with ESMTPSA id l17sm8436130qkj.85.2022.01.12.05.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 05:46:50 -0800 (PST)
Date: Wed, 12 Jan 2022 10:46:48 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 16/31] python: move qmp-shell under the AQMP package
Message-ID: <20220112134648.r7edb7lkitqkybud@laptop.redhat>
References: <20220110232910.1923864-1-jsnow@redhat.com>
 <20220110232910.1923864-17-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110232910.1923864-17-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wainer Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 06:28:55PM -0500, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
> ---
>  python/README.rst                      | 2 +-
>  python/qemu/{qmp => aqmp}/qmp_shell.py | 0
>  python/setup.cfg                       | 2 +-
>  scripts/qmp/qmp-shell                  | 2 +-
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename python/qemu/{qmp => aqmp}/qmp_shell.py (100%)
> 
> diff --git a/python/README.rst b/python/README.rst
> index 9c1fceaee7..fcf74f69ea 100644
> --- a/python/README.rst
> +++ b/python/README.rst
> @@ -59,7 +59,7 @@ Package installation also normally provides executable console scripts,
>  so that tools like ``qmp-shell`` are always available via $PATH. To
>  invoke them without installation, you can invoke e.g.:
>  
> -``> PYTHONPATH=~/src/qemu/python python3 -m qemu.qmp.qmp_shell``
> +``> PYTHONPATH=~/src/qemu/python python3 -m qemu.aqmp.qmp_shell``
>  
>  The mappings between console script name and python module path can be
>  found in ``setup.cfg``.
> diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
> similarity index 100%
> rename from python/qemu/qmp/qmp_shell.py
> rename to python/qemu/aqmp/qmp_shell.py
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 78421411d2..168a79c867 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -67,7 +67,7 @@ console_scripts =
>      qom-tree = qemu.utils.qom:QOMTree.entry_point
>      qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
>      qemu-ga-client = qemu.utils.qemu_ga_client:main
> -    qmp-shell = qemu.qmp.qmp_shell:main
> +    qmp-shell = qemu.aqmp.qmp_shell:main
>      aqmp-tui = qemu.aqmp.aqmp_tui:main [tui]
>  
>  [flake8]
> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
> index 4a20f97db7..31b19d73e2 100755
> --- a/scripts/qmp/qmp-shell
> +++ b/scripts/qmp/qmp-shell
> @@ -4,7 +4,7 @@ import os
>  import sys
>  
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -from qemu.qmp import qmp_shell
> +from qemu.aqmp import qmp_shell
>  
>  
>  if __name__ == '__main__':
> -- 
> 2.31.1

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


