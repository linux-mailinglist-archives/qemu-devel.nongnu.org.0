Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEA0475703
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:57:35 +0100 (CET)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRyY-0001eL-QJ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:57:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRbX-0005S1-Oh
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:33:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRbV-0007SW-RV
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:33:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVsq4vQRp4gnLdmijyN4t6GqqgCnvn13DaFM3wrmniM=;
 b=LQOXW/wT0p+drHwDLdx2IkuYTyiiBox9fy4EgNLcHzJbbDU13DAiL4SbgQoRn3SabcBJip
 Rjxe/GnrZadQrSHMIr3m06smVvhmSi+DB8zzKr42XyseeT/2pgqpWx0p+2W0s7zgYciwLk
 J3ThmMEBwJivPeDEbICD8yOjEPN/ZZA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-X5cn7AlTPIeANGfhMIEnRA-1; Wed, 15 Dec 2021 05:33:44 -0500
X-MC-Unique: X5cn7AlTPIeANGfhMIEnRA-1
Received: by mail-wm1-f72.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so12415274wma.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iVsq4vQRp4gnLdmijyN4t6GqqgCnvn13DaFM3wrmniM=;
 b=YC618HdUG39DMJhpixj3QcMc1UFDObRv2BuidwL2g/5nRIyep+iBevBM4pBD8zS40x
 /nKZPnRWPcRPCvFbzX6OTj9Zdynl/81vC58zsNzOkxrmJKmczYjtHi1ZGBwZRyORgRWw
 Bhn3z54yd8V3w6cJqXvxpgHRAH1E5jB8XAOMh6SmMhbBIFarU+F+QUuGnb09V8ZUFRKF
 qtauAIqaJ7+t2OSbXkn/3hWxY6U5VRL93xAdK4DQK4XjWITDApe2zyfEck2i4eAbHHht
 kC9d0HHmCqV9KySEyTtS6UV4oRllUXrIpmdXbqOv72/3AGb7WXeFRUyO8o5FY7rgzBMr
 Z9nw==
X-Gm-Message-State: AOAM530kYncET5V1QsAP9asaPCv4JmU76a3OMqm9KMb8YIEF7orfSOwI
 NKAx9jVG5K3GxBO6F+qYtaR+TlUSNPSngAEVKSnFg+L3sEcV38BfD3Z1E08BxMJxWK4jYQeNbop
 c/lCmbyuAULx6coxsYeC6LtnWvHRf7lpZX29wOjA1u2SL5KWZrmADujHr6SjawXWP
X-Received: by 2002:a7b:c357:: with SMTP id l23mr4047464wmj.35.1639564422539; 
 Wed, 15 Dec 2021 02:33:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjJVIlpBdQMKXbg2tX1zx2FwnucaCxS4KLdwS0iaWjnYLfQnLikPXUkYlP8vCcf6N+GFx80w==
X-Received: by 2002:a7b:c357:: with SMTP id l23mr4047444wmj.35.1639564422285; 
 Wed, 15 Dec 2021 02:33:42 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n33sm4698083wms.46.2021.12.15.02.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:33:41 -0800 (PST)
Message-ID: <f64cc438-eab1-6409-3d7c-18b0b49fb65d@redhat.com>
Date: Wed, 15 Dec 2021 11:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2? v2 0/5] docs/devel/style: Improve rST rendering
To: qemu-devel@nongnu.org
References: <20211118145716.4116731-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211118145716.4116731-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 11/18/21 15:57, Philippe Mathieu-Daudé wrote:
> Various changes in docs/devel/style.rst to improve its
> rST rendering (around C types/qualifiers/functions).
> 
> Since v1:
> - Addressed Darren Kenny comments on function names
> 
> Based-on: <20211118144317.4106651-1-philmd@redhat.com>
> 
> Philippe Mathieu-Daudé (5):
>   docs/devel/style: Render C types as monospaced text
>   docs/devel/style: Improve Error** functions rST rendering
>   docs/devel/style: Improve string format rST rendering
>   docs/devel/style: Render C function names as monospaced text
>   docs/devel/style: Misc rST rendering improvements
> 
>  docs/devel/style.rst | 222 ++++++++++++++++++++++---------------------
>  1 file changed, 113 insertions(+), 109 deletions(-)
> 


