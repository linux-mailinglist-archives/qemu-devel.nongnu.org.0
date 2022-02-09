Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC294AF212
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 13:47:49 +0100 (CET)
Received: from localhost ([::1]:39264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHmNv-0007fB-15
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 07:47:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nHmBj-0005Es-0e
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:35:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nHmBa-0002w3-JN
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644410100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7gTl6kBXyargwXm4QGmiQVVKWutm4V0FHEGrtVblFZI=;
 b=h7SVeNnfdwuzkwKK2UdO7mdmtOriWK7ldoRhBjTHcPdnWZlA0nfEXWaAEpFURAflk4mPqb
 l5dhvKLtWEgjA4SSF39vUYtKKIaaXSlzwSUezCC6REfLnDKV+6ewXRJ2eYBdlbwsjUaF8g
 0GMUyz4knluD62rgsHMAIgVxoIZOYcE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-97eRSCdIMMKfmnIWdmZMWQ-1; Wed, 09 Feb 2022 07:34:59 -0500
X-MC-Unique: 97eRSCdIMMKfmnIWdmZMWQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 k3-20020a9d4b83000000b005a1871e98cbso1317810otf.10
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 04:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gTl6kBXyargwXm4QGmiQVVKWutm4V0FHEGrtVblFZI=;
 b=XBK8wfucu+Mm49C/nP9pxqXFB4uGHB56U9xGV3p3UpeeHjn1kQ2sesSUkNoTqfjiz0
 IrEk3sVkMxAOzwQ/tb9vzdEGXCOJFeFST7yXtmIIvE9E7V0/Y74eDjtE8mecCkPnAk5X
 cjl4ZOI9zjVPxHkpf1F7v7ROaOHpqNpCj2+hVUVNyTo/cpW0FSDNgqsV0pprJvFk/HFy
 WkpAJcUr9fLV78+p++8U564D0pSP/69HIhb0yXN1ph5OBa2bFVTS4GSeAR6KibgusUhJ
 esqPp1c1wgzQ1CpEJqkSO6lxnBXFEx6QBYuoNlSpml0tOaJFeCGFHUW32H4/IU2Nt8Fe
 Indg==
X-Gm-Message-State: AOAM533YZwY3bKGUBZR7qi39nsOUD3rhGDvMhGZgzLBk59PCu/SpFM41
 HtHJl+kLVGJUVVNGwsZrq3QYJgohOIrLrUpZ+G1OOJFjNvEJN6y9/rFi7RFh4Tg8aI/W2kDTomj
 UFuEXxLJHGdUuC0M=
X-Received: by 2002:a05:6808:1247:: with SMTP id
 o7mr1188062oiv.269.1644410098226; 
 Wed, 09 Feb 2022 04:34:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhb2AWG/TrKRa7mGZuzMpizTA6VLiC8IFUm/8Dfakv0PDnGOV/oUTzn9JthJiHM55juDgglg==
X-Received: by 2002:a05:6808:1247:: with SMTP id
 o7mr1188051oiv.269.1644410097990; 
 Wed, 09 Feb 2022 04:34:57 -0800 (PST)
Received: from localhost ([191.181.58.94])
 by smtp.gmail.com with ESMTPSA id e192sm6832941oob.11.2022.02.09.04.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 04:34:57 -0800 (PST)
Date: Wed, 9 Feb 2022 09:34:55 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: python - remove ehabkost and add bleal
Message-ID: <20220209123455.ff256wodqp54zgwy@laptop.redhat>
References: <20220208000525.2601011-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208000525.2601011-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 07:05:25PM -0500, John Snow wrote:
> Eduardo Habkost has left Red Hat and has other daily responsibilities to
> attend to. In order to stop spamming him on every series, remove him as
> "Reviewer" for the python/ library dir and add Beraldo Leal instead.
> 
> For the "python scripts" stanza (which is separate due to level of
> support), replace Eduardo as maintainer with myself.
> 
> (Thanks for all of your hard work, Eduardo!)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9814580975..028ac0de25 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2735,13 +2735,13 @@ F: backends/cryptodev*.c
>  Python library
>  M: John Snow <jsnow@redhat.com>
>  M: Cleber Rosa <crosa@redhat.com>
> -R: Eduardo Habkost <eduardo@habkost.net>
> +R: Beraldo Leal <bleal@redhat.com>
>  S: Maintained
>  F: python/
>  T: git https://gitlab.com/jsnow/qemu.git python
>  
>  Python scripts
> -M: Eduardo Habkost <eduardo@habkost.net>
> +M: John Snow <jsnow@redhat.com>
>  M: Cleber Rosa <crosa@redhat.com>
>  S: Odd Fixes
>  F: scripts/*.py

Reviewed-by: Beraldo Leal <bleal@redhat.com>

Thanks,
Beraldo


