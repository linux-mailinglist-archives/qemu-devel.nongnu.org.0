Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC0F422CC9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:42:05 +0200 (CEST)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmZv-0006hR-Pf
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmJO-00018v-TJ
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmJL-000547-MI
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633447494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dj2EpzsyjxoHfqZzRQQu2QbW7+yv3cPc62SD2cn5O9I=;
 b=ThbyQiTldrYf2zsN/8WX2RbFFcYYjkBraYpWN5TUUk8f7ShZoqYKsZVg1itHQYJqv7wKxR
 WFezjl7PFZG+rX9H3Ou9FejQ2k4P6phJDJqs/iQJZYHLL+5c8hSWKDc2rE1Gzh8Hwb6GM9
 d7VmBC6pEKZEhIZtqewvlAqhllA5JbQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-ywX9GLbmNlu-fsEKRa7PoQ-1; Tue, 05 Oct 2021 11:24:53 -0400
X-MC-Unique: ywX9GLbmNlu-fsEKRa7PoQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so273510edb.8
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 08:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dj2EpzsyjxoHfqZzRQQu2QbW7+yv3cPc62SD2cn5O9I=;
 b=E+RCWqCYF1su1tlSkJOFKzHUfOKcl86TcVF42Sz6gmx4jjuawenuKsHg5FUmpMmLfi
 5hbbyp38/tjOr9l8T+jrjNxMOARsISn6V10RRzIJUmlwQWN9eougl3192qRD1IWhYFCw
 SlLqBpXHD/KViXJOnUbH2nZtz/Exvx3LUSyeBvISbizXKMct8hBl6S0kbePNxy26qUEx
 jZ2Gqy5lkZoKXxVlZ0Hj0ufTqWmQ1yJRPbJE8w8cp/RiZWY9fRZ6K/cr93lvkw18esJC
 xqpGv+e8lxpVCE1PwGoC12fe7VRha6y67ZI62/jlEglZxcsecDvNzkSdV7LoB2+lCF8a
 M+Gw==
X-Gm-Message-State: AOAM530BjP+1WX51au0LqCWu9R8OPjn1kUBIXsDXtmqaBj03DYHsWHeQ
 3xDBtqdgC5TcxUZ2lig0C8DpMxyW2j+h1zeCwo17BTfqra1EmmGs9nH9xBOtDqY57DKv2Zai93R
 sadjm0RiZ/PhIK+U=
X-Received: by 2002:a05:6402:510b:: with SMTP id
 m11mr26689352edd.258.1633447491747; 
 Tue, 05 Oct 2021 08:24:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUtdoOOvq82mIC6ApTERE5WPODNJNDrJBcQjZkL6f2P2Ki2hN/GEra+jGz4CV5BhKRMqcMgA==
X-Received: by 2002:a05:6402:510b:: with SMTP id
 m11mr26689331edd.258.1633447491579; 
 Tue, 05 Oct 2021 08:24:51 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id e22sm9313822edu.35.2021.10.05.08.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:24:51 -0700 (PDT)
Date: Tue, 5 Oct 2021 11:24:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v4 3/3] docs: Add documentation for vhost based RNG
 implementation
Message-ID: <20211005112437-mutt-send-email-mst@kernel.org>
References: <20210927221359.2917482-1-mathieu.poirier@linaro.org>
 <20210927221359.2917482-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210927221359.2917482-4-mathieu.poirier@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 04:13:59PM -0600, Mathieu Poirier wrote:
> Add description and example for the vhost-user based RNG implementation.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Causes a build failure:

Warning, treated as error:
/scm/qemu/docs/system/devices/vhost-user-rng.rst:document isn't included in any toctree



> ---
>  docs/system/devices/vhost-user-rng.rst | 39 ++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 docs/system/devices/vhost-user-rng.rst
> 
> diff --git a/docs/system/devices/vhost-user-rng.rst b/docs/system/devices/vhost-user-rng.rst
> new file mode 100644
> index 000000000000..a145d4105c1a
> --- /dev/null
> +++ b/docs/system/devices/vhost-user-rng.rst
> @@ -0,0 +1,39 @@
> +QEMU vhost-user-rng - RNG emulation
> +===================================
> +
> +Background
> +----------
> +
> +What follows builds on the material presented in vhost-user.rst - it should
> +be reviewed before moving forward with the content in this file.
> +
> +Description
> +-----------
> +
> +The vhost-user-rng device implementation was designed to work with a random
> +number generator daemon such as the one found in the vhost-device crate of
> +the rust-vmm project available on github [1].
> +
> +[1]. https://github.com/rust-vmm/vhost-device
> +
> +Examples
> +--------
> +
> +The daemon should be started first:
> +
> +::
> +
> +  host# vhost-device-rng --socket-path=rng.sock -c 1 -m 512 -p 1000
> +
> +The QEMU invocation needs to create a chardev socket the device can
> +use to communicate as well as share the guests memory over a memfd.
> +
> +::
> +
> +  host# qemu-system								\
> +      -chardev socket,path=$(PATH)/rng.sock,id=rng0				\
> +      -device vhost-user-rng-pci,chardev=rng0					\
> +      -m 4096 									\
> +      -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on	\
> +      -numa node,memdev=mem							\
> +      ...
> -- 
> 2.25.1


