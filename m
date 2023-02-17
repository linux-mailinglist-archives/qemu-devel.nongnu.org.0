Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF669B0C5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3WT-0001bD-FM; Fri, 17 Feb 2023 11:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pT3WR-0001ax-H5
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:23:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pT3WP-0003ab-9q
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676651020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MjzchUN/f8n3YVcteUgl6j3t1/V7XmUc2chEf4jEeMU=;
 b=JdlOpCeQhK5XVEajOlsl7FKhAZ22l80pQwP6IUezGGIbl6wUDP2tNU+bmyS8b/EEJNat+t
 thVFGejL2DuwCQ38C6CV9pCWXFRA9q2IFZ/w0uHZCi9gaNwP0s/MW9AnAOXoTnjTGyexqX
 8TUrH9+k5ekovxtkzE5TA3dPVunDVDo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-2YjN4LoBMc2dwXk7uYzOvw-1; Fri, 17 Feb 2023 11:23:38 -0500
X-MC-Unique: 2YjN4LoBMc2dwXk7uYzOvw-1
Received: by mail-ed1-f72.google.com with SMTP id
 j10-20020a05640211ca00b004acbf564d75so1671824edw.5
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 08:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MjzchUN/f8n3YVcteUgl6j3t1/V7XmUc2chEf4jEeMU=;
 b=e07HkrDzDCWzQzBwT/BoOJWXWNgVI/7s0qn0/PCar8ctF7WYQgNQToLCOoR6Py6tC1
 PjIcYwCOxFIeoaQeQurnZUtcPz0ybeaTPZIFoUJu35BzhgS8K566IH0OTbQcahoby98T
 6gb7Q0a+KI9WNnOlwEF8Egsima+bMFYe5MGR3euhGF3hJeIb86dZydogLO5KENYj561n
 733rWcAxMlNoc3JMV1gaPIAKwkh2s0tSpXwsPoRmZCg3qf+LOTLonU8w1sLqb7WIQD1U
 ekfOcYv+JLDIZFvr9ET50ucLND76fO9MeELUJ8HDDTmCpS8X6RhcgNNSS/jSfKzYGPhP
 qvAw==
X-Gm-Message-State: AO0yUKUU4hH3jFqkQfTisYLhvR5fOFP+PH+PPaQl5c8Wp2YvIRov/spy
 WGQFxKYsyJOku5L55oGOjR+Lt/KDMGMiNsbe+hVf/oUODHPPcnihVCX4VhWsTYy3/lOektCGSJb
 fAF6n3/HVVuXaHy4=
X-Received: by 2002:a05:6402:445:b0:4ac:b2c8:aeaf with SMTP id
 p5-20020a056402044500b004acb2c8aeafmr1350125edw.26.1676651017691; 
 Fri, 17 Feb 2023 08:23:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8fpWKhTwJpxJnLqUuZMMmEGvGXFqrqsJXG8Kb6oEsgQzjVEOaZq9IYVHv29Q90e2WfR8p/7A==
X-Received: by 2002:a05:6402:445:b0:4ac:b2c8:aeaf with SMTP id
 p5-20020a056402044500b004acb2c8aeafmr1350091edw.26.1676651017394; 
 Fri, 17 Feb 2023 08:23:37 -0800 (PST)
Received: from sgarzare-redhat (host-87-11-6-224.retail.telecomitalia.it.
 [87.11.6.224]) by smtp.gmail.com with ESMTPSA id
 s27-20020a50ab1b000000b004acb6d659eesm2494746edc.52.2023.02.17.08.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 08:23:36 -0800 (PST)
Date: Fri, 17 Feb 2023 17:23:34 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 "Florescu, Andreea" <fandree@amazon.com>,
 Damien <damien.lemoal@opensource.wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Hanna Reitz <hreitz@redhat.com>, Alberto Faria <afaria@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, gmaglione@redhat.com
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
Message-ID: <20230217162334.b33myqqfzz33634b@sgarzare-redhat>
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

Hi Stefan,

On Fri, Jan 27, 2023 at 10:17:40AM -0500, Stefan Hajnoczi wrote:
>Dear QEMU, KVM, and rust-vmm communities,
>QEMU will apply for Google Summer of Code 2023
>(https://summerofcode.withgoogle.com/) and has been accepted into
>Outreachy May 2023 (https://www.outreachy.org/). You can now
>submit internship project ideas for QEMU, KVM, and rust-vmm!
>
>Please reply to this email by February 6th with your project ideas.

sorry for being late, if there is still time I would like to propose the 
following project.

Please, let me know if I should add it to the wiki page.

Any feedback or co-mentors are welcome :-)

Thanks,
Stefano



=== Sibling VM communication in vhost-user-vsock ===

'''Summary:''' Extend the existing vhost-user-vsock Rust application to
support sibling VM communication

During GSoC 2021, we developed vhost-user-vsock application in Rust. It
leveraged the vhost-user protocol to emulate a virtio-vsock device in an
external process. It provides the hybrid VSOCK interface over AF_UNIX
introduced by Firecracker.

The current implementation supports a single virtual machine (VM) per
process instance.
The idea of this project is to extend the vhost-user-vsock crate
available in the rust-vmm/vhost-device workspace to support multiple VMs
per instance and allow communication between sibling VMs.

This project will allow you to learn more about the virtio-vsock
specification, rust-vmm crates, and vhost-user protocol to interface
with QEMU.

This work will be done in Rust, but we may need to patch the
virtio-vsock driver or vsock core in Linux if we will find some issues.
AF_VSOCK in Linux already supports the VMADDR_FLAG_TO_HOST flag to be
used in the struct sockaddr_vm to communicate with sibling VMs.

Goals:
* Understand how a virtio-vsock device works
* Refactor vhost-user-vsock code to allow multiple virtio-vsock device instances
* Extend the vhost-user-vsock CLI
* Implement sibling VM communication
* (optional) Support adding new VMs at runtime

'''Links:'''
* [https://gitlab.com/vsock/vsock vsock info and issues]
* [https://wiki.qemu.org/Features/VirtioVsock virtio-vsock QEMU wiki page]
* [https://github.com/rust-vmm/vhost-device/tree/main/crates/vsock vhost-user-vsock application]
* [https://summerofcode.withgoogle.com/archive/2021/projects/6126117680840704 vhost-user-vsock project @ GSoC 2021]
* [https://github.com/firecracker-microvm/firecracker/blob/master/docs/vsock.md Firecracker's hybrid VSOCK]
* [https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/vhost-user.rst vhost-user protocol]
* [https://lore.kernel.org/lkml/20201214161122.37717-1-andraprs@amazon.com/ VMADDR_FLAG_TO_HOST flag support in Linux]

'''Details:'''
* Project size: 350 hours
* Skill level: intermediate (knowledge of Rust and virtualization)
* Language: Rust
* Mentor: Stefano Garzarella <sgarzare@redhat.com>
** IRC: sgarzare / Matrix: @sgarzare:matrix.org
* Suggested by: Stefano Garzarella <sgarzare@redhat.com>


