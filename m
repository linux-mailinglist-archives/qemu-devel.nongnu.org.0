Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6D46E559
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:16:29 +0100 (CET)
Received: from localhost ([::1]:40612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFXQ-0000Bo-E3
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:16:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mvFW1-0007gI-JW
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:15:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mvFVz-0003pT-Qt
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639041299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cf5pf6EKUixjZTggCYp8nMj6L0Xv31iujI9Okk4o4mw=;
 b=g7iiIS5emRR/Vc+kaUV2OxgZj74p1FQ10pRU+/Sop0D57PQl4nlt6ns1fJVqBb3kMp3wm2
 njJPddf2GEmN+pqtZwmzF9VjkLSD83EvUvV0g1JXnM2B2yukLCOHnjNcUs1Swb9LiAM62g
 nW2E+irm33t74EGnOxV57d9FAaxqNsc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-0um4F-CWMpO0F0d__kDNKw-1; Thu, 09 Dec 2021 04:14:56 -0500
X-MC-Unique: 0um4F-CWMpO0F0d__kDNKw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so1185939wrc.17
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 01:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cf5pf6EKUixjZTggCYp8nMj6L0Xv31iujI9Okk4o4mw=;
 b=f0QHdUZoQIkTbRapCztFIsNeHslptpjAcEeweWFIpRLHXjY4HsRV5wQw5anotCycmW
 Pv8jX4r4BQKQ//KSt8mEXc5HPO4PnBfgNJ+fIFQYFpXKWempXlLvSRxzT11+EMMB8XU5
 pEioPFSvRPBKkdBXGc7Kqb5OVPQzGeghMhKj01s3XWlzPA9FwCYvrhxoJFEMsfWrzSrL
 JYDD8R6XzXcFEa9gsAA02AVPC7/kwUfvWgplEaIt8ji8wc23QJwhwQad/aSuPNEWP09H
 1L96UpO162HF56HrgB9X5mPuqcGFf7haELFp32xr5a2KM33i24ODsXgxXVyQMHY6ydzb
 tzbw==
X-Gm-Message-State: AOAM5320Q+PpazPJVWsKi5+xpiN+j7wRaH8H0UXB4dyCzqoxp4zP8Wpr
 n0UG74KDNrzvW0PqZPg8ZgULwT4zGEVDpn+MyUvEk5/IWn77hDX/1hkMkcu5SP4CtBXwbDgFdr9
 dNutuoxao9oFj884=
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr5221880wrs.126.1639041295751; 
 Thu, 09 Dec 2021 01:14:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwFAo0LyFxjJ/at+VUL8GtRoqVATZT8UWix+w4DJSToruWuYQFUL6/epYOc48hHb8lcMxIaA==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr5221849wrs.126.1639041295499; 
 Thu, 09 Dec 2021 01:14:55 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l5sm7109373wrs.59.2021.12.09.01.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 01:14:54 -0800 (PST)
Message-ID: <62461e08-a5ef-f39c-3b7a-3a9426c1b11a@redhat.com>
Date: Thu, 9 Dec 2021 10:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: powerpc_excp: Guard ALIGNMENT interrupt with
 CONFIG_TCG
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211208230650.2125095-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211208230650.2125095-1-farosas@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/21 00:06, Fabiano Rosas wrote:
> We cannot have TCG code in powerpc_excp because the function is called
> from kvm-only code via ppc_cpu_do_interrupt:
> 
>  ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
>  function ‘cpu_ldl_code’ [-Werror=implicit-function-declaration]
> 
> Fortunately, the Alignment interrupt is not among the ones dispatched
> from kvm-only code, so we can keep it out of the disable-tcg build for
> now.
> 
> Fixes: 336e91f853 ("target/ppc: Move SPR_DSISR setting to powerpc_excp")
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> 
> ---
> 
> Perhaps we could make powerpc_excp TCG only and have a separate
> function that only knows the two interrupts that we use with KVM
> (Program, Machine check). But for now this fix will do, I think.

If KVM only uses 2 exception vectors, you could guard the
enum in target/ppc/cpu.h using #ifdef'ry. While making the
include uglier, it will helps to catch vector misused at
compile time.

> ---
>  target/ppc/excp_helper.c | 2 ++
>  1 file changed, 2 insertions(+)


