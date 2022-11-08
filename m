Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC9620EB7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:22:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMfa-0000NP-Pa; Tue, 08 Nov 2022 06:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1osMfU-0000N3-L0
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:21:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1osMfS-0001fd-Nj
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667906480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NdG8gVIkeKrggwlBGyvY9bH0G2bxhUPyGAtUdi5JNiA=;
 b=SVmONkon3bG8jUYOjCMa3O1r8jltdh8MKJj4lVWMa7t9say0jot7NuqkWSDW14V8eS9BRV
 rMctb6RwKGQW2VIER/f7B5tzeXZbnv+zFc/w++JtY3idj7Gogcl3EZliVwhhCnDnhj1SbG
 CkAEZX1Z6M/+q3ca0yyKYysbradvFa0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-l28ZxOxnNj6ef5QmPxcqZg-1; Tue, 08 Nov 2022 06:21:15 -0500
X-MC-Unique: l28ZxOxnNj6ef5QmPxcqZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52429381078B;
 Tue,  8 Nov 2022 11:21:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 058EC40C2064;
 Tue,  8 Nov 2022 11:21:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2AE02180039D; Tue,  8 Nov 2022 12:21:11 +0100 (CET)
Date: Tue, 8 Nov 2022 12:21:11 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Gregory Price <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 mst@redhat.com, marcel.apfelbaum@gmail.com, imammedo@redhat.com,
 jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net,
 a.manzanares@samsung.com, bwidawsk@kernel.org,
 gregory.price@memverge.com, hchkuo@avery-design.com.tw,
 cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [BUG] hw/i386/pc.c: CXL Fixed Memory Window should not reserve
 e820 in bios
Message-ID: <20221108112111.czqldmb7wemhqy6f@sirius.home.kraxel.org>
References: <20221017234001.53297-1-gregory.price@memverge.com>
 <CAARzgwxEO5rr=b_QjiG7RoEdV=9yOgj9gxUxNvuaUnNtUEnhtw@mail.gmail.com>
 <CAD3UvdTWLXf_OecWbtP9wfAvO2+xdWiAUjQHONrgB4AAAjwdHQ@mail.gmail.com>
 <CAARzgwyCTaNoiqtVPS394Nk9LAS05116Dvc2GxifHpO01+ZN4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwyCTaNoiqtVPS394Nk9LAS05116Dvc2GxifHpO01+ZN4g@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

> >> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> > index 566accf7e6..5bf5465a21 100644
> >> > --- a/hw/i386/pc.c
> >> > +++ b/hw/i386/pc.c
> >> > @@ -1061,7 +1061,6 @@ void pc_memory_init(PCMachineState *pcms,
> >> >          hwaddr cxl_size = MiB;
> >> >
> >> >          cxl_base = pc_get_cxl_range_start(pcms);
> >> > -        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);

Just dropping it doesn't look like a good plan to me.

You can try set etc/reserved-memory-end fw_cfg file instead.  Firmware
(both seabios and ovmf) read it and will make sure the 64bit pci mmio
window is placed above that address, i.e. this effectively reserves
address space.  Right now used by memory hotplug code, but should work
for cxl too I think (disclaimer: don't know much about cxl ...).

take care & HTH,
  Gerd


