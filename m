Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B23DF028
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:21:21 +0200 (CEST)
Received: from localhost ([::1]:45606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvIG-00033r-BQ
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mAvGm-0001Y1-4b
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mAvGk-0005fj-GP
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628000384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8z4UTG2XCbFJju8KF7uNjiFEXePuBgOKlP8g65H+4bE=;
 b=KSEZmq/8shagWh6KSi4Ww+Gefe3S5YbmZ+NNTIVdmFY0WPC3a8tx0XK4MICNG5BvDi45jp
 B1ZmSwzGG4KvCBwX1o4xBsGViLzPDWFgiyO88d2lOeIApiO/76TO8xBCy3b4oh4ZzrDGvF
 AOcOFmI7tjiWks0GSGIvL8NXcZP9sGg=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-5THtcy5bM0KhVG2B52naxQ-1; Tue, 03 Aug 2021 10:19:43 -0400
X-MC-Unique: 5THtcy5bM0KhVG2B52naxQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 o5-20020a0568080bc5b029025cbda427bbso8640259oik.5
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 07:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=8z4UTG2XCbFJju8KF7uNjiFEXePuBgOKlP8g65H+4bE=;
 b=VtsJaD1BQVXjrgs+AyJxrTVwNn18QxDaFsIg+qFDMdwhKfagdcqoa97OOZUKiJTptZ
 1McAvzMq+y4sKGxZ5X05wpOZ6I6hb+CGbcUtvd6wZq1vVBdW45+M7HkG9ko2TeSdr4Xk
 hLR4m/i2Eu0DNp0J9fqesiCbSoP20roskFMEfvTeBBtupAMm87dtCDBr8QnTKUi3jyDJ
 9SjRf//n7krbc7Kst7Jf+rGJe/h8s0qYrhG1DFB27KWbr4OCoiD06Ec22IecREF4aFEe
 8f6xBzwsbpqodC8gGhVT5bD+19T/nGCV3lTmr5WJtuQb5yGJvnf7cAdNM4WfM/SroIgW
 oBjA==
X-Gm-Message-State: AOAM533fH0avjdb4qYK7ldp56Rdu4/DIjFr6IGyjZhJFB8tJLlR6YIXz
 KiL12BU+WvEYWA8USIUdHufZs+O/PQHaRkzgJQ1ncB1ToA+rqbGIuXQsXy6tGXEiIf7ERG09lZS
 YokJPlQF7UgqkIE4=
X-Received: by 2002:a05:6830:23a7:: with SMTP id
 m7mr15716074ots.17.1628000383266; 
 Tue, 03 Aug 2021 07:19:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG72v7JnOQT4y12h7UDbfc81wpLoqv+VpkEg4kJqQMXbI9C0jebramGfZyKeYixJABZRR8rA==
X-Received: by 2002:a05:6830:23a7:: with SMTP id
 m7mr15716060ots.17.1628000383040; 
 Tue, 03 Aug 2021 07:19:43 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id 12sm342779otg.14.2021.08.03.07.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:19:42 -0700 (PDT)
Date: Tue, 3 Aug 2021 08:19:41 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Subject: Re: [Question] Reduce the msix_load cost for VFIO device
Message-ID: <20210803081941.66cccf40.alex.williamson@redhat.com>
In-Reply-To: <61e3fdd1-13a1-0675-b5c8-f7bfe3e6a042@huawei.com>
References: <61e3fdd1-13a1-0675-b5c8-f7bfe3e6a042@huawei.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 16:43:07 +0800
"Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
<longpeng2@huawei.com> wrote:

> Hi Alex,
> 
> We found that the msix_load() will cost 40~50ms if the VF has 60+ interrupts,
> the following code cost too much for each interrupt:
> 
> msix_load:
>   for (vector = 0; vector < 60; vector++)
>     msix_handle_mask_update
>       vfio_msix_vector_do_use
>         vfio_add_kvm_msi_virq
>           kvm_irqchip_add_msi_route
>             kvm_irqchip_commit_routes <-- cost 0.8ms each time
> 
> In irq remapping mode, the VF interrupts are not routed through KVM irqchip

I'm not sure what this means.  Your MSIX interrupts are going through
QEMU anyway?  Why?

> in fact, so maybe we can reduce this cost by "x-no-kvm-msix=ture", right?
> Are there any risks if we do in this way ?

You're obviously free to configure your device this way, but the
expectation is that any sort of startup latency is more than offset by
improved runtime latency through the KVM route.  This option is usually
reserved for debugging, when we want to see all interaction with the
device in QEMU.

If there's a case where we're not detecting that a KVM route is
ineffective, then we should figure out how to detect that and skip this
code, but again the expectation is that the KVM route is worthwhile.

If this is specifically about kvm_irqchip_commit_routes(), maybe the
setup path needs a way to batch multiple routes and defer the commit,
if that's possible.  Thanks,

Alex


