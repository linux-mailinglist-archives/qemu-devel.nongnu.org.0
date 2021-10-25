Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD2F439EBA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 20:52:09 +0200 (CEST)
Received: from localhost ([::1]:34830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf54q-00043a-6V
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 14:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mf50s-00016x-Ai
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 14:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mf50p-0007hK-Dk
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 14:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635187676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fYfItJnMQXNyJ0eLC4OInJhpCJ+FkrRZHtJ2X8P1eF4=;
 b=BRFH67HbRZic+fpuQp8h7c4wKqbfptvS44Z+5YvQaD8YOL6TtyKP7NyLQBXA1VSK3swupD
 rXXYEBEeGeiXMU+PbuiIpsTaTCzYSRWEShjS8uDUpcGCyahdAO9HmkM8iLI5wjikECbolU
 RbRo7rOflkvdUbWWUs2LcQwJLfPAJTo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-4tSJfc-HMnaT0gwOYKCCNg-1; Mon, 25 Oct 2021 14:47:55 -0400
X-MC-Unique: 4tSJfc-HMnaT0gwOYKCCNg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z17-20020a7bc7d1000000b0032cafafaf79so340272wmk.5
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 11:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fYfItJnMQXNyJ0eLC4OInJhpCJ+FkrRZHtJ2X8P1eF4=;
 b=fAfusAvNaFKxTk1oEDIne1D3ZCZuy/jFi/3T5KPSiSTFavI9AMMWc8cYgAMao5IU9k
 LxNbTq4t/2qrsQ+7203U61I8tqHShxns+arHBo+Lvw9aVxeKzI1/dPNQZr77dR7xBHAU
 CR6a+7b4cU7sZml0T/NAQhSN6P4L4eAQSEHfz6g9hG4Fs1Ua3xvo680rqiXL10X87+da
 JVz9MgKvzLlIUibYG0STLi2rlFO7Q1CsrRe0KY539misFM9U7UoALQihP/ir8plG5UW7
 XDzoTfqAL8EsbyfEpBIQ2oWufc6sByi2z+p/f8dR+dS92d686H2BzdspnEsg0jJQY8gP
 fEVQ==
X-Gm-Message-State: AOAM533fykAnnm4A6Qq0C4PqW9jKu6ICydQCOccxZv1Jxy2ZVKLzZH0a
 wJX74u84dmPNaxYByDBrpONDhDld2zNeEDM0ygBMTi3qchq4S8CvM9riUxKn/LmoDgdiB5dHWKl
 Z6IncNDt+f3LihpFNqIB/J7e74rSv5SBXzTg9Yd+10MlXIPskMUv/RoRzOwoDtEtnyak=
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr26311593wri.62.1635187673433; 
 Mon, 25 Oct 2021 11:47:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIg/+tmOUWjwO9YkRLMC8YSUFv4Uz2jopY9w9oR2Gg0jAiCQnknwhHyR7e9q8e4jivTJTPGQ==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr26311560wri.62.1635187673117; 
 Mon, 25 Oct 2021 11:47:53 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id a134sm9161239wmd.9.2021.10.25.11.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 11:47:52 -0700 (PDT)
Date: Mon, 25 Oct 2021 19:47:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs@redhat.com
Subject: Re: [PATCH] virtiofsd: Error on bad socket group name
Message-ID: <YXb71uIKOIGhqHCg@work-vm>
References: <20211014122554.34599-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014122554.34599-1-dgilbert@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: xiagao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Make the '--socket-group=' option fail if the group name is unknown:
> 
> ./tools/virtiofsd/virtiofsd .... --socket-group=zaphod
> vhost socket: unable to find group 'zaphod'
> 
> Reported-by: Xiaoling Gao <xiagao@redhat.com>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued

> ---
>  tools/virtiofsd/fuse_virtio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 8f4fd165b9..39eebffb62 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -999,6 +999,13 @@ static int fv_create_listen_socket(struct fuse_session *se)
>                           "vhost socket failed to set group to %s (%d): %m\n",
>                           se->vu_socket_group, g->gr_gid);
>              }
> +        } else {
> +            fuse_log(FUSE_LOG_ERR,
> +                     "vhost socket: unable to find group '%s'\n",
> +                     se->vu_socket_group);
> +            close(listen_sock);
> +            umask(old_umask);
> +            return -1;
>          }
>      }
>      umask(old_umask);
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


