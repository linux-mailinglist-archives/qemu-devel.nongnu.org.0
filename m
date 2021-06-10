Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6D73A24A6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:43:21 +0200 (CEST)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEPQ-0004yt-C8
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lrENc-0004H9-EV
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lrENY-0001OT-TV
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhmNy54xP/hV8MnknPq7fB9c9PaICEeaqwj8wNw20OA=;
 b=JMGezbmNyzJbM1rmp5GMRsesPsXc4Dv6uC4rg+LM1LkgC/aixXj5cWSKWAj11Z7Pf/8iZE
 lZveWQA7baWtSUsVgbm8zD9jGLIiiHZpRdhGVrb4cVJkjg21sMzSTNFWfrbgdEMifXFRQS
 SjpF8x2pyycr9ybqJ0bRMtjOyb8JGJg=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-VQlQHnlqNZqJcHz4xwqipg-1; Thu, 10 Jun 2021 02:41:21 -0400
X-MC-Unique: VQlQHnlqNZqJcHz4xwqipg-1
Received: by mail-pf1-f197.google.com with SMTP id
 y11-20020aa79e0b0000b02902e9e0e19fdcso678453pfq.14
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uhmNy54xP/hV8MnknPq7fB9c9PaICEeaqwj8wNw20OA=;
 b=ZHwqbm+t+cD5lo7I6N0rIPNliRo93CsiioNMUFoAhL0nr6tLp+BAmF1E3X8BoXDy08
 Bvsht6r8wUA+8phPgL1yo2Uhefe3in7FUILfy0tvp74lwiSAPMIAzIBfYP5e85UVFsiu
 ikIMn3V1MEJgaCfSnOoVirWSzZHsDqPlemrLIazbN9LthOqkKqUIpHXPHXUbaWpwV/Gx
 Q0Vh5gugQZFMLq+qI7VxQDHajJljp3wdRSe8ZcCBw2Phtx4tQ9ge/E4LLjTFbgLaFxjG
 SSuHknQ0RusYjyj7XumHjmLns6+swoNXpRBRJ4cpZZiLW+mGcnrXirN0QlpXjQEcXufy
 2W5Q==
X-Gm-Message-State: AOAM533nrXwQLVniRoiIpPWJP5sIF9gWPnDiif0X+A+VyR1PJwlbro/b
 fYijfNP5qnYZwuz6+GQATpd++vGZAhye5lZDqh1ilTC34jyCWCID5dqM36LiUzgVuIieLsit/aV
 lnKi5fn6WgIOj6Fw=
X-Received: by 2002:a17:90a:9910:: with SMTP id
 b16mr1805007pjp.94.1623307280465; 
 Wed, 09 Jun 2021 23:41:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpidxPBWyOxKK8GFIGc+aM2wppHKw0N/NP6v9Qb9lKurjgDk/1RO4i6pGoXE0AqFY92vDPUg==
X-Received: by 2002:a17:90a:9910:: with SMTP id
 b16mr1804985pjp.94.1623307280196; 
 Wed, 09 Jun 2021 23:41:20 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 11sm1608015pge.57.2021.06.09.23.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 23:41:19 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com,
 yuri.benditovich@daynix.com, armbru@redhat.com, eblake@redhat.com,
 berrange@redhat.com
References: <20210609100457.142570-1-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
Date: Thu, 10 Jun 2021 14:41:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609100457.142570-1-andrew@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/9 下午6:04, Andrew Melnychenko 写道:
> Libvirt usually launches qemu with strict permissions.
> To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.


A silly question:

Kernel had the following permission checks in bpf syscall:

        if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
                 return -EPERM;
...

         err = security_bpf(cmd, &attr, size);
         if (err < 0)
                 return err;

So if I understand the code correctly, bpf syscall can only be done if:

1) unprivileged_bpf is enabled or
2) has the capability  and pass the LSM checks

So I think the series is for unprivileged_bpf disabled. If I'm not 
wrong, I guess the policy is to grant CAP_BPF but do fine grain checks 
via LSM.

If this is correct, need to describe it in the commit log.


>
> Added property "ebpf_rss_fds" for "virtio-net" that allows to
> initialize eBPF RSS context with passed program & maps fds.
>
> Added qemu-ebpf-rss-helper - simple helper that loads eBPF
> context and passes fds through unix socket.
> Libvirt should call the helper and pass fds to qemu through
> "ebpf_rss_fds" property.
>
> Added explicit target OS check for libbpf dependency in meson.
> eBPF RSS works only with Linux TAP, so there is no reason to
> build eBPF loader/helper for non-Linux.
>
> Overall, libvirt process should not be aware of the "interface"
> of eBPF RSS, it will not be aware of eBPF maps/program "type" and
> their quantity.


I'm not sure this is the best. We have several examples that let libvirt 
to involve. Examples:

1) create TAP device (and the TUN_SETIFF)

2) open vhost devices


>   That's why qemu and the helper should be from
> the same build and be "synchronized". Technically each qemu may
> have its own helper. That's why "query-helper-paths" qmp command
> was added. Qemu should return the path to the helper that suits
> and libvirt should use "that" helper for "that" emulator.
>
> qmp sample:
> C: { "execute": "query-helper-paths" }
> S: { "return": [
>       {
>         "name": "qemu-ebpf-rss-helper",
>         "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
>       }
>      ]
>     }


I think we need an example on the detail steps for how libvirt is 
expected to use this.

Thanks


>
> Andrew Melnychenko (5):
>    ebpf: Added eBPF initialization by fds.
>    virtio-net: Added property to load eBPF RSS with fds.
>    ebpf_rss_helper: Added helper for eBPF RSS.
>    qmp: Added qemu-ebpf-rss-path command.
>    meson: libbpf dependency now exclusively for Linux.
>
>   ebpf/ebpf_rss-stub.c           |   6 ++
>   ebpf/ebpf_rss.c                |  31 +++++++-
>   ebpf/ebpf_rss.h                |   5 ++
>   ebpf/qemu-ebpf-rss-helper.c    | 130 +++++++++++++++++++++++++++++++++
>   hw/net/virtio-net.c            |  77 ++++++++++++++++++-
>   include/hw/virtio/virtio-net.h |   1 +
>   meson.build                    |  37 ++++++----
>   monitor/qmp-cmds.c             |  78 ++++++++++++++++++++
>   qapi/misc.json                 |  29 ++++++++
>   9 files changed, 374 insertions(+), 20 deletions(-)
>   create mode 100644 ebpf/qemu-ebpf-rss-helper.c
>


