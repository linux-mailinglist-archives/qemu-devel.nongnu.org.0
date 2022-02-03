Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD624A7FE8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 08:38:25 +0100 (CET)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFWhD-0001rg-RW
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 02:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nFWWJ-0007uP-AB
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 02:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nFWWF-0004Bm-Db
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 02:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643873220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DXcTQx/rA3s+fT1k5T0A+hE6V+96fK7bFLzrVF7JGQc=;
 b=XOVZobEw4VRPW7mptwlCQgqCcQETK0X5l5sTByjwIUdd6RX3EDBiaJaY2vmY7WZx1yZcJo
 x3muR8BJ3EeYk910Pn0qxOxlufWSQqMSbiYGV02V2Mk5TEfdhj++6jBa7DVP1CmeStqrw6
 RYYMLTao64VZpcJFM7BapFbP7BX/5Pk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-szY6poNXNxeroS0GcskjCg-1; Thu, 03 Feb 2022 02:26:59 -0500
X-MC-Unique: szY6poNXNxeroS0GcskjCg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b0035153bf34c3so5429684wms.2
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 23:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DXcTQx/rA3s+fT1k5T0A+hE6V+96fK7bFLzrVF7JGQc=;
 b=tAqmuY50yxa26AS9XE9w0DhQhICfEP2RKeCTddZqhPWoHQWTud9Hj66ImQB5R//NGC
 KiXFzeLXH8GdbiqRERPNzp+xgT1z6xV+mdtIIqwFpNBZnbqKPVdl9h+k/f+bt3aEIkXq
 6WVB7x5AtSNMsLmumB6gcBTGs0Z2bt2UcG/ZvpZMi9qvyZJ5mFF09G1/7VBtzeZu7Y5E
 TYF8uXk/bjac7pgMjjwHTt6qOxKddRgkTbqMaBAiRdCW3YtpaPNZHokQW2K006alNfj7
 b7maFVpMJKoUaBhElLKFYVRJOAk4bx9wcNfMFSSNBrAqaqMdBNU+n8fwHBt19c8FNsbl
 NvwA==
X-Gm-Message-State: AOAM530JkxpKYnjQTpqeGMzjhD8g3zEar8h4Q6oJ6GR7ie8t/Hv2y9Im
 T+Ahs2iMvcJv9TEW0sFu8emImIR/0Tai/NMxIcPUMBnuggVLye8DRo5G4qd4uBNa1AVqt2ilS+t
 f4msrkASmkxCR6+8=
X-Received: by 2002:a5d:524e:: with SMTP id k14mr27206960wrc.294.1643873218202; 
 Wed, 02 Feb 2022 23:26:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGD++hpmWpaphZxrKKt93OmAb7jTD7RMMkpqQuIuQ34CuTl1tOrdlkmHRv4fkJoCuGid204w==
X-Received: by 2002:a5d:524e:: with SMTP id k14mr27206942wrc.294.1643873217911; 
 Wed, 02 Feb 2022 23:26:57 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id n2sm14722842wrx.108.2022.02.02.23.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 23:26:57 -0800 (PST)
Message-ID: <50a980af-f67d-b093-4a62-d8b9806898e7@redhat.com>
Date: Thu, 3 Feb 2022 08:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] qemu-options: fix incorrect description for '-drive
 index='
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20220202143422.912070-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220202143422.912070-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/02/2022 15.34, Laurent Vivier wrote:
> qemu-options.hx contains grammar that a native English-speaking
> person would never use.
> 
> Replace "This option defines where is connected the drive" by
> "This option defines where the drive is connected".
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/853

I'd prefer:

Fixes: e0e7ada1d5 ("Update documention with '-drive' usage")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/853

but anyway:

Reviewed-by: Thomas Huth <thuth@redhat.com>


> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   qemu-options.hx | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ba3ae6a42aa3..094a6c1d7c28 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1377,7 +1377,7 @@ SRST
>           the bus number and the unit id.
>   
>       ``index=index``
> -        This option defines where is connected the drive by using an
> +        This option defines where the drive is connected by using an
>           index in the list of available connectors of a given interface
>           type.
>   


