Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6033337BC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:45:31 +0100 (CET)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuTC-00053J-D3
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lJuPu-0002YK-Fm
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:42:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lJuPr-0003vq-SD
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615365723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BMpvUs3HEJzNyg+qSNzj74ZjhwLgxBOtPVpDKetxNYw=;
 b=ICSK/wjnKtegmArIam9nnJX+fUsq6r1asP8rXz0b2U7vmfi8+URf4+5HNytcLl16o7ruO9
 KgFgkaHSsmZo5PC1qIwXJ0GtaGdkzMCPnHTdjfCau4JbqGLAVSjOGOK46FeDOMwk1hMfgb
 pQP50KRiX//zTzPp1jWnac6SEsQWM+Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-1vpTDhwQOVOyKUeRN__twg-1; Wed, 10 Mar 2021 03:42:01 -0500
X-MC-Unique: 1vpTDhwQOVOyKUeRN__twg-1
Received: by mail-wm1-f70.google.com with SMTP id y9so863420wma.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 00:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BMpvUs3HEJzNyg+qSNzj74ZjhwLgxBOtPVpDKetxNYw=;
 b=QNcSgbxtks1nW35HdZGOwj9mrKGOEQ1DPomvE3ZzuUGDHrjiHNk7Hwo7ab8potolOu
 HF4CygCpWyWMFLnLzJy40ZOAV8vMrY57Vhs3A+0ytHnj9zsondswhCZ4ejz6+wAvR1om
 /8HSnwHXict/JLP7AhERGIWtY1V9EmF4CP2cXWXbvMV+l5+xjJNC3fzOfAfELIPD3F9p
 ZHwAq3oRA390m3WWtkt8Kvo7iYKfISWBPEMxDpycbSrmBVdB34iTC/AxJufIwjAN7G09
 Dw3pFQ+HlA/bMAvfRSk/g4swp/Xooi6Xxsrclf8SmQpO1GyMvhMg74kyBbL+YxZVxFNt
 ta7w==
X-Gm-Message-State: AOAM532QpunPTOXlF9rLTpBDNczKUj35dBjO1CctprVE14bMJOH5exWI
 8WJa/VcuU9nJNAB4U4X4xP6wym8uApdIJc1Zj/X/76tPtdwVFONnXNI8PMn/t15WxzrG6JYRNN7
 psz8ZL4B+5AMe2yU=
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr2258437wrz.11.1615365720591;
 Wed, 10 Mar 2021 00:42:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFxg9ZMrFGDR1b5mXnWDx8LUzHyVJ0YlqLcF8LuAX1YWdyjO7zPUaupEfi47WUtAPC6oP4Ww==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr2258419wrz.11.1615365720434;
 Wed, 10 Mar 2021 00:42:00 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id s18sm24357606wrr.27.2021.03.10.00.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 00:42:00 -0800 (PST)
Date: Wed, 10 Mar 2021 09:41:58 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 3/6] net/eth: Initialize input_size variable earlier
Message-ID: <20210310084158.56mdl7ekqfijv76g@steredhat>
References: <20210309182709.810955-1-philmd@redhat.com>
 <20210309182709.810955-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309182709.810955-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 07:27:06PM +0100, Philippe Mathieu-Daudé wrote:
>Initialize the 'input_size' variable earlier to make the
>next commit easier to review.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> net/eth.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


