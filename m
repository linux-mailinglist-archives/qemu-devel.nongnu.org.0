Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7368A3392D5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:14:18 +0100 (CET)
Received: from localhost ([::1]:39670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkQb-0000wE-Gv
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKjo1-0003aX-De
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKjnz-00039d-La
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615563262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9FFzhQWqTUg1il6FN2MrDyWgZ/JgEoDGRCAYgsHyZw=;
 b=NIh7FRayg3NkTiPFCXxvo5Pow7Se4svjjYL/wl5X/tzgt2Nskpb1bW2DnJc5cSQ1C4Ttd2
 Q2Y6HQeW0qcgJnCu9+NEvZE9cUziKUwK/sRAqZaSiYM670vHqVO5udG6IBswRdVqHjv6Ck
 frH+A+xHSVWFGQ7TcxMzHwGyNDdnVVo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-lGHaw4hENSqeBhefV4Xryg-1; Fri, 12 Mar 2021 10:34:21 -0500
X-MC-Unique: lGHaw4hENSqeBhefV4Xryg-1
Received: by mail-wm1-f70.google.com with SMTP id a3so2179012wmm.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 07:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g9FFzhQWqTUg1il6FN2MrDyWgZ/JgEoDGRCAYgsHyZw=;
 b=alV3FPMQGyrsW5E3Xo6NNvGGiiF7nazgy0QSU/KRHkg9AZ6jq1QlRE6AuaCL9kPcYH
 K+/wXjQ6rD8huoJ4/hqZR6Kuctgs3jU0g/7Eiq6XPq7Eg5CUi5TMdQoIKRD62/2aOQ4f
 B4pXz0a2SS6+dcoB3mjXHqwDQ3f+pxavJyJNSeMIUqW1IenKmTD/C9Dz/89hP6gAbbFV
 R4ETPFLfvP0LxA+XtoXFPt3Ji9vAlNzwPlpotU9pQcRkxPBotACsByCaRNNZPW9F12DI
 biIE15GV0yZBXqqR3VQAfBoiL/PW7Ka8ePKXicaSC0rDb7s3NKWr8cI3p3Q15qNSdtGa
 cz1w==
X-Gm-Message-State: AOAM5312Te/DHVDPqku93YZhtU1NeLufVdslphuvLjYYEgXvgjwriy7G
 wWUcTCsJ9DbhHWNQ9mNdm9mGezCgoTe/CgS2nII6x5DYIBymyZvSka1BoQ/GNaS6hoRney8aUEL
 W3KYQ4jpJQgrKEKQ=
X-Received: by 2002:a1c:a7d3:: with SMTP id q202mr13527168wme.93.1615563260080; 
 Fri, 12 Mar 2021 07:34:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjwCcJT5T6KeOKlF0z3n/5uJ7jl3cKVnOmFhyaEZty6dwWlMI/VON1DzGq072jIcdHwEszrg==
X-Received: by 2002:a1c:a7d3:: with SMTP id q202mr13527161wme.93.1615563259956; 
 Fri, 12 Mar 2021 07:34:19 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j30sm9412322wrj.62.2021.03.12.07.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 07:34:19 -0800 (PST)
Subject: Re: [PATCH 05/27] ui: factor out qemu_console_set_display_gl_ctx()
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
 <20210312100108.2706195-6-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd67f04b-8f94-7cef-0a76-13b2c9e84876@redhat.com>
Date: Fri, 12 Mar 2021 16:34:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312100108.2706195-6-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 11:00 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The next patch will make use of this function to dissociate
> DisplayChangeListener from GL context.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/ui/console.h |  2 ++
>  ui/console.c         | 21 +++++++++++++--------
>  2 files changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


