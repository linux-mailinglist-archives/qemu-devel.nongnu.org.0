Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401EE4E586E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:31:54 +0100 (CET)
Received: from localhost ([::1]:36526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5lx-0007Qo-CT
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:31:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nX5eu-0002O2-Ef
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:24:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nX5er-00022D-R5
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648059872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRu70+B7cr7DXyw/llvEi46s56ZUIv42U6RvaSzFt7U=;
 b=eVt1hnFfP3PMeyxXhJsIDVtL/a2LVxDCqJpn5qqyOXMR0rztNEFpPA3tstwem7vTrPmdyg
 djo/3ORNpCADo1k/s2ymHqn0qnKYhXiiR0EG/GpxobYtgiDvVUKsq657h9nJ2bOKfZDxmm
 qYyC5jhSC7LI6L2nHgUxT5E7gfnzgis=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-SDAy6TwwNM-wm76aBbcR4A-1; Wed, 23 Mar 2022 14:24:31 -0400
X-MC-Unique: SDAy6TwwNM-wm76aBbcR4A-1
Received: by mail-ed1-f70.google.com with SMTP id
 b10-20020a50e38a000000b00418cd24fd27so1539403edm.8
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pRu70+B7cr7DXyw/llvEi46s56ZUIv42U6RvaSzFt7U=;
 b=OzkDqZHpHUaeJLH8/M1ifHkCBJiLhQJJ0leT1/d9s9s1qRUfro62JaGBqE93XiXmG1
 Jp/wKktdrm/t0eJ4kNvjZ3Y7DqGQfFDLrXyga2EMDyGH8fkyEluvMl+SP2wsDCjsL2jX
 2b8GCt9nUPqwPKe4ujlStykEFARZLpT1EEktpKpvxUo88CMDFMfbFC0zRHltgl3sViZw
 edzh+AqHn55hQ+yK2uKTdgmP5SAYX7tOMLTwhKJaqDsorsr47YCMd0eRaqGj5bne42DB
 R9UvjAzLguNHL3Nig2XlmKQFTKEjQOZXAWkdSQgxZlYAdol7UD3XuCBtg8tLK+0adqCx
 MBBw==
X-Gm-Message-State: AOAM533sDyfXwtWBVfis+PtwD5BE4bYFNiy0t5tIS3N5R6VcHh5ShE1f
 y9SN+yYj+fh23i7O/s6h8X6G9CObihsKzjaTY5HbiKWIwP+FcfoP1DdEVvbysu5kJtAfDcvw17X
 58K7sMsmfhwpDLXY=
X-Received: by 2002:a17:906:7945:b0:6e0:19:5f7c with SMTP id
 l5-20020a170906794500b006e000195f7cmr1579680ejo.458.1648059870043; 
 Wed, 23 Mar 2022 11:24:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymVXaIWJhEKOGlF4yBCZcfiJZSIYE9s5QiVGznCoeNYoyb5x01GFLZ3TghjlLmzaGK2pPlkA==
X-Received: by 2002:a17:906:7945:b0:6e0:19:5f7c with SMTP id
 l5-20020a170906794500b006e000195f7cmr1579657ejo.458.1648059869812; 
 Wed, 23 Mar 2022 11:24:29 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b006e05b7ce40csm217755ejb.221.2022.03.23.11.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:24:29 -0700 (PDT)
Message-ID: <e265172c-39b7-2f2d-54ca-79ac77cc27fb@redhat.com>
Date: Wed, 23 Mar 2022 19:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/10] python/aqmp: copy qmp docstrings to qemu.aqmp.legacy
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-7-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220321210847.914787-7-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.03.22 22:08, John Snow wrote:
> Copy the docstrings out of qemu.qmp, adjusting them as necessary to
> more accurately reflect the current state of this class.
>
> (Licensing: This is copying and modifying GPLv2-only licensed docstrings
> into a GPLv2-only file.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
> ---
>   python/qemu/aqmp/legacy.py | 102 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 94 insertions(+), 8 deletions(-)
>
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> index 10c7c99c4f..20ffdd8956 100644
> --- a/python/qemu/aqmp/legacy.py
> +++ b/python/qemu/aqmp/legacy.py

[...]

> @@ -60,6 +63,21 @@ class QMPBadPortError(QMPError):
>   
>   
>   class QEMUMonitorProtocol:
> +    """
> +    Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP)
> +    and then allow to handle commands and events.
> +
> +    :param address:  QEMU address, can be either a unix socket path (string)
> +                     or a tuple in the form ( address, port ) for a TCP
> +                     connection
> +    :param server:   Deprecated, ignored. (See 'accept')

Can’t help but notice that this is (technically) just wrong, because it 
isn’t ignored.  Are you afraid people might not be sufficiently 
dissuaded by the “deprecated” keyword?  (I mean, if that were the case, 
I’d suggest you write “Deprecated, because setting this to true might 
make your computer explode” instead.)

Hanna

> +    :param nickname: Optional nickname used for logging.
> +
> +    ..note::
> +        No connection is established during `__init__`, this is done by
> +        the `connect()` or `accept()` methods.
> +    """
> +
>       def __init__(self, address: SocketAddrT,
>                    server: bool = False,
>                    nickname: Optional[str] = None):


