Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475A247736D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:45:17 +0100 (CET)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxr4N-00075g-Ol
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:45:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxqqx-0000Oj-Bu
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:31:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxqqv-0001yV-0D
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639661480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KNiSUDLHJ2+4xivyRsC/HWjVYtVE9XfCepN9JEA+7Zs=;
 b=bibrzRyRxl3iT851j94ar3xI7LCvM0C7bUBUy1jyViI1sm0nMFa/jTvkBm1GJWxwtJNDwh
 xrw+XZwKPaPD5/CbK3ArcHIxJErb833/bjru9s07NlUxTV3ueR1JJ1Cr3nYzsLIRx4Upiw
 lF/kp877CQOePLNF+qiyAXwgOMmObRE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-ICwQgO94PVaq8hTGcOdM_g-1; Thu, 16 Dec 2021 08:31:19 -0500
X-MC-Unique: ICwQgO94PVaq8hTGcOdM_g-1
Received: by mail-qt1-f197.google.com with SMTP id
 v32-20020a05622a18a000b002b04d0d410dso33504675qtc.11
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KNiSUDLHJ2+4xivyRsC/HWjVYtVE9XfCepN9JEA+7Zs=;
 b=c4McXU1dviD1JsTBtjJOPzuJFtJuX9eQH0NKi4PQst3cdb+whTEwlrrDULjmdS+azA
 j9PNfpR5DvPfm7q1krwKHLkRel7Iso885CmbdJ1aCStm6u4sPR/Ofy7rLD0DjN0+7EbC
 MBYwQlP6E0P2IfOJ5KSz8Ckr4wm85zO7QTsa2pfkt4rGmnX0SZ65JfiZtvfkoQKBZ8mi
 FacmN9nBz8EocuYitXf7iXXsTEZR9lB7jc2rRsnFNkRYxQFvYA0HGq/xnkIh2sncS9S4
 bpsMkc0UdXvJuzM+4+Mpyai5BtTV4Pp+HQbhb41Z4WUeawzFUOmqMcQZK5EjJQ9njWFy
 Wvug==
X-Gm-Message-State: AOAM532kDqJ46N9rO86rFVHBreipWMSwBdOp4N/Y3oPeKrBgRluySKhj
 VpJpSD3tqJDgx+BdpDihUbqv+pDdtRd9nMuVNyfi+5hdUohLz1Au1Y2rhWit3hnocmeQx2dSyAL
 2h7ImK1H6peFo8H0=
X-Received: by 2002:a05:620a:1907:: with SMTP id
 bj7mr12037222qkb.318.1639661478532; 
 Thu, 16 Dec 2021 05:31:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNKrZxvusi575evePPhRQkXsUz9k5DYYyLM92XLEd9evs4/TmTJ+floTodxs++04e+MOtWSw==
X-Received: by 2002:a05:620a:1907:: with SMTP id
 bj7mr12037208qkb.318.1639661478325; 
 Thu, 16 Dec 2021 05:31:18 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id s6sm2711194qki.23.2021.12.16.05.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:31:17 -0800 (PST)
Date: Thu, 16 Dec 2021 10:31:16 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 11/25] python: move qmp-shell under the AQMP package
Message-ID: <20211216133116.ta7irp65lwommxfn@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-12-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-12-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 02:39:25PM -0500, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
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

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


