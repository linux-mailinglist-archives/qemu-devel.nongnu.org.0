Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCAE2B83B4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:20:40 +0100 (CET)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfS4N-0008G9-Sr
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfS0L-00057g-Hx
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:16:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfS0J-0001od-GV
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605723386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Ui0hOp51J0M8aAVaLj92KIM+lt6qlAfbuztdbsUGrE=;
 b=PhIRGTkncHJ7NCPoVHv002OBCboq77Vikf1I5v8oOQs2Sl60KXCqzMiE1GSaODfg+iTwMR
 0yYTDBb5MRuEyHlsxKuZa46rMOlKR48r3NlkZu/WCaNwbyzEK1LTbl85/Fx7vIGq0S5PTZ
 +vi9rWk/OJombhO8ho1VNVUbTR+qqug=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-c9qmU4IAOwy3BScgL82Wag-1; Wed, 18 Nov 2020 13:16:23 -0500
X-MC-Unique: c9qmU4IAOwy3BScgL82Wag-1
Received: by mail-wm1-f70.google.com with SMTP id z62so2934398wmb.1
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Ui0hOp51J0M8aAVaLj92KIM+lt6qlAfbuztdbsUGrE=;
 b=TzQUGfgA9LcaLrtbRE+zwm7W2m8COt+yp3lNFGLtUCQ5H/f/1C4lfoSi3kejnF+yf1
 mpV3DQ/2Z8pUOIVLms0OfTEjFgRYMDQKYeDw0nT75ncNItYjwx+FInEay9lRs7QVTIjb
 5a2WbbwWvIUQeXNQz+kpA0X5GVOqcSL9p/EqXj1VXR044ouhI3lT8Amox40nC1aUhAhj
 AQ4zv5L5qxHl7+OfXOrBRzn3WPYjAd5N8TnZRubTeUAiRxVhplUJA2XVHL935yKa/TrK
 FP3I5DnAHvtkhTX2X9MwSo/njo0a/grXNVXuEnwziXFWNXosL9yFfxNTOu6CZbl0Hz83
 NtGw==
X-Gm-Message-State: AOAM532VcqjCrW8ZA8BqxkYBxiE4QoX4FehX6ZIDjMDCEKzG2DUwNdBT
 EUj2d5zdMx3piGJslZoP3SeTnG72fYJENHr0dwkiZCbFONfAs+P7ql0GXCN+k5Wz9xChjcqjkHV
 1t53x0Eu9+qkbcPo=
X-Received: by 2002:a1c:44f:: with SMTP id 76mr331434wme.181.1605723381957;
 Wed, 18 Nov 2020 10:16:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+BC7MdOjaWYwIl5XxbiacKtEb7g0TuCzpEpc82HcCPdg3b687yd7FRxHwOc9t189r/BoMxg==
X-Received: by 2002:a1c:44f:: with SMTP id 76mr331417wme.181.1605723381747;
 Wed, 18 Nov 2020 10:16:21 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 90sm14369239wrl.60.2020.11.18.10.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 10:16:21 -0800 (PST)
Subject: Re: [PATCH 4/6] configure / meson: Move check for sys/signal.h to
 meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <62372a20-98a1-2b91-f255-d651e0fa3573@redhat.com>
Date: Wed, 18 Nov 2020 19:16:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-5-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 6:10 PM, Thomas Huth wrote:
> This check can be done in a much shorter way in meson.build
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure   | 10 ----------
>  meson.build |  1 +
>  2 files changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


