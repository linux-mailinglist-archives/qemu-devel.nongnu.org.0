Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8466A75DC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:09:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTgj-0004PQ-AF; Wed, 01 Mar 2023 16:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTgh-0004Ll-BC
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:08:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTgf-0007S9-Nl
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677704913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CwJM6EV+NZ573/WsyVyTFBl18QW89Ii+o62SEmExYIo=;
 b=Mj20khr8eQ/Vnk58haio6oOmitFS3+0nPny8hIlcf2eG5YS3uNMDFDZEO5DZZUdXKwHIQ/
 u7yPWxj38EhL5N+l5fa0t9/mWwgaEZ8G7Y7ccrfjTfPiLkrbjKRc4dB8BMuKeksoyUGian
 NJMD9aXbBQ/s2+Ef7/F8an3auHEkqnE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-ZwufVvx2M9ag62EnHL2hcw-1; Wed, 01 Mar 2023 16:08:31 -0500
X-MC-Unique: ZwufVvx2M9ag62EnHL2hcw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i18-20020a05600011d200b002c94d861113so2772660wrx.16
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677704909;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CwJM6EV+NZ573/WsyVyTFBl18QW89Ii+o62SEmExYIo=;
 b=yIJJ+7tByjmUaMDEmu8SP6r2ah+5Jz35aiqGZE2YwuJu2fl+hHiNGYCDbBqv11GmPG
 05Auy79FZW0FNzB5EyfGeTByPOE8gZzQXP5OjfaCNclua7sap0ch4ccH3eCRyV8E1V8E
 Cmy1Qlysixv1fuDQN0Hye9bodNHa42FMHjxrK6e1ikjvdxSQCxoi+0i5yoZrpnctaLUv
 g0SdPgJ1QpnTYIZkSsX6EAwDjV2uaG2L71n1aKnU8N3hwuh7GbuEeWqm89HzwrvuCoTs
 0qu5C+CaytBUSVyLUYGpjwu40vU08NMa9FaUeKZfsBfSdalJz+khymfXvokeZYgxaSsj
 g0SQ==
X-Gm-Message-State: AO0yUKXCFZrXOMHbzJDaPB3W7a+yZLfEGGfScDj+Hf2gnD0w+LqTdEUw
 WG4gt6j+QGSRRtXbyPVY971o7ie95aUrYPaEErJ3ZpZpAEfzPWOKccsvsWA0pbfhK6dDAWiGA0K
 9BOCDI1eMd3mK5ZM=
X-Received: by 2002:a05:600c:997:b0:3eb:39e0:3530 with SMTP id
 w23-20020a05600c099700b003eb39e03530mr5902564wmp.41.1677704909755; 
 Wed, 01 Mar 2023 13:08:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9Xgs6v00k/CFIfKmqp6t137szU4B2VPl6efo2c/MuxUKC14o4n6Q8F6lC3NjuGwKlAAwhXXw==
X-Received: by 2002:a05:600c:997:b0:3eb:39e0:3530 with SMTP id
 w23-20020a05600c099700b003eb39e03530mr5902550wmp.41.1677704909355; 
 Wed, 01 Mar 2023 13:08:29 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 o6-20020a1c7506000000b003dc522dd25esm663593wmc.30.2023.03.01.13.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:08:28 -0800 (PST)
Date: Wed, 1 Mar 2023 16:08:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: Re: [PATCH v5 14/18] qapi/qdev.json: unite DEVICE_* event data into
 single structure
Message-ID: <20230301160809-mutt-send-email-mst@kernel.org>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-15-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216180356.156832-15-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 16, 2023 at 09:03:52PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> DEVICE_DELETED and DEVICE_UNPLUG_GUEST_ERROR has equal data, let's
> refactor it to one structure. That also helps to add new events
> consistently.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Needs ack from QAPI maintainers.

> ---
>  qapi/qdev.json | 39 +++++++++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 2708fb4e99..135cd81586 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -114,16 +114,37 @@
>  { 'command': 'device_del', 'data': {'id': 'str'} }
>  
>  ##
> -# @DEVICE_DELETED:
> +# @DeviceAndPath:
>  #
> -# Emitted whenever the device removal completion is acknowledged by the guest.
> -# At this point, it's safe to reuse the specified device ID. Device removal can
> -# be initiated by the guest or by HMP/QMP commands.
> +# In events we designate devices by both their ID (if the device has one)
> +# and QOM path.
> +#
> +# Why we need ID? User specify ID in device_add command and in command line
> +# and expects same identifier in the event data.
> +#
> +# Why we need QOM path? Some devices don't have ID and we still want to emit
> +# events for them.
> +#
> +# So, we have a bit of redundancy, as QOM path for device that has ID is
> +# always /machine/peripheral/ID. But that's hard to change keeping both
> +# simple interface for most users and universality for the generic case.
>  #
>  # @device: the device's ID if it has one
>  #
>  # @path: the device's QOM path
>  #
> +# Since: 8.0
> +##
> +{ 'struct': 'DeviceAndPath',
> +  'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @DEVICE_DELETED:
> +#
> +# Emitted whenever the device removal completion is acknowledged by the guest.
> +# At this point, it's safe to reuse the specified device ID. Device removal can
> +# be initiated by the guest or by HMP/QMP commands.
> +#
>  # Since: 1.5
>  #
>  # Example:
> @@ -134,18 +155,13 @@
>  #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>  #
>  ##
> -{ 'event': 'DEVICE_DELETED',
> -  'data': { '*device': 'str', 'path': 'str' } }
> +{ 'event': 'DEVICE_DELETED', 'data': 'DeviceAndPath' }
>  
>  ##
>  # @DEVICE_UNPLUG_GUEST_ERROR:
>  #
>  # Emitted when a device hot unplug fails due to a guest reported error.
>  #
> -# @device: the device's ID if it has one
> -#
> -# @path: the device's QOM path
> -#
>  # Since: 6.2
>  #
>  # Example:
> @@ -156,5 +172,4 @@
>  #      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
>  #
>  ##
> -{ 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
> -  'data': { '*device': 'str', 'path': 'str' } }
> +{ 'event': 'DEVICE_UNPLUG_GUEST_ERROR', 'data': 'DeviceAndPath' }
> -- 
> 2.34.1


