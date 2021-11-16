Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE150453652
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:48:02 +0100 (CET)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0gj-0003UC-MZ
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:48:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn0dU-0000th-Rc
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:44:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn0dS-0006RJ-MX
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637077478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0jaS5NnLU2y2rH+Akjnuy87QudZHC1HNtZsAd79WgF0=;
 b=HVxL9WSsh+G4T73oO30H1qn08dZq1w7m7+nPqxs9Hs5dRjW+G/lNPKK616MPdsQVrW5ZGK
 5BKRb9TlfNW/F55mGrvwEVseJfM9Ag49H9vRy86WOIzkG0C2yx8TFfpLvIsO3INonuMhLs
 8hj38xXyfrnidcUrIhepJDTj2PL8idc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-Odblm0gdPbGXbybaG1gl5w-1; Tue, 16 Nov 2021 10:44:36 -0500
X-MC-Unique: Odblm0gdPbGXbybaG1gl5w-1
Received: by mail-wm1-f72.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso1381179wms.4
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0jaS5NnLU2y2rH+Akjnuy87QudZHC1HNtZsAd79WgF0=;
 b=CWvg4UG9YOwM9xT7a1EI+5tQa8Ok5JRLS5YSwaW4bdMbNfVaDBuGRH8QGBSWJaEAyl
 S4rdCxf/sfC4WIhqQ1JfLcivoHFEKlWLq6OIQ2LclAO3bZAA/JDQMThJdc6nG1PF4pqH
 AScAVg3PKPZJ/TUKu/9Cq6EV/GF9qWZ/u/AXbOexfobBofgBPAyEtl8xtbnIcCJUmqs5
 V6Oytlk8w08MMMMY/mDf4DWlac9pemV8HmKRbSb1nP14FPex80tPlz91/pL5qXTJ7hhO
 w0Gxre6FyJ+uKPYD8siNsmSuWC4vd6cgdsnE5fNxlRk0ZiztNMSdx1sMi3z+4Pc0koVa
 tR0A==
X-Gm-Message-State: AOAM531fLwUQ7cTYNINHI315EmqFlicHgQz/hE2WK4uBoT+DrMa6DxHb
 yP749VSUjkTLhq5dB/JWBynZUMSersSrn4B2UaWg6Ps291Fa8kNyjMMP78xpYCP9OhqcvL0nxzZ
 CPvatuNgQhJpYPGo=
X-Received: by 2002:a1c:9a4f:: with SMTP id c76mr68760959wme.162.1637077475348; 
 Tue, 16 Nov 2021 07:44:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyspmeiKKEZh/HtDB91hgjruiM66Tostnm5O3AKEUj0MjOeAOGgrj8uCb6jKh/I31M+ahQyIw==
X-Received: by 2002:a1c:9a4f:: with SMTP id c76mr68760934wme.162.1637077475142; 
 Tue, 16 Nov 2021 07:44:35 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t9sm18804873wrx.72.2021.11.16.07.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 07:44:34 -0800 (PST)
Message-ID: <b0ad5a1f-3f5e-7252-5e4d-d7b4b5ea3aa8@redhat.com>
Date: Tue, 16 Nov 2021 16:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] pmu: fix pmu vmstate subsection list
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211116150837.169291-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211116150837.169291-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 16:08, Laurent Vivier wrote:
> The subsection is not closed by a NULL marker so this can trigger
> a segfault when the pmu vmstate is saved.
> 
> This can be easily shown with:
> 
>   $ ./qemu-system-ppc64  -dump-vmstate vmstate.json
>   Segmentation fault (core dumped)
> 
> Fixes: d811d61fbc6c ("mac_newworld: add PMU device")
> Cc: mark.cave-ayland@ilande.co.uk
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/misc/macio/pmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index 4ad4f50e08c3..eb39c64694aa 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -718,6 +718,7 @@ static const VMStateDescription vmstate_pmu = {
>      },
>      .subsections = (const VMStateDescription * []) {
>          &vmstate_pmu_adb,
> +        NULL
>      }
>  };

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

BTW I ran 'git grep -W -F .subsections' and couldn't find other
occurrence.


