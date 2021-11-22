Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67016458E18
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:18:41 +0100 (CET)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8HQ-0000Jr-BF
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:18:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp8FO-00075U-48
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:16:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp8FM-0005FK-1a
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637583386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7RpdKzZGHJZ5YHDhLfbZGvNHvwjPnMxN0RW8cyz58uE=;
 b=iIGaJZAM3YfePWEnweY7kIXhon91IT91V5mOu1eB18HtBieqZT/lUf1mV/9q8mHNlOU7sn
 iN0qSE5mKlon5pYvOvXmneWXTuVCyQhV7/Ouz1jDjOsOL2gg1+WzP4ehRW9K+fL3w8rMdu
 R2kKhMQwtgv328UsTPekcl0V7qsJq8A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-109-PXt5A4zxNsizRDcjd_Y1FQ-1; Mon, 22 Nov 2021 07:16:24 -0500
X-MC-Unique: PXt5A4zxNsizRDcjd_Y1FQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so10094406wmc.7
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 04:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7RpdKzZGHJZ5YHDhLfbZGvNHvwjPnMxN0RW8cyz58uE=;
 b=t/8f5yyXqWokQaXoI83jen5SBqBjBrn7M8DDUzOS++IjfHnEzNiQrAZQWPWGJf3PNC
 TUxz9P9uxKmAlpXGB/zp50E3daTE5NiqWHosPwkEkDioccJMx160vNfc2NFV3WqWizYO
 Ja7DY8pous+Kk1d/4EfKJCoMxz/5SX3d7PzzQ1dQpqF4AVezl9TP1Yhw+RN3EKCO58GN
 2fvdfgjets9X6/Ua0Jgz+J8DPHtyqo9lp17Bl/+G5iSRO+iA2GqylUUrrX6b29d4LAWk
 HoCaY+foo38vXMWKHi9M+66wePNxJalvFxKHmp497jE7v+seIhKjuVwIEaS1Pp9jv/BA
 0r/A==
X-Gm-Message-State: AOAM530l/CV0mU+kSTPtw4FzjMEAjiuEeC2UO4luS5oRsLrbe1FXBnZP
 W0nzFg1lYKkPK6BIEhcSDP60l6f5jNvkTowQXqAybXKOyxXfoZAbk/TRNoNi5gLX8CtEvZyQgJx
 QOezpiQyqQZYa5zg=
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr28559603wmj.91.1637583383121; 
 Mon, 22 Nov 2021 04:16:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAVFP3AGaVi870q7Y9l7bVgb6H1nlQOUkkRtKPDqRDfJRM+o7dLoWuysQJDFsaAZBX4MpPwQ==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr28559580wmj.91.1637583382942; 
 Mon, 22 Nov 2021 04:16:22 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m17sm8581486wrz.22.2021.11.22.04.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:16:22 -0800 (PST)
Message-ID: <b813a86c-1e44-2249-3f40-647a918aec6c@redhat.com>
Date: Mon, 22 Nov 2021 13:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] ui: fix incorrect scaling on highdpi with gtk/opengl
To: Alexander Orzechowski <orzechowski.alexander@gmail.com>,
 qemu-devel@nongnu.org
References: <20211121065504.29101-1-orzechowski.alexander@gmail.com>
 <20211121065504.29101-2-orzechowski.alexander@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211121065504.29101-2-orzechowski.alexander@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/21 07:55, Alexander Orzechowski wrote:
> Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
> ---
>  ui/gtk-gl-area.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


