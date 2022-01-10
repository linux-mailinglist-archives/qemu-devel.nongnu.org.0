Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7B48A1EA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:27:35 +0100 (CET)
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n72CU-0005c0-Ez
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n725i-0005Cb-Ow
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:20:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n725g-0006n5-5S
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641849631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YgTOUzBnPU5SClntb12M/WJx+w+RmRjeC8NorpFV83E=;
 b=AgVsf60FTFzOScKJrCudFKIbb5L5Q5bY/OnDi5OKHWhiIyK3vHE16IKCtcmYBQv+0C8aRt
 PJ7v/DcO8eGZMXOBHmaxp+7D2PjV7nIs7k2Z44yOEzvW2TKA9eFL7KAK/Cx7cEYzHjJQNV
 KdzqhM8iOemMu5ZvZoN/oUleXWoBSUo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-I99rVt6XOnqwF9PQcsLgsg-1; Mon, 10 Jan 2022 16:20:30 -0500
X-MC-Unique: I99rVt6XOnqwF9PQcsLgsg-1
Received: by mail-qt1-f200.google.com with SMTP id
 j26-20020ac8405a000000b002c472361f33so11804419qtl.16
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YgTOUzBnPU5SClntb12M/WJx+w+RmRjeC8NorpFV83E=;
 b=ma10qnT61J/vaNmSBLEPWUA3YbZfV0FE9BIK6tS/+X33TjOCa/jVfonUVdwRD3flDB
 T8ysQq47T8eRUknxQf+xX4biPHaUk/cBlmSsC5zmkluXUrQdGfr2xHXK3T8rMiRJMyt2
 l+T5QIzdvcE5pZ4EteEx2df8o9cUkZu+DsnsyGNeHclJaHcuXeU1vGWeDS5MLjmQRcaQ
 bUHAKuCyIgd6jti1ze0e5BJTam2rkERBH3i5Atag9PCJwnNgPOM1EHFHCUS93KjpSqly
 QrIStLiNq137uiOX2IrJ0/FJs4+Rs84wqycrp598lzN5uipmK/FzhFT3xXJcqH293SCI
 9EWA==
X-Gm-Message-State: AOAM530ohbSqEDjgrfg4uhV5QBpy3+tPjs0ImaWi87Yx09Slwe+DaPDo
 hLQm04G2sF+BRth/9oEbHGbGAXGVbblLlvOArRzV9Lq+bsW0nBsUs/ElA7WLO3KfxYk+Z+L0Tox
 0HkiwmbZxhBpw7HI=
X-Received: by 2002:ac8:7f4b:: with SMTP id g11mr1394524qtk.608.1641849630079; 
 Mon, 10 Jan 2022 13:20:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwr0fKuQxjyh7OYhAcZJUF54utIaRysMt2MdQDS+9yU2m6fZrfOETbt3yIdKANmPveQkvJnYw==
X-Received: by 2002:ac8:7f4b:: with SMTP id g11mr1394512qtk.608.1641849629895; 
 Mon, 10 Jan 2022 13:20:29 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id d15sm5077679qka.3.2022.01.10.13.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:20:29 -0800 (PST)
Date: Mon, 10 Jan 2022 18:20:26 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 3/3] python: update type hints for mypy 0.930
Message-ID: <20220110212026.473rhawitprg5zf3@laptop.redhat>
References: <20220110191349.1841027-1-jsnow@redhat.com>
 <20220110191349.1841027-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110191349.1841027-4-jsnow@redhat.com>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 02:13:49PM -0500, John Snow wrote:
> Mypy 0.930, released Dec 22, changes the way argparse objects are
> considered. Crafting a definition that works under Python 3.6 and an
> older mypy alongside newer versions simultaneously is ... difficult,
> so... eh. Stub it out with an 'Any' definition to get the CI moving
> again.
> 
> Oh well.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/qmp/qom_common.py | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/python/qemu/qmp/qom_common.py b/python/qemu/qmp/qom_common.py
> index a59ae1a2a1..2e4c741f77 100644
> --- a/python/qemu/qmp/qom_common.py
> +++ b/python/qemu/qmp/qom_common.py
> @@ -30,10 +30,6 @@
>  from . import QEMUMonitorProtocol, QMPError
>  
>  
> -# The following is needed only for a type alias.
> -Subparsers = argparse._SubParsersAction  # pylint: disable=protected-access
> -
> -
>  class ObjectPropertyInfo:
>      """
>      Represents the return type from e.g. qom-list.
> @@ -89,7 +85,7 @@ def __init__(self, args: argparse.Namespace):
>          self.qmp.connect()
>  
>      @classmethod
> -    def register(cls, subparsers: Subparsers) -> None:
> +    def register(cls, subparsers: Any) -> None:
>          """
>          Register this command with the argument parser.
>  
> -- 
> 2.31.1
> 
>

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


