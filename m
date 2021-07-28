Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E7F3D9586
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:48:55 +0200 (CEST)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8obu-00082S-Io
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oZG-0005zW-B1
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oZC-0007kX-A4
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=38j4KHGfeTtxPMvZ695EDpmZWWPQKj4xsaoyI0iyuLQ=;
 b=G5iiFpt5C7XKF0a89AtwLT0gaE8d/N5oIjzPkc+ZE3tUzcPB2ptTze5eZj/mxh6ZMcKina
 y5RTvAFrd2mxqOtLYMf3GW0SvawPd2fDF3jt4AU8vCZHN+oku/g/lQyLdWgO6FHeVGmp2o
 zQ/7cmEm8YZr6myb3tZAjAOw7u8r5r4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-U-eAgVEcOE2oN2O4POBPdg-1; Wed, 28 Jul 2021 14:46:03 -0400
X-MC-Unique: U-eAgVEcOE2oN2O4POBPdg-1
Received: by mail-wm1-f70.google.com with SMTP id
 14-20020a05600c230eb029024b7cd56259so621210wmo.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=38j4KHGfeTtxPMvZ695EDpmZWWPQKj4xsaoyI0iyuLQ=;
 b=jif9ZF2DQfXGO4i7b2Q6fwjREqI0fc4FTYOyTponazHmkXogtuL5AxXMEZpVvoD5qc
 OZQXrhxn5XiFMjaq4KUBX6XASUzaFbXINtkcwaQv8kiD08nHrIwlRi8MyxTtvX8kKZSC
 jKL2268idfSF5g0PuVfMvBQlXx3kRIWnb0T/epwTT4BbQRtyefyKiov2FLixvr/lwPi4
 yhIPbSBfUukXhmyhN9tLFHvuCOxxHTOf8I7myQKXnyd2wH6CBeweAeMnWc0UT5TQhr1L
 53+EzHUBMu5kYm2h8jlnTvmXZWlfJw/rDV4TtwbbE4sjhbeuYvncKDPHtPUmMqMmdfbF
 hxxQ==
X-Gm-Message-State: AOAM530Igl4lOhJY7tLf1MfgiCz9waMaiBIpxzBEzbtSPwbiWpLYEnEC
 t/xH9isVa7Tf7TN+9Z7+pgXdZD4GtSivYOnKLGZKQwi9Htq1AB6wHk8jId7cBwRf3buvFCsGgQn
 Qk0iNVeDcfC5MyKQ=
X-Received: by 2002:a1c:48d:: with SMTP id 135mr953769wme.31.1627497962876;
 Wed, 28 Jul 2021 11:46:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzx8tY9940+Kd4MBYvlD4Q/QqcxXxFh8AbRnYrWi3Uszx+vkUXOdaaTP/QpLEhKavJc6a28Q==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr953746wme.31.1627497962651;
 Wed, 28 Jul 2021 11:46:02 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id n17sm7597022wmo.18.2021.07.28.11.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 11:46:02 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] virtio-gpu: hostmem [wip]
To: Antonio Caggiano <antonio.caggiano@collabora.com>, qemu-devel@nongnu.org
References: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
 <20210728134634.2142156-3-antonio.caggiano@collabora.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b48379de-c286-c6cb-7802-deaf438a9a5d@redhat.com>
Date: Wed, 28 Jul 2021 20:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728134634.2142156-3-antonio.caggiano@collabora.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.719, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 3:46 PM, Antonio Caggiano wrote:
> From: Gerd Hoffmann <kraxel@redhat.com>
> 
> ---
>  hw/display/virtio-gpu-base.c                |  4 +++
>  hw/display/virtio-gpu-pci.c                 | 14 +++++++++
>  hw/display/virtio-gpu.c                     |  1 +
>  hw/display/virtio-vga.c                     | 32 +++++++++++++++------
>  include/hw/virtio/virtio-gpu.h              |  5 ++++
>  include/standard-headers/linux/virtio_gpu.h |  5 ++++
>  6 files changed, 52 insertions(+), 9 deletions(-)

WIP aims for a RFC series.


