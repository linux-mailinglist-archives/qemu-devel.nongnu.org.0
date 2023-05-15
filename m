Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799AF702763
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:40:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTiG-00078L-T6; Mon, 15 May 2023 04:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyTiD-00075i-3z
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyTiB-0003T8-F2
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684139862;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uycywLDTlVxNKYvAeYFf+amTd5OBZMEtpMq6zU3s3b8=;
 b=XOlS2/aOGJQ0mGsCxDTown9wvDeZeScDPhbi3m5pU6ZIgt/1Mz35zyZ70pmkgi6erRd8sc
 +P9Q3AMjmAYFeBXyD/TDsdhmspntmUSHYI2jU6fVmAIzIc1eXG+bgDNUpSWdjjINH/fr5J
 4Kq+iJex3Hd0wgWc6zG6ZHNLHGompDw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-_qr7ZTu6OHu0lLH0isyaHg-1; Mon, 15 May 2023 04:37:40 -0400
X-MC-Unique: _qr7ZTu6OHu0lLH0isyaHg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3078ad2f421so6248869f8f.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 01:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684139859; x=1686731859;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uycywLDTlVxNKYvAeYFf+amTd5OBZMEtpMq6zU3s3b8=;
 b=dYbdWYOJLmjFnGwBYOMe5/xL95PcLOwBGBfrFZAyld2oxJnN3lWiWeixj3R9y6uFUl
 VgqNXcDSDsYc3iLEcmComMb4YSz2XLLJZONY0/jobwS3u+rP0Q5+Z7gKQETzY22htgxM
 XkQ0oAytFB5G/QqXJVLV4tVCHwDoGPTHo4FTQHJocRLcmP3hAdt6uqPNe2kSddtCvYGL
 WCE+JEBbwL9ilfpBq9Xi6frr7owpIM/DTO3M+Z9pRzQhWRS5eVglRDkvPG2pvsEVNEjc
 wi4GgiaftaCWe0ZNPUzEck8H2vasg3GQm+l4CWMHIiUCGJ2MF42Y4DNti0yzTrJF7YuS
 e7Ag==
X-Gm-Message-State: AC+VfDxuJD+9TkwOpYQKvu6SB5YDY7khZjY0dX5cfhyw9Q31qrPsmB+b
 tfv4eyQE9Cle3PaKjRPG7zi42X3TejOzIqfEbdZKh30i/ojQxEspe25y61J3pLPK3lZYdNtCbma
 nnVx8jZGAePIDUao=
X-Received: by 2002:adf:f208:0:b0:2fb:1d3a:93ff with SMTP id
 p8-20020adff208000000b002fb1d3a93ffmr24146691wro.61.1684139859562; 
 Mon, 15 May 2023 01:37:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5APdqf1SHQTHyiucH3MZagVTn8zQKAuHfUUBJ+///I3dQiHDhq8Tl08aCaDj6gOQRVFgcPrQ==
X-Received: by 2002:adf:f208:0:b0:2fb:1d3a:93ff with SMTP id
 p8-20020adff208000000b002fb1d3a93ffmr24146670wro.61.1684139859274; 
 Mon, 15 May 2023 01:37:39 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 w3-20020a05600018c300b002fe96f0b3acsm31926689wrq.63.2023.05.15.01.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 01:37:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  armbru@redhat.com,
 eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 1/8] migration: introduced 'MigrateAddress' in QAPI
 for migration wire protocol.
In-Reply-To: <20230512143240.192504-2-het.gala@nutanix.com> (Het Gala's
 message of "Fri, 12 May 2023 14:32:33 +0000")
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-2-het.gala@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 10:37:37 +0200
Message-ID: <878rdq2dny.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Het Gala <het.gala@nutanix.com> wrote:
> This patch introduces well defined MigrateAddress struct and its related child
> objects.
>
> The existing argument of 'migrate' and 'migrate-incoming' QAPI - 'uri' is of
> string type. The current migration flow follows double encoding scheme for
> fetching migration parameters such as 'uri' and this is not an ideal design.
>
> Motive for intoducing struct level design is to prevent double encoding of QAPI
> arguments, as Qemu should be able to directly use the QAPI arguments without
> any level of encoding.
>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  qapi/migration.json | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 82000adce4..bf90bd8fe2 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1423,6 +1423,47 @@
>  ##
>  { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>  
> +##
> +# @MigrateTransport:
> +#
> +# The supported communication transport mechanisms for migration
> +#
> +# @socket: Supported communication type between two devices for migration.
> +#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
> +#          'fd' already
> +#
> +# @exec: Supported communication type to redirect migration stream into file.
> +#
> +# @rdma: Supported communication type to redirect rdma type migration stream.
> +#
> +# Since 8.0

8.1

I can fix that if it gets acked from someone from QAPI.

> +##
> +{ 'enum': 'MigrateTransport',
> +  'data': ['socket', 'exec', 'rdma'] }
> +
> +##
> +# @MigrateExecCommand:
> + #
> + # Since 8.0
> + ##
> +{ 'struct': 'MigrateExecCommand',
> +   'data': {'args': [ 'str' ] } }
> +
> +##
> +# @MigrateAddress:
> +#
> +# The options available for communication transport mechanisms for migration
> +#
> +# Since 8.0
> +##
> +{ 'union': 'MigrateAddress',
> +  'base': { 'transport' : 'MigrateTransport'},
> +  'discriminator': 'transport',
> +  'data': {
> +    'socket': 'SocketAddress',
> +    'exec': 'MigrateExecCommand',
> +    'rdma': 'InetSocketAddress' } }
> +
>  ##
>  # @migrate:
>  #

I will wait for a comment from QAPI people, from migration point of
view:

Reviewed-by: Juan Quintela <quintela@redhat.com>


