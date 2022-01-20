Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EFD49541D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:23:57 +0100 (CET)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAc6G-0001zw-Ra
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nAXB9-0003lV-HZ
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:08:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nAXB5-0002uD-Pb
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642684115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KxUYIvUo0EmOGbPqYISktlDHzRoE5z9DapEkn3Dhqgs=;
 b=ANGhF2RZGe6YXlEqNzU3/y15p2e+W87orXaLqqqbPtlYisL3bEb6NMm8BcV4pJwgxjqS1T
 Fq7s4/drNKAL+zbaeQpoQYbSw6Ct9kUHcde1FY93WB8DQpF2VspJlyZUkm9HSCwjzTFBNb
 Xv8bmzhhkAvMGOdS+JjBMTdV5XQh6nc=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-8gO6LtkjMC-fmqurX-1e-g-1; Thu, 20 Jan 2022 08:08:33 -0500
X-MC-Unique: 8gO6LtkjMC-fmqurX-1e-g-1
Received: by mail-ot1-f70.google.com with SMTP id
 a89-20020a9d2662000000b005909e4d9585so3650253otb.18
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 05:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KxUYIvUo0EmOGbPqYISktlDHzRoE5z9DapEkn3Dhqgs=;
 b=fcpee6TglO4ZKYx6fT2gyRP7ZGbqnDgNsAfq6hzftb//OLj5mBElhjpxqpEBfZSxwx
 fDFvElx2daWgUiqe5Xah5spDSrl55++nn4Fl1xuhOocwUYOoUtk+4D6aZtnCdyCEdiAy
 c9Vb8slFkxnAxVbxzrLpi99FrUov6ax8Lb+jMkahFnFZcZogYM5AmB5IPbqiDqeuKqZ3
 6ot2y2bY7jawyj3DC3dhM6XUsJoJSu1eYLbsp6arH0ybYNiJb3FjASCmyXe4kkPo76wT
 IGJ+0bPO7qwwiqPpqaN1ux8ErYI0cAyiDIvu9nXSTP/38t6Xnp1pdjb2aOnNy9di3XeD
 +vXw==
X-Gm-Message-State: AOAM533EOTADyebtzltOiUqpFUVuk0LUV2d2Ja15dybvRXksIlwAcIkb
 VWt+MQ2wm+dpGyOtqdl7eizRPregMXmwy4KSFQ01BitQIUBYxcesMIl4zRMuTHbXgOUW0Sijk0U
 i3RVmvOdsYv89dnc=
X-Received: by 2002:a05:6808:144a:: with SMTP id
 x10mr7501938oiv.79.1642684112308; 
 Thu, 20 Jan 2022 05:08:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsJHBR61XVj7yJ2uRg8K/aa/u6B+Y38mRUORth5jsc14gwBZbeSXNlTuapPLHY+g2kUVbARw==
X-Received: by 2002:a05:6808:144a:: with SMTP id
 x10mr7501922oiv.79.1642684112074; 
 Thu, 20 Jan 2022 05:08:32 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id o21sm1312858ote.4.2022.01.20.05.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:08:31 -0800 (PST)
Date: Thu, 20 Jan 2022 10:06:17 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 2/5] python: use avocado's "new" runner
Message-ID: <20220120130617.cmh7aiugzezy4yr3@laptop.redhat>
References: <20220119193916.4138217-1-jsnow@redhat.com>
 <20220119193916.4138217-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119193916.4138217-3-jsnow@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 02:39:13PM -0500, John Snow wrote:
> The old legacy runner no longer seems to work with output logging, so we
> can't see failure logs when a test case fails. The new runner doesn't
> (seem to) support Coverage.py yet, but seeing error output is a more
> important feature.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/avocado.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/python/avocado.cfg b/python/avocado.cfg
> index c7722e7ecd..a460420059 100644
> --- a/python/avocado.cfg
> +++ b/python/avocado.cfg
> @@ -1,5 +1,5 @@
>  [run]
> -test_runner = runner
> +test_runner = nrunner
>  
>  [simpletests]
>  # Don't show stdout/stderr in the test *summary*

Since Avocado 82, the new one is the default. So, you could remove the
the "[run]" section.

In any case:

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


