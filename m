Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC9D4EF882
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 18:57:09 +0200 (CEST)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naKaC-00041H-DO
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 12:57:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1naKYC-00038A-OW
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1naKYA-0006hQ-1x
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648832101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B6vDnIVZwey/K901VKjaQ1ZlItOYL6Orkv9M9uSHgvA=;
 b=Z0LKzGEMrDvBOPoOKPWfqAOiqZ9eNQF2rM05fwfgUIm1TmzH7+Ldj1fHe8+jdfdPip95RD
 l9uaaHv7SzbdvLXat/PpvkL1sVVc1SAc0sCn5GV44A1kcsRwUvXpyaGkMGUsoDqyxjg/v/
 j/1V86ndSkMrlLexTolG6MJNambu8Ng=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-k_u2ItEeNCe2sdpHH4Gvbw-1; Fri, 01 Apr 2022 12:55:00 -0400
X-MC-Unique: k_u2ItEeNCe2sdpHH4Gvbw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-df022f3ebcso1465783fac.16
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 09:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B6vDnIVZwey/K901VKjaQ1ZlItOYL6Orkv9M9uSHgvA=;
 b=DFnW1PUtch+HbpBD7/z2JsKVclDrU1SV53dKZkDjfKGnx3mm03FqMJx0YaxB/WkgYw
 Fh2C9FWB7uneuo8NKkAJOA5t7RvhAa4h05bXBnIG5qx92eMcV9MkGMoe9QdEqNzRlgE2
 jeXzpbAyIyku+FKeYbtCfhl4mCyk6alEa6dbYPQQ1uAmnRocwSlDhVj8rRleNlGe6gXN
 5McFQ7rNM9ySComtqRI7bsdBn6A4iKd/zV3bXe0PKy07wTjcVpyV8rYiX+olPYBxsiF5
 bvpd8e2Avowaw7dCg2xYppCfGeg1cNmjC5YqfjkUHbnhjpqeGUO54AZVfijPLjNFNS3I
 EQxA==
X-Gm-Message-State: AOAM532IDjQ7m+b4DAj9ss+TgNpb4lWDmR4HV+5/0gt+1MsNz3IWehoh
 iWRJEagr+Q/ZlKS5iKYrAAaafg4lvqJ81Dktl98lOtAJNnEZixqujs615HtweWt1inlDeJ2eAF1
 ex9j3p3IWgcxZHZ0=
X-Received: by 2002:a05:6830:14a:b0:5cf:b0e5:485f with SMTP id
 j10-20020a056830014a00b005cfb0e5485fmr1183584otp.293.1648832099429; 
 Fri, 01 Apr 2022 09:54:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMn7NQMZFfAEV4VDHYfgnoOTbbUZfhpv7mpuYc6aps6MspT2RoopY9pVTHnWsJlvbgoVzpRA==
X-Received: by 2002:a05:6830:14a:b0:5cf:b0e5:485f with SMTP id
 j10-20020a056830014a00b005cfb0e5485fmr1183565otp.293.1648832099223; 
 Fri, 01 Apr 2022 09:54:59 -0700 (PDT)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 p22-20020a056870831600b000ccfbea4f23sm1361256oae.33.2022.04.01.09.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 09:54:58 -0700 (PDT)
Date: Fri, 1 Apr 2022 13:54:56 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 07/13] add a couple new trove classifiers
Message-ID: <20220401165456.ifrjzrm6dyytqhlt@laptop.redhat>
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-8-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220330182424.3438872-8-jsnow@redhat.com>
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

On Wed, Mar 30, 2022 at 02:24:18PM -0400, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  setup.cfg | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/setup.cfg b/setup.cfg
> index 776f4f1..44f913d 100644
> --- a/setup.cfg
> +++ b/setup.cfg
> @@ -14,6 +14,7 @@ long_description = file:PACKAGE.rst
>  long_description_content_type = text/x-rst
>  classifiers =
>      Development Status :: 3 - Alpha
> +    Intended Audience :: Developers
>      License :: OSI Approved :: GNU General Public License v2 (GPLv2)
>      Natural Language :: English
>      Operating System :: OS Independent
> @@ -23,6 +24,7 @@ classifiers =
>      Programming Language :: Python :: 3.8
>      Programming Language :: Python :: 3.9
>      Programming Language :: Python :: 3.10
> +    Topic :: System :: Emulators
>      Typing :: Typed
>  
>  [options]
> -- 
> 2.34.1
> 

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


