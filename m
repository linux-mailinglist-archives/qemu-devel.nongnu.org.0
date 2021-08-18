Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3323EFF76
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:47:08 +0200 (CEST)
Received: from localhost ([::1]:34060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHE3-00082U-EH
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGHCz-0007K6-6F
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:46:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGHCx-00084i-Da
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629276358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85TXiaRRX8neoe2KTAThgjX2uNwq2gvqvpsMSjIf5tM=;
 b=KgbF6opnri0CTNYuJ1rqfjUizcQMd2dY4em6ekmjNKaDG8OEQLgWIvSmd0D7gycYCK5OLB
 GHvrLKpsQCFKW0dxOVWYkMcrJ2f5la9Z2ME0XTwChIX0vHjiwpATrUa58XHsOpDNcOG+F6
 o37pRftvR+bDXBwRpTHnKi55lFC335I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-vNClPhnBNaClAY_AeWUgxA-1; Wed, 18 Aug 2021 04:45:57 -0400
X-MC-Unique: vNClPhnBNaClAY_AeWUgxA-1
Received: by mail-wr1-f69.google.com with SMTP id
 n18-20020adfe792000000b00156ae576abdso348754wrm.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 01:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=85TXiaRRX8neoe2KTAThgjX2uNwq2gvqvpsMSjIf5tM=;
 b=k42wQQXmFwcBq9sCUrHlayh1VbuOrT4htE8TFRnIeDj/9A2R0Y7ZzAiMQtEkdY43sb
 cKD7Tq+AMaFNH8v81cKGwAZ5RX/mpMAdQ6lfaRM2uRc4+Ga1aEmzXwaZg43njjdtquB8
 2xhjOrW8erP7AkFvQbBKLDnPQc2lrUN7Yc1z6sI68MOYAb02l9xU1So0pE8uTWS5aPKH
 qx+sKAYpQ8OCB75plvV5XNU6vowcujGaUZEDX0wvXLt4ZPbL5fuZYSo36XbaDR6ALsmJ
 prK4oo4efl5YCLwpFNuzMvG0ai2W5Eto8I2D2PZp1AHZlRbBhehgIr3GqPaqPItP59V3
 XX8g==
X-Gm-Message-State: AOAM5332c1nFqs8yTzzFx+RDZWQtM+w07vKencmqlzTyL77xjXF0tEYj
 aweumkCDqi8Np5+BaeDPsZ3T94p6i8suHKbYfTl/NLak+jS7y0eqbrhbEfiK0F3AtIDmDTsNPZF
 0yvgaNhUqBefaKHs=
X-Received: by 2002:adf:e887:: with SMTP id d7mr8785746wrm.79.1629276356457;
 Wed, 18 Aug 2021 01:45:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMP8MUbwNLwhGn+RuCCGcDO7zfQPuW0nkBJLBlheoF0wmJOaSZGMwqXy//OQkxpINqDvWn3A==
X-Received: by 2002:adf:e887:: with SMTP id d7mr8785730wrm.79.1629276356251;
 Wed, 18 Aug 2021 01:45:56 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p3sm5258672wrr.21.2021.08.18.01.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 01:45:55 -0700 (PDT)
Subject: Re: [PATCH v2 03/55] target/alpha: Implement do_unaligned_access for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7ab83b4c-b917-64e9-3c04-8113b9749539@redhat.com>
Date: Wed, 18 Aug 2021 10:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-4-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 6:13 AM, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/cpu.c        | 2 +-
>  target/alpha/mem_helper.c | 8 +++-----
>  2 files changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


