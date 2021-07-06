Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027753BC4EE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 04:54:00 +0200 (CEST)
Received: from localhost ([::1]:53154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0bDi-0003PO-GW
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 22:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0bCk-0002ku-OJ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 22:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0bCh-0005nH-Hx
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 22:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625539973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKkC5RK2i5n4axh0wCHh6HEmW3hBQ7B0OZoTQLTmEUk=;
 b=MpXguXENtSzo5ieGRlt2NC2AfNcrKMLvcfhzWrtLHRJ044qiBv9Isj/Wrkg+Uh+moNjGHA
 1Ma2F1Ya9G+K4vMzrCC/cUtoZ+jQ1nQGaFPYuucY8NTYKTu7FiEoetJF+pDlr9cCOUoQ+X
 c8W0ledBJ9HUaNEk5YGjRAP6JtnKdhY=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-7uhqyQe9PNqd1tao0QvH_w-1; Mon, 05 Jul 2021 22:52:51 -0400
X-MC-Unique: 7uhqyQe9PNqd1tao0QvH_w-1
Received: by mail-pg1-f199.google.com with SMTP id
 x9-20020a6541490000b0290222fe6234d6so15018363pgp.14
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 19:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FKkC5RK2i5n4axh0wCHh6HEmW3hBQ7B0OZoTQLTmEUk=;
 b=CQ3/M/GObOBoqCJU4BgwOPcNO5G6wQ3YH/TN3XR7vkt8kjX2GplF0TglscflYt+mEc
 ziCG402OuXf2XPYA3gAWIKz+GGfWA/YeTSj2bizDxonaTtdxig8XJ7uYKPgDAHae2F69
 71TV8i+d5EEYjnfHradT51FDdqJbtKwRU+f54EoHrPamaGmpLbXPuLB7WlGnah7QcqWt
 CJvK5Wdjppk8qmpLL09YAsOWFCr6CMlT9mp9/ceriF82j1mwpH+BrwRE9Lb2SYY5A8CM
 qCJwv/xbUEPB8sJlnkysm4SdBA0AuR9qw1Z9kSKeIfUdI1bbKYsQYeN0I8oXdj6Zq8re
 O9rw==
X-Gm-Message-State: AOAM533CDz+hOlV1X07cD47aPfXcliMSwjxJfOFATkRzFB5wT81bhq7B
 Xg0yC025jARjwl0blCjVGDoFetdtepNwz94r6ulZ7AQCR4q5eKC4DF7ANdCC9m48eNTt/4PV/jw
 TXCGwfuXPctPfIB8=
X-Received: by 2002:a17:902:ec88:b029:129:a87d:f0b4 with SMTP id
 x8-20020a170902ec88b0290129a87df0b4mr1332044plg.3.1625539970728; 
 Mon, 05 Jul 2021 19:52:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOzc+wFIN8oWCH+D8GSoC9AbBGerwjsMCgO67sIqUddm+NBBUQHJXYuU90HHLoCByJ20XRTg==
X-Received: by 2002:a17:902:ec88:b029:129:a87d:f0b4 with SMTP id
 x8-20020a170902ec88b0290129a87df0b4mr1332027plg.3.1625539970501; 
 Mon, 05 Jul 2021 19:52:50 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p3sm867530pjt.0.2021.07.05.19.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 19:52:50 -0700 (PDT)
Subject: Re: [PATCH] migration: failover: reset partially_hotplugged
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210629152937.619193-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fe63f84b-a4ff-b068-8608-2864dbb28a64@redhat.com>
Date: Tue, 6 Jul 2021 10:52:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629152937.619193-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Jens Freimann <jfreimann@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/29 ÏÂÎç11:29, Laurent Vivier Ð´µÀ:
> When the card is plugged back, reset the partially_hotplugged flag to false
>
> Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1787194
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   hw/net/virtio-net.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index bd7958b9f0ee..16d20cdee52a 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3234,6 +3234,7 @@ static bool failover_replug_primary(VirtIONet *n, DeviceState *dev,
>           }
>           hotplug_handler_plug(hotplug_ctrl, dev, &err);
>       }
> +    pdev->partially_hotplugged = false;
>   
>   out:
>       error_propagate(errp, err);


Acked-by: Jason Wang <jasowang@redhat.com>



