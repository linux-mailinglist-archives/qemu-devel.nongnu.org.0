Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1566A4FC172
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:49:40 +0200 (CEST)
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndwIM-0000fl-KL
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ndwGK-00079z-VN
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ndwGH-0001Df-2Y
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649692047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HUoW+M9S/L0saPB4p9jlR8SaSFRVW7XdFc0bsm8qgY8=;
 b=Ly9jt1wtbgBB7L0ObdSdLCJ3886bgwr6JbgLPgEhEHGww7Fm8rMi8izyXeqw4ZaT7x0mIY
 Wm5W1nb9Qon0Gg1bBnxZ71xM6YFLjq8PeTiE1kwNJK0MiunZ4q8CZm9W7/XaoVi9nAo8Zf
 3BWmoRego9I+YZC76+pOXZH6p/NyJlc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-36Roa4-WMAC1y2PeN24Kug-1; Mon, 11 Apr 2022 11:47:26 -0400
X-MC-Unique: 36Roa4-WMAC1y2PeN24Kug-1
Received: by mail-wr1-f70.google.com with SMTP id
 q4-20020adfc504000000b002079c9cc1bfso1173987wrf.11
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HUoW+M9S/L0saPB4p9jlR8SaSFRVW7XdFc0bsm8qgY8=;
 b=7cyjKjGsNGR3aZIuxJKxBSLYTg0I7fwWVzSCcNsJZxMONoSsDLdv2y+oyTvSc5paye
 Hx5VJY9H5NxsFpHOndvGWvDJUprUEHl+Ggeuwmf0uJCtPBtxeEL/umQNcCVBKBslBQv8
 lPSIkrgbp106/lp0xT+IaFGYP8CgSCFcnZ/SgLx1ZxNkbLkjb5aagIDF5I7Fr1n1zvKI
 Gahx4LTi3txZoFS2F51vCjgDFHAwVlkUNu8/4A52y+JhXGn0oKq8yV4KP6efY836KQZ9
 Ufl+8/BAWjmAvkCMU6NAbmh8tbgwMptj49fAb2eu7xj3cnxTvQfQsLen481FzaDZiJyb
 UcwA==
X-Gm-Message-State: AOAM532561zlXljFKEdIcynKfjWuItv13KwwaIhICobRaAew+DW20Iwp
 1kFq19bHwi4xbUBjQJKQ+iSc/KodIfhT1SYe1xVH7kuItkXXblmgJQi8/T7li3WNmhIcr55BNMg
 X93JN0pNRxwLAv6Y=
X-Received: by 2002:a5d:68ca:0:b0:207:a1d3:da87 with SMTP id
 p10-20020a5d68ca000000b00207a1d3da87mr8397323wrw.492.1649692045482; 
 Mon, 11 Apr 2022 08:47:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbB3LrRYPytvHLrWVHHDao+73B94vSpbUzt87GItbUzzhXeTJd760xIHM492crFyyQfDv5Dw==
X-Received: by 2002:a5d:68ca:0:b0:207:a1d3:da87 with SMTP id
 p10-20020a5d68ca000000b00207a1d3da87mr8397311wrw.492.1649692045196; 
 Mon, 11 Apr 2022 08:47:25 -0700 (PDT)
Received: from redhat.com ([2.52.1.156]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b0038cc9096507sm19389796wmq.3.2022.04.11.08.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:47:24 -0700 (PDT)
Date: Mon, 11 Apr 2022 11:47:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] contrib/vhost-user-blk: add missing GOptionEntry NULL
 terminator
Message-ID: <20220411114709-mutt-send-email-mst@kernel.org>
References: <20220411150057.3009667-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220411150057.3009667-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 11, 2022 at 04:00:57PM +0100, Stefan Hajnoczi wrote:
> The GLib documentation says "a NULL-terminated array of GOptionEntrys"
> so we'd better make sure there is a terminator that lets
> g_option_context_add_main_entries() know when the end of the array has
> been reached.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge

> ---
>  contrib/vhost-user-blk/vhost-user-blk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index d14b2896bf..cd4a5d7335 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -593,7 +593,8 @@ static GOptionEntry entries[] = {
>      {"blk-file", 'b', 0, G_OPTION_ARG_FILENAME, &opt_blk_file,
>       "block device or file path", "PATH"},
>      { "read-only", 'r', 0, G_OPTION_ARG_NONE, &opt_read_only,
> -      "Enable read-only", NULL }
> +      "Enable read-only", NULL },
> +    { NULL, },
>  };
>  
>  int main(int argc, char **argv)
> -- 
> 2.35.1


