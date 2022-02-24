Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F784C2DF4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:12:24 +0100 (CET)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEr0-0007o0-IS
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:12:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNEnn-0005jA-5q
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:09:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNEnj-0007aZ-HE
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:09:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645711738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtYTYkwIdkf5+RzIUNSezYX7u4CRDpViKPZOS1/JiJI=;
 b=YLABMnvv2tfGWQh6/iMYNl+HL23MlGKjSG4GZlvmNzB/vlioRfoEjJtdpPvZ6exMPq8/Vp
 uyKmrGCcUtK3sbeoOj6RFExVSTcfyrZe36bnuLaFMarAOxoSg2/TluapPKm27W7Nvfge/b
 nElVvRuK+1RWLUsx/8xAtillwVtcfzA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-MbybjZhbMPCs1vSpbXbyUA-1; Thu, 24 Feb 2022 09:08:57 -0500
X-MC-Unique: MbybjZhbMPCs1vSpbXbyUA-1
Received: by mail-ej1-f72.google.com with SMTP id
 kw5-20020a170907770500b006ba314a753eso1247361ejc.21
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 06:08:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RtYTYkwIdkf5+RzIUNSezYX7u4CRDpViKPZOS1/JiJI=;
 b=jCIENY2FfFkOHXu6pxTzSekRi+0qItMQIu2Yj4yfzj+BAE5zL3aE3ZEnfiRYKdl2rk
 FW2qVheTVyNE4dbtqTvbZdrB3edT+MdEHYdIkG1+GwGjciJiE2OHA61Pxl/ZxE93Slkj
 cvLxJWtehRsyTeIRyq8XIjYlXLhOpJ0h8x1KhGXlLjqDTItU8LE7jlpYQJlmg8L4pWsd
 lW1OuzZtgW4z2k4EYtS7dX9oHgMxkTHZ9/Yeoyh6FgqOPm3sU/GDWSKBmkD8E1KengI0
 nsIiSrmfncl4NOUQouxrqebUt505yWWa85eT9XhsueYVlylqWPVijAGi3L3F44nGwoNX
 GtiQ==
X-Gm-Message-State: AOAM532Xfw8WPuoXbp0m2phMVxzgog5DbXZSYjR0BC+hRhRYlWZ4HB6S
 7b6bChYAkqtkBTqv2SJpFPrzIfezpIzC4aoc3PE+j9Xkm68E2XKTocmHvW5h27iJCg+7igTPUez
 yNY3g6mUhfkT137o=
X-Received: by 2002:a17:906:364d:b0:6cd:9109:cfd4 with SMTP id
 r13-20020a170906364d00b006cd9109cfd4mr2436624ejb.198.1645711735772; 
 Thu, 24 Feb 2022 06:08:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/WQ9VQtbTFe8rhN1ku4tXdyZv0A1m+i9y9hrxNaQJTKosB5dVWaBXvPkAoW/YfCSrLtTINQ==
X-Received: by 2002:a17:906:364d:b0:6cd:9109:cfd4 with SMTP id
 r13-20020a170906364d00b006cd9109cfd4mr2436609ejb.198.1645711735531; 
 Thu, 24 Feb 2022 06:08:55 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id r8sm1374019edt.65.2022.02.24.06.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 06:08:55 -0800 (PST)
Message-ID: <6c0eeeab-b481-724f-ec23-891af2fe6cee@redhat.com>
Date: Thu, 24 Feb 2022 15:08:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] block/curl.c: Set error message string if
 curl_init_state() fails
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220222152341.850419-1-peter.maydell@linaro.org>
 <20220222152341.850419-2-peter.maydell@linaro.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220222152341.850419-2-peter.maydell@linaro.org>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.22 16:23, Peter Maydell wrote:
> In curl_open(), the 'out' label assumes that the state->errmsg string
> has been set (either by curl_easy_perform() or by manually copying a
> string into it); however if curl_init_state() fails we will jump to
> that label without setting the string.  Add the missing error string
> setup.
>
> (We can't be specific about the cause of failure: the documentation
> of curl_easy_init() just says "If this function returns NULL,
> something went wrong".)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   block/curl.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


