Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2938568EF30
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:41:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjHQ-0007Ny-FU; Wed, 08 Feb 2023 07:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pPjHK-0007MF-6b
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:10:23 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pPjHI-0001sn-Er
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:10:21 -0500
Received: by mail-wm1-x330.google.com with SMTP id z13so5702061wmp.2
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 04:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yj7A2Iy7u3FcfZSHeT9reKcl3NMlbOAZlTdVmXK/d/Y=;
 b=WwVDVsVQ93fMO+mrgqv7RKjIm5mHJFBTCXK2DuEpBhfgbEPn1+cPSjFnXo3hIB9I2/
 aaqGj8OIV0lCsHDBrDrqGL/Yx8mpLdnxItSVNIl+/dfFm9sHXuYq3R4D3A7+GTfWbPOm
 OKDj/1PTIOuiwW/5Wwr7qYyIeXsPz62eE0ZMb+f0FdcmNtPIrIbB+KQf6suV9kfGV1ac
 Su97Vu2qimhbS/2Nuzj8/1P50PF42GGSENT+9bfxndb1wxSuSPaEJlfDaJg9u/NRD0Ng
 lyGJtoODLkAV4wdTpUGt9ipfGxJ6Rc4uTzGkDrXXtAnFc9DWVa3igFWloKCtW6jKQJDg
 dy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yj7A2Iy7u3FcfZSHeT9reKcl3NMlbOAZlTdVmXK/d/Y=;
 b=iQLThzC/Z2WEuuTweOWummhjUebeuO68Xu8xk/B4NYWMWZvR0dNqJOdELIV75UCo6n
 bnEe+yu/snQcM4PIkPV1Z/p+doS6gnFvO2piuP1IjQK+ToNFesZGSi3qBQVIbQRyag+X
 U5T9GDg3q50dwBPz9y6vUHtjoFdBou8ea/k2tm2qemm93gC4XtSA9CyRYRT1Ua89g+s9
 wR/JojYzDLfUkpGc8dH3Go5gwz95LCmQzbXkWUpzuDf6EIQkz9g5lc00RGfN0wWA/+VX
 TOfUXmlPymoM75GPEV93nVBibEsRHDRKNgIMJpyqx1Rp6qrFUzyBFizM6W1wuiMAl/aK
 3AOw==
X-Gm-Message-State: AO0yUKVRW2sDxCGTHYV0+PbUmYFBvBbsMbXudu3DWDa8BiJ0IGIxuqLI
 63ugA8zpDCzxBF8TU1PvnI+u1w==
X-Google-Smtp-Source: AK7set+V+TidhEf70JlG5vUum881/TglNroruZGMt5W5dh9HSuDU3mexIT3cOm9iB/6wOPi+l649fg==
X-Received: by 2002:a05:600c:3093:b0:3dd:37a5:dc90 with SMTP id
 g19-20020a05600c309300b003dd37a5dc90mr6412487wmn.32.1675858218617; 
 Wed, 08 Feb 2023 04:10:18 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 c63-20020a1c3542000000b003df14531724sm1812791wma.21.2023.02.08.04.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 04:10:18 -0800 (PST)
Date: Wed, 8 Feb 2023 12:10:13 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 08/16] target/arm/kvm-rme: Populate the realm with
 boot images
Message-ID: <Y+ORJftuXd2DjV3F@myrica>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-9-jean-philippe@linaro.org>
 <e43446dd-e6d9-3591-aea8-c77dc83dcd8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e43446dd-e6d9-3591-aea8-c77dc83dcd8b@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, Jan 27, 2023 at 01:54:23PM -1000, Richard Henderson wrote:
> >   static void rme_vm_state_change(void *opaque, bool running, RunState state)
> >   {
> >       int ret;
> > @@ -72,6 +115,9 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
> >           }
> >       }
> > +    g_slist_foreach(rme_images, rme_populate_realm, NULL);
> > +    g_slist_free_full(g_steal_pointer(&rme_images), g_free);
> 
> I suppose this technically works because you clear the list, and thus the
> hook is called only on the first transition to RUNNING.  On all subsequent
> transitions the list is empty.
> 
> I see that i386 sev does this immediately during machine init, alongside the
> kernel setup.  Since kvm_init has already been called, that seems workable,
> rather than queuing anything for later.

The problem I faced was that RME_POPULATE_REALM needs to be called after
rom_reset(), which copies all the blobs into guest memory, and that
happens at device reset time, after machine init and
kvm_cpu_synchronize_post_init().

> But I think ideally this would be handled generically in (approximately)
> kvm_cpu_synchronize_post_init, looping over all blobs.  This would handle
> any usage of '-device loader,...', instead of the 4 specific things you
> handle in the next patch.

I'd definitely prefer something generic that hooks into the loader, I'll
look into that. I didn't do it right away because the arm64 Linux kernel
loading is special, requires reserving extra RAM in addition to the blob
(hence the two parameters to kvm_arm_rme_add_blob()). But we could just
have a special case for the extra memory needed by Linux and make the rest
generic.

Thanks,
Jean

