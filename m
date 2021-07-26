Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64363D5BC4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:36:41 +0200 (CEST)
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81ii-0005MH-OW
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m81hb-0004Fd-58
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m81hY-00087c-T0
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627310128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6lJ2G0eUQ8W8c9f7q5Tal5b+7k70U9JC9E+tCG9OouE=;
 b=iU0+mwRBBpU3aXbw3NmVv/1qchDTtJHK0DM6/m6dtnku88ORHgDViZsniI7m+4kkAWuX7x
 lYRbPVO/2EWwuSICicUKCPHHVn0W2ss8zLYdcbes2VXQULMYj/AfKQEEKjbyq4uMwOZ96x
 vdOt3fTyPs4bKrU3SM/5FB5tnOqKieM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-6GUo87PqPXa0lES3vRLCaQ-1; Mon, 26 Jul 2021 10:35:24 -0400
X-MC-Unique: 6GUo87PqPXa0lES3vRLCaQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o67-20020a1ca5460000b0290223be6fd23dso691289wme.1
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6lJ2G0eUQ8W8c9f7q5Tal5b+7k70U9JC9E+tCG9OouE=;
 b=razSahguBR8Mmdjk6KiNQcQl/yeSGNVtIJkXfeFpqfX6pnM20F8YrCUo3puoAxGcUx
 g4M25s6ugXIAPxL3HUFbM5ZpOzsFRbxBcIc7YR+BjN5E2xL03HkmReUsESDNIfq6n0vn
 T5EcOebFXDvLY6+BN+2DSE2JgCA1kfhYNM0GKuPPq2M5+ii0UeWlEfnJSyqDI9PX6zdQ
 mpKQFb5/gbugkkaxE4lOgPsk1/SftWLepLrS4Vd0npdGS2/Q0deINHiz17Y5gD+S+Pzi
 ABb0xXRIxiTZZvbOr9uFPBTKTlkYRDhZP+eb1WsSSgbhDh0sagxpnL5lJmeJ8c4hL8O8
 /BhQ==
X-Gm-Message-State: AOAM532CbefgelT43VamjoQ3+csqZ8G4ZSbYh7qeWs8zLUDejpf0Mm6R
 9qvdKXHlIferP2J35dquSDN213fW0BIaVneLhkl8qSxVCABqaneCBCad9A37Kx8/d9y+YuY//V/
 GiLsStmOBYPrS4qM=
X-Received: by 2002:a1c:2282:: with SMTP id
 i124mr17462488wmi.166.1627310123479; 
 Mon, 26 Jul 2021 07:35:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQzH8bOzIGtoJjJjGp5lezO9vRLTvzqjnbTawB60dwinROHBwEnDddBx0ejLKsb9BWBJjzig==
X-Received: by 2002:a1c:2282:: with SMTP id
 i124mr17462478wmi.166.1627310123360; 
 Mon, 26 Jul 2021 07:35:23 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id e6sm50316969wrg.18.2021.07.26.07.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:35:22 -0700 (PDT)
Date: Mon, 26 Jul 2021 15:35:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.1 10/10] docs/tools/virtiofsd.rst: Delete stray
 backtick
Message-ID: <YP7IKQCPqmvzJWYA@work-vm>
References: <20210726142338.31872-1-peter.maydell@linaro.org>
 <20210726142338.31872-11-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210726142338.31872-11-peter.maydell@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> The documentation of the posix_acl option has a stray backtick
> at the end of the text (which is rendered literally into the HTML).
> Delete it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  docs/tools/virtiofsd.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index c4ac7fdf38f..b208f2a6f05 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -102,7 +102,7 @@ Options
>      default is ``no_xattr``.
>  
>    * posix_acl|no_posix_acl -
> -    Enable/disable posix acl support.  Posix ACLs are disabled by default`.
> +    Enable/disable posix acl support.  Posix ACLs are disabled by default.
>  
>  .. option:: --socket-path=PATH
>  
> -- 
> 2.20.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


