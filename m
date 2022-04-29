Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E591F514AF7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 15:45:36 +0200 (CEST)
Received: from localhost ([::1]:45214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkQwB-0005Aa-Oo
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 09:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nkQuo-0004Ve-CY
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 09:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nkQul-0007H7-K8
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 09:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651239846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ThyEtwPHz6/hdmZnHMLDsn8rhkr0luIcJ64pEo3lNNI=;
 b=Cz379CxrmmG7Lm0GCb/zlXKeUODMZw5f4BDO7xe71Pc6vfrfkIrWH6PwlvODOnJcVNvF7S
 OloGO14HBMHU4yQo2XaFg3FPstXeZW+gKwrVfBBbLK5ndDCWNTP3j+AQCzQ+imQtO2v1IM
 DhIO5hfvXIufDyAUz7aIcF7axNePoeA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-i8PkDAqBOx-I3LI9aDviLw-1; Fri, 29 Apr 2022 09:44:05 -0400
X-MC-Unique: i8PkDAqBOx-I3LI9aDviLw-1
Received: by mail-qk1-f197.google.com with SMTP id
 y140-20020a376492000000b0069f7e985c95so5265797qkb.15
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 06:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ThyEtwPHz6/hdmZnHMLDsn8rhkr0luIcJ64pEo3lNNI=;
 b=lYUjedMLA41mSQG/uIOHOZxp7BfTFMga3Bfs8bsYObUuWGNMWKvbkmGZJ0bBnAcxuc
 3ACxTsmLaxVnOGUewTGP5Lya6i9ua/1ND4GbLOXqxssFnLmWhJP/7OUCqlMehzufTMXl
 h8xcXAhLQSc6Jc1oC/xVEESRrY5ZFNCkH6nEMGxXios5JkJQYjRKyIH53X3yuTvAgMSn
 CCEGru3Kf0mmMJBYLnOBCW0hqyEKqD/7cTKK7STEshByywZ7tk3Ioid0gOD3jfNtKaLj
 QdWsx0pl1pqMCbCTZFz4RXN2EgFmOqyT4zDJbtzFpAS/FJLEeoHQCgdkxtO/kPIuqTBd
 KMhw==
X-Gm-Message-State: AOAM531bFRkWWjm54Zt8s7idBPIFVvzCkanzLft+QOrJEhQ24GJw1F5z
 /HqPvUFtTqfp3FuzlqxdaCx0bvzQWFgGvKY4UmzQ/TCbMRXUNpsETM9be4cL1yxB+hqRZp+ehdx
 7ftl9shLSSvAgSIM=
X-Received: by 2002:a37:a149:0:b0:69f:bb3c:9f09 with SMTP id
 k70-20020a37a149000000b0069fbb3c9f09mr838616qke.21.1651239844735; 
 Fri, 29 Apr 2022 06:44:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyC8LkJmEIessG0cEDlBn8dFvxSwpFaYePdWb+x3RghJ/TiF466HZEb+gc937NoCyBphy8Ug==
X-Received: by 2002:a37:a149:0:b0:69f:bb3c:9f09 with SMTP id
 k70-20020a37a149000000b0069fbb3c9f09mr838602qke.21.1651239844553; 
 Fri, 29 Apr 2022 06:44:04 -0700 (PDT)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 u17-20020a05620a431100b0069fb9f98b26sm489778qko.69.2022.04.29.06.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 06:44:04 -0700 (PDT)
Date: Fri, 29 Apr 2022 10:44:01 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 03/12] update project description
Message-ID: <20220429134401.qfsweswaovuc6xfz@laptop.redhat>
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-4-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422184940.1763958-4-jsnow@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 02:49:31PM -0400, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
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


