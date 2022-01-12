Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627C48C6AD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:06:55 +0100 (CET)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fDB-000590-Vo
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:06:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7e3D-0007KQ-B0
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:52:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7e2y-0001VH-VA
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641995536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1HXfQTpCebizzugLFkFlaBClRfqzIcjyiTgq/HXipHc=;
 b=Y/7tW3weMPB0mXjNqHsDMVgFc9G/K1IatSZAryEPqtr4HiwLMW3sqMfkWjVNmJ2/NmIMTU
 nntN3e9fJrD3i9s5JNePyEvozk1A1HJzDBuHxedOxk/D00QUNea3b0JSodzZPO6DOlUjoO
 KZOMfCQ9yNspcO5DbecgJ4ixe8W71BY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-QlGWEqpnOA-3KmxpjTkSYg-1; Wed, 12 Jan 2022 08:52:15 -0500
X-MC-Unique: QlGWEqpnOA-3KmxpjTkSYg-1
Received: by mail-vk1-f198.google.com with SMTP id
 r66-20020a1fda45000000b0031524495b43so420834vkg.17
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1HXfQTpCebizzugLFkFlaBClRfqzIcjyiTgq/HXipHc=;
 b=zabPFI7AGEu4IydwiBq/J9Ura1Bkz2LBcx53IjjutqD+bcMrqUFlrgO3L3T8+58xNB
 St1rbs8N54yXp/fwmlkTV6w4xoTpt8mC3p6ZKQabpZF0KE55VkGnc2fUWOB0k0jAti5p
 ITQtQss4gkCGD0F1FfEuQ1RJ0ZTr0mn4muQ3gT+z5961W7MJE3yBWkU0mX3g/NHLQEHh
 XXtdIpng4TvTbMcfN/YDMbOCjSUBc518LEMP2Vf1c9lN0HQGceYKh2wN4eH0BdjRZoa8
 NHMdeRo6N4QkWoaJbDawZBobXYpXjM1LM4KipgOiaOfUKNWf/+eFxwcBB711uD3YJ7Rc
 BA3g==
X-Gm-Message-State: AOAM533M/FfvoSPi+KTZEjqBOcEde46z6cn83huv0r1TxUUaQ7o30zMs
 Xo5y1+wKL1ZMgmBtr3ZezkqT7vuZV0lPOCUi/DxFc++9jngblaUrmKqKxreOfSTwB+Yb5MlcoFL
 x/XwaU/zsc41ehNs=
X-Received: by 2002:ab0:134:: with SMTP id 49mr3958494uak.22.1641995534633;
 Wed, 12 Jan 2022 05:52:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi0TMKdiVKlPPOVJIGw17xhVTkPMaHvAK30Ecmhiv3Ua+TxRJVBuEmBLuFYJHxnVdZJCXixg==
X-Received: by 2002:ab0:134:: with SMTP id 49mr3958488uak.22.1641995534454;
 Wed, 12 Jan 2022 05:52:14 -0800 (PST)
Received: from localhost ([2804:18:8ca:405a:c209:ac99:1eeb:4fa6])
 by smtp.gmail.com with ESMTPSA id 23sm193094vkw.4.2022.01.12.05.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 05:52:14 -0800 (PST)
Date: Wed, 12 Jan 2022 10:52:12 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 14/31] python/qmp: switch qmp-shell to AQMP
Message-ID: <20220112135212.b4w5q5rv6qdz2jk5@laptop.redhat>
References: <20220110232910.1923864-1-jsnow@redhat.com>
 <20220110232910.1923864-15-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110232910.1923864-15-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
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

On Mon, Jan 10, 2022 at 06:28:53PM -0500, John Snow wrote:
> We have a replacement for async QMP, but it doesn't have feature parity
> yet. For now, then, port the old tool onto the new backend.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  python/qemu/aqmp/legacy.py   |  3 +++
>  python/qemu/qmp/qmp_shell.py | 31 +++++++++++++++++--------------
>  2 files changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> index 27df22818a..0890f95b16 100644
> --- a/python/qemu/aqmp/legacy.py
> +++ b/python/qemu/aqmp/legacy.py
> @@ -22,6 +22,9 @@
>  from .qmp_client import QMPClient
>  
>  
> +# (Temporarily) Re-export QMPBadPortError
> +QMPBadPortError = qemu.qmp.QMPBadPortError

Probably I'm missing something, but any reason for not using, something
like this?

from qemu.qmp import (QMPMessage, QMPReturnValue, SocketAddrT,
                      QMPBadPortError)

--
Beraldo


