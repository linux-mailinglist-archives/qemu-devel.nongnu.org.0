Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE01048C5D8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:21:17 +0100 (CET)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eV2-0007F7-RS
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:21:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7dea-0005Eb-I4
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:27:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n7deX-0005O7-M8
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641994020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w05PqNRqaqhBrDXzeP5RtV5BQS/M0lEbpd+ufb/uf44=;
 b=bFNasWa1dqPctVP5qfby8AP66CMe4lYkk3YMEadgda5MnXl8ywV2s2zo6Myk+6X2++PzMn
 MrkWKg2kD7xKg+Xza7Rn1WPeIt2gqXV/jVhwuTKgZeaXh7Ztg19fEEKXU/NuwjiBXzwtlo
 p9p0dfkkv3G2YajZou8GEOx739aA3VY=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-70TGJYCsOjKFdy4iDbf1KQ-1; Wed, 12 Jan 2022 08:26:52 -0500
X-MC-Unique: 70TGJYCsOjKFdy4iDbf1KQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 l12-20020a05612207cc00b003148d34a9d5so412939vkr.13
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:26:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w05PqNRqaqhBrDXzeP5RtV5BQS/M0lEbpd+ufb/uf44=;
 b=cnV7DZ/WxHdr38AzUaJPA+UsX7Cwrz31eOlg3OHe2p34yYWvrI1nL8/D6rRgT9t5hB
 7eZSNV8MlqxFykkwZXo68n0+EuL7Bv4Y2DDRLIWxNFoc6WIGUWNanUOi013IqZ5P87Ny
 HqPBUbCNmlAFVQxlF/0F2H1K+jHRsNCj12AxQXL5o599RTQtxpm8XB6ZD37Hi39nCvFb
 P+DLfckidWOC+COM8bJegnXI3fxb1ruqRByKsU6C6mYnqeyFsYbfUie6KRj8dhUpauww
 Mf4Fd6DiBLsUJ2EaMXFBPnLoF04uH+HosL5vdui7usmAlznJ0O/v1j+hMn0mK8Z7ys76
 n8ug==
X-Gm-Message-State: AOAM532TJ+qsSaQPRK79MuQRZLgtIDSIg/rsznaNyxQO5Or5dUdb8THn
 QLPCz1KAdAz7c59v2PPELXV3evQotgJgj4WlAQDYm8bh8Fziq2FngCntv88jUNURwj+88a5hQ95
 23OK0R7AcgJqUhOM=
X-Received: by 2002:a05:6102:2451:: with SMTP id
 g17mr3991576vss.8.1641994012199; 
 Wed, 12 Jan 2022 05:26:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTpVy9+byQhf2la+ubrgEI34oZBvwKBk7CEyGipO79FEy1pPXDxh32uQSkPnyT9HMzZApkVg==
X-Received: by 2002:a05:6102:2451:: with SMTP id
 g17mr3991561vss.8.1641994011930; 
 Wed, 12 Jan 2022 05:26:51 -0800 (PST)
Received: from localhost ([2804:18:8ca:405a:c209:ac99:1eeb:4fa6])
 by smtp.gmail.com with ESMTPSA id m62sm7741891uam.0.2022.01.12.05.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 05:26:51 -0800 (PST)
Date: Wed, 12 Jan 2022 10:26:48 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 05/31] python/aqmp: fix docstring typo
Message-ID: <20220112132648.7tllmcjkfdibwbqg@laptop.redhat>
References: <20220110232910.1923864-1-jsnow@redhat.com>
 <20220110232910.1923864-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110232910.1923864-6-jsnow@redhat.com>
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

On Mon, Jan 10, 2022 at 06:28:44PM -0500, John Snow wrote:
> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
> index 880d5b6fa7..173556404d 100644
> --- a/python/qemu/aqmp/__init__.py
> +++ b/python/qemu/aqmp/__init__.py
> @@ -6,7 +6,7 @@
>  QEMU Guest Agent, and the QEMU Storage Daemon.
>  
>  `QMPClient` provides the main functionality of this package. All errors
> -raised by this library dervive from `AQMPError`, see `aqmp.error` for
> +raised by this library derive from `AQMPError`, see `aqmp.error` for
>  additional detail. See `aqmp.events` for an in-depth tutorial on
>  managing QMP events.
>  """

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


