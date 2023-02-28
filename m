Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F126A5E49
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:35:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3sJ-00055t-DH; Tue, 28 Feb 2023 12:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pX3sH-00051f-Gj
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pX3sF-0000Dp-KI
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677605685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s/AGn97AI8YGBk4aLDSy0vGS4XOOuR9v1pJVC2xh3L4=;
 b=ej64kDX+FjL1zZ6Ozv57pK0sXSJd4YZE/0d+l6tlv+KUIpFiVtdVnqOQJ7kTovLn3Cd9SN
 dM+vBMBnJFQPI454BXvTUTDnOAZS5mxnB/i67WPLdw7YUgVgptwOHr/YOfNtmFzIDQlOpa
 7ZI35KAa5f8WmWsFTyDsQiEcC8XSGyM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-IYPVLfqrNC6ULp1xKxzVdQ-1; Tue, 28 Feb 2023 12:34:44 -0500
X-MC-Unique: IYPVLfqrNC6ULp1xKxzVdQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 x63-20020a17090a6c4500b00237731465feso3235814pjj.8
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 09:34:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s/AGn97AI8YGBk4aLDSy0vGS4XOOuR9v1pJVC2xh3L4=;
 b=DIeQ++2BpRme30ETvhGE8E/lV9B89039zSpm4A7W8oBxWrgkO2O/NuitaeYyaZAOPg
 ujAhR29GZYvK75QdjFnylXsTBvBDg3BMhtHQAYaneKKKgh4fKZRp1/R4ZRTNOWHbCUfq
 E8MxmVrXXScjbwe/0ZHmbWgG7CFY7yBGXjNOIjC+XtgWUmykZ3c3tLzpJZnFqcyN+aFi
 nNUpu/kJct7Y8v3D7xQbP/CLu41IbRNlC2K1iBjkOabIZ1gi8QRlEZ1BSDqkLotu9CnQ
 1x0g8w03y7tMsBn4P+/CQpFVAsdyYe1ot98PtdeTKJPKGqpXyNBo6/s8Ij/jStcaWOhe
 zjSQ==
X-Gm-Message-State: AO0yUKVMuoY9Vkycm4f7CUB7VJzL+QmgryG1jQ8gCo3vcSLxpfBvD584
 V2as3wATpF0E2aVDH7R8ianLXTjFFH1OhUOKs2IxPoLuo8gvfG31n3AbjpIXN8wrboM2aHqS0VV
 6hryMq0q7VtGT5EGzntr+on//2uUDe5g=
X-Received: by 2002:a17:90a:d3ca:b0:237:9cbe:22ad with SMTP id
 d10-20020a17090ad3ca00b002379cbe22admr1447594pjw.5.1677605683448; 
 Tue, 28 Feb 2023 09:34:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9HBdfALl9hzkys09ig8qmlnSHkfeZ6cIjUfNir/WVqf5tyDK6+if2qahCLYc4pe5NO434js9PXHlT/9uuJsZs=
X-Received: by 2002:a17:90a:d3ca:b0:237:9cbe:22ad with SMTP id
 d10-20020a17090ad3ca00b002379cbe22admr1447585pjw.5.1677605683150; Tue, 28 Feb
 2023 09:34:43 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Feb 2023 09:34:42 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230228150216.77912-2-cohuck@redhat.com>
Date: Tue, 28 Feb 2023 09:34:42 -0800
Message-ID: <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
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

On Tue, Feb 28, 2023 at 04:02:15PM +0100, Cornelia Huck wrote:
> Introduce a new cpu feature flag to control MTE support. To preserve
> backwards compatibility for tcg, MTE will continue to be enabled as
> long as tag memory has been provided.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst |  21 ++++++
>  hw/arm/virt.c                    |   2 +-
>  target/arm/cpu.c                 |  18 ++---
>  target/arm/cpu.h                 |   1 +
>  target/arm/cpu64.c               | 110 +++++++++++++++++++++++++++++++
>  target/arm/internals.h           |   1 +
>  target/arm/kvm.c                 |  29 ++++++++
>  target/arm/kvm64.c               |   5 ++
>  target/arm/kvm_arm.h             |  19 ++++++
>  target/arm/monitor.c             |   1 +
>  10 files changed, 194 insertions(+), 13 deletions(-)

I've given a quick look with libvirt integration in mind, and
everything seem fine.

Specifically, MTE is advertised in the output of qom-list-properties
both for max-arm-cpu and the latest virt-X.Y-machine, which means
that libvirt can easily and reliably figure out whether MTE support
is available.

> +MTE CPU Property
> +================
> +
> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> +presence of tag memory (which can be turned on for the ``virt`` machine via
> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> +proper migration support is implemented, enabling MTE will install a migration
> +blocker.

Is it okay to use -machine virt,mte=on unconditionally for both KVM
and TCG guests when MTE support is requested, or will that not work
for the former?

> +If not specified explicitly via ``on`` or ``off``, MTE will be available
> +according to the following rules:
> +
> +* When TCG is used, MTE will be available if and only if tag memory is available;
> +  i.e. it preserves the behaviour prior to the introduction of the feature.
> +
> +* When KVM is used, MTE will default to off, so that migration will not
> +  unintentionally be blocked. This might change in a future QEMU version.

If and when this changes, we should ensure that the new default
behavior doesn't affect existing machine types, otherwise we will
break guest ABI for existing VMs.

-- 
Andrea Bolognani / Red Hat / Virtualization


