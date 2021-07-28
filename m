Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1AF3D8D4B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 13:57:35 +0200 (CEST)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8iBq-0006af-9u
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 07:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8iA3-0005qD-Bf
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:55:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8i9z-0005VI-Jd
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627473338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwONRxaME430gHNeuJ9akxVDm1QINz1mfpQr9KwOR/8=;
 b=ONLDmZao2ZuGaCldjBcGbAkrNDXEbPmx0cVGcmsTckCawTtBG5Qgj0rKg041FDdMnyrJbo
 b+KXlqtw/QxmPhgZ7sWW2W/Zec+002bSwEX41U1PrxcHA9wJ5V/GfLTk2ZIdSNKejpJhye
 VHfoTD+2qdfOD5Xa2aYTxblZ/YiQ9UY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-eSXXWGjIPUaes9uNp3exBw-1; Wed, 28 Jul 2021 07:55:37 -0400
X-MC-Unique: eSXXWGjIPUaes9uNp3exBw-1
Received: by mail-wr1-f70.google.com with SMTP id
 o8-20020a5d4a880000b029013a10564614so853016wrq.15
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 04:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iwONRxaME430gHNeuJ9akxVDm1QINz1mfpQr9KwOR/8=;
 b=Qad6HOlyqlFYaELiQcZm+n0LiSSQPj0RM1yGyr4iOTGr5EvM7BwF8QnpfJK1KubGm9
 SwWSdwAL6IHNVak4T1yv4EDXuGBw/5zsXgQC5aQsbuZZ4NmKND9Kmr+0TqRSyHUAgWDZ
 w3EL/Z4zRK/orUS+e0tt8bpwxoCzqNON7bEsSWDFVF1PCYfNmzNWaZH1CJvW6oePPSIV
 sxV8Ru3pc1UwiKDfKTnbFie3nomx5+/EfOIoV34MHIwrd7jLwiLpcnMSeNdYcmUMF2R2
 ddUK5IkyGBv8Y0L23wwmoP998ETAt4By0rhYaSKM/IbKdYS5Ksn/5s5tf0HCXihkL52s
 uYjg==
X-Gm-Message-State: AOAM531bFg8u9Ua+lEpLBFEbKS2HvYu0j9H2qdY7w18gHgWJqaymAZEX
 AQzWA/Mw2yiVaO6QqHyXqsUZLJCZmDE1h/DwS46sbCeGuxG5sLOyu/PB5sDCjUEpiNrWTdhoNEy
 IIYtjWSEslWikN0Q=
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr27239473wmk.51.1627473336032; 
 Wed, 28 Jul 2021 04:55:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS7zgJ+uK1vTjkiqZlWM3Pms71kFwPpUdLu+xjMVmXdUSp5tYBrJdnmcDbtr/45WRI28mP5w==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr27239434wmk.51.1627473335495; 
 Wed, 28 Jul 2021 04:55:35 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id 18sm5815179wmv.24.2021.07.28.04.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:55:35 -0700 (PDT)
Subject: Re: [PATCH 2/3] ui/input-barrier: Move TODOs from barrier.txt to a
 comment
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210727204112.12579-1-peter.maydell@linaro.org>
 <20210727204112.12579-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1923b2b9-d9a6-c32a-2bb7-6bdc20cab92c@redhat.com>
Date: Wed, 28 Jul 2021 13:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727204112.12579-3-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/21 10:41 PM, Peter Maydell wrote:
> docs/barrier.txt has a couple of TODO notes about things to be
> implemented in this device; move them into a comment in the
> source code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/barrier.txt   | 4 ----
>  ui/input-barrier.c | 5 +++++
>  2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


