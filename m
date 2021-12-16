Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A1B477341
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:36:34 +0100 (CET)
Received: from localhost ([::1]:53854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqvx-0003K3-VL
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:36:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxqhK-0007Np-CI
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:21:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxqhI-0008Rg-L8
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639660884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/GzY8ZQXqYzqjBhsu6pmj6VQA0pIeHk9D4zRzXUj104=;
 b=PH4Gw+umWwuPA6pMmTz9w5aDLQrOuqPV9gZ6QcLqkx9DHVAmh9ZwgYC/V1X0HgFTNxiy44
 YQ0Zs6/EE82sok4r6aL3ggqAM8IPYUqz6pTM6MFn7o19wpXP/QeK1Y9R+qCIN96yeMJq88
 PZRuGT1rGlkNRbdi1Rnrc3hG27CFHVk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-2Qg9ciwmOQ2BDtrY7h7YQg-1; Thu, 16 Dec 2021 08:21:21 -0500
X-MC-Unique: 2Qg9ciwmOQ2BDtrY7h7YQg-1
Received: by mail-qt1-f198.google.com with SMTP id
 h20-20020ac85e14000000b002b2e9555bb1so33616181qtx.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/GzY8ZQXqYzqjBhsu6pmj6VQA0pIeHk9D4zRzXUj104=;
 b=OAKQqjYIHEP+kHcTvOs7mRUB1SrXrQHIwePIRW4Ow3Wu228W/ebQe2OcsL42S9G1MS
 mQmnlfDPrIbU0/oQI0kvo59ooc+RFhkDO3ktdMeVObi6S1NdijlVn/qDth+b9AXKAsXP
 q9k0u57m2GEYepAAZk6UwFm3F7qWlS780QJ1ycjv/WygzQQprT0NBhaip1bg/MfQBzcv
 FzBAjPrkNFH7KpTI0y4qNWDMEWZFBAlGhinRB2VnJP+pgNAw0A9bOa9PGmFCMXRGZrTW
 HzZI04ClM+SRARRDVeD1dylomZ0IuXxcLzhS9g0K+Nj0QILENZhXoyPBT1plJHEGGZoq
 EbTg==
X-Gm-Message-State: AOAM532GYx0452PgxYGHjO+d3oJKLd8xFixRglrcX54eq6iBGdBLUEOZ
 8VIEE1uDPRlzkyy3mf5MK4uidepXUBHmU3uoFUUjJDuNkH4/olXgQ/S7U1+MCnZrAJtn0CBTj1l
 hg2r8qW0A+udX/HQ=
X-Received: by 2002:a05:6214:c47:: with SMTP id
 r7mr15812162qvj.51.1639660880590; 
 Thu, 16 Dec 2021 05:21:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1vMpTKARwWSIwPKOxRFMlscF4sgs4UVkruMYj2UcHzJWuQBRqi/9icGx5/LvKeYoWkNCVAg==
X-Received: by 2002:a05:6214:c47:: with SMTP id
 r7mr15812146qvj.51.1639660880411; 
 Thu, 16 Dec 2021 05:21:20 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id c22sm4133153qtd.76.2021.12.16.05.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:21:20 -0800 (PST)
Date: Thu, 16 Dec 2021 10:21:13 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 07/25] python/qmp: switch qemu-ga-client to AQMP
Message-ID: <20211216132113.33lkasmzkdnu655y@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-8-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-8-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 02:39:21PM -0500, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/qmp/qemu_ga_client.py | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/python/qemu/qmp/qemu_ga_client.py b/python/qemu/qmp/qemu_ga_client.py
> index b3e1d98c9e..15ed430c61 100644
> --- a/python/qemu/qmp/qemu_ga_client.py
> +++ b/python/qemu/qmp/qemu_ga_client.py
> @@ -37,8 +37,8 @@
>  # the COPYING file in the top-level directory.
>  
>  import argparse
> +import asyncio
>  import base64
> -import errno
>  import os
>  import random
>  import sys
> @@ -50,8 +50,8 @@
>      Sequence,
>  )
>  
> -from qemu import qmp
> -from qemu.qmp import SocketAddrT
> +from qemu.aqmp import ConnectError, SocketAddrT
> +from qemu.aqmp.legacy import QEMUMonitorProtocol
>  
>  
>  # This script has not seen many patches or careful attention in quite
> @@ -61,7 +61,7 @@
>  # pylint: disable=missing-docstring
>  
>  
> -class QemuGuestAgent(qmp.QEMUMonitorProtocol):
> +class QemuGuestAgent(QEMUMonitorProtocol):
>      def __getattr__(self, name: str) -> Callable[..., Any]:
>          def wrapper(**kwds: object) -> object:
>              return self.command('guest-' + name.replace('_', '-'), **kwds)
> @@ -149,7 +149,7 @@ def ping(self, timeout: Optional[float]) -> bool:
>          self.qga.settimeout(timeout)
>          try:
>              self.qga.ping()
> -        except TimeoutError:
> +        except asyncio.TimeoutError:
>              return False
>          return True
>  
> @@ -172,7 +172,7 @@ def suspend(self, mode: str) -> None:
>          try:
>              getattr(self.qga, 'suspend' + '_' + mode)()
>              # On error exception will raise
> -        except TimeoutError:
> +        except asyncio.TimeoutError:
>              # On success command will timed out
>              return
>  
> @@ -182,7 +182,7 @@ def shutdown(self, mode: str = 'powerdown') -> None:
>  
>          try:
>              self.qga.shutdown(mode=mode)
> -        except TimeoutError:
> +        except asyncio.TimeoutError:
>              pass
>  
>  
> @@ -277,7 +277,7 @@ def _cmd_reboot(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
>  
>  def send_command(address: str, cmd: str, args: Sequence[str]) -> None:
>      if not os.path.exists(address):
> -        print('%s not found' % address)
> +        print(f"'{address}' not found. (Is QEMU running?)")
>          sys.exit(1)
>  
>      if cmd not in commands:
> @@ -287,10 +287,10 @@ def send_command(address: str, cmd: str, args: Sequence[str]) -> None:
>  
>      try:
>          client = QemuGuestAgentClient(address)
> -    except OSError as err:
> +    except ConnectError as err:
>          print(err)
> -        if err.errno == errno.ECONNREFUSED:
> -            print('Hint: qemu is not running?')
> +        if isinstance(err.exc, ConnectionError):
> +            print('(Is QEMU running?)')
>          sys.exit(1)
>  
>      if cmd == 'fsfreeze' and args[0] == 'freeze':

From the Python PoV, LGTM:

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


