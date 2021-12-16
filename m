Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F183847738B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:50:00 +0100 (CET)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxr8x-00040H-Lb
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:49:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxr5M-0000TA-Gm
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:46:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxr5K-0000RY-8f
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639662372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nUVRnWblM71VCFdM2wtVZtTGrkxnzW+QRDk9wUvIjA0=;
 b=BfqnqDSNfaJ6TexS4xFePKi2mFDlJFrhz4Sm7hLZFQwgd7FnqLRf+sKtxg9DAm3ItrGmE2
 /q18gVOz/MHUkQGFQcL0PHXnzkkWMq7/Wq68hfWHCdV4EopDWVZVZLwupxUT9Mp/4tt2bm
 fx4ZramiB8ypPFOvK476PIyyEdp6DL4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-3TEc3QtsN7iIXiBuOAjhdg-1; Thu, 16 Dec 2021 08:46:11 -0500
X-MC-Unique: 3TEc3QtsN7iIXiBuOAjhdg-1
Received: by mail-qt1-f199.google.com with SMTP id
 e2-20020ac84142000000b002b4bc4ffc49so33618245qtm.8
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nUVRnWblM71VCFdM2wtVZtTGrkxnzW+QRDk9wUvIjA0=;
 b=7+lW1tJXgTSDL6lofIx/cXDTUoZ9JOnJJ63+ghk4mc6OidEw6XYdKbvW5139TxUrdR
 rsoh4YVtXgf27Zr4ZCjHaKrAcC0DurV9Mzh62rV3TshdVgh16Orf+rygr4lBoYY/m7Lj
 DVCl2Nc7S1LUC8/SMairn6sGvtXWS+5RzJJd1aG5l13e7UEjVsm1Ckgn4FgC9sRoXjwO
 k6UzGBn/Nla+o4aURmXSJfml/j4fsk8nVeepYExhkycvA5cY933dkXJ7H4mdNY6OLSZq
 DDeoBoLenSw5fyoBHdVYy0mo4KD7mhibgh7cofeyq5VHJQbMrIDFJEGCyXGsI8k/FyV0
 LSVA==
X-Gm-Message-State: AOAM532Cm41BzlzDnm6+THkr5DUzQYsSFSkSGschTlYrwx+rc7z2AepH
 r7bsfiiVA7UIUKjIWGtI0H2I7IEx2D6yUVLZYkUvhEw1bz0xuIZ19ZRMxFfckhhvcnnf9kyXOU+
 5vdcGkW9h+wXVlgA=
X-Received: by 2002:a05:622a:1207:: with SMTP id
 y7mr16750984qtx.635.1639662371032; 
 Thu, 16 Dec 2021 05:46:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxu6sAdjhv/Ockk59yiE9mZUB/SZGzukZUcdFRInHFo7wDaGlMw/34erR6tdJV1fpleTik3og==
X-Received: by 2002:a05:622a:1207:: with SMTP id
 y7mr16750970qtx.635.1639662370874; 
 Thu, 16 Dec 2021 05:46:10 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id bm35sm2769420qkb.86.2021.12.16.05.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:46:10 -0800 (PST)
Date: Thu, 16 Dec 2021 10:46:03 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 14/25] scripts/cpu-x86-uarch-abi: switch to AQMP
Message-ID: <20211216134603.sqqflkjchgqtryu4@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-15-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-15-jsnow@redhat.com>
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

On Wed, Dec 15, 2021 at 02:39:28PM -0500, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/cpu-x86-uarch-abi.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
> index 8963d90f0b..c262d2f027 100644
> --- a/scripts/cpu-x86-uarch-abi.py
> +++ b/scripts/cpu-x86-uarch-abi.py
> @@ -6,7 +6,7 @@
>  # compatibility levels for each CPU model.
>  #
>  
> -from qemu import qmp
> +from qemu.aqmp.legacy import QEMUMonitorProtocol
>  import sys
>  
>  if len(sys.argv) != 2:
> @@ -66,7 +66,7 @@
>  
>  
>  sock = sys.argv[1]
> -shell = qmp.QEMUMonitorProtocol(sock)
> +shell = QEMUMonitorProtocol(sock)
>  shell.connect()
>  
>  models = shell.cmd("query-cpu-definitions")

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


