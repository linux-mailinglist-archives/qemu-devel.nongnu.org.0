Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67A05024C3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 07:47:53 +0200 (CEST)
Received: from localhost ([::1]:51518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfEoC-00080W-Rq
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 01:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nfEk0-0006Of-Lr
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 01:43:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nfEjy-000181-Ki
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 01:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650001410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Ah2XURx1JlkV/S8bxYYezOvvBW+5AwYlVMUkGq6WMs=;
 b=fhxujMbOP1+wYzljYHbEKqN7wq4SC75yX0g78Z+xr4zSKRGZRg5z0l1rsQTZPY7ReChgqz
 vPm5naE1mKpGKaVncSPtIuVy1mrmvsAfzNXShgbN+t6Qoe/ayqh28J4tNAM19roQLqypap
 f6g8HlgeMNlfJililWseJyythXiX/K4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-w4eHMQNCO1qInRPwfZ3mwQ-1; Fri, 15 Apr 2022 01:43:27 -0400
X-MC-Unique: w4eHMQNCO1qInRPwfZ3mwQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 q1-20020a17090a2dc100b001cba43e127dso4199860pjm.9
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 22:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Ah2XURx1JlkV/S8bxYYezOvvBW+5AwYlVMUkGq6WMs=;
 b=Y4HscjYuyqqFpc0C0Gco0FEDkR94mSyhEVjtNbZWeEhPt68CfacIn+taA8EJHGzN0+
 n9D8DGfiQYh4KHG44tlLnLpf2vniwvexYpqQb4pfnVBRiLTKsgCL0rVFUmMsBVqJfsXM
 reSXMUdYtGrpSmAxN4GJ7R6rx6CNFMO8OFb2FTMBbRDBNKMZdhYd6zdb/XNca5h3w9Kf
 hDFM75BnV0zBduHlI0UzI89gtoa0vp1LuOMS61Jgzxq8OQUrfZV01Ik1raAl9DPl3usp
 QuW4SclIU1W87UFZ1cDcjJuwx96CUzvolixKLTSI5w3l+ORc333gmweE04HDkpAFaUQQ
 lVMw==
X-Gm-Message-State: AOAM531MIeEkTI95ZMHWi7A+G/1Xo9ffdU9TltrXzMThLyrxZQHY0oR7
 XDQmluYtaH5kjrFbZTjksqSn0749vydJ+NmLYX9i3lHvwxn4lqkecJ+ZBQ82N3WsGlTTJKGUiqY
 2usHIqJp4AIT1AhA=
X-Received: by 2002:a17:90b:1192:b0:1cb:59d0:d06f with SMTP id
 gk18-20020a17090b119200b001cb59d0d06fmr2370838pjb.127.1650001406852; 
 Thu, 14 Apr 2022 22:43:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeyiXcP4NdaVEmmhE2sNPPQE1g9gmJ61ZHcPs28dSX7dRmsi+RwOH7fPL1TA1tbMMNdlx/YA==
X-Received: by 2002:a17:90b:1192:b0:1cb:59d0:d06f with SMTP id
 gk18-20020a17090b119200b001cb59d0d06fmr2370820pjb.127.1650001406593; 
 Thu, 14 Apr 2022 22:43:26 -0700 (PDT)
Received: from [10.72.13.51] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 u206-20020a6279d7000000b00505fdc42bf9sm1556555pfc.101.2022.04.14.22.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 22:43:26 -0700 (PDT)
Message-ID: <3acc2973-fa44-25f5-c762-8cba20260e90@redhat.com>
Date: Fri, 15 Apr 2022 13:43:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH 0/5] Vhost-user: add Virtio RSS support
To: Maxime Coquelin <maxime.coquelin@redhat.com>, qemu-devel@nongnu.org,
 mst@redhat.com, andrew@daynix.com, yuri.benditovich@daynix.com,
 dgilbert@redhat.com, quintela@redhat.com
References: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: chenbo.xia@intel.com, dmarchan@redhat.com, ktraynor@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/8 20:28, Maxime Coquelin 写道:
> The goal of this series is to add support for Virtio RSS
> feature to the Vhost-user backend.
>
> First patches are preliminary reworks to support variable
> RSS key and indirection table length. eBPF change only adds
> checks on whether the key length is 40B, it does not add
> support for longer keys.
>
> Vhost-user implementation supports up to 52B RSS key, in
> order to match with the maximum supported by physical
> NICs (Intel E810). Idea is that it could be used for
> application like Virtio-forwarder, by programming the
> Virtio device RSS key into the physical NIC and let the
> physical NIC do the packets distribution.
>
> DPDK Vhost-user backend PoC implementing the new requests
> can be found here [0], it only implements the messages
> handling, it does not perform any RSS for now.
>
> [0]: https://gitlab.com/mcoquelin/dpdk-next-virtio/-/commits/vhost_user_rss_poc/


Not directly related to this series. I wonder if vhost-user consider to 
support control virtqueue then all the RSS stuffs could be done at 
vhost-user backend without introducing new commands.

Thanks


>
> Maxime Coquelin (5):
>    ebpf: pass and check RSS key length to the loader
>    virtio-net: prepare for variable RSS key and indir table lengths
>    virtio-net: add RSS support for Vhost backends
>    docs: introduce RSS support in Vhost-user specification
>    vhost-user: add RSS support
>
>   docs/interop/vhost-user.rst       |  57 ++++++++++++
>   ebpf/ebpf_rss-stub.c              |   3 +-
>   ebpf/ebpf_rss.c                   |  17 ++--
>   ebpf/ebpf_rss.h                   |   3 +-
>   hw/net/vhost_net-stub.c           |  10 ++
>   hw/net/vhost_net.c                |  22 +++++
>   hw/net/virtio-net.c               |  87 +++++++++++++-----
>   hw/virtio/vhost-user.c            | 146 +++++++++++++++++++++++++++++-
>   include/hw/virtio/vhost-backend.h |   7 ++
>   include/hw/virtio/virtio-net.h    |  16 +++-
>   include/migration/vmstate.h       |  10 ++
>   include/net/vhost_net.h           |   4 +
>   12 files changed, 344 insertions(+), 38 deletions(-)
>


