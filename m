Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F0B47739C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:51:37 +0100 (CET)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrAW-00063t-9l
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:51:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxqtS-0002Z5-2Y
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:33:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxqtM-0003Tv-Nm
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639661631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ETAm5XnEWizgf3kyhzt6DBvOTVEjoj3589eybMZlg2E=;
 b=fzeBsb1aEKPmBKRDoubLeXG/DsngESpYRc4zuqPfBNsA6xoogITL8D9xK7TknY2a/tBo7O
 ++7s3gTHyF0zztu3XbGwN4BAiNozjk9t++tQAa0GkiVd5sbcf2KzHeP5zHLGq4bSn/YCLf
 SDDaDUNlj1/PBw3B41iZus4hdaX3NkA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-BswiyGccNJuf_t3J0sbLOQ-1; Thu, 16 Dec 2021 08:33:50 -0500
X-MC-Unique: BswiyGccNJuf_t3J0sbLOQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 h20-20020ac85e14000000b002b2e9555bb1so33650144qtx.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ETAm5XnEWizgf3kyhzt6DBvOTVEjoj3589eybMZlg2E=;
 b=Xhi3ugsh2BcRghHdfoBiGjP8XoaInxMh3W1eSFq+BjEpWxHpDfUvSaC9X+fL1zmDVU
 nW86myVrpnBMj9UtSI4cv4qqhUJhK1D52ruDfFA9s3wz0ftxE04/3pqZlvBgR6E+UCpn
 4g/J3IIAd/TiR1hFkXG/Ht+7w7CgioETO49PXyElcY4kEvKjsuq32ofnU6DYdFCU95Jr
 H+dF9lpTGymngtxMY+3E/uwXPyhSVGU//LAVc+a5EpMolkMrFWrE2ztLIOu8BNnqipbO
 n1T+hxMroLOf8BWGzHroyshjM/lK/nhXfm2bLsqteOauJfPwj6F3YIBdVy3+1UbTDCWL
 q6jg==
X-Gm-Message-State: AOAM5322U1OXq70gziWFYyxLQq4J7xHBxoGirQHX28kxo+UHMxc40TSU
 1Tf11FMR5atptzviF16wbeMWAgRyCcqv6UwaRWZvW9Ua6ilIZRwJnt4lPTX4qXMdbnbgYAmG+DI
 E2S7tea9Z2BjpzAk=
X-Received: by 2002:a05:6214:20e3:: with SMTP id
 3mr2883255qvk.25.1639661630234; 
 Thu, 16 Dec 2021 05:33:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXTk9XvpaF7sbAQ94zUUH/etMimTtGd/qVuFc2XjJQlmzpl79IdU5oFK0B1gqRiYSKTBZ6UA==
X-Received: by 2002:a05:6214:20e3:: with SMTP id
 3mr2883227qvk.25.1639661630021; 
 Thu, 16 Dec 2021 05:33:50 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id q11sm4134865qtw.26.2021.12.16.05.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:33:49 -0800 (PST)
Date: Thu, 16 Dec 2021 10:33:47 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 12/25] python/machine: permanently switch to AQMP
Message-ID: <20211216133347.xdoemt64y27ssmhl@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-13-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-13-jsnow@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Dec 15, 2021 at 02:39:26PM -0500, John Snow wrote:
> Remove the QEMU_PYTHON_LEGACY_QMP environment variable, making the
> switch permanent. Update Exceptions and import paths as necessary.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 18 +++++++-----------
>  python/qemu/machine/qtest.py   |  2 +-
>  2 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 67ab06ca2b..21fb4a4f30 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -40,21 +40,16 @@
>      TypeVar,
>  )
>  
> -from qemu.qmp import (  # pylint: disable=import-error
> +from qemu.aqmp import SocketAddrT
> +from qemu.aqmp.legacy import (
> +    QEMUMonitorProtocol,
>      QMPMessage,
>      QMPReturnValue,
> -    SocketAddrT,
>  )
>  
>  from . import console_socket
>  
>  
> -if os.environ.get('QEMU_PYTHON_LEGACY_QMP'):
> -    from qemu.qmp import QEMUMonitorProtocol
> -else:
> -    from qemu.aqmp.legacy import QEMUMonitorProtocol
> -
> -
>  LOG = logging.getLogger(__name__)
>  
>  
> @@ -710,8 +705,9 @@ def events_wait(self,
>          :param timeout: Optional timeout, in seconds.
>                          See QEMUMonitorProtocol.pull_event.
>  
> -        :raise QMPTimeoutError: If timeout was non-zero and no matching events
> -                                were found.
> +        :raise asyncio.TimeoutError:
> +            If timeout was non-zero and no matching events were found.
> +
>          :return: A QMP event matching the filter criteria.
>                   If timeout was 0 and no event matched, None.
>          """
> @@ -734,7 +730,7 @@ def _match(event: QMPMessage) -> bool:
>              event = self._qmp.pull_event(wait=timeout)
>              if event is None:
>                  # NB: None is only returned when timeout is false-ish.
> -                # Timeouts raise QMPTimeoutError instead!
> +                # Timeouts raise asyncio.TimeoutError instead!
>                  break
>              if _match(event):
>                  return event
> diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
> index f2f9aaa5e5..817c8a5425 100644
> --- a/python/qemu/machine/qtest.py
> +++ b/python/qemu/machine/qtest.py
> @@ -26,7 +26,7 @@
>      TextIO,
>  )
>  
> -from qemu.qmp import SocketAddrT  # pylint: disable=import-error
> +from qemu.aqmp.protocol import SocketAddrT
>  
>  from .machine import QEMUMachine
>  

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


