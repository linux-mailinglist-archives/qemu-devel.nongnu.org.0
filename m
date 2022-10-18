Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601FC6027C5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:01:17 +0200 (CEST)
Received: from localhost ([::1]:58764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okiTM-0007i7-2F
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1okiAM-00047O-F5
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 04:41:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1okiAK-0004Cc-Kp
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 04:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666082494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8sB9Ol+BcDz+kvcaYd1xpXeM3+KnWqUnO8tObPZrXYo=;
 b=WwzrAtYHzqd8VWULLA9tIjVFGWttdxM1oFejhHPYdnQ8I+6hdI3wnn2GxqThXbDGfHmLIc
 Gbsli9qtt5M0f8oRe/D8p8IkcfgAYXC4L1WQtia3pmvSTUGOByQP6LAvvhxj/2r64HOaB8
 bnoUBojWYScKhnm9NLllMaFkNqQ2L5w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-eh8iLvXxOM63Zt3vMtzUJg-1; Tue, 18 Oct 2022 04:41:33 -0400
X-MC-Unique: eh8iLvXxOM63Zt3vMtzUJg-1
Received: by mail-wr1-f71.google.com with SMTP id
 h17-20020adfaa91000000b0022e9f2245c8so4343371wrc.19
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 01:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8sB9Ol+BcDz+kvcaYd1xpXeM3+KnWqUnO8tObPZrXYo=;
 b=IUIy8jqL72hOhfsEp3QxFkgGVPrlZoN4NPyJfXcaWCcuRnkOts2dWGrxGARtgfKhxo
 jUDFBFFIYWWJ5tqZ6yyXY+ZE68arpKmo8MQu71ACZGEwHBzvRSA54QtDU/CFMf06GyEv
 W++yGi7aZm2+mm6Ky6frmAS50/9ANxAsy/9Grs3nbUc7M1MnV+RxH1xPIpmSItSoKbEU
 P9sOOMUGWz21Rs/jcbSksOTkRlgy/6qKpWA5kmO7GOL3cXuXov3Vv7PSJsdZQMI/vwnO
 /trjAVgTE3lvo2L0dIuscdNixw3mpFTe8f1DJa8b64jTaDfmjw8SycRhyBWoSqJi4xH5
 bz9Q==
X-Gm-Message-State: ACrzQf07uiDfwe4we1APbrrcfHmXs80m1I8P8+wyAvOEZWGyQ5wZRmax
 zj1pIQgi4kh4oXHIfwqjgfoAw0Md196iHL6M4dxF8BMheH0yrN292nyjr5Tz4yaECBL8bf0j3UU
 xua04iHaBB/BeMbk=
X-Received: by 2002:a05:600c:4e06:b0:3c6:ce02:ece4 with SMTP id
 b6-20020a05600c4e0600b003c6ce02ece4mr1091088wmq.58.1666082492180; 
 Tue, 18 Oct 2022 01:41:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7exqulEdovouNbQ3zyQvsX7awBZ32TjGn8+gMe1ZOFdYHrSQ0ue69qec5mfrhOfKWed+pjEQ==
X-Received: by 2002:a05:600c:4e06:b0:3c6:ce02:ece4 with SMTP id
 b6-20020a05600c4e0600b003c6ce02ece4mr1091070wmq.58.1666082491940; 
 Tue, 18 Oct 2022 01:41:31 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e9-20020adffc49000000b002206203ed3dsm10429416wrs.29.2022.10.18.01.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 01:41:31 -0700 (PDT)
Date: Tue, 18 Oct 2022 09:41:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Subject: Re: [PATCH v2] nbd/client: Use smarter assert
Message-ID: <Y05muTwPNKfZSDkB@work-vm>
References: <20221017191207.1255807-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017191207.1255807-1-eblake@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

* Eric Blake (eblake@redhat.com) wrote:
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> 
> v2: update subject line and commit message to reflect file being
> touched; adjust a second nearby assertion with the same issue
> 
>  nbd/client.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/nbd/client.c b/nbd/client.c
> index 30d5383cb1..90a6b7b38b 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -658,11 +658,11 @@ static int nbd_send_meta_query(QIOChannel *ioc, uint32_t opt,
>      char *p;
> 
>      data_len = sizeof(export_len) + export_len + sizeof(queries);
> -    assert(export_len <= NBD_MAX_STRING_SIZE);
> +    assert(strlen(export) <= NBD_MAX_STRING_SIZE);
>      if (query) {
>          query_len = strlen(query);
>          data_len += sizeof(query_len) + query_len;
> -        assert(query_len <= NBD_MAX_STRING_SIZE);
> +        assert(strlen(query) <= NBD_MAX_STRING_SIZE);
>      } else {
>          assert(opt == NBD_OPT_LIST_META_CONTEXT);
>      }
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


