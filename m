Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69682382C6F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:42:48 +0200 (CEST)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lica7-0008MX-GS
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1licYb-0006mK-Q0
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1licYX-0004Da-68
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621255268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zc5pQVvR5NHAn9w4/pHD7eq9jWlNlfCuX6hnc+MgW7U=;
 b=BUQiofa9+35iJyyYzDudpiH8n916HTzQ/dfhAddJf23afzJXHSpWmsWvP/dXSkig4jMFRO
 sgRutpf9AoObywv4HU7ANLAzOB1ma2dMTqY6FbWmNmnoJlQCe7O3nujKH8LyTkC9L8ltWz
 LJwJ+OUvXi1/Wpi6qH0TQYcYaBnSyYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-glm_meCKOPi9Ao4WmKUA3A-1; Mon, 17 May 2021 08:41:04 -0400
X-MC-Unique: glm_meCKOPi9Ao4WmKUA3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84D2D801107;
 Mon, 17 May 2021 12:41:03 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-29.ams2.redhat.com
 [10.36.113.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E47719726;
 Mon, 17 May 2021 12:41:01 +0000 (UTC)
Subject: Re: [PATCH 03/21] qdev-properties: PropertyInfo: add
 realized_set_allowed field
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-5-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0f0cd3e2-f098-dd45-7e57-0f58eb08ef96@redhat.com>
Date: Mon, 17 May 2021 14:40:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
> Add field, so property can declare support for setting the property
> when device is realized. To be used in the following commit.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/hw/qdev-properties.h | 1 +
>   hw/core/qdev-properties.c    | 6 +++---
>   2 files changed, 4 insertions(+), 3 deletions(-)

Looks OK to me, although qdev isn’t my specialty.

> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 0ef97d60ce..007e1f69f4 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -32,6 +32,7 @@ struct PropertyInfo {
>       const char *name;
>       const char *description;
>       const QEnumLookup *enum_table;
> +    bool realized_set_allowed;

I think a comment would be nice, though.

Max

>       int (*print)(Object *obj, Property *prop, char *dest, size_t len);
>       void (*set_default_value)(ObjectProperty *op, const Property *prop);
>       ObjectProperty *(*create)(ObjectClass *oc, const char *name,
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 50f40949f5..c34aac6ebc 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -26,11 +26,11 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
>   
>   /* returns: true if property is allowed to be set, false otherwise */
>   static bool qdev_prop_allow_set(Object *obj, const char *name,
> -                                Error **errp)
> +                                const PropertyInfo *info, Error **errp)
>   {
>       DeviceState *dev = DEVICE(obj);
>   
> -    if (dev->realized) {
> +    if (dev->realized && !info->realized_set_allowed) {
>           qdev_prop_set_after_realize(dev, name, errp);
>           return false;
>       }
> @@ -79,7 +79,7 @@ static void field_prop_set(Object *obj, Visitor *v, const char *name,
>   {
>       Property *prop = opaque;
>   
> -    if (!qdev_prop_allow_set(obj, name, errp)) {
> +    if (!qdev_prop_allow_set(obj, name, prop->info, errp)) {
>           return;
>       }
>   
> 


