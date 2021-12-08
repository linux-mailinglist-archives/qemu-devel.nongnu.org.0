Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659C946CE7F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:48:20 +0100 (CET)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1murgZ-0004kc-Ff
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:48:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1murdL-00038H-Rf
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:45:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1murdJ-000171-Ix
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638949496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H73P9/1lzwFjmS5mjgjcuaGBsJLSSDMpPJ5IStKykgE=;
 b=Hs3qayRAjLX29CIAT7ZhloIZuRpgF7grksxcNyE5SZH8DYKWKe4N4iPzLgB5cMgLFR1fDw
 C5i+5BeU5wW/ENLQNGlroJhqw58Yv0udH5RvRAIFgEI8pGcXAJavjefGQ9E0Pb2cU505wP
 waIdLpMjN35VqouAdW73frINilsvQu8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-Ep3gcYR2PriBBMnZ3F7AMQ-1; Wed, 08 Dec 2021 02:44:55 -0500
X-MC-Unique: Ep3gcYR2PriBBMnZ3F7AMQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 b15-20020aa7c6cf000000b003e7cf0f73daso1354260eds.22
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 23:44:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H73P9/1lzwFjmS5mjgjcuaGBsJLSSDMpPJ5IStKykgE=;
 b=Fxci15SwYfZhWRn5qbvTHxIVrD2Bhn28xZfDDSCXFGsjOw7kdxA2j51QN8DJ/+TU7O
 BM/XxdRwWy5yrHVoEBu1RW2NBvkPObZ+JjrtyZOMExGHfBbnIdzGxHJeklBJbmqTBkKh
 lat3Rmi5l273gTE6OhlrGs/A5Q7SE2R6Sw+EJru7/WkZMY8/O3U3JvZPJbCxdTR9AItD
 rfSYzCUOgsm8n3+rMLx6N0wSL5p8rV0hBqt78EEkVFV4NoVM/bv3LNGfNEzLQb6+MYiV
 /mi1Ji4o+h1f2ZIQvPo1GF4JBw8smglPiJry4C9Sng+/vaBcDxa7jIiXKp9Q1FJnIyQG
 ek9A==
X-Gm-Message-State: AOAM53236hxN7E9v9cyuvIkcG2Wz5+64rb47athwZoj7F0FgRsn5Zakt
 ZAI7rQHKmUACng4/R19CW6P+Oc8uWWthE5ktwPZxRi5xf6JLjofVVdOJCWbmyn1HGz3dWMslJux
 r4Qh5U+PpqNnAUlQ=
X-Received: by 2002:a17:907:7294:: with SMTP id
 dt20mr5485800ejc.321.1638949493928; 
 Tue, 07 Dec 2021 23:44:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7TLg4RpfxJueBc7hvO77f+ALejW+3MWs1RD2WX7aMOY3UvXWloLS5ppDok1MnzOFnZr9Kvw==
X-Received: by 2002:a17:907:7294:: with SMTP id
 dt20mr5485783ejc.321.1638949493701; 
 Tue, 07 Dec 2021 23:44:53 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:ebdb:5cc6:c351:b05:514f])
 by smtp.gmail.com with ESMTPSA id h7sm1604471ede.40.2021.12.07.23.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 23:44:53 -0800 (PST)
Date: Wed, 8 Dec 2021 02:44:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v6 0/6] tests/qtest: add some tests for virtio-net failover
Message-ID: <20211208024429-mutt-send-email-mst@kernel.org>
References: <20211206222040.3872253-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211206222040.3872253-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 06, 2021 at 11:20:34PM +0100, Laurent Vivier wrote:
> This series adds a qtest entry to test virtio-net failover feature.

I think it's a good idea to CC me and Jason on the next version.
Thanks!


> We check following error cases:
> 
> - check missing id on device with failover_pair_id triggers an error
> - check a primary device plugged on a bus that doesn't support hotplug
>   triggers an error
> 
> We check the status of the machine before and after hotplugging cards and
> feature negotiation:
> 
> - check we don't see the primary device at boot if failover is on
> - check we see the primary device at boot if failover is off
> - check we don't see the primary device if failover is on
>   but failover_pair_id is not the one with on (I think this should be changed)
> - check the primary device is plugged after the feature negotiation
> - check the result if the primary device is plugged before standby device and
>   vice-versa
> - check the if the primary device is coldplugged and the standy device
>   hotplugged and vice-versa
> - check the migration triggers the unplug and the hotplug
> 
> There is one preliminary patch in the series:
> 
> - PATCH 1 introduces a function to enable PCI bridge.
>   Failover needs to be plugged on a pcie-root-port and while
>   the root port is not configured the cards behind it are not
>   available
> 
> v6:
> - manage more than 2 root ports
> - add a function to check if a card is available or not
> - check migration state
> - add cancelled migration test cases
> - rename tests
> 
> v5:
> - re-add the wait-unplug test that has been removed from v4 by mistake.
> 
> v4:
> - rely on query-migrate status to know the migration state rather than
>   to wait the STOP event.
> - remove the patch to add time out to qtest_qmp_eventwait()
> 
> v3:
> - fix a bug with ACPI unplug and add the related test
> 
> v2:
> - remove PATCH 1 that introduced a function that can be replaced by
>   qobject_to_json_pretty() (Markus)
> - Add migration to a file and from the file to check the card is
>   correctly unplugged on the source, and hotplugged on the dest
> - Add an ACPI call to eject the card as the kernel would do
> 
> Laurent Vivier (6):
>   qtest/libqos: add a function to initialize secondary PCI buses
>   tests/qtest: add some tests for virtio-net failover
>   failover: fix unplug pending detection
>   tests/libqtest: update virtio-net failover test
>   test/libqtest: add some virtio-net failover migration cancelling tests
>   tests/libqtest: add a migration test with two couples of failover
>     devices
> 
>  hw/acpi/pcihp.c                   |   30 +-
>  include/hw/pci/pci_bridge.h       |    8 +
>  tests/qtest/libqos/pci.c          |  118 +++
>  tests/qtest/libqos/pci.h          |    1 +
>  tests/qtest/meson.build           |    3 +
>  tests/qtest/virtio-net-failover.c | 1294 +++++++++++++++++++++++++++++
>  6 files changed, 1451 insertions(+), 3 deletions(-)
>  create mode 100644 tests/qtest/virtio-net-failover.c
> 
> -- 
> 2.33.1
> 
> 
> 
> 


