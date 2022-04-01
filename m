Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5203E4EF87B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 18:54:58 +0200 (CEST)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naKY5-0002Qe-Em
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 12:54:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1naKWB-0001QW-RP
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:53:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1naKW9-0006YN-89
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648831975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/7d+g/Y9D8NoM3PYlGyxex3nTHBohWBmubjCJDYgrLU=;
 b=eqFk+db8OzCnvH8Xl9M1tcQhpUJxKYK1i/NtGeWz8yZtt7ccF0pbqFuc+X87mrTEuwF6mz
 lmkTX8aV22wqH/Pab5z9+enZn5i+ufYj8aFU2oYJ748TPCNqCq71ojN/BMm6MNsSu4Xeud
 0oxwmMQ1XQ4BkgRQaTLOVmQykjqdB3I=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-TilDpd5BPUKbLViNFRPxwg-1; Fri, 01 Apr 2022 12:52:54 -0400
X-MC-Unique: TilDpd5BPUKbLViNFRPxwg-1
Received: by mail-oo1-f70.google.com with SMTP id
 j18-20020a4ae852000000b003181c031d81so1938743ooj.22
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 09:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/7d+g/Y9D8NoM3PYlGyxex3nTHBohWBmubjCJDYgrLU=;
 b=NJgMFrZikXxbElxFnxb0V5P7ozJQVsjOHZSpskV/V0jKt+8z5dDTe5rvb1mFAXYztS
 KnmYbl+CGLp0TxfettagyEl75vP8ct/xhOMUK4kjZbxRDZyp6ERA82IZ54RfjTG0i3Fl
 jAdPa3jqD9Qfm0YpVcsGP0uAgyLNwr45FyKyEiihxXAcxGujghQHWZ2lv2cPQQEsP355
 YwYdgYyt9wGI/yDnIBNQVcMDQ/kfXW5KxbROsa1b5l4QFiu6juHoJtSldei3dAirm6++
 QhwvovgUbUOfvTKIYcv9A8L7CF76mGOUkEmAujj/N/eTW0m6xn3q5jsiYG2N1fpDnDZG
 QVpA==
X-Gm-Message-State: AOAM531GJ4LSEX953tg9F554COwvDbyQQpx5N0xW9KOioOyxAryJcY9H
 jHBJirhl2QHrF6W2uDGy9ZIYqJGAXm7UnwromnlF6/z5Me2F/PlcHBjx2y9A+TzUvmVzcmQ9Oz9
 r7DX6/+wDeh/onF8=
X-Received: by 2002:aca:2410:0:b0:2ec:b1cf:2dab with SMTP id
 n16-20020aca2410000000b002ecb1cf2dabmr4921931oic.231.1648831973692; 
 Fri, 01 Apr 2022 09:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMO6Ovw+CVT2IPE+0QjuZMMKDtoxgiEDPeBR4jtbrJ7Zo/gMuYkSgigCiUtWw1qNAZmz1i0g==
X-Received: by 2002:aca:2410:0:b0:2ec:b1cf:2dab with SMTP id
 n16-20020aca2410000000b002ecb1cf2dabmr4921920oic.231.1648831973499; 
 Fri, 01 Apr 2022 09:52:53 -0700 (PDT)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 c11-20020a056830314b00b005cdb444d41csm1312880ots.32.2022.04.01.09.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 09:52:53 -0700 (PDT)
Date: Fri, 1 Apr 2022 13:52:50 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 05/13] update project description
Message-ID: <20220401165250.x2f3ewe3niesvh63@laptop.redhat>
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220330182424.3438872-6-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 02:24:16PM -0400, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  setup.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/setup.cfg b/setup.cfg
> index f06f944..c21f2ce 100644
> --- a/setup.cfg
> +++ b/setup.cfg
> @@ -7,7 +7,7 @@ maintainer = John Snow
>  maintainer_email = jsnow@redhat.com
>  url = https://www.qemu.org/
>  download_url = https://www.qemu.org/download/
> -description = QEMU Python Build, Debug and SDK tooling.
> +description = QEMU Monitor Protocol library
>  long_description = file:PACKAGE.rst
>  long_description_content_type = text/x-rst
>  classifiers =

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


