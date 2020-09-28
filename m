Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2D27A9B8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 10:39:24 +0200 (CEST)
Received: from localhost ([::1]:38858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMogt-00086i-II
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 04:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kMofX-0007G1-1u
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 04:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kMofV-00063a-EL
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 04:37:58 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601282276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pmk68CubBUcwqrQhGRpMfZcWtWh5G+aT4mukzekGhIk=;
 b=b5h1fWJjJUGBi/r5g3nbVcZ7vL1l0jURyl4078FuwGqIrV84Fh7dnds2ChQ76oBKMkL25/
 sfgVjmWffueJnPjbpjpxS9g18gPlzIhLrsFbdwllBMh8tVpzZ5jnhGPInZnndGT66giN5M
 +8ohbN8K/NpW8fs3PC1i3MBooilVjmw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-iCaS19q1MwiVeOrg7yrFKQ-1; Mon, 28 Sep 2020 04:37:54 -0400
X-MC-Unique: iCaS19q1MwiVeOrg7yrFKQ-1
Received: by mail-wm1-f71.google.com with SMTP id s24so102850wmh.1
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 01:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pmk68CubBUcwqrQhGRpMfZcWtWh5G+aT4mukzekGhIk=;
 b=mob5ZvhABmHi7SFovNGx0awKHOOFhWqHYJ1usgFd36hTAzVBwVrDrsaDt3G5xbvvPN
 4xxAxgTOG1Ka0oiaoPSSyKHj00rfJDiJ/bT9+71+Fk9c8xUTiEEoHtFjjYa3aZIOvkSO
 fM0X1TNLEzL3S7F8E7IAzseJBaQUggspKd7Sfv1R4UAI/7i91Wtcu0C27IaYp28M8Ehe
 445H7LJXKfzCm2AzwHjmopXpXK1teoT86Lkni0cA56oqSK8qnakUDchlej5CJgEWruDK
 BBQR2MRavMPAoVUb+JRE02WYbvSY1psKLqqL7Yd8vTFoVWJdlqPpViivay1DRfC2Wy3R
 mvEw==
X-Gm-Message-State: AOAM531cXOPjHkkOSElbn6G0oqVYmTjBB9fYzJ27kG9Le8fOFPbffk63
 +iZSwRr/mAadZRKX5ddoGeatt0/EHNdf38FvZphZTxztGg7tCmpnqxVj3VV8/tUbxLSvqfQrW1y
 h0lZtlz4pMlQBWZg=
X-Received: by 2002:a05:600c:410e:: with SMTP id
 j14mr467696wmi.13.1601282273690; 
 Mon, 28 Sep 2020 01:37:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM3yzjfxofI845e9f2f3YnZISCSjo1lUENo8ysXEbv3bP/U0Wrvgeq4WSc7Vzq5htk0Ps/Ig==
X-Received: by 2002:a05:600c:410e:: with SMTP id
 j14mr467680wmi.13.1601282273497; 
 Mon, 28 Sep 2020 01:37:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:f4f8:dc3e:26e3:38c7?
 ([2001:b07:6468:f312:f4f8:dc3e:26e3:38c7])
 by smtp.gmail.com with ESMTPSA id s26sm260033wmh.44.2020.09.28.01.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 01:37:53 -0700 (PDT)
Subject: Re: [PATCH 08/12] tests/9pfs: refactor test names and test devices
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1601203436.git.qemu_oss@crudebyte.com>
 <265f5d9a0fb10ce5e782455839d1baf678dbac48.1601203436.git.qemu_oss@crudebyte.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7aba6fc7-6d9b-25b5-9dbf-04e15314707c@redhat.com>
Date: Mon, 28 Sep 2020 10:37:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <265f5d9a0fb10ce5e782455839d1baf678dbac48.1601203436.git.qemu_oss@crudebyte.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:29:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.576,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.011, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/20 12:40, Christian Schoenebeck wrote:
> +    qos_node_consumes("virtio-9p-device-local", "virtio-bus", &opts);
> +    qos_node_produces("virtio-9p-device-local", "virtio-local");

This should produce "virtio", similar to what I remarked in the previous
patch.

> +    qos_node_produces("virtio-9p-device-local", "virtio-9p-local");
> +
> +    /* virtio-9p-pci-local */
> +    opts.extra_device_opts = local_str_addr;
> +    add_qpci_address(&opts, &addr);
> +    qos_node_create_driver_named("virtio-9p-pci-local", "virtio-9p-pci",
> +                                 virtio_9p_pci_create);
> +    qos_node_consumes("virtio-9p-pci-local", "pci-bus", &opts);
> +    qos_node_produces("virtio-9p-pci-local", "pci-device");
> +    qos_node_produces("virtio-9p-pci-local", "virtio-local");
> +    qos_node_produces("virtio-9p-pci-local", "virtio-9p-local");
>  }


The implementation in patches 1 and 2 is reasonable, but what is the
advantage of this as opposed to specifying the fsdev in the edge options
for the test (similar to virtio-net)?  I was expecting both
virtio-9p-device-synth and virtio-9p-device-local to produce virtio-9p,
so that the existing tests would be reused automatically by the qos
graph walk.

As things stand, I don't see any reason to have separate devices for
different backends.

Paolo


