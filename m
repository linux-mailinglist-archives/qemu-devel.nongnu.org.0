Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC162B79E4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:04:52 +0100 (CET)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJOV-0005lW-O8
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kfJDq-0007I8-UU
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:53:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kfJDo-0007qk-UU
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605689628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kQVbcURz5odP9Hj6EywB5dozHcw3VvaATEkWwS6JcVg=;
 b=gBDRxFioZTmRA3T6pCOqV/tjsj4n2kUSZgI+FAo4X37266Po7GhVg0qjILFwG/HSRHAeTI
 cxtOaaevfdwgv1qqOaTasR8CAvrqg0xFOj/DCpdjbxAUtd48l5hZyHm2owzmyztvT2pUJ/
 YDgPrXJLnHWOiuWS43rSTHpeQ5lpjKs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-VpNbbnvqMS6lyyxbp3F96g-1; Wed, 18 Nov 2020 03:53:46 -0500
X-MC-Unique: VpNbbnvqMS6lyyxbp3F96g-1
Received: by mail-wm1-f70.google.com with SMTP id d2so734243wmd.8
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kQVbcURz5odP9Hj6EywB5dozHcw3VvaATEkWwS6JcVg=;
 b=koMTAFe+2TDGKpZ7M9Y54yTEVldFvdqGnMAFBDWLzEBCxsQNpmQXSVFqpBmhuo4Cvo
 KQ3onpLS6iPeoDX5bfC2mYhS9Qzx0FqlxpqywIo2tVEuZmWfbZtJe+3X8HMAb3wgoftG
 Xxt984fjwp1s4cXz4JW29/ZG40UasxulDAD93XEmZyUMtP8R8H7TcH7ZhA2WjGPMcfoI
 SjAwF0QKJH89D7pd1atZzntjAa7n8OyATOY6K1yhXfl4nI7dBkLtveHTHbX1ddVBG0KI
 AlhJJ7wJMu8dz2e9nR4Afxkiung1MqrBncwaDP1XOcH0P5EbPOE5bMJaOqMR4p9dp3+4
 7y3Q==
X-Gm-Message-State: AOAM530kqN9AISnAcqwSaPmPYCqRokItK0eBNDszD4nxUum1lSIOEByu
 zGaiPZvmsIOImeEPMZ+vppSKlgnWd1tREbaySsiHAeUrSAu+bqGxcwKYxbCx62uDgasrS0H/ZDi
 9a933Q2+Nzw4no6w=
X-Received: by 2002:a1c:9ad3:: with SMTP id c202mr3143369wme.43.1605689625273; 
 Wed, 18 Nov 2020 00:53:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSuVtzYTa22m4JXeFNBjcsleGJf6F1RDRweWP2DPZNQL8CrfzSa3Juzq+lLjsHIxVCyx+8kA==
X-Received: by 2002:a1c:9ad3:: with SMTP id c202mr3143349wme.43.1605689625093; 
 Wed, 18 Nov 2020 00:53:45 -0800 (PST)
Received: from redhat.com (bzq-79-181-34-244.red.bezeqint.net. [79.181.34.244])
 by smtp.gmail.com with ESMTPSA id k1sm28603780wrp.23.2020.11.18.00.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:53:43 -0800 (PST)
Date: Wed, 18 Nov 2020 03:53:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 00/27] Virtio net failover fixes
Message-ID: <20201118035209-mutt-send-email-mst@kernel.org>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 09:37:21AM +0100, Juan Quintela wrote:
> Hi
> 
> This is a big rework of the network failover setup.  General idea is:
> * We don't cache the name of the primary/standby devices
>   We have several problems there with stale pointers
> * After this:
> - We can always remove either the primary/standby devices without trouble
> - Pluggin/unplugging works
> - We go to device opts to see what the failover device are.
>   Notice that we are plugging/unplugging the device, so it is not critical.
> - Once there, I "fixed" managedsave for libvirt (now gives an error instead o=
> f just hanging)
> * Fields not cached anymore:
> - primary_device_dict
> - primary_device_opts
> - standby_id
> - primary_device_id
> - primary_dev
> * I renamed the should_be_hidden() callback to hide device, but if
>   people preffer the old name I can leave it.
> * Add (some) doc to some functions
> * Remove almost 100 lines of code while fixing things.
> 
> Please review.

OK that's great, any of this appropriate for 5.2?
The memory leak fix maybe?

> Later, Juan.
> 
> Juan Quintela (27):
>   migration: Network Failover can't work with a paused guest
>   failover: fix indentantion
>   failover: Use always atomics for primary_should_be_hidden
>   failover: primary bus is only used once, and where it is set
>   failover: Remove unused parameter
>   failover: Remove external partially_hotplugged property
>   failover: qdev_device_add() returns err or dev set
>   failover: Rename bool to failover_primary_hidden
>   failover: g_strcmp0() knows how to handle NULL
>   failover: Remove primary_device_opts
>   failover: remove standby_id variable
>   failover: Remove primary_device_dict
>   failover: Remove memory leak
>   failover: simplify virtio_net_find_primary()
>   failover: should_be_hidden() should take a bool
>   failover: Rename function to hide_device()
>   failover: virtio_net_connect_failover_devices() does nothing
>   failover: Rename to failover_find_primary_device()
>   failover: simplify qdev_device_add() failover case
>   failover: simplify qdev_device_add()
>   failover: make sure that id always exist
>   failover: remove failover_find_primary_device() error parameter
>   failover: split failover_find_primary_device_id()
>   failover: We don't need to cache primary_device_id anymore
>   failover: Caller of this two functions already have primary_dev
>   failover: simplify failover_unplug_primary
>   failover: Remove primary_dev member
> 
>  include/hw/qdev-core.h         |  28 ++--
>  include/hw/virtio/virtio-net.h |   9 +-
>  hw/core/qdev.c                 |  19 +--
>  hw/net/virtio-net.c            | 298 +++++++++++++--------------------
>  migration/migration.c          |  13 ++
>  softmmu/qdev-monitor.c         |  43 ++---
>  6 files changed, 167 insertions(+), 243 deletions(-)
> 
> --=20
> 2.26.2
> 


