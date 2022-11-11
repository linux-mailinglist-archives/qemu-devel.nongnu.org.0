Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356D6625D37
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:38:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVA3-0007Vb-H6; Fri, 11 Nov 2022 09:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otV9y-0007V3-K0
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:37:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otV9x-0003CY-6n
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668177452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tw7WXiynU+Ey4ACbtr/TnLshynxlREc4cADZXwl+AQ8=;
 b=ZTJPgKhFoaUGmzQjSNXHtnOMtLC2D5dgDxLC3Uex3vnEEQAiIN948W0C0EH36lx5ZnKn1I
 RtwFuPKnkU8nfPPzGJrJjELxZe07aYkStyPNjgLywQPfUao30AAZtY9MlDcBdx3t/buwTr
 upC46Zrw8VElk7ksdZKYqqrbe2e1ejE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-qG_nrKtKN5qY-zKyR_vE9g-1; Fri, 11 Nov 2022 09:37:31 -0500
X-MC-Unique: qG_nrKtKN5qY-zKyR_vE9g-1
Received: by mail-wr1-f70.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so1061541wrg.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tw7WXiynU+Ey4ACbtr/TnLshynxlREc4cADZXwl+AQ8=;
 b=ebg5Qq9hZnCJXvJtCj1p2F1VaFLmptXJV/BgIOcSaSJ6L3L+wRrk8S3/g4iUbY7e/s
 hpZgV5T5/7kY3wCHU31zjcW9zFL7FTzOt6LlvRLpbowY6L3B8NMvuK6RdkOSgQ31jogO
 mZrZ9va5U6/g/dNMt7837FsMSRGykOkJ0ZI+xOji1yhkaljK0wjHIGAMy6cGIxuL0H7o
 09MIfjA/+dhRAGgxofJjDo1iN4nReWKP6qIdqo+Cur5KFtpSxG1+yo0RjLqt3OpyrXq7
 EZEZ4PwkR/d3Af+kM08bJtMeJGl+ukkXGof+snWwUCbDztKEofsHa4sJh4Uu3iOj6umW
 Nk6w==
X-Gm-Message-State: ANoB5pnckbyC7CE64SoAlE2rADOlPP6gTSiO2tkt/HSIic0vAZ+lg5s2
 gfvdmz33kOIuKr/aqMYQFIsvqGeYijXDyQAW5qGbIuhpQyEkZJj8qZf4HwvMqX/Sm7cx/oQ7nej
 PSdqhC9Jpgu67pnM=
X-Received: by 2002:a05:600c:2306:b0:3cf:6a83:c7a3 with SMTP id
 6-20020a05600c230600b003cf6a83c7a3mr1391634wmo.21.1668177449949; 
 Fri, 11 Nov 2022 06:37:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6JcU8GAHalNdLwNufHYrKG7VEnJSyZcKpQH47nBRm7uGkbhRhYG18oyNMWzGusRboh9xrh0g==
X-Received: by 2002:a05:600c:2306:b0:3cf:6a83:c7a3 with SMTP id
 6-20020a05600c230600b003cf6a83c7a3mr1391608wmo.21.1668177449669; 
 Fri, 11 Nov 2022 06:37:29 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c46cc00b003b4ac05a8a4sm11673796wmo.27.2022.11.11.06.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:37:29 -0800 (PST)
Date: Fri, 11 Nov 2022 09:37:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gregory Price <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, jonathan.cameron@huawei.com,
 linux-cxl@vger.kernel.org, alison.schofield@intel.com,
 dave@stgolabs.net, a.manzanares@samsung.com, bwidawsk@kernel.org,
 gregory.price@memverge.com, hchkuo@avery-design.com.tw,
 cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [BUG] hw/i386/pc.c: CXL Fixed Memory Window should not reserve
 e820 in bios
Message-ID: <20221111093704-mutt-send-email-mst@kernel.org>
References: <20221017234001.53297-1-gregory.price@memverge.com>
 <CAARzgwxEO5rr=b_QjiG7RoEdV=9yOgj9gxUxNvuaUnNtUEnhtw@mail.gmail.com>
 <CAD3UvdTWLXf_OecWbtP9wfAvO2+xdWiAUjQHONrgB4AAAjwdHQ@mail.gmail.com>
 <CAARzgwyCTaNoiqtVPS394Nk9LAS05116Dvc2GxifHpO01+ZN4g@mail.gmail.com>
 <20221108112111.czqldmb7wemhqy6f@sirius.home.kraxel.org>
 <20221111115123.2f9bc8b6@imammedo.users.ipa.redhat.com>
 <20221111114059.4eilz452nmfttp3a@sirius.home.kraxel.org>
 <20221111142411.41220086@imammedo.users.ipa.redhat.com>
 <20221111133602.6ixmvy7tu3whg422@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111133602.6ixmvy7tu3whg422@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Fri, Nov 11, 2022 at 02:36:02PM +0100, Gerd Hoffmann wrote:
> >     if (pcmc->has_reserved_memory && machine->device_memory->base) {             
> > [...]
> >                                                              
> >         if (pcms->cxl_devices_state.is_enabled) {                                
> >             res_mem_end = cxl_resv_end;
> > 
> > that should be handled by this line
> > 
> >         }                                   
> >                                      
> >         *val = cpu_to_le64(ROUND_UP(res_mem_end, 1 * GiB));                      
> >         fw_cfg_add_file(fw_cfg, "etc/reserved-memory-end", val, sizeof(*val));   
> >     }  
> > 
> > so SeaBIOS shouldn't intrude into CXL address space
> 
> Yes, looks good, so with this in place already everyting should be fine.
> 
> > (I assume EDK2 behave similarly here)
> 
> Correct, ovmf reads that fw_cfg file too.
> 
> > > I suspect the reason for these entries to exist in the first place is to
> > > inform the firmware that it should not place stuff there, and if we
> >        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > just to educate me, can you point out what SeaBIOS code does with reservations.
> 
> They are added to the e820 map which gets passed on to the OS.  seabios
> uses (and updateas) the e820 map too, when allocating memory for
> example.  While thinking about it I'm not fully sure it actually looks
> at reservations, maybe it only uses (and updates) ram entries when
> allocating memory.
> 
> > > remove that to conform with the spec we need some alternative way for
> > > that ...
> > 
> > with etc/reserved-memory-end set as above,
> > is E820_RESERVED really needed here?
> 
> No.  Setting etc/reserved-memory-end is enough.
> 
> So for the original patch:
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> take care,
>   Gerd

It's upstream already, sorry I can't add your tag.

-- 
MST


