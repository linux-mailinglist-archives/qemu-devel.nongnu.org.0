Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2112625B53
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:37:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otUCg-00028s-D9; Fri, 11 Nov 2022 08:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1otUCZ-00025r-Ll
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:36:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1otUCX-0004YZ-Uz
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668173769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k2XlcnribdQ2WZUC/ZLk8kXBYUBfC3dTYiOB9eZSA5Q=;
 b=iJlvgyv3ceMLGiaTmRiWkUWj4h9xVV4wUuR+bnhbfmanBbcya5WzNfpjryIgB1oxj+gUuc
 G/KO5JX2DJyTwQjMYkekwA0NuFC4cKqLLIMLrBpvYZ8Dc244dT9bbLo3InvMjZgR1SFrRu
 0737b79Krr0+S5bUs+Vu2tavM26Xd8M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-5j3Ta0yvN-GdNTfXL1RJFA-1; Fri, 11 Nov 2022 08:36:06 -0500
X-MC-Unique: 5j3Ta0yvN-GdNTfXL1RJFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CE028027FE;
 Fri, 11 Nov 2022 13:36:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 133AB111F3BB;
 Fri, 11 Nov 2022 13:36:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B0A2C18003BA; Fri, 11 Nov 2022 14:36:02 +0100 (CET)
Date: Fri, 11 Nov 2022 14:36:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Gregory Price <gourry.memverge@gmail.com>,
 qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net,
 a.manzanares@samsung.com, bwidawsk@kernel.org,
 gregory.price@memverge.com, hchkuo@avery-design.com.tw,
 cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [BUG] hw/i386/pc.c: CXL Fixed Memory Window should not reserve
 e820 in bios
Message-ID: <20221111133602.6ixmvy7tu3whg422@sirius.home.kraxel.org>
References: <20221017234001.53297-1-gregory.price@memverge.com>
 <CAARzgwxEO5rr=b_QjiG7RoEdV=9yOgj9gxUxNvuaUnNtUEnhtw@mail.gmail.com>
 <CAD3UvdTWLXf_OecWbtP9wfAvO2+xdWiAUjQHONrgB4AAAjwdHQ@mail.gmail.com>
 <CAARzgwyCTaNoiqtVPS394Nk9LAS05116Dvc2GxifHpO01+ZN4g@mail.gmail.com>
 <20221108112111.czqldmb7wemhqy6f@sirius.home.kraxel.org>
 <20221111115123.2f9bc8b6@imammedo.users.ipa.redhat.com>
 <20221111114059.4eilz452nmfttp3a@sirius.home.kraxel.org>
 <20221111142411.41220086@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111142411.41220086@imammedo.users.ipa.redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

>     if (pcmc->has_reserved_memory && machine->device_memory->base) {             
> [...]
>                                                              
>         if (pcms->cxl_devices_state.is_enabled) {                                
>             res_mem_end = cxl_resv_end;
> 
> that should be handled by this line
> 
>         }                                   
>                                      
>         *val = cpu_to_le64(ROUND_UP(res_mem_end, 1 * GiB));                      
>         fw_cfg_add_file(fw_cfg, "etc/reserved-memory-end", val, sizeof(*val));   
>     }  
> 
> so SeaBIOS shouldn't intrude into CXL address space

Yes, looks good, so with this in place already everyting should be fine.

> (I assume EDK2 behave similarly here)

Correct, ovmf reads that fw_cfg file too.

> > I suspect the reason for these entries to exist in the first place is to
> > inform the firmware that it should not place stuff there, and if we
>        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> just to educate me, can you point out what SeaBIOS code does with reservations.

They are added to the e820 map which gets passed on to the OS.  seabios
uses (and updateas) the e820 map too, when allocating memory for
example.  While thinking about it I'm not fully sure it actually looks
at reservations, maybe it only uses (and updates) ram entries when
allocating memory.

> > remove that to conform with the spec we need some alternative way for
> > that ...
> 
> with etc/reserved-memory-end set as above,
> is E820_RESERVED really needed here?

No.  Setting etc/reserved-memory-end is enough.

So for the original patch:
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


