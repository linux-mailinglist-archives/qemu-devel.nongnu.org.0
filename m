Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C090C6F012B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:02:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prvdc-0007zF-6q; Thu, 27 Apr 2023 03:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prvdZ-0007yv-71
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:01:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prvdX-0003Pl-KU
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682578910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Hko65pAenTGfXNXslRMXLMkHsBT7iNce91u3gRZMcE=;
 b=Hur+L57XGvmQTfHlz7NQY49VFH26TsdrG9wTwb5Z1E0Mn+K6ty42bAwyYGNbSRGUCiCJRA
 HS3balNmueaWW3sys5dOmQmNl/L0I3SQUQ2s9nqFX+4/NvX/YsZjdbqSz6JOtn3fff/dWK
 J1Pb4dmolE6/JyMcvrlcudoqaGmn7xU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-ttLnjiI5OWCZd6ySRS8qpw-1; Thu, 27 Apr 2023 03:01:48 -0400
X-MC-Unique: ttLnjiI5OWCZd6ySRS8qpw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f69e5def13so2981680f8f.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 00:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682578907; x=1685170907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Hko65pAenTGfXNXslRMXLMkHsBT7iNce91u3gRZMcE=;
 b=hx7XYJdtfoqCZCEboop4ONRV89bQK+EmlhPlcXu6G87gSI0BQ6ytjbVrlgQfiSil/d
 OsozPVVEVAsKf8a3LFDqh5Nqz1jg+0Zusf26YSVgfC9sxoAVpQUwF7VmugjAayqIvsIJ
 X54cnQAkMtmUtbjq7Tte3VsGpVovUv2NX90uFUt4Hyk6n869yR/xOyPIZ/nlPYB50Oqc
 Jsxch+DSzH2c3LuFb72f3u/qzL9KZ1DVwZsbazgM+gx8R7t+8CMT7o1iKPtDdPijQ9XZ
 DaU+xObTYVDK6Vd75tGf6MNicIPaA+6fRyQsS/fWYb6iqJnLwPb+aPyp4NYJEeLyBO6o
 AFYw==
X-Gm-Message-State: AC+VfDwQQwDG+kKP69+VRcAwocc0Xh9hjeH4asSlSM5bENcOt/oO9kO8
 Hj36QysM8ocF++2r44mOt39fMZI/GDeZsf4cjkiRkyxjKsNXnWvvuq5n+GQWutMRDKQBj0gotnm
 cqjGILFIdKJgFUV8=
X-Received: by 2002:adf:f98f:0:b0:2fb:11ec:f2a1 with SMTP id
 f15-20020adff98f000000b002fb11ecf2a1mr522147wrr.20.1682578907616; 
 Thu, 27 Apr 2023 00:01:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7um3cqDj1M41cUvuWZp2ULG93O+M5uxdvv1iWIJize2oWnP/WLFD8xYpSDbbgoRHgu+L6yog==
X-Received: by 2002:adf:f98f:0:b0:2fb:11ec:f2a1 with SMTP id
 f15-20020adff98f000000b002fb11ecf2a1mr522124wrr.20.1682578907198; 
 Thu, 27 Apr 2023 00:01:47 -0700 (PDT)
Received: from redhat.com ([2.52.19.183]) by smtp.gmail.com with ESMTPSA id
 z14-20020a5d4d0e000000b002efb4f2d240sm17621925wrt.87.2023.04.27.00.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 00:01:46 -0700 (PDT)
Date: Thu, 27 Apr 2023 03:01:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 anisinha@redhat.com, jusual@redhat.com
Subject: Re: [PATCH v4] acpi: pcihp: allow repeating hot-unplug requests
Message-ID: <20230427030127-mutt-send-email-mst@kernel.org>
References: <20230418090449.2155757-1-imammedo@redhat.com>
 <eaff7481-48ab-14f4-330b-e2d84dd72855@msgid.tls.msk.ru>
 <ZEldKCEgmDA7Hmdx@pinwheel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEldKCEgmDA7Hmdx@pinwheel>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 26, 2023 at 07:20:08PM +0200, Kashyap Chamarthy wrote:
> On Wed, Apr 26, 2023 at 07:40:02PM +0300, Michael Tokarev wrote:
> > 18.04.2023 12:04, Igor Mammedov wrote:
> > > with Q35 using ACPI PCI hotplug by default, user's request to unplug
> > > device is ignored when it's issued before guest OS has been booted.
> > > And any additional attempt to request device hot-unplug afterwards
> > > results in following error:
> > > 
> > >    "Device XYZ is already in the process of unplug"
> > > 
> > > arguably it can be considered as a regression introduced by [2],
> > > before which it was possible to issue unplug request multiple
> > > times.
> > 
> > Stable-8.0 material?
> 
> FWIW, I'd say, yes. This fix is useful for stable releases.  As this
> solves a real problem for upper-management tools.
> 
> I have tested this fix; and it works.  I'll post my testing notes /
> reproducer in a follow-up email.  In short, I followed the
> reproducer steps from here[1].
> 
> [1] https://gitlab.com/libvirt/libvirt/-/issues/309
> 


You can CC stable then.

> -- 
> /kashyap


