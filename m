Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8DD6D63D4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:49:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjh2A-0006Om-R2; Tue, 04 Apr 2023 09:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjh28-0006M9-O2
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:49:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjh27-0008RC-5x
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680616150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGqu3Hkq0a1a3n2Kq3cuzJo1Icv0FRBGNq1vK4iJAs8=;
 b=hNy29uEGT8I81UCEdfry/3j/oJFxD8YrBiUbkR36B5SC3Ad/YC7n0LL0hiuRWgDK/BoNhD
 hIEfPG2p+XPFOVG1ZKD/ZaQ0vbpZNggSA24DNj87wYARxFSDMBA9sr3xkzmvPB3ZbvQZAF
 k4IjXolaSL7kcLxAGaRXLO38dozr68g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-IvFpLjhcMNC0G-pUeDcbfA-1; Tue, 04 Apr 2023 09:49:09 -0400
X-MC-Unique: IvFpLjhcMNC0G-pUeDcbfA-1
Received: by mail-ed1-f71.google.com with SMTP id
 a40-20020a509eab000000b005024c025bf4so33957018edf.14
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616147; x=1683208147;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iGqu3Hkq0a1a3n2Kq3cuzJo1Icv0FRBGNq1vK4iJAs8=;
 b=SsCEOcgtw3/H93eYuZef+uYO2qJddIgFczaWaiZ5zEzdMx4Oz09aJeIzUjJA5AnFoM
 Ak47wr5Oit3RMAQe5UtdgKJ9+OeE6a6fFUkmuFPhkqLNdO/wr8sizzKRQT9gDlV0ZVic
 5YVJOkOeuT7H+AszwOeu1CIIDLaWGUdR1BquWDc8yilFLFnmjZLdku93DZYmenR3IgRp
 cjV6FGusdV/SdKOEb4CIzYxfYM5N3lxTmTnSG/HCL3sviv7yy3nngcr5lq+lELu2FP+4
 9oLFqNcAnG9YM1/LiztOq+VeBtnlfxOEumtImyDBvpCof7oV64fBvhihG7L7LWp1BKL5
 qxVA==
X-Gm-Message-State: AAQBX9dUNnJv89Cp5sTCe/toettLp4UV03/0qO4ih98o6+x1zILuwn/A
 tj11pB7w7FepJQq1hb3nDQJ5WVPeeNNZxn2iBinFtGNkTbuxq1U/KPs0waV57hcZQuw0y9xkvVi
 qzii2tgsD/l1K7N8yXQrR9UE=
X-Received: by 2002:a17:906:99c6:b0:947:5bd8:9523 with SMTP id
 s6-20020a17090699c600b009475bd89523mr2508234ejn.31.1680616147658; 
 Tue, 04 Apr 2023 06:49:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350auPVJh1gQRaTRU3aXZArdJH5xdSHcDYfdK6SkpPa+8loCjFJNkeBSuUcKGS0+/6kuaAUU3LQ==
X-Received: by 2002:a17:906:99c6:b0:947:5bd8:9523 with SMTP id
 s6-20020a17090699c600b009475bd89523mr2508217ejn.31.1680616147379; 
 Tue, 04 Apr 2023 06:49:07 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 v7-20020a170906564700b009447277c26fsm5999210ejr.72.2023.04.04.06.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:49:06 -0700 (PDT)
Message-ID: <2d2d0705-b5eb-b3b6-f558-3d460db58729@redhat.com>
Date: Tue, 4 Apr 2023 15:49:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 for 8.0?] nbd/server: Request TCP_NODELAY
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Florian Westphal <fw@strlen.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
References: <20230404004047.142086-1-eblake@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230404004047.142086-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/4/23 02:40, Eric Blake wrote:
> Nagle's algorithm adds latency in order to reduce network packet
> overhead on small packets.  But when we are already using corking to
> merge smaller packets into transactional requests, the extra delay
> from TCP defaults just gets in the way (see recent commit bd2cd4a4).
> 
> For reference, qemu as an NBD client already requests TCP_NODELAY (see
> nbd_connect() in nbd/client-connection.c); as does libnbd as a client
> [1], and nbdkit as a server [2].  Furthermore, the NBD spec recommends
> the use of TCP_NODELAY [3].
> 
> [1] https://gitlab.com/nbdkit/libnbd/-/blob/a48a1142/generator/states-connect.c#L39
> [2] https://gitlab.com/nbdkit/nbdkit/-/blob/45b72f5b/server/sockets.c#L430
> [3] https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#protocol-phases
> 
> CC: Florian Westphal <fw@strlen.de>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Message-Id: <20230327192947.1324372-1-eblake@redhat.com>
> ---
> 
> v2 fix typo, enhance commit message
> 
> Given that corking made it in through Kevin's tree for 8.0-rc2 but
> this one did not, but I didn't get any R-b, is there any objection to
> me doing a pull request to get this into 8.0-rc3?
> 
>   nbd/server.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index 848836d4140..3d8d0d81df2 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2758,6 +2758,7 @@ void nbd_client_new(QIOChannelSocket *sioc,
>       }
>       client->tlsauthz = g_strdup(tlsauthz);
>       client->sioc = sioc;
> +    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
>       object_ref(OBJECT(client->sioc));
>       client->ioc = QIO_CHANNEL(sioc);
>       object_ref(OBJECT(client->ioc));
> 
> base-commit: efcd0ec14b0fe9ee0ee70277763b2d538d19238d

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


