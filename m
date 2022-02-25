Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE814C456C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:09:01 +0100 (CET)
Received: from localhost ([::1]:38084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNaLE-00029S-BO
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:09:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNa2o-00083r-Ub
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:49:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNa2M-00084m-J8
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645793367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NwjxohUAdJYRfjSawZJsZ7hKjEoWTH+ZeZOEUSR9U0M=;
 b=K96v60wfehP6yBEN009q2jWWfnUxzGcF6OhDW8h+wMTxUspv8flhHkHz64oxaJ/f8qbUH0
 0R3ocnut+kbnP2fAhVCLUDdOoMxVKWYiV5LlWmDZ5XVrRojBjObfu+Sipc96JaM+LUEjBc
 MbIBmUItlK00R4t5FsJ91R3r6Gnbjhc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-dUA-HEWYPNWEwTzpLab6pA-1; Fri, 25 Feb 2022 07:49:26 -0500
X-MC-Unique: dUA-HEWYPNWEwTzpLab6pA-1
Received: by mail-wr1-f72.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so850851wrh.16
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 04:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NwjxohUAdJYRfjSawZJsZ7hKjEoWTH+ZeZOEUSR9U0M=;
 b=VJ6K4MWUDXF9Ifupp4YH0RE21qLC5bcYjfYtEJBqGfM8ptVkDJidX4GnDlJuu6ZhKa
 4CQGRaXDTCxUEmD24D+U3ASLJcaW3HB5PnDyHVcn5CxNELhJxCb/6/ARgDxbxbVurw2g
 KVmJ5S/T6sl62vSI1JJuF9+kPrxwUdfjwdkeER3LThNhT7wqRDQdy7Mo9pPqW1SWdUBI
 Hoy8SMQWLlQtKMcSTqZ0BjmRaQ9UzLjYKQJ0l+Y0NqTswWj9xENAmAdIHshdSDn1aSN7
 mpYtGCoWotxo/TMFPPwH8wpQWOUmClp6bAvso1kzj0SVIg0oZniyh3tldTFm4DgeUUQN
 xUzg==
X-Gm-Message-State: AOAM532UK3EKtuTkBTPFgJ0jIDygt0FWelkpZcLLJTCbPqycJ1fR3Cgd
 znKSXnFGIopuGOB39Qv+cTSr8aEqI3uwefYWT8ZqgLXVZ+KIETAgU2Xd+vvsES/aLQ0wn+XJijC
 bC10NOg5ouBn4Rqk=
X-Received: by 2002:a7b:c141:0:b0:381:8a:21e5 with SMTP id
 z1-20020a7bc141000000b00381008a21e5mr2511806wmi.155.1645793365317; 
 Fri, 25 Feb 2022 04:49:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvCHRVBZttgK5pmMo+HKujJro93s0eLZBqLAwKuxazOBtnbMeBr/cbwJbhGl4xKNSJWfJUOQ==
X-Received: by 2002:a7b:c141:0:b0:381:8a:21e5 with SMTP id
 z1-20020a7bc141000000b00381008a21e5mr2511782wmi.155.1645793365022; 
 Fri, 25 Feb 2022 04:49:25 -0800 (PST)
Received: from redhat.com ([2.55.145.157]) by smtp.gmail.com with ESMTPSA id
 q11-20020adfcd8b000000b001e320028660sm2096836wrj.92.2022.02.25.04.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 04:49:24 -0800 (PST)
Date: Fri, 25 Feb 2022 07:49:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220225074024-mutt-send-email-mst@kernel.org>
References: <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
 <f19dd8be-f923-fd7d-c54d-a54fd775dcc5@oracle.com>
 <20220224144800-mutt-send-email-mst@kernel.org>
 <37df5f3a-283a-a016-311f-8281bbacda19@oracle.com>
 <20220224150626-mutt-send-email-mst@kernel.org>
 <5cae0afc-df3e-5dc6-d11b-2f7d931ba5e6@oracle.com>
 <20220224144053.3fbe234d.alex.williamson@redhat.com>
 <eb699dff-09d3-e9ba-2c35-3c91966efa13@oracle.com>
MIME-Version: 1.0
In-Reply-To: <eb699dff-09d3-e9ba-2c35-3c91966efa13@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 12:36:24PM +0000, Joao Martins wrote:
> I am trying to approach this iteratively and starting by fixing AMD 1T+ guests
> with something that hopefully is less painful to bear and unbreaks users doing
> multi-TB guests on kernels >= 5.4. While for < 5.4 it would not wrongly be
> DMA mapping bad IOVAs that may lead guests own spurious failures.
> For the longterm, qemu would need some sort of handling of configurable a sparse
> map of all guest RAM which currently does not exist (and it's stuffed inside on a
> per-machine basis as you're aware). What I am unsure is the churn associated
> with it (compat, migration, mem-hotplug, nvdimms, memory-backends) versus benefit
> if it's "just" one class of x86 platforms (Intel not affected) -- which is what I find
> attractive with the past 2 revisions via smaller change.

Right. I pondered this for a while and I wonder whether you considered
making this depend on the guest cpu vendor and max phys bits.  Things
are easier to debug if the memory map is the same whatever the host. The
guest vendor typically matches the host cpu vendor after all, and there
just could be guests avoiding the reserved memory ranges on principle.

We'll need a bunch of code comments explaining all this hackery, as well
as machine type compat things, but that is par for the course.

Additionally, we could have a host check and then fail to init vdpa and
vfio devices if the memory map will make some memory inaccessible.

Does this sound reasonable to others? Alex? Joao?

-- 
MST


