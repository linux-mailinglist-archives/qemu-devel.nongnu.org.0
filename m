Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E0A6015C3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 19:51:16 +0200 (CEST)
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okUGh-00009m-05
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 13:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1okU5u-0001QM-1g
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1okU5q-0003lI-RA
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666028397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yaEGRsBv1gMsu/tTftUYlK9RDG+Xd9A6A6rEbkDhEW8=;
 b=WT+n0aDUcCfbKh2JCbJ78p+eHD+VmIP/425sjfmKVTf0oP9NeRWbuyvT4cyvqhaAuQZ9Cl
 8v3QAi5aYT0ZHO9Z9IjCNbkupc9bj+V6d5MDKGzFvecHL+/w874zKOUR9ZqZYS4/bqYs6d
 cdK5H+HiPk4XtOA4HyCGSQlvgvUBDdI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-yWeluVaSOF2kqKAZlBRbRQ-1; Mon, 17 Oct 2022 13:39:55 -0400
X-MC-Unique: yWeluVaSOF2kqKAZlBRbRQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c5-20020a1c3505000000b003c56da8e894so9816305wma.0
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 10:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yaEGRsBv1gMsu/tTftUYlK9RDG+Xd9A6A6rEbkDhEW8=;
 b=LiGWv0HQz+LEnXsZy+9iIPB1WqFrjgHGUqq/7/tuB4GK64R5l45VwAGm6brPd9EhQ+
 VZaJJYpfLeTkypWLBSCGYplku7K5CSb3iPWahVQiZM/m/ZQu/RIHKMoGCoXHD1p11Onz
 jErTHdzGNKANnO0dxnPfBeRFgCKJc/M2Yyc1AIi+M239esI8XGzP2oqHVsTWa7g/vAKf
 35YLbPvZcAVjodiAY1xA928masZ7vBHxU1Oc45Vzv753dFvDCoqpLJQ3Ury57FPOF2Rz
 Nxce7uyFMBgSNM9KSkU0UbxZRpDbiLfNb39F9vYPt9sYFVy3KPxNKbB6OZwsKOfyTwIo
 iv+w==
X-Gm-Message-State: ACrzQf2w3Cd5+itTk+JXLDDtju4xyxQOX6LbTELgxJRnqP3BTnge3lUN
 2GbveygRkP6Uri3ztPxGVvSPDJGC23DJDGsamaHZGTAzA1EcyHt6z55qcu1CQEkq/c/YTLQ20xP
 cNMVhAbpr7erbEq4=
X-Received: by 2002:a05:600c:4e06:b0:3c6:ce02:ece4 with SMTP id
 b6-20020a05600c4e0600b003c6ce02ece4mr7819678wmq.58.1666028394471; 
 Mon, 17 Oct 2022 10:39:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Jx1EqyVJH4GSHUvtkMpew8kFZX9iv3fx/5DU6ebwwhKMc07Qgf8AshZXmYNlqr9+Xkuo0Mg==
X-Received: by 2002:a05:600c:4e06:b0:3c6:ce02:ece4 with SMTP id
 b6-20020a05600c4e0600b003c6ce02ece4mr7819669wmq.58.1666028394253; 
 Mon, 17 Oct 2022 10:39:54 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c4f5300b003c6f3f6675bsm6044325wmq.26.2022.10.17.10.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 10:39:53 -0700 (PDT)
Date: Mon, 17 Oct 2022 18:39:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Subject: Re: [PATCH] nbd/server: Use smarter assert
Message-ID: <Y02TZ5YyN2nN8RYR@work-vm>
References: <20221017173727.1246179-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017173727.1246179-1-eblake@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Thankfully, the incoming string can never be that large: if the export
> name is reflecting what the client asked about, we already guarantee
> that we drop the NBD connection if the client tries to send more than
> 32M in a single NBD_OPT_* request; and if the export name is coming
> from qemu, nbd_receive_negotiate() asserted that strlen(info->name) <=
> NBD_MAX_STRING_SIZE.  Still, it doesn't hurt to be more explicit in
> how we write our assertion that we are aware that no wraparound is
> possible.
> 
> Fixes: 93676c88 ("nbd: Don't send oversize strings", v4.2.0)
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  nbd/client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/nbd/client.c b/nbd/client.c
> index 60c9f4941a..b601ee97e5 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -658,7 +658,7 @@ static int nbd_send_meta_query(QIOChannel *ioc, uint32_t opt,
>      char *p;
> 
>      data_len = sizeof(export_len) + export_len + sizeof(queries);
> -    assert(export_len <= NBD_MAX_STRING_SIZE);
> +    assert(strlen(export) <= NBD_MAX_STRING_SIZE);
>      if (query) {
>          query_len = strlen(query);
>          data_len += sizeof(query_len) + query_len;
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


