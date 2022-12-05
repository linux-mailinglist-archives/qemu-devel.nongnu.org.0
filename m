Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06472642307
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 07:39:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2579-0005Ah-JX; Mon, 05 Dec 2022 01:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p256y-00058j-On
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 01:37:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p256w-0003TP-Ru
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 01:37:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670222273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=apcYAJBSyFYf1kAdu5bDGn8ryVNHg9TfyWL9vTMw6Jk=;
 b=h3wXnWh30dVeStQ+bZKOtA/kKAMUwYrU+6PyEPkJmFnmcTndWY5ISa5ZZGtBitffE/9FpV
 tIgl742AJZatl3yLUcFEGKb3oyk0rMPEAsCNUd+awt48opnyAApqDm5WQj7OR6i75aZqU2
 h+6CJZalJFd5Zi1tTifr3FDbTxR4fMs=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-hik32HP4Npaoq7AoFt9Krw-1; Mon, 05 Dec 2022 01:37:51 -0500
X-MC-Unique: hik32HP4Npaoq7AoFt9Krw-1
Received: by mail-ot1-f70.google.com with SMTP id
 v17-20020a9d7d11000000b0066c33c3e0easo6274286otn.11
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 22:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=apcYAJBSyFYf1kAdu5bDGn8ryVNHg9TfyWL9vTMw6Jk=;
 b=vkplYYBog/3A0gJuX4gKSDpaEQO61VO1jfuYb5tVIYR1ajrsGfMWufHbJfkP/WWOEf
 UDF0f97P3wUHosXJiE4TM5voITRnAqFaF+tt/lGbyuSnkptoLU4kp94LJo2cO3RTPf6a
 lkjXt/a0COtcbYE13nHBBBkPwK83A354jXs1uQyggUY0APJBo5hn1DB6Sy23mSR5PaWd
 kGDD2E40zNbrwqojn9K3Lg9Mnz+jgeo1BYwCyfSse7YzqAHHu2JID2FLYgHoCcJi1Cny
 H0PqNX/stbdcCuhmwogaoFtakcl6dX4nHIMIg4rOw4nB5SomBME/SvO2rd9dL8KHv4mr
 KzvQ==
X-Gm-Message-State: ANoB5pneFI956qfVBiqb4G+De+ahDL8Iu6Q7DOFYFYtr0HweNJe+7SCh
 QPj1dc8fkm4X4Si7HuwbmlFbYLGHHaYvfTFgJtiCsAvWJJZ8rbS9QQR09RerqfKMU6JjgHUTa+0
 da9Kbyo9BBQKR1h04Ox1H2toutOi4tsg=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr40643433otb.237.1670222270522; 
 Sun, 04 Dec 2022 22:37:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6f6IXSNrTrY/vQXCaZHumPOXEbRg8QuMV4oQTZbHOVx0mn32j/uo5TdSmzXiBXEQY78TWJlDqybKA8gAbGDv0=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr40643429otb.237.1670222270309; Sun, 04
 Dec 2022 22:37:50 -0800 (PST)
MIME-Version: 1.0
References: <0357c2371db0438eac0de474db2b8ddc@huawei.com>
In-Reply-To: <0357c2371db0438eac0de474db2b8ddc@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 5 Dec 2022 14:37:39 +0800
Message-ID: <CACGkMEtm=P27rQLJOWZgVaf=N0VWU1Vo1NnCxnU9D6ZPhb7JVg@mail.gmail.com>
Subject: Re: [PATCH] net: Fix qemu crash when hot-pluging a vhost-net failed.
To: Yangming <yangming73@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wangzhigang (O)" <wangzhigang17@huawei.com>, 
 "zhangliang (AG)" <zhangliang5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Mon, Dec 5, 2022 at 2:23 PM Yangming <yangming73@huawei.com> wrote:
>
> Dear all:
>
>
>
> I found a bug of qemu: hot-pluging a vhost-net may cause virtual machine crash in following steps:
> 1. Starting a vm without any net device.
> 2. Hot-pluging 70 memory devices.
> 3. Hot-pluging a vhost-net device.
>
>
>
> After the 3rd step, the qemu crashed with following messages:
>
>
>
> vhost backend memory slots limit is less than current number of present memory slots
>
> warning: vhost-net requested but could not be initialized
>
> qemu-system-x86_64: ../net/net.c:1106: net_client_init1: Assertion `nc' failed.
>
> 2022-12-05 03:14:08.794+0000: shutting down, reason=crashed
>
>
>
> This commit is used to fix the mentioned problem. It is based on commit a33c25399f9bc3dcf83064adeba2a82e61bf4608 of master branch.

Thanks for the patch, would you please send a formal patch (not as an
attachment), you can do it via git-send-email.

Thanks

>
>
>
> Kind regards.
>
>


