Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B63EE883
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 10:30:28 +0200 (CEST)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFuUN-0006sf-HG
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 04:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mFuSf-0005Hn-Ak
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mFuSd-0005eH-80
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629188918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tp2fILMnP7c1pzyLIKAn8iP7WUlnLOYrMK410JTKhvE=;
 b=QK/S2oOr9XHv8V/EcgDILutRIsehZub5tJhcGoMjYz9hG52UdjU9ask6ieXyhI5c3MWuBS
 VkSf7cOgkdIYZZcCLrNhYaHbVP9mxtTYLqAwCsPTxC/yAXlZ9uKKwrYKmRwFNMwDNnjfgF
 EvhWXqdWU4zW097TdG9vMSfSltYA1II=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-sKbpifrzM66Jo43MvoOfYA-1; Tue, 17 Aug 2021 04:28:37 -0400
X-MC-Unique: sKbpifrzM66Jo43MvoOfYA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f6-20020a05600c1546b029025af999e04dso4767540wmg.7
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 01:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Tp2fILMnP7c1pzyLIKAn8iP7WUlnLOYrMK410JTKhvE=;
 b=VzW1PX1lFmfeYndf91pdrCwJPuEFb//tHQDtshWUum2UILNd/jL4IIVhZRDshwLYu9
 7Mm7+ePpcJ/Mp+eSPMclBQC/TF5j5wP/FNetLIWHV4sotP4SCAIzyHoAWsiKldF2nGAT
 8yHp1y7QKnEsjgDF6Q4yaGSfsPN0MrapOUjuGEWPuod8d8IYLHJoCzao46rM9j+uvKfA
 GyyTF81QEfdsmF8szXk++3JmR0rbh0XMwL3J+mOLD43NkaBa8fkGAxd7QoOKk13D4+bd
 QZy0Xef3zwHfrmQh7Bguyy/zFmJz6ZnjANSkLkuKtbAHlHTtLUXZmyaaQKLQ5YpkZ8qa
 I9/g==
X-Gm-Message-State: AOAM531aewOkElMWrqbwf/Dv71YG0zz9Uj4qHjzt1JvzVfwKzzTAjl7f
 k427Zp9KKThcvh2gl6+zlmAR1miSb3ZIAtaxullfYhFCoMsQMXZ0n1UWazWh4IBsaHAOaVgF5Cw
 mGDv+S/O7aSw3d6I=
X-Received: by 2002:a05:6000:10d:: with SMTP id
 o13mr2533350wrx.102.1629188916226; 
 Tue, 17 Aug 2021 01:28:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxrmYxyea4Q8G1mPNyUss0LfPcseeeGnJPYd15CaYTkh4HbNC0yn4TXZwmOw/dF3U0Ewwm5g==
X-Received: by 2002:a05:6000:10d:: with SMTP id
 o13mr2533340wrx.102.1629188916075; 
 Tue, 17 Aug 2021 01:28:36 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 g12sm1524838wru.85.2021.08.17.01.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 01:28:35 -0700 (PDT)
Subject: Re: [PATCH] qemu-storage-daemon: Only display FUSE help when FUSE is
 built-in
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210816180442.2000642-1-philmd@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <1ee592ba-efb9-08ab-5137-5463ea6a6557@redhat.com>
Date: Tue, 17 Aug 2021 10:28:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816180442.2000642-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qing Wang <qinwang@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.08.21 20:04, Philippe Mathieu-Daudé wrote:
> When configuring QEMU with --disable-fuse, the qemu-storage-daemon
> still reports FUSE command line options in its help:
>
>    $ qemu-storage-daemon -h
>    Usage: qemu-storage-daemon [options]
>    QEMU storage daemon
>
>      --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>
>               [,growable=on|off][,writable=on|off]
>                             export the specified block node over FUSE
>
> Remove this help message when FUSE is disabled, to avoid:
>
>    $ qemu-storage-daemon --export fuse
>    qemu-storage-daemon: --export fuse: Invalid parameter 'fuse'
>
> Reported-by: Qing Wang <qinwang@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   storage-daemon/qemu-storage-daemon.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


