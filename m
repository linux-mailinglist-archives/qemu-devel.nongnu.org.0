Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB2948C666
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:47:25 +0100 (CET)
Received: from localhost ([::1]:55330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7euK-0005Y5-77
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:47:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7e6D-0004Oi-BI
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:55:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7e68-00022k-4a
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641995731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dn9M3Jxd8jt72+pDKLuZvSziMClwTUtgCRwFRs6KwbY=;
 b=e49OdIScyKgdtge9L2ukoG3/1JEFShFogXPMDeLO9dOmnKdTXWq54fgjGxuJGa7osSSHnA
 jj8c77GSDpQZ6cDwIc0WodtpwWlUrJTh9IrSgFSGNiEeW0KWfVnpIMmLIwUU6Inx1kgu5W
 adcoRV5sG8RCa1+sU0OFnRapSAw2L/k=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-mB4L-kBzMP-eRmvfJ6cY-w-1; Wed, 12 Jan 2022 08:55:28 -0500
X-MC-Unique: mB4L-kBzMP-eRmvfJ6cY-w-1
Received: by mail-qk1-f199.google.com with SMTP id
 i6-20020a05620a144600b00477708052b6so1804755qkl.10
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dn9M3Jxd8jt72+pDKLuZvSziMClwTUtgCRwFRs6KwbY=;
 b=vycyolsPadNnu6FUsG01riqkfEGxHZ7YodigEM02hQ+qjjzHoCax5y0P7i3pt1XzSW
 krL9M/eJaixjTAXM4gmGKBYKzKVxcuA+TdLaFRlsXv7vjykXmVmsj2Oo39aUGksKxs+m
 wiDtvopk9LMLY6MYI77ikjBflWk+oGKBoJRh9AYZ+6yTsHszbsKPGnVNCxPvrJ1LH+93
 fMKRS1nQS8vSo9GRjG/z4A+X9GZm0Ns2kkgMp+KlZ7LWfXnlT9iR2Il9DqxKHnxNNlNK
 QsKe1un1jyLdcIsFJ+b9hnevFYHIoVZd5ceIcBfghlZs9zTSckhOrYEn32zgO8uPSH8c
 XuYw==
X-Gm-Message-State: AOAM530sOgtdYPoN52L1QBWwaVYWDBmKAGCVJ5BcCTNwCqOKF5fjd2Gp
 mfoCBOEJL1fyH+vpgTTq8VbsmhQeyltsgQGuQv3exyiT9z4EfOxEOSDgu8EPlkQ+0lOyz/+KVNi
 q7eHynCh7scZBmxk=
X-Received: by 2002:ac8:5985:: with SMTP id e5mr6345931qte.58.1641995727916;
 Wed, 12 Jan 2022 05:55:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykrCXcmivpnCna0o5Jiko+kt2SAkI2CZ5ZtCl6ksu1jI+KyrTn/B2WiuldWMDwtUKa/uGlaA==
X-Received: by 2002:ac8:5985:: with SMTP id e5mr6345905qte.58.1641995727675;
 Wed, 12 Jan 2022 05:55:27 -0800 (PST)
Received: from localhost ([2804:18:8ca:405a:c209:ac99:1eeb:4fa6])
 by smtp.gmail.com with ESMTPSA id h6sm7636698qko.130.2022.01.12.05.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 05:55:27 -0800 (PST)
Date: Wed, 12 Jan 2022 10:55:24 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 15/31] python: move qmp utilities to python/qemu/utils
Message-ID: <20220112135524.tmckqr4aaalr52jy@laptop.redhat>
References: <20220110232910.1923864-1-jsnow@redhat.com>
 <20220110232910.1923864-16-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110232910.1923864-16-jsnow@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wainer Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 06:28:54PM -0500, John Snow wrote:
> In order to upload a QMP package to PyPI, I want to remove any scripts
> that I am not 100% confident I want to support upstream, beyond our
> castle walls.
> 
> Move most of our QMP utilities into the utils package so we can split
> them out from the PyPI upload.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  python/qemu/{qmp => utils}/qemu_ga_client.py |  0
>  python/qemu/{qmp => utils}/qom.py            |  0
>  python/qemu/{qmp => utils}/qom_common.py     |  0
>  python/qemu/{qmp => utils}/qom_fuse.py       |  0
>  python/setup.cfg                             | 16 ++++++++--------
>  scripts/qmp/qemu-ga-client                   |  2 +-
>  scripts/qmp/qom-fuse                         |  2 +-
>  scripts/qmp/qom-get                          |  2 +-
>  scripts/qmp/qom-list                         |  2 +-
>  scripts/qmp/qom-set                          |  2 +-
>  scripts/qmp/qom-tree                         |  2 +-
>  11 files changed, 14 insertions(+), 14 deletions(-)
>  rename python/qemu/{qmp => utils}/qemu_ga_client.py (100%)
>  rename python/qemu/{qmp => utils}/qom.py (100%)
>  rename python/qemu/{qmp => utils}/qom_common.py (100%)
>  rename python/qemu/{qmp => utils}/qom_fuse.py (100%)
> 
> diff --git a/python/qemu/qmp/qemu_ga_client.py b/python/qemu/utils/qemu_ga_client.py
> similarity index 100%
> rename from python/qemu/qmp/qemu_ga_client.py
> rename to python/qemu/utils/qemu_ga_client.py
> diff --git a/python/qemu/qmp/qom.py b/python/qemu/utils/qom.py
> similarity index 100%
> rename from python/qemu/qmp/qom.py
> rename to python/qemu/utils/qom.py
> diff --git a/python/qemu/qmp/qom_common.py b/python/qemu/utils/qom_common.py
> similarity index 100%
> rename from python/qemu/qmp/qom_common.py
> rename to python/qemu/utils/qom_common.py
> diff --git a/python/qemu/qmp/qom_fuse.py b/python/qemu/utils/qom_fuse.py
> similarity index 100%
> rename from python/qemu/qmp/qom_fuse.py
> rename to python/qemu/utils/qom_fuse.py
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 417e937839..78421411d2 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -60,13 +60,13 @@ tui =
>  
>  [options.entry_points]
>  console_scripts =
> -    qom = qemu.qmp.qom:main
> -    qom-set = qemu.qmp.qom:QOMSet.entry_point
> -    qom-get = qemu.qmp.qom:QOMGet.entry_point
> -    qom-list = qemu.qmp.qom:QOMList.entry_point
> -    qom-tree = qemu.qmp.qom:QOMTree.entry_point
> -    qom-fuse = qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
> -    qemu-ga-client = qemu.qmp.qemu_ga_client:main
> +    qom = qemu.utils.qom:main
> +    qom-set = qemu.utils.qom:QOMSet.entry_point
> +    qom-get = qemu.utils.qom:QOMGet.entry_point
> +    qom-list = qemu.utils.qom:QOMList.entry_point
> +    qom-tree = qemu.utils.qom:QOMTree.entry_point
> +    qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
> +    qemu-ga-client = qemu.utils.qemu_ga_client:main
>      qmp-shell = qemu.qmp.qmp_shell:main
>      aqmp-tui = qemu.aqmp.aqmp_tui:main [tui]
>  
> @@ -80,7 +80,7 @@ python_version = 3.6
>  warn_unused_configs = True
>  namespace_packages = True
>  
> -[mypy-qemu.qmp.qom_fuse]
> +[mypy-qemu.utils.qom_fuse]
>  # fusepy has no type stubs:
>  allow_subclassing_any = True
>  
> diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
> index 102fd2cad9..56edd0234a 100755
> --- a/scripts/qmp/qemu-ga-client
> +++ b/scripts/qmp/qemu-ga-client
> @@ -4,7 +4,7 @@ import os
>  import sys
>  
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -from qemu.qmp import qemu_ga_client
> +from qemu.utils import qemu_ga_client
>  
>  
>  if __name__ == '__main__':
> diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
> index a58c8ef979..d453807b27 100755
> --- a/scripts/qmp/qom-fuse
> +++ b/scripts/qmp/qom-fuse
> @@ -4,7 +4,7 @@ import os
>  import sys
>  
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -from qemu.qmp.qom_fuse import QOMFuse
> +from qemu.utils.qom_fuse import QOMFuse
>  
>  
>  if __name__ == '__main__':
> diff --git a/scripts/qmp/qom-get b/scripts/qmp/qom-get
> index e4f3e0c013..04ebe052e8 100755
> --- a/scripts/qmp/qom-get
> +++ b/scripts/qmp/qom-get
> @@ -4,7 +4,7 @@ import os
>  import sys
>  
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -from qemu.qmp.qom import QOMGet
> +from qemu.utils.qom import QOMGet
>  
>  
>  if __name__ == '__main__':
> diff --git a/scripts/qmp/qom-list b/scripts/qmp/qom-list
> index 7a071a54e1..853b85a8d3 100755
> --- a/scripts/qmp/qom-list
> +++ b/scripts/qmp/qom-list
> @@ -4,7 +4,7 @@ import os
>  import sys
>  
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -from qemu.qmp.qom import QOMList
> +from qemu.utils.qom import QOMList
>  
>  
>  if __name__ == '__main__':
> diff --git a/scripts/qmp/qom-set b/scripts/qmp/qom-set
> index 9ca9e2ba10..06820feec4 100755
> --- a/scripts/qmp/qom-set
> +++ b/scripts/qmp/qom-set
> @@ -4,7 +4,7 @@ import os
>  import sys
>  
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -from qemu.qmp.qom import QOMSet
> +from qemu.utils.qom import QOMSet
>  
>  
>  if __name__ == '__main__':
> diff --git a/scripts/qmp/qom-tree b/scripts/qmp/qom-tree
> index 7d0ccca3a4..760e172277 100755
> --- a/scripts/qmp/qom-tree
> +++ b/scripts/qmp/qom-tree
> @@ -4,7 +4,7 @@ import os
>  import sys
>  
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
> -from qemu.qmp.qom import QOMTree
> +from qemu.utils.qom import QOMTree
>  
>  
>  if __name__ == '__main__':
> -- 
> 2.31.1

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


