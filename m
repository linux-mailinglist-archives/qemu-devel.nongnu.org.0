Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A15476D2C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:15:15 +0100 (CET)
Received: from localhost ([::1]:40490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmr4-000602-DJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:15:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxmn4-0001fq-Cg
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:11:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxmn1-00076S-NX
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639645863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJsBgMPSf6FuJRu5DveNnScZjq3o/Rvu1uGGhwFoWTw=;
 b=KzutOwih7d9QC2xC1jmTJ1IHZUV87rfDBENzlgNrodI3WKXhAQ0eTbFczUKLDeS2wm4ong
 qm9mIxjh60sSbuPmyB63QO8WNPG1mP2cEUbb1L1savNH2qY9d2IsZ3iykDrS30izZx2DjD
 TRTHYET2YoJThM7nqaQdxhZzE+K9EPU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-fWGMltGJN_CJkREPQwaclQ-1; Thu, 16 Dec 2021 04:11:01 -0500
X-MC-Unique: fWGMltGJN_CJkREPQwaclQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o4-20020adfca04000000b0018f07ad171aso6701595wrh.20
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TJsBgMPSf6FuJRu5DveNnScZjq3o/Rvu1uGGhwFoWTw=;
 b=GdvF5WXnW6L3vcN4/ehb8JZ4PyNLG6Iau86JcRiBYCaxEleYLxq5EpHa8LJZkHJL/j
 PcgmKDpFpG0XTmt7czh6A43SrdSoHoMfuASDYZsJ8vUj+RSSwcuXWh7N8pxfT3nVr8g5
 FrDGhR1GrKUeY/VhdIC3Z8ISWl34Yf7kpl8FhFZUfR2fqCZCTiHwFE+z40z7D0iej3EL
 DSGxb6Cpzh/lH3gEWY/VCJQcsNrlpJb4zc6DSmFpvuUoVmaVAb76nAUN3HyZUbXPwJ4L
 RYhC7EEDIi6RgGZmEljT55tGEPphkzYjvgdPIidwAEUsWLnA+sDgKiA2fjmrPj20Cweu
 VZog==
X-Gm-Message-State: AOAM531YmtPQGxdjaKMgtRocxRptHA8iWii8Ts3AI4bJ6j2doH8TeXuY
 7Ec6cfkyojIzMQ+T+Oi9OnNqNd1tNDT44rECRhRHb8ydkeYplz19bRlT5k41B6Cz5RFljDJN+Zp
 rq8X+aOMUq7wdzh4=
X-Received: by 2002:adf:ba0c:: with SMTP id o12mr8075560wrg.452.1639645860640; 
 Thu, 16 Dec 2021 01:11:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQ5fTy0fFdJL+cWp+x0uacyOXAM558wfsV/cNxWLfZODBc01FNfHVXZm0ScZDqS5Yx58UJ2w==
X-Received: by 2002:adf:ba0c:: with SMTP id o12mr8075552wrg.452.1639645860427; 
 Thu, 16 Dec 2021 01:11:00 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m17sm4172225wrz.22.2021.12.16.01.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:11:00 -0800 (PST)
Message-ID: <2bd56fb0-0c9d-fe62-dfa0-db103c0e82ae@redhat.com>
Date: Thu, 16 Dec 2021 10:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 08/10] meson: rename "arch" variable
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-9-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211216085139.99682-9-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 09:51, Paolo Bonzini wrote:
> Avoid confusion between the ARCH variable of configure/config-host.mak
> and the same-named variable of meson.build.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


