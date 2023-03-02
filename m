Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E2D6A7D04
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:45:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeYm-0005up-C7; Thu, 02 Mar 2023 03:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeYk-0005u3-IL
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:45:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeYi-0001f8-OY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677746702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=880ZDJkWO5s+Y7/TcwUSsavo32ltg1ovbeUf8Nwk5qU=;
 b=VpTnQXxD1jCnaH3wh43VmF73cGblC98n46cey19+xzFfmPBbM+Wn6t94fLPlCbpA9TY6MB
 Z1HShab8pv3iCXzZB8/EC1cGSCd0ZsscOY88mfwkwLQUgwN5Ty8+CWUvZuKN6keMFFGBbd
 qa4V373tHoSNZO0TXLMhpTMkIjtqlV4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-mApDypdwO7CprvuL7pjDHA-1; Thu, 02 Mar 2023 03:45:01 -0500
X-MC-Unique: mApDypdwO7CprvuL7pjDHA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so760608wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677746700;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=880ZDJkWO5s+Y7/TcwUSsavo32ltg1ovbeUf8Nwk5qU=;
 b=wWt8+JGqsOufO/gYSmTlLUnlVptJLqTCoU/QCJrohab5nTk0x9sb6W14FSTOKeS7xD
 u615UQm/5g6URQBGrgcLDUxk8kF+wrjYzh99jr9UOLkRT+DLXDHBaV4uxPWr4Lef3eL4
 ZbzrcZMDO8Lb40fweiX57njqitd3YbQRhgSC4sXA2QWzinWH4M29L+Ma4WnXbESg6KPe
 Jb7aFujkn8kd7aX/V5QmDzPLTILoei6mwp5mhcFmJ4MXcZSi21xS0DXS9HQLYv5FFakt
 BQJiYQ+kXSvq9P1YR9UJIOkjknzj7x1QZEZt1TLm49AGzAg5nyL0LNIr+HkRt01w9Oa7
 ik7Q==
X-Gm-Message-State: AO0yUKVl8bcvVQFNkTDpwyQGqNAN/hxr93BLolMQzBwS6o4BuYxfvQdR
 uZVJbtzSG6wyjBMr/LlYrcngEmzw0jo7QwNIHUGK1C6tGN4r2EnXFeQFVDWkygREuW6JRtg7ytD
 iYih9PkZyaJehhZU=
X-Received: by 2002:a5d:510f:0:b0:2c7:1c31:2348 with SMTP id
 s15-20020a5d510f000000b002c71c312348mr7509799wrt.19.1677746700646; 
 Thu, 02 Mar 2023 00:45:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/XuZ5Jin0Cn0MPpm9rEXcipzFwk04VYnSYZ7Du+1fsvEBdHeqb1irk6SElj/aL88ZKESCv0Q==
X-Received: by 2002:a5d:510f:0:b0:2c7:1c31:2348 with SMTP id
 s15-20020a5d510f000000b002c71c312348mr7509781wrt.19.1677746700314; 
 Thu, 02 Mar 2023 00:45:00 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 t14-20020adfe44e000000b002c5503a8d21sm14990661wrm.70.2023.03.02.00.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:44:59 -0800 (PST)
Date: Thu, 2 Mar 2023 03:44:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: Re: [PATCH v5 18/18] qapi: introduce DEVICE_ON event
Message-ID: <20230302034409-mutt-send-email-mst@kernel.org>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-19-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216180356.156832-19-vsementsov@yandex-team.ru>
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

On Thu, Feb 16, 2023 at 09:03:56PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We have DEVICE_DELETED event, that signals that device_del command is
> actually completed. But we don't have a counter-part for device_add.
> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
> when the device in some intermediate state. Let's add an event that say
> that the device is finally powered on, power indicator is on and
> everything is OK for next manipulation on that device.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  qapi/qdev.json | 10 ++++++++++
>  hw/pci/pcie.c  | 14 ++++++++++++++
>  hw/pci/shpc.c  | 12 ++++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 6f2d8d6647..116a8a7de8 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -348,3 +348,13 @@
>  { 'command': 'query-hotplug',
>    'data': { 'id': 'str' },
>    'returns': 'HotplugInfo' }
> +
> +##
> +# @DEVICE_ON:
> +#
> +# Emitted whenever the device insertion completion is acknowledged by the guest.
> +# For now only emitted for SHPC and PCIe-native hotplug.
> +#
> +# Since: 8.0
> +##
> +{ 'event': 'DEVICE_ON', 'data': 'DeviceAndPath' }

Same as any event, this has to be accompanied by a query.
Which query returns the "ON" status?

-- 
MST


