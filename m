Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93754420942
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:19:40 +0200 (CEST)
Received: from localhost ([::1]:39368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXL4N-0003p6-Lc
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKz6-000588-TH
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:14:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKz1-00043D-SV
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633342447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DQy3hcmEG7f8p0XG7+HQIaO0VC6GZhQxwlTyx9Ls2o8=;
 b=DcTMgRFP0aJ6s8KATFUTjUECkBE8aVOY1rdWWhX60kvLcZ8iECMkGdvPV83ePvU4cIOjbj
 z4fNQwL5lOgANoBQCM8MtVpFZVNUlpA+UhmoXA4UZ1fDLf9p+JCUF8B4qqZ3lz/3/EZCqO
 1MVQKaFHy3EGfoaqm3K3HHJr3xLO5Zc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-ZYvMQBgJOneAfqzggzZeqQ-1; Mon, 04 Oct 2021 06:14:06 -0400
X-MC-Unique: ZYvMQBgJOneAfqzggzZeqQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 a10-20020a5d508a000000b00160723ce588so4452003wrt.23
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 03:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DQy3hcmEG7f8p0XG7+HQIaO0VC6GZhQxwlTyx9Ls2o8=;
 b=TmG7DJa0reLNtmsC5M4esTJGCHQ4C9dwc17KqYktNZyZtrIlvZQrDgzHuroiyRevFr
 GWYhVbxIoN/kY6ZaWU9w+UaC+3Amf1BxFXTuIVE2UsqopOLZIe5mcAsEd7pNl5rGsJyP
 6X/jw9VUnJQV0ZOdD2dm9AiOKOERB0jFlpXal6t9TgE2yL/afdIyylNiKhZYRT57gLd1
 ccOiM7KShx/mjTx8s32wP0o718FziUDHTGF4v9awT03l2VBXO1VfiYLomseZ+b+btPqX
 oDfLiySKTQP8Ik4rYOiZyqFKCbw3ZAkaYCoBSQbqRuCl7rSAclj9hfwNzTq4FtCyLKn0
 oGKw==
X-Gm-Message-State: AOAM530GNJLV0PtUs07NJXaIr/wunKy83iWWo1PbfCNuIiEjICXf8gmX
 8asDtY8PYO48zVAHnOydWv08HvbEeQAmJOUgOgXXPqFZ0O8BFu7FjBaX21LNpxrGZ/GmQoGP9lh
 vM16qQaSeiM/2/c8=
X-Received: by 2002:adf:9bc9:: with SMTP id e9mr7896345wrc.388.1633342445247; 
 Mon, 04 Oct 2021 03:14:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6xmecZPd8EJ7UEjc/MNxBc0yktAFhzsCIEptziVSR332G2Q0OLjV37vXubMNa2VB7PxiVzw==
X-Received: by 2002:adf:9bc9:: with SMTP id e9mr7896330wrc.388.1633342445124; 
 Mon, 04 Oct 2021 03:14:05 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id l21sm7802830wmg.18.2021.10.04.03.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 03:14:04 -0700 (PDT)
Date: Mon, 4 Oct 2021 12:14:03 +0200
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 2/5] hw/arm/virt: Add a control for the the highmem
 redistributors
Message-ID: <20211004101403.i65r26cc22a5ktqi@gator>
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-3-maz@kernel.org>
 <20211004094408.xfftmls7h6bbypuk@gator>
MIME-Version: 1.0
In-Reply-To: <20211004094408.xfftmls7h6bbypuk@gator>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 11:44:08AM +0200, Andrew Jones wrote:
> On Sun, Oct 03, 2021 at 05:46:02PM +0100, Marc Zyngier wrote:
...
> >  
> > -    return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
> > +    return (MACHINE(vms)->smp.cpus > redist0_capacity &&
> > +            vms->highmem_redists) ? 2 : 1;
> 
> Wouldn't it be equivalent to just use vms->highmem here?

OK, I see in the last patch that we may disable highmem_redists
but not highmem.

In that case,

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


