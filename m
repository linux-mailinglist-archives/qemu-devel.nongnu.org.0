Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C4648C642
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:42:16 +0100 (CET)
Received: from localhost ([::1]:43452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7epK-0005Z2-HP
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:42:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7eBW-0004px-3t
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:01:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7eBT-0003Th-FX
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641996060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=00Oy25YBBqK0lvNWOrBbZUTwMWkhdMLhcYtNcdg5xto=;
 b=C/cU1C6AXDqbprmvJ1J+OFaicj2dBVZ0I9GzfVNnh9VkNglS/Gv1/AdBOBa/nFdhJvBhch
 Q9YskrOq3VXhNWc/NmiQhgNkqYS02/nxvXE4YTFHmFmFIijB9nESoWbK4zb+fuWsaIwiGa
 /EFTMvct22bn8E5CPghz3JXhdFYr0vQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-IoWe3v90P9iYpwyBrd6uhg-1; Wed, 12 Jan 2022 09:00:59 -0500
X-MC-Unique: IoWe3v90P9iYpwyBrd6uhg-1
Received: by mail-qk1-f198.google.com with SMTP id
 b185-20020a37b2c2000000b004783172e402so1835444qkf.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 06:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=00Oy25YBBqK0lvNWOrBbZUTwMWkhdMLhcYtNcdg5xto=;
 b=rLLYY77vCsCO7oODiuQN6tJB1XGPNYv26wMFhdzb5uFFvReCslmKTAsBLW1m+fncj+
 5zOqPgjtOcEidzUGLd+18zJg0Ewsok1Iv/JLUy6chgAcdvywVzf90ZmmnVFs4aQMQ3yo
 6qtXOvEMXANBYfXh7vvf2/h8Vca71kZd4kuovfAEUiVTDQcqvduuyJ2OUpzx0WNFQ2D1
 jk6Vh1kVkCijJ++CeS4RnfqLTmb7qns9XsuSB972EqW12xdmf5V6xkc5+3XaRazAs4zs
 nPdztO5zF9PJ/poUWIA4QKa5Ny2enZkzOvwNLzFJBWHU4kZ4c4BR20vQux6MDdjQlzzk
 rB4g==
X-Gm-Message-State: AOAM532Ke7R2LC0U9m5WgaZ/mQm0bJmHvcIAgEdm2wN+pFoYpJNrDTMs
 F/KxQ+VU96uE8lfy5iDQ7qCE7FEn1MVj2H6H5R6eQc2dFQKfHkIDqXAmxfBbRisZCV3skqcpZ9+
 Wh4SkTQTAeVpvWOw=
X-Received: by 2002:a05:620a:258e:: with SMTP id
 x14mr6289802qko.578.1641996058757; 
 Wed, 12 Jan 2022 06:00:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5jv9Rrw9PBN0qqKjJ5JSqjEInqfmnotwwvsLCbcOS3fz4FOl6KlaVKfHImqbyRkrkXl4ttA==
X-Received: by 2002:a05:620a:258e:: with SMTP id
 x14mr6289758qko.578.1641996058352; 
 Wed, 12 Jan 2022 06:00:58 -0800 (PST)
Received: from localhost ([2804:18:8ca:405a:c209:ac99:1eeb:4fa6])
 by smtp.gmail.com with ESMTPSA id bl28sm8473637qkb.17.2022.01.12.06.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 06:00:58 -0800 (PST)
Date: Wed, 12 Jan 2022 11:00:55 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 31/31] python: rename 'aqmp-tui' to 'qmp-tui'
Message-ID: <20220112140055.ja65ytv7lkqa7ttk@laptop.redhat>
References: <20220110232910.1923864-1-jsnow@redhat.com>
 <20220110232910.1923864-32-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110232910.1923864-32-jsnow@redhat.com>
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

On Mon, Jan 10, 2022 at 06:29:10PM -0500, John Snow wrote:
> This is the last vestige of the "aqmp" moniker surviving in the tree; remove it.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/qmp/{aqmp_tui.py => qmp_tui.py} | 12 ++++++------
>  python/setup.cfg                            |  6 +++---
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  rename python/qemu/qmp/{aqmp_tui.py => qmp_tui.py} (98%)
> 
> diff --git a/python/qemu/qmp/aqmp_tui.py b/python/qemu/qmp/qmp_tui.py
> similarity index 98%
> rename from python/qemu/qmp/aqmp_tui.py
> rename to python/qemu/qmp/qmp_tui.py
> index 184a3e4690..17dc94e7c3 100644
> --- a/python/qemu/qmp/aqmp_tui.py
> +++ b/python/qemu/qmp/qmp_tui.py
> @@ -6,13 +6,13 @@
>  # This work is licensed under the terms of the GNU GPL, version 2 or
>  # later.  See the COPYING file in the top-level directory.
>  """
> -AQMP TUI
> +QMP TUI
>  
> -AQMP TUI is an asynchronous interface built on top the of the AQMP library.
> +QMP TUI is an asynchronous interface built on top the of the QMP library.
>  It is the successor of QMP-shell and is bought-in as a replacement for it.
>  
> -Example Usage: aqmp-tui <SOCKET | TCP IP:PORT>
> -Full Usage: aqmp-tui --help
> +Example Usage: qmp-tui <SOCKET | TCP IP:PORT>
> +Full Usage: qmp-tui --help
>  """
>  
>  import argparse
> @@ -129,7 +129,7 @@ def has_handler_type(logger: logging.Logger,
>  
>  class App(QMPClient):
>      """
> -    Implements the AQMP TUI.
> +    Implements the QMP TUI.
>  
>      Initializes the widgets and starts the urwid event loop.
>  
> @@ -612,7 +612,7 @@ def main() -> None:
>      Driver of the whole script, parses arguments, initialize the TUI and
>      the logger.
>      """
> -    parser = argparse.ArgumentParser(description='AQMP TUI')
> +    parser = argparse.ArgumentParser(description='QMP TUI')
>      parser.add_argument('qmp_server', help='Address of the QMP server. '
>                          'Format <UNIX socket path | TCP addr:port>')
>      parser.add_argument('--num-retries', type=int, default=10,
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 911ae02de7..4614521dea 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -51,7 +51,7 @@ devel =
>  fuse =
>      fusepy >= 2.0.4
>  
> -# AQMP TUI dependencies
> +# QMP TUI dependencies
>  tui =
>      urwid >= 2.1.2
>      urwid-readline >= 0.13
> @@ -67,7 +67,7 @@ console_scripts =
>      qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
>      qemu-ga-client = qemu.utils.qemu_ga_client:main
>      qmp-shell = qemu.qmp.qmp_shell:main
> -    aqmp-tui = qemu.qmp.aqmp_tui:main [tui]
> +    qmp-tui = qemu.qmp.qmp_tui:main [tui]
>  
>  [flake8]
>  extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
> @@ -83,7 +83,7 @@ namespace_packages = True
>  # fusepy has no type stubs:
>  allow_subclassing_any = True
>  
> -[mypy-qemu.qmp.aqmp_tui]
> +[mypy-qemu.qmp.qmp_tui]
>  # urwid and urwid_readline have no type stubs:
>  allow_subclassing_any = True
>  
> -- 
> 2.31.1
>

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


