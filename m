Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE18C3F256D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 05:44:22 +0200 (CEST)
Received: from localhost ([::1]:52926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGvSA-0003Zq-0R
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 23:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mGvRD-0002tk-8t
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mGvRB-00010U-Nq
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 23:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629431001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OYLW+U4L9SnCfufToOHyviyU0e6OBHl74xCNqyRbkg=;
 b=ffeyHNxxGsBr8NiQ+vwh0fn9QeXoNUSjnwSkTQ7wOE2gtHWESVo6xam/g9SVQ22mcmz4xC
 auTH4lZaBeC7UG3gq/aDZpAvYFTxgAglsAh5mEbjgmYciwtpZfwPNHT4p93lHIdy6uKcvu
 72VUvm4z//LV9RW8dqY6MmWV8jcdN+s=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-eZTQkhg7NmaKdLTA35dLSg-1; Thu, 19 Aug 2021 23:43:19 -0400
X-MC-Unique: eZTQkhg7NmaKdLTA35dLSg-1
Received: by mail-pl1-f198.google.com with SMTP id
 p7-20020a170902b087b029012c2879a885so2442755plr.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 20:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3OYLW+U4L9SnCfufToOHyviyU0e6OBHl74xCNqyRbkg=;
 b=eywQMHRjGYYeI14mWfYe7MRs5ZET/Z1eeiD2mzMgOFG0mW5FlEHCqqIAIXYJdw9Slu
 aP6GCfKij862J07JQijLQ57uPsYvHmb9GxOe8qG0kxoJmIgcGV08BQyzSZdNJkcWUJij
 2YZy+UCCfkKgIJpOatgeiBwOr7UfhS1cPaHcurKOYB/dsSihfT0iZD+ap9HOnezPS82N
 u3CzGVbLEAqu2wSRzU5n7R0GENoXgfhOFsp2l2V2+SBPwLTnuUrBOnW3zgDD5WBrXkyb
 /lb9ljfc5ocpx63x3JXAZIdbEjS3oR7lyR7ceelQWhx06KRC/BcrAripju1F/BOBwAM3
 ZucQ==
X-Gm-Message-State: AOAM531cEJYgqyMbTXpoBUtSV9maGAkuWmpmkaNOODrLxm4FTZh7zNlh
 ycMY5WfGLOKGz57UZGilQsH26vcrxTd2knwpPJh1UqSvdjt3ROreqFCS+IZtxEdfmDGXTHBzscA
 by1gE5hKSHpaAkxU=
X-Received: by 2002:a63:1952:: with SMTP id 18mr16778861pgz.15.1629430998704; 
 Thu, 19 Aug 2021 20:43:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpPIlFuwL2VsUVI9XusAQRJBp1Fkyp5OKHhiGK+Gb0DXgLjbM+r0BGaAabgcPAz9+bXp5/QQ==
X-Received: by 2002:a63:1952:: with SMTP id 18mr16778846pgz.15.1629430998480; 
 Thu, 19 Aug 2021 20:43:18 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c23sm5975510pgb.74.2021.08.19.20.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 20:43:17 -0700 (PDT)
Subject: Re: [PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com,
 yuri.benditovich@daynix.com, armbru@redhat.com, eblake@redhat.com,
 berrange@redhat.com
References: <20210713153758.323614-1-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2fb03875-28b4-7689-8c69-b71c6052908d@redhat.com>
Date: Fri, 20 Aug 2021 11:43:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210713153758.323614-1-andrew@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


ÔÚ 2021/7/13 ÏÂÎç11:37, Andrew Melnychenko Ð´µÀ:
> Libvirt usually launches qemu with strict permissions.
> To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.
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
> Changed Qemu updates eBPF maps to array mmaping. Mmaping allows
> bypassing unprivileged BPF map update. Also, instead of 3 maps
> (config, key and indirection table) there is one map that
> combines everything.
>
> Added helper stamp. To check that helper was build with qemu,
> qemu would check helper symbols that should contain the stamp.
> It was done similar to qemu modules, but checking was performed
> by the helper's ELF parsing.
>
> Overall, libvirt process should not be aware of the "interface"
> of eBPF RSS, it will not be aware of eBPF maps/program "type" and
> their quantity. That's why qemu and the helper should be from
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
>
> Changes since v1:
> * Mmap() used instead if bpf_map_update_elem().


Some questions:

1) Is the mmap() part a stable ABI?
2) Is there a change that we may use other kinds of bpf map that can be 
mmaped?
3) What's the advantages of using bpf mmap() over the rx-filter-event?

Thanks


> * Added helper stamp.
>
> Andrew Melnychenko (5):
>    ebpf: Added eBPF initialization by fds and map update.
>    virtio-net: Added property to load eBPF RSS with fds.
>    qmp: Added the helper stamp check.
>    ebpf_rss_helper: Added helper for eBPF RSS.
>    qmp: Added qemu-ebpf-rss-path command.
>
>   ebpf/ebpf_rss-stub.c              |   6 +
>   ebpf/ebpf_rss.c                   | 120 ++++---
>   ebpf/ebpf_rss.h                   |   8 +-
>   ebpf/qemu-ebpf-rss-helper.c       | 130 +++++++
>   ebpf/rss.bpf.skeleton.h           | 557 +++++++++++++++---------------
>   hw/net/virtio-net.c               |  77 ++++-
>   include/hw/virtio/virtio-net.h    |   1 +
>   meson.build                       |  47 ++-
>   monitor/meson.build               |   1 +
>   monitor/qemu-helper-stamp-utils.c | 297 ++++++++++++++++
>   monitor/qemu-helper-stamp-utils.h |  24 ++
>   monitor/qmp-cmds.c                |  32 ++
>   qapi/misc.json                    |  33 ++
>   tools/ebpf/rss.bpf.c              |  67 ++--
>   14 files changed, 990 insertions(+), 410 deletions(-)
>   create mode 100644 ebpf/qemu-ebpf-rss-helper.c
>   create mode 100644 monitor/qemu-helper-stamp-utils.c
>   create mode 100644 monitor/qemu-helper-stamp-utils.h
>


