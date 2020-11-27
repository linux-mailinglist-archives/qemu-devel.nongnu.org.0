Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82FF2C6B7E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 19:22:55 +0100 (CET)
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiiOU-00037k-Uq
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 13:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiiMT-00023M-No
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:20:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiiMO-000431-Pg
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606501241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XRUu1ujYdL5L648exhpLxJs8pk5t7z5sXWcH0+n9S54=;
 b=Ky/Hg4U8YGwy2ubQJopRnHV9WoCrfGDsg05ZGMO2uoU3PrOu7gQ3cjak339i2dlENUYK4T
 R/2IE7uZypVHt/YNjr04SRuXP1MtWLtIkJ2W4QurdYkh/ZVcnLgSeSvIufJrwwzjtkQdp6
 9YLJKOQt7taYkBUR/bIyLI6aOSSqjgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-2m8OR-lgMeC9f3HDqcQa4g-1; Fri, 27 Nov 2020 13:20:39 -0500
X-MC-Unique: 2m8OR-lgMeC9f3HDqcQa4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9768100B724;
 Fri, 27 Nov 2020 18:20:37 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AEC060BF1;
 Fri, 27 Nov 2020 18:20:36 +0000 (UTC)
Date: Fri, 27 Nov 2020 13:20:36 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
Message-ID: <20201127182036.GF2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
 <20201127164708.GZ2271382@habkost.net>
 <CAFEAcA_rt_aJTfBzAchUfCH5aKpSPReXWrVDC5mMEvyPughB8w@mail.gmail.com>
 <20201127171757.GB2271382@habkost.net>
 <CAFEAcA8D3SUMvxXU4RRYxeBAsywRfAvaFhSToJ1jcrH8bn+-4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8D3SUMvxXU4RRYxeBAsywRfAvaFhSToJ1jcrH8bn+-4Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 06:16:27PM +0000, Peter Maydell wrote:
> On Fri, 27 Nov 2020 at 17:18, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > Thanks!  Is the data returned by kvm_arm_get_host_cpu_features()
> > supposed to eventually affect the value of id_aa64mmfr0?  I don't
> > see how that could happen.
> 
> kvm_arm_get_host_cpu_features() does:
>         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
>                               ARM64_SYS_REG(3, 0, 0, 7, 0));
> 
> which is filling in data in the ARMHostCPUFeatures* that it is
> passed as an argument. The caller is kvm_arm_set_cpu_features_from_host(),
> which does
>  kvm_arm_get_host_cpu_features(&arm_host_cpu_features)
> (assuming it hasn't already done it once and cached the results;
> arm_host_cpu_features is a global) and then
>  cpu->isar = arm_host_cpu_features.isar;
> thus copying the ID values into the "struct ARMISARegisters isar"
> that is part of the ARMCPU struct. (It also copies across the
> 'features' word which gets set up with ARM_FEATURE_* flags
> for the benefit of the parts of the target code which key off
> those rather than ID register fields.)

Thanks!  For some reason I missed the line above when grepping
for id_aa64mmfr0.

-- 
Eduardo


