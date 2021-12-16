Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9343B477375
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:46:43 +0100 (CET)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxr5m-0008Ez-EO
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:46:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxqmD-0003x2-Nn
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:26:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxqmC-0000rG-2r
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639661187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TeKpHNbdVP/lxgJbt39SeR2rwAgp4p2CCSQuASnq/rw=;
 b=WELk04tBLvKgokmSwr3FA++GRZiuJhp4nGdu7J17+4Fy/izvMq/L90A2lfQ851a2aw0tW0
 bqnG5lwrNucsqJ7PpZfUrY91x8PsodpWXrQd2s0P0AftIH3+1PuWCKw1aOf+Bv9S7vKSJV
 B1rgRDrenmHS89yg6Ry+v917obgKxu4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-dJuEu2G1MeCXk_wu428pow-1; Thu, 16 Dec 2021 08:26:23 -0500
X-MC-Unique: dJuEu2G1MeCXk_wu428pow-1
Received: by mail-qv1-f71.google.com with SMTP id
 kk28-20020a056214509c00b00410d091c34fso4854890qvb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TeKpHNbdVP/lxgJbt39SeR2rwAgp4p2CCSQuASnq/rw=;
 b=ZmFq9d4njkCm4KoRlhIejbk7YiXrt56JMWVknQUGMqbNa0eW6h52POExSbtaCxXPr/
 opmIurldljVAQZMNwZtg4ypNYpEdVK5mqrpghe+54oxIDKPL3cBR3FGoFm11WsK7OvAs
 Z1N3FTrlFMKG82FQr8KhV0zgrG/1dr2NwVttIKsmfZKmVBTYymN8xskVsqO88a8imtW2
 mQpCFmPkKB28fMs9gTd20oYDpdf9c7+av2Z60ABPgpj9FmxumsqILEYV4vT2xv440JQE
 winEsEyjkP86psDVfRwmozUWf/qn7MEfsRwaOAqOFL00ZDJLbyMlevDS5Ss7TYfguzbL
 7csw==
X-Gm-Message-State: AOAM533py1BR8dfNWSrvdraZAJFpi8UQAG1v6j09DitSjCvjgIkPeDHH
 ZyQEBc5UjzyqwG5FVvBpcpmnCwZfT9PTq6wHSjmqaI8UOFoD8ZCKXLZeU2p04lTaoz1BhCrwcHr
 fdsrPQLQiTs8QHxU=
X-Received: by 2002:a05:620a:450b:: with SMTP id
 t11mr12083545qkp.609.1639661183051; 
 Thu, 16 Dec 2021 05:26:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPFxj1rZHiKw1kUdsz5HUSzBsSkLE9KG6AMwkz73eYZdxKI8AsFx7F8cqWlAOy/qOgUc4/vA==
X-Received: by 2002:a05:620a:450b:: with SMTP id
 t11mr12083530qkp.609.1639661182854; 
 Thu, 16 Dec 2021 05:26:22 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id z10sm4318019qtw.71.2021.12.16.05.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:26:22 -0800 (PST)
Date: Thu, 16 Dec 2021 10:26:15 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 08/25] python/qmp: switch qom tools to AQMP
Message-ID: <20211216132615.tsoe4dpx5nhmttrb@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-9-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-9-jsnow@redhat.com>
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

On Wed, Dec 15, 2021 at 02:39:22PM -0500, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/qmp/qom.py        |  5 +++--
>  python/qemu/qmp/qom_common.py |  3 ++-
>  python/qemu/qmp/qom_fuse.py   | 11 ++++++-----
>  3 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py
> index 8ff28a8343..bb5d1a78f5 100644
> --- a/python/qemu/qmp/qom.py
> +++ b/python/qemu/qmp/qom.py
> @@ -32,7 +32,8 @@
>  
>  import argparse
>  
> -from . import QMPResponseError
> +from qemu.aqmp import ExecuteError
> +
>  from .qom_common import QOMCommand
>  
>  
> @@ -233,7 +234,7 @@ def _list_node(self, path: str) -> None:
>                  rsp = self.qmp.command('qom-get', path=path,
>                                         property=item.name)
>                  print(f"  {item.name}: {rsp} ({item.type})")
> -            except QMPResponseError as err:
> +            except ExecuteError as err:
>                  print(f"  {item.name}: <EXCEPTION: {err!s}> ({item.type})")
>          print('')
>          for item in items:
> diff --git a/python/qemu/qmp/qom_common.py b/python/qemu/qmp/qom_common.py
> index a59ae1a2a1..6f07451dfa 100644
> --- a/python/qemu/qmp/qom_common.py
> +++ b/python/qemu/qmp/qom_common.py
> @@ -27,7 +27,8 @@
>      TypeVar,
>  )
>  
> -from . import QEMUMonitorProtocol, QMPError
> +from qemu.aqmp import QMPError
> +from qemu.aqmp.legacy import QEMUMonitorProtocol
>  
>  
>  # The following is needed only for a type alias.
> diff --git a/python/qemu/qmp/qom_fuse.py b/python/qemu/qmp/qom_fuse.py
> index 43f4671fdb..653a76b93b 100644
> --- a/python/qemu/qmp/qom_fuse.py
> +++ b/python/qemu/qmp/qom_fuse.py
> @@ -48,7 +48,8 @@
>  import fuse
>  from fuse import FUSE, FuseOSError, Operations
>  
> -from . import QMPResponseError
> +from qemu.aqmp import ExecuteError
> +
>  from .qom_common import QOMCommand
>  
>  
> @@ -99,7 +100,7 @@ def is_object(self, path: str) -> bool:
>          try:
>              self.qom_list(path)
>              return True
> -        except QMPResponseError:
> +        except ExecuteError:
>              return False
>  
>      def is_property(self, path: str) -> bool:
> @@ -112,7 +113,7 @@ def is_property(self, path: str) -> bool:
>                  if item.name == prop:
>                      return True
>              return False
> -        except QMPResponseError:
> +        except ExecuteError:
>              return False
>  
>      def is_link(self, path: str) -> bool:
> @@ -125,7 +126,7 @@ def is_link(self, path: str) -> bool:
>                  if item.name == prop and item.link:
>                      return True
>              return False
> -        except QMPResponseError:
> +        except ExecuteError:
>              return False
>  
>      def read(self, path: str, size: int, offset: int, fh: IO[bytes]) -> bytes:
> @@ -138,7 +139,7 @@ def read(self, path: str, size: int, offset: int, fh: IO[bytes]) -> bytes:
>          try:
>              data = str(self.qmp.command('qom-get', path=path, property=prop))
>              data += '\n'  # make values shell friendly
> -        except QMPResponseError as err:
> +        except ExecuteError as err:
>              raise FuseOSError(EPERM) from err
>  
>          if offset > len(data):

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


