Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2301A46439B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 00:47:46 +0100 (CET)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msCqf-0001qg-9w
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 18:47:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1msCp1-0000Si-EW
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 18:46:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1msCoz-0005u1-JT
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 18:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638315960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=slilrITkB5zTjdP1mFiosB8UjDl6oEhgPSoUx+v4zMs=;
 b=bH/30eqy3SuPEyAWa6PjFJRCM/c5t15DBaqVxRCIUTX+Wmv6yWjorXRswnHA/GcHxI9JHK
 OavkC+VYEGjk4M8nlqdNaRTmPjvCEy6tOlg9kYuAWHCGv0CUp4jSbtuydrXf48Zwk9JkPw
 TcX+QACZWXf2qSM1yh62IhE2NMGDcz4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-Czznm_P8PHG6c0S_tj2TuA-1; Tue, 30 Nov 2021 18:45:57 -0500
X-MC-Unique: Czznm_P8PHG6c0S_tj2TuA-1
Received: by mail-ed1-f70.google.com with SMTP id
 v1-20020aa7cd41000000b003e80973378aso18375327edw.14
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 15:45:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=slilrITkB5zTjdP1mFiosB8UjDl6oEhgPSoUx+v4zMs=;
 b=6864kd9sCbt1tH53P9kahoSat6fgZEnAG/fAs5m4zB2/4+CCfZfYXiTXvU4Y4xnv6V
 WVS7f1/aV2pHDhvriy0ydp7gRTpbi4whdZWNaKSghNUeuITy2zHBeD4ZfOfvB3Zl8eh4
 AksvKCM3u2Ar3wm4wpRdbfxw2hzTvh/G+I+5qAaflvVN4+LluPFRQFOFls1PKAiqZo8X
 rB4jkH59yLUUpKAejeGx5S7R9oQGCfGDSHL2QJVULBPNaHKb/dpdibeahyVPAQDoC65/
 i1ARsPIN3C+k2O50eGbHIOXLnxiNbs0b4CO0iemlWvvZrodGmipKPIVQBQQwTn7VueT/
 qiTw==
X-Gm-Message-State: AOAM531/wL5+6MBnc0D8yplhguRpSiSskf4PSUWnDBNYakAnVTwudmmA
 +z8WKBjyh/uMVXujd/T3N9C+r1rAllTxoIhkArSJeROhMEksbTSDpNN8BzQNf2UIk2nycqNGIql
 nFSDM2Y+ok0R31ys=
X-Received: by 2002:a17:906:52cf:: with SMTP id
 w15mr2785742ejn.122.1638315956366; 
 Tue, 30 Nov 2021 15:45:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRMFZzC7tf37ABotxnoGpfUm9YW4ZOL0VCpcB+3MvNmph2CYQdFwPzcBq/b0PfdvY0uqAkwQ==
X-Received: by 2002:a17:906:52cf:: with SMTP id
 w15mr2785728ejn.122.1638315956230; 
 Tue, 30 Nov 2021 15:45:56 -0800 (PST)
Received: from redhat.com ([2.53.15.215])
 by smtp.gmail.com with ESMTPSA id nd36sm10252642ejc.17.2021.11.30.15.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:45:55 -0800 (PST)
Date: Tue, 30 Nov 2021 18:45:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/3] virtio-mem: Support
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Message-ID: <20211130184539-mutt-send-email-mst@kernel.org>
References: <20211130092838.24224-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211130092838.24224-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 30, 2021 at 10:28:35AM +0100, David Hildenbrand wrote:
> Support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE in QEMU, which indicates to
> a guest that we don't support reading unplugged memory. We indicate
> the feature based on a new "unplugged-inaccessible" property available
> for x86 targets only (the only ones with legacy guests). Guests that don't
> support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE will fail initialization if
> indicated/required by the hypervisor.
> 
> For example, Linux guests starting with v5.16 will support
> VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.
> 
> For future targets that don't have legacy guests (especially arm64), we'll
> always indicate VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE.
> 
> More details can be found in the description of patch #2.
> 
> "
> For existing compat machines, the property will default to "off", to
> not change the behavior but eventually warn about a problematic setup.
> Short-term, we'll set the property default to "auto" for new QEMU machines.
> Mid-term, we'll set the property default to "on" for new QEMU machines.
> Long-term, we'll deprecate the parameter and disallow legacy guests
> completely.
> "
> 
> TODO: Once 6.2 was release, adjust patch #3. Replace patch #1 by a proper
>       Linux header sync.


oh so it's not for 6.2. got it.

> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Hui Zhu <teawater@gmail.com>
> Cc: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> 
> David Hildenbrand (3):
>   linux-headers: sync VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
>   virtio-mem: Support VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
>   virtio-mem: Set "unplugged-inaccessible=auto" for the 6.2 machine on
>     x86
> 
>  hw/i386/pc.c                                |  1 +
>  hw/virtio/virtio-mem.c                      | 63 +++++++++++++++++++++
>  include/hw/virtio/virtio-mem.h              |  8 +++
>  include/standard-headers/linux/virtio_mem.h |  9 ++-
>  4 files changed, 78 insertions(+), 3 deletions(-)
> 
> -- 
> 2.31.1


