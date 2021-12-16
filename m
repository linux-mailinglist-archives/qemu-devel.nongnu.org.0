Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE8B47745D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:22:52 +0100 (CET)
Received: from localhost ([::1]:36096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrel-0003nR-9i
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:22:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrah-0007Ww-6K
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:18:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrae-0007M3-Kl
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639664316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pKDPJYRDSXPtRq/TULiTrrG8lW1Y4KTq6/99BfFlo/8=;
 b=SCXd01PLDyc+ViXHS6zCE+IKIVZCfY0YwkXmpBLf1Ko6Z+w9QpKQDNsh02iDqfBmZOQGFv
 Fo776L/DNsiOLjUVuVgbma/r9MUwYlGf0fvYQlwMANxM/GVF5DgLgeNTP6xe1/o3wIV4iY
 F1JCUxjZJAx8szeP/JgvluJDv8Z9r98=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-Cx1_7pHSMzSNQfSwbrQ6gg-1; Thu, 16 Dec 2021 09:18:35 -0500
X-MC-Unique: Cx1_7pHSMzSNQfSwbrQ6gg-1
Received: by mail-qt1-f200.google.com with SMTP id
 g16-20020ac85810000000b002b212f2662aso33605419qtg.20
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 06:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pKDPJYRDSXPtRq/TULiTrrG8lW1Y4KTq6/99BfFlo/8=;
 b=0z6plMso652jKfjUIu7a82A+PhCSBXfiQuLwC3iB676i4xjrN0tM6q1lGMWbGq1Kwr
 0d+ddjS2pOQkiiZ35LNcOsRXO/CjwKFdFa38G6ydaOqOHdMNwaiU4NyfQRncgDXOAbMb
 G16X3XiZThHbdxhGieysAZNCHaoZalbdKPYRuqxkAv9mYnpIMQW+4fWSX1dhRunpbYO7
 2stOT/BUgAUXJivy5GwugSNsGp3VPRYNSaotWXRskWDDDbJqBBpO/Sw9gmovYGX1SQFU
 fHsBfE/xBtcORni9p6aCpCT+voWkBQ/FJ4COEhhwn+128wtcZnW6TdO95K65l+UZ+Mxu
 53qQ==
X-Gm-Message-State: AOAM532i7c1998f78Sq4HfI7O74W93kz+VFIthAtvFBB3ws+TA+tg/0q
 8Ue1k/xMzgoLhsuuN5mXxv69l899x1yI15cW45AcwEvINOX+65wZAYxzBVVZ9EscuZXfeppxukU
 9AQyaNiiSckM/lOE=
X-Received: by 2002:a05:6214:411d:: with SMTP id
 kc29mr15966592qvb.22.1639664312575; 
 Thu, 16 Dec 2021 06:18:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwE2hCk5WP45YAUtpIPqfq6FyUSpZJyhwCMY+P+ASFxIUpS27Oh5a32HwlSVTms/eGYwv3qOw==
X-Received: by 2002:a05:6214:411d:: with SMTP id
 kc29mr15966569qvb.22.1639664312424; 
 Thu, 16 Dec 2021 06:18:32 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id n12sm2747931qkh.52.2021.12.16.06.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 06:18:31 -0800 (PST)
Date: Thu, 16 Dec 2021 11:18:30 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 24/25] python: re-enable pylint duplicate-code warnings
Message-ID: <20211216141830.6kfv7uaryf3yfdul@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-25-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-25-jsnow@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 02:39:38PM -0500, John Snow wrote:
> With the old library gone, there's nothing duplicated in the tree, so
> the warning suppression can be removed.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/setup.cfg | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/python/setup.cfg b/python/setup.cfg
> index 5140a5b322..c341e922c2 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -114,7 +114,6 @@ ignore_missing_imports = True
>  disable=consider-using-f-string,
>          too-many-function-args,  # mypy handles this with less false positives.
>          no-member,  # mypy also handles this better.
> -        duplicate-code,  # To be removed by the end of this patch series.
>  
>  [pylint.basic]
>  # Good variable names which should always be accepted, separated by a comma.

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


