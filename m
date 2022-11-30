Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B765B63D3B8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:47:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Kbo-0001cb-P9; Wed, 30 Nov 2022 05:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Kbm-0001Ys-58
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:46:30 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Kbk-0006BO-LN
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:46:29 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 i81-20020a1c3b54000000b003d070274a61so629108wma.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vsIHot7p+gI0Af7RvqMEDCnEIsJsHecZ8nVCVFEL558=;
 b=JetyPDNZzBJnqMxApjkVdhz+bvHagFiCMFkGig6WziKxsj+BeK5bpt4fqBsELwH9E3
 0WkbUWRbv594YYz3MM5NmG9tSycRbOEeW1gd5OhqNQGslpUbaQgbx1zaKO25gG5vpvK5
 F8fusFacTQk5/lDXE8Jy8d8VknFbYCEGvJJPG6cLHV9KyU7AftqVf6J9+2h9nBoMcgkD
 33GnC6nUekkNrNWpYe/+wdniHLHr0y12MWNhzgw0dJ8KQXcug0PU8hYvJCYEOIRS8D0f
 HO5KIVXMLvGJWZ82M6j9RrEO9JYgt68xam6mS7l9vjLes++nErvP4oHeODuvkhkSvdzZ
 1/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vsIHot7p+gI0Af7RvqMEDCnEIsJsHecZ8nVCVFEL558=;
 b=Bp2oc6WaTlH72Baz0NXZI4yp5Qn8H4RK2Rgpjz1Us4tT7fcbzVITRGnnT7FDhBc2Xh
 3BKv7HTBf1ppx+wY+0G5GLOmR2L1RKj3CYE/ghJaHI922mqbiceSOh4ay/1Gen78ZTyB
 l/eYRIB1e63pHSkrsAyCXpdZhPoiJlIjMRzoJpbf6x546JQxznQP5qdurQYOlbKtJm/g
 beERsafCyufUoQ0zbZBGHhZUEn/g1wx8zGiNiU3gbQcevPX7keHECMHUA0UjvA5WKh5P
 3o7HQ8UktyGnmFO5hUisF+2jEXXS/lvAp9qPbXhB7A3YitbhtoiYzHLLPH63FaXVs8n2
 0R2g==
X-Gm-Message-State: ANoB5pkoUEDzdPE4Mw6bq8fm2cNTTC0X3sHoFpx/BBkdpwQBeZhD+3eP
 9L0xhlsZw8DYwKPEK+zEyRc0Dw==
X-Google-Smtp-Source: AA0mqf4Cb0GCuuQXh9i44+xFCi5U3qMubokMjeC8qgc9imAfKf1jFZ7v42lERJ3BOX9G3TKC1szUmQ==
X-Received: by 2002:a05:600c:4f82:b0:3cf:aa11:9394 with SMTP id
 n2-20020a05600c4f8200b003cfaa119394mr32241565wmq.183.1669805185919; 
 Wed, 30 Nov 2022 02:46:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b003b47ff307e1sm1569605wmq.31.2022.11.30.02.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:46:25 -0800 (PST)
Message-ID: <4aa658f8-4c2f-c3a6-bc39-0d0aafdc0cb2@linaro.org>
Date: Wed, 30 Nov 2022 11:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 2/7] hw/display/virtio-vga: Convert
 TYPE_VIRTIO_VGA_BASE to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125115240.3005559-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/11/22 12:52, Peter Maydell wrote:
> Convert the TYPE_VIRTIO_VGA_BASE class to 3-phase reset, so we
> don't need to use device_class_set_parent_reset() any more.
> 
> Note that this is an abstract class itself; none of the subclasses
> override its reset method.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/display/virtio-vga.h |  2 +-
>   hw/display/virtio-vga.c | 15 +++++++++------
>   2 files changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


