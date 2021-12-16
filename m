Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0BF4773B4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:55:25 +0100 (CET)
Received: from localhost ([::1]:33816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrEC-0004ME-AR
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:55:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxr6s-0003KT-IU
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:47:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxr6q-00010s-Pw
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639662468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g1VYfxIQPQWChZZDEKx4S0P1k12gBtblo7iJ3GokaM8=;
 b=c5FVG+g4MwAdJvNI/DPyl96Ez0v2Us1Bv9d5920CUB4p01hhzS2NBk8s3l0hwbWsubC/MI
 ppYHfPmiC/8hRpyAIBN3bj5U+PAdcWfsxj4P2PRND8jYKu4qPMcEsWCc38CK/iG7md1VKv
 h8ZgC8zA50yTuxN19ckABVwDQH+pGME=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-Z-PHdRThNfyKjQQY8-5uxw-1; Thu, 16 Dec 2021 08:47:47 -0500
X-MC-Unique: Z-PHdRThNfyKjQQY8-5uxw-1
Received: by mail-qv1-f72.google.com with SMTP id
 kl17-20020a056214519100b003ba5b03606fso33965796qvb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g1VYfxIQPQWChZZDEKx4S0P1k12gBtblo7iJ3GokaM8=;
 b=b6oi/Ui8yZ5VA1NQuHdZ0PdAQzNTlwJXRHV8JmiAVpQnaEMfFqAiARyr+B/H+9IIu7
 UMI/HSvdQ3+i2jH4vm1chDx9nNbRWqUNI/zYMcCR/ArMwUixjlpUivDYRkyJTk7W7C1f
 Zi99DK+HB1Cz0pvP/JTqM+qTvdAvodb+YdmsNUYCYNTspAR7MPMfYAID3z6WjttThVg4
 44FqrLwM86MVS5OV3uC3fJulxcjOXHZlReZN0Al8QPuCYymj56F5IRirDgtyFUrHOHtA
 OWMgEwI9mSGP7cdq7aPTaePeKBvTs5rSJUIEpth0a5Mxm+dmtstmhF49mO/Xy78nFKMc
 Dpzw==
X-Gm-Message-State: AOAM530X5YEfkiC2EejBvNfNaZ5j8doMz6dqhzHgvdRCi+rfacJd+G5K
 J7+W493DFLQA7UjeXW7ltwaFjP/b/Qa6c6gm54MHlTI5z0EAo9woIG7PHmFVGntkFpt8sf9Njov
 wq+b+TI3FMfRt+VA=
X-Received: by 2002:a37:5cc:: with SMTP id 195mr12009537qkf.680.1639662465724; 
 Thu, 16 Dec 2021 05:47:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8WROG8WKV0GLSzX5cWN41JwAItRqphj4TosomudhKJCV0DOixw/uQi33zuY6++lrDWfTeZw==
X-Received: by 2002:a37:5cc:: with SMTP id 195mr12009523qkf.680.1639662465533; 
 Thu, 16 Dec 2021 05:47:45 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id ay36sm2748923qkb.60.2021.12.16.05.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:47:45 -0800 (PST)
Date: Thu, 16 Dec 2021 10:47:43 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 15/25] scripts/render-block-graph: switch to AQMP
Message-ID: <20211216134743.tyctvqzy6lbxqfuk@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-16-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-16-jsnow@redhat.com>
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

On Wed, Dec 15, 2021 at 02:39:29PM -0500, John Snow wrote:
> Creating an instance of qemu.aqmp.ExecuteError is too involved here, so
> just drop the specificity down to a generic AQMPError.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/render_block_graph.py | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
> index da6acf050d..97778927f3 100755
> --- a/scripts/render_block_graph.py
> +++ b/scripts/render_block_graph.py
> @@ -25,10 +25,8 @@
>  from graphviz import Digraph
>  
>  sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
> -from qemu.qmp import (
> -    QEMUMonitorProtocol,
> -    QMPResponseError,
> -)
> +from qemu.aqmp import QMPError
> +from qemu.aqmp.legacy import QEMUMonitorProtocol
>  
>  
>  def perm(arr):
> @@ -105,7 +103,7 @@ def command(self, cmd):
>          reply = json.loads(subprocess.check_output(ar))
>  
>          if 'error' in reply:
> -            raise QMPResponseError(reply)
> +            raise QMPError(reply)
>  
>          return reply['return']

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


