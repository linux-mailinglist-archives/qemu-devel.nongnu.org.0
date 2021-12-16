Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA40477301
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:19:19 +0100 (CET)
Received: from localhost ([::1]:60402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqfG-0004is-0f
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:19:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxqcL-0002re-7l
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:16:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxqcG-0006wZ-91
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639660568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uOC6naAZHyotOBROzybQtHxV3pzPo8s9wyZfsr5xv9s=;
 b=YfXL9w5usU82Xkdllq9UtWVlxh6M9//gy9IfOhmYLBsc60BAGMeLQ1mqgno720TEm93ViC
 Nj/uaabdPYAzZk/kbFj5JPLwA0dQK9gKADrAgahFi7leLUSUUIWiDRtiadN9UPUbrWLgSi
 TDw0TEG/cCYpbPrwNHvI4VIMyO3gYiY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-AicMk1aqPYyMTxih6oGSOw-1; Thu, 16 Dec 2021 08:16:07 -0500
X-MC-Unique: AicMk1aqPYyMTxih6oGSOw-1
Received: by mail-qv1-f69.google.com with SMTP id
 12-20020a05621420cc00b00410c7826fc6so6801928qve.19
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uOC6naAZHyotOBROzybQtHxV3pzPo8s9wyZfsr5xv9s=;
 b=DY7OKz+cTyhPWiQmu2YG6yIEpyjB9X9eWE/4KbZ6+U1dlJkcHhLdbTCcAjpESUM8QQ
 tTY6ZN6QlVVTnJPSTCEnJyB8N0sQ//kAT9v9EqYDyZZCho1PkOev4/Kh6CIUEFUxgRIX
 vLazWjt2IJmkjXrzS1yTs1R2dbwsgLp6yC9IGx/DAkKgw/+chFabghaXdZONzJo6f/Ms
 99XbUp+4O8VvNEqmQuCUWHQALEtdnCNZsYrdsplheJzoRxVIpGKr7EK+lyu5fTlHLdb1
 J4QIPpnr7KlIWa4sT8JFMhNJiZcyEOoh0bdeCKvah54pkw2/3Vfm7ntHGrkR6pQCfOTE
 bKZg==
X-Gm-Message-State: AOAM532rlEYD+LT+Ik0JVCOXrixlDVtDqzYqkzmmLtPdmm9ErZ1HJ52u
 rmRfR+f4Q4nVngsVPUC3Y4NKxdhYDKBDVfkiNfq8suoP5WzegEpI41hqmyQz+Z5HxtCh3EGsNfi
 WeHjinW0J8n6/eqA=
X-Received: by 2002:a05:6214:2682:: with SMTP id
 gm2mr11382711qvb.2.1639660566635; 
 Thu, 16 Dec 2021 05:16:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1O54yiIVTggBvq2B0mEBCOGw4Nm/HUEkCckMg+/USs56CNjogltlq5orOLeSVT1EOt7KLag==
X-Received: by 2002:a05:6214:2682:: with SMTP id
 gm2mr11382685qvb.2.1639660566410; 
 Thu, 16 Dec 2021 05:16:06 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id x4sm4234067qtw.44.2021.12.16.05.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:16:05 -0800 (PST)
Date: Thu, 16 Dec 2021 10:16:03 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 04/25] python/aqmp: add SocketAddrT to package root
Message-ID: <20211216131603.tsomctdifr6qcru3@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-5-jsnow@redhat.com>
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

On Wed, Dec 15, 2021 at 02:39:18PM -0500, John Snow wrote:
> It's a commonly needed definition, it can be re-exported by the root.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/__init__.py | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
> index 880d5b6fa7..c6fa2dda58 100644
> --- a/python/qemu/aqmp/__init__.py
> +++ b/python/qemu/aqmp/__init__.py
> @@ -26,7 +26,12 @@
>  from .error import AQMPError
>  from .events import EventListener
>  from .message import Message
> -from .protocol import ConnectError, Runstate, StateError
> +from .protocol import (
> +    ConnectError,
> +    Runstate,
> +    SocketAddrT,
> +    StateError,
> +)
>  from .qmp_client import ExecInterruptedError, ExecuteError, QMPClient
>  
>  
> @@ -48,4 +53,7 @@
>      'ConnectError',
>      'ExecuteError',
>      'ExecInterruptedError',
> +
> +    # Type aliases
> +    'SocketAddrT',
>  )

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


