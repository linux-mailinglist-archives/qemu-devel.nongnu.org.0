Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181674F7B87
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:25:03 +0200 (CEST)
Received: from localhost ([::1]:57556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncONy-0001ZE-4q
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncOJK-000726-HR
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:20:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncOJH-00063B-Mm
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649323211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjmfgxCSyCDwoSAYgSqvWw6A/SgpSQ8PIQ7RRYBd9vk=;
 b=H1YgIBUPDjwSC//S9q+QcPWlX2M9p+V2FzN2WeomSP7LzYOATRIBqw1IzYm9o5mb9jq3c/
 /RW1reaVfjpHu9NRbWaSHpW0XmH1rLKaO1rzpXi5JIR0Ei81XeHG+kWz47KKYgWEjht1/z
 XoHVVxEeLmKaTYR8Rij05/fHOmi/5AE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-gvr4u9hpMxCz4IEMoDvNnw-1; Thu, 07 Apr 2022 05:20:08 -0400
X-MC-Unique: gvr4u9hpMxCz4IEMoDvNnw-1
Received: by mail-ej1-f71.google.com with SMTP id
 mp18-20020a1709071b1200b006e7f314ecb3so2697493ejc.23
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jjmfgxCSyCDwoSAYgSqvWw6A/SgpSQ8PIQ7RRYBd9vk=;
 b=bxtd3yic02FsC5wEsahHVDLF9AZ/5o5470giFbrv49qLAEh+W7Qk6tznPClSFqeN0P
 qkLB1D2WfUmciPBVPJm8Ty6qymYZ/MwAQitGFhZtQerNwRJMa8V05bUj6p8n8xp3+s8d
 eqRtQWYpkD7mIxxc0C44gwxhVL43qdrGs4UP+pGe7hBZENfRqusFekTKYhlBezHHmIQ7
 28zt0dylRT9Q8m4PvGgYHBe60ug2keUYlRRWrcSp+4wNliOswcfGX7LWKX/U1HASYxrS
 ESLeZlVDAMog9BMn4CgGs5m+aRyZMDBA+RSbGpguCQL/EOJ00ZVusCD8PVHjngXabJWM
 SsxQ==
X-Gm-Message-State: AOAM533mnwjZkQmdoPCx8lo0fEur4rhbCFrUsnjbF3BDayA3Y5jRPZdS
 DMUuVHAx6WfTavggVS+MDcyL7hMi5AkxUp8ZM3wFym9ahw3fEHExCDmVIIlPw4MsgP5qEaDmw6g
 PTegv7BakHPNpo+I=
X-Received: by 2002:a17:907:9703:b0:6da:6412:508a with SMTP id
 jg3-20020a170907970300b006da6412508amr12294603ejc.77.1649323207090; 
 Thu, 07 Apr 2022 02:20:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9fFA51YW8u96Ecxvo7nXQvTgcbvbqoJTxqAxcEFtnS4a/9l3P0OjJvyR8VT7VESAscky7fw==
X-Received: by 2002:a17:907:9703:b0:6da:6412:508a with SMTP id
 jg3-20020a170907970300b006da6412508amr12294577ejc.77.1649323206824; 
 Thu, 07 Apr 2022 02:20:06 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a056402510e00b0041d0c0942adsm289273edd.52.2022.04.07.02.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 02:20:06 -0700 (PDT)
Message-ID: <4dd5129f-61ed-c8b0-81f2-072ba9246dfc@redhat.com>
Date: Thu, 7 Apr 2022 11:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/7] util: add qemu-co-timeout
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220406180801.374844-1-vsementsov@openvz.org>
 <20220406180801.374844-5-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220406180801.374844-5-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.04.22 20:07, Vladimir Sementsov-Ogievskiy wrote:
> Add new API, to make a time limited call of the coroutine.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   include/qemu/coroutine.h | 13 ++++++
>   util/qemu-co-timeout.c   | 89 ++++++++++++++++++++++++++++++++++++++++
>   util/meson.build         |  1 +
>   3 files changed, 103 insertions(+)
>   create mode 100644 util/qemu-co-timeout.c

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


