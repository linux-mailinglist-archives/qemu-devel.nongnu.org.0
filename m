Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A380603140
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 19:00:40 +0200 (CEST)
Received: from localhost ([::1]:44624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okpxG-0008Tq-F8
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 13:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okpav-0005QU-J4
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:37:42 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okpat-0002aI-UT
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:37:33 -0400
Received: by mail-wr1-x436.google.com with SMTP id u10so24549814wrq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 09:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pqCspm8kxX9MiW3uJI6rVBeMtxtN1B3Wefz3u9EIq7U=;
 b=FcDKkgoFvEYSwyF0/sQTyg+y5jrFaaypCPJg5c9ROR+WMQ+K8hQhjfrlk4IZKyThuP
 SbEkIt0XzhptQA9X7lP2MfVNmMNT3ftHJ6MxLfg53HatUlesuFjB6q98KJuasXTEJbjG
 obQl924aHaM9bHaDyD61IkPDtpJVv8qcAQAm2xPvtbROqtSl7De67vDFqjRPT/NsxW7A
 OieawF9wcpYWXjNGjCbZdim3z7/AkY6LtmL7CVcmsog6YcXRQlo5dcI+Iyvkyhu7/ett
 rRNe35IVUHIw71FE/St0YvPePn6B3IZ8qttJ07McvG5l+l3JqfTd8rwI9hfGEqEYh0pO
 17zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pqCspm8kxX9MiW3uJI6rVBeMtxtN1B3Wefz3u9EIq7U=;
 b=AJIkA1/MPAEp2t2tbvo03uD370PLtwI5Shftufe5l6zHz3FRXm+FeuadoD/YtPb0c4
 XJ+siP8AV7Fc5zxAvA5FK50WBz6Q74uTeKWjon7bZ7rHKuQVuASSiu2JHnBBxzGYOL/6
 fZeYX/cRrFcpIq5uCScC+SHlESJvTodVT13cfro8iek1N+80DriH+pmN9uBIg/LMDCEu
 TIMr+QERzIuKokBf+o2jOxoyeaSd7JZqDeI/y9SZIXQ9rqTtD8Mj17S/9d8oHX76PT6w
 sG4AhsOpDtM6QbTUTLdvTVr3AvkPh1KHIxZuaONLDK3ds1vZ5Ti4PLyMQ5eI8OL5csUM
 vUFA==
X-Gm-Message-State: ACrzQf0PxiMDknSTGGMv+oWOlVBBw1F3GXHvE+VjEoGQlW6s1XXdPkMm
 pgJWa2xIuhGRusmf2dwDmzqSpg==
X-Google-Smtp-Source: AMsMyM5aF0klomqHOH9VD8N/ULsHZNWr0rIjrYO7x6yhQphmmgZWvMKHuMP0a90tAg6GfXJZhCT2Ww==
X-Received: by 2002:a5d:5249:0:b0:230:1ba4:b6cc with SMTP id
 k9-20020a5d5249000000b002301ba4b6ccmr2505383wrc.197.1666111049306; 
 Tue, 18 Oct 2022 09:37:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a056000136100b002301c026acasm11628946wrz.85.2022.10.18.09.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 09:37:28 -0700 (PDT)
Message-ID: <d33519e0-e52e-f871-48c9-521e1c5cd4b0@linaro.org>
Date: Tue, 18 Oct 2022 18:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2] nbd/client: Use smarter assert
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
References: <20221017191207.1255807-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221017191207.1255807-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/10/22 21:12, Eric Blake wrote:
> Assigning strlen() to a uint32_t and then asserting that it isn't too
> large doesn't catch the case of an input string 4G in length.
> Thankfully, the incoming strings can never be that large: if the
> export name or query is reflecting a string the client got from the
> server, we already guarantee that we dropped the NBD connection if the
> server sent more than 32M in a single reply to our NBD_OPT_* request;
> if the export name is coming from qemu, nbd_receive_negotiate()
> asserted that strlen(info->name) <= NBD_MAX_STRING_SIZE; and
> similarly, a query string via x->dirty_bitmap coming from the user was
> bounds-checked in either qemu-nbd or by the limitations of QMP.
> Still, it doesn't hurt to be more explicit in how we write our
> assertions to not have to analyze whether inadvertent wraparound is
> possible.
> 
> Fixes: 93676c88 ("nbd: Don't send oversize strings", v4.2.0)
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> v2: update subject line and commit message to reflect file being
> touched; adjust a second nearby assertion with the same issue
> 
>   nbd/client.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/nbd/client.c b/nbd/client.c
> index 30d5383cb1..90a6b7b38b 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -658,11 +658,11 @@ static int nbd_send_meta_query(QIOChannel *ioc, uint32_t opt,
>       char *p;
> 
>       data_len = sizeof(export_len) + export_len + sizeof(queries);
> -    assert(export_len <= NBD_MAX_STRING_SIZE);
> +    assert(strlen(export) <= NBD_MAX_STRING_SIZE);
>       if (query) {
>           query_len = strlen(query);
>           data_len += sizeof(query_len) + query_len;
> -        assert(query_len <= NBD_MAX_STRING_SIZE);
> +        assert(strlen(query) <= NBD_MAX_STRING_SIZE);
>       } else {
>           assert(opt == NBD_OPT_LIST_META_CONTEXT);
>       }

Nitpicking (pre-existing) the assertions could be moved before
the assignations.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


