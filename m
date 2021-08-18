Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7D43F03AC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 14:25:21 +0200 (CEST)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGKdE-00016o-Hm
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 08:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGKbb-0000AU-2Y
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGKbY-0002T8-MB
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629289414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6heZxKczG4bGoyNdf6Wdxcu7E/3BUWfkD4J5060gcNE=;
 b=g7WlmT+8kHEaJLbdpv2AJ0XGCNLrdiRM+bhz52FO/4moRXhZCnoWDJtWYkTE8m/Evhpool
 Kr3RiVQMVZAZPVLGUmlQIW0fGK/euTylqjra5112VVQUv96SYdntlw+ie/Z6lbhn8z6haF
 lDAJ3iZW1atceE+5kC0inn7YUHrASKw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-bsDEjMqUMkm0hv0hUpZ4yA-1; Wed, 18 Aug 2021 08:23:33 -0400
X-MC-Unique: bsDEjMqUMkm0hv0hUpZ4yA-1
Received: by mail-wm1-f69.google.com with SMTP id
 10-20020a05600c024a00b002e6bf2ee820so2170491wmj.6
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 05:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6heZxKczG4bGoyNdf6Wdxcu7E/3BUWfkD4J5060gcNE=;
 b=dh9KlB4ToFpJOrAwGPD6Pl8DIKC1mVGrzWKLpNc4vWnZvA4OGq/h1niLae6ACJRAfl
 lDWAv20hfADJI1gJPDSCIsD9DzNWBVMO1PHyZjRZM71HEdsUlB1+drJjXtdq4Qo6DjzJ
 GYu0oNqmcu5DSY2WlH6Bco22p4IJox5u63TYkY6GyD2TQjCzXWTCogjDqhOHP2buOjip
 ZRKDIEx+Uuo3a/KGrf7DuhAvBW/w0+g4zYF2mo1/uaIEKlMZpk0J73/dPjgMwmIeDpf7
 edqlAokRBO55r8tNCRkdhctyz0xTTtr3/0+GG4DkptN/kLP+a3k6EzCBwW0kEVIXp5iG
 aLgA==
X-Gm-Message-State: AOAM533A90U32YUm3JnQcPhj/2WcOgFgNt7lZR8wS54XBZzayXXO1m65
 LbRymxo+gK/j6TC2hkk5o3UE6OHRTdEP6JCWCk0vbqHYLUx1YBxQg+3Rt5Mj2R4tmBCbSAECjMk
 yqQ7RXEeRBU6KfE4=
X-Received: by 2002:a5d:6a4e:: with SMTP id t14mr10507410wrw.41.1629289412531; 
 Wed, 18 Aug 2021 05:23:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO0eJy1PDpm0IqzJpnOGLI6apb+v5ULcq9Hb1JsuguAvz6P4YUOUViIhcpqorFgMV7O0IS1Q==
X-Received: by 2002:a5d:6a4e:: with SMTP id t14mr10507374wrw.41.1629289412236; 
 Wed, 18 Aug 2021 05:23:32 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h12sm5042555wmm.29.2021.08.18.05.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 05:23:31 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v2 1/2] include/qemu/int128.h: introduce bswap128s
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210818110656.1993090-1-matheus.ferst@eldorado.org.br>
 <20210818110656.1993090-2-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <da437fb3-2a7b-b221-3d74-d5aba7911e18@redhat.com>
Date: Wed, 18 Aug 2021 14:23:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818110656.1993090-2-matheus.ferst@eldorado.org.br>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 1:06 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Changes the current bswap128 implementation to use __builtin_bswap128
> when available, adds a bswap128 implementation for !CONFIG_INT128
> builds, and introduces bswap128s based on bswap128.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  include/qemu/int128.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


