Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D81552AC9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 08:09:19 +0200 (CEST)
Received: from localhost ([::1]:47852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3X4f-0005RY-Iv
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 02:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o3X0Q-00041y-0J
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 02:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o3X0K-0006HY-L3
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 02:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655791485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VYoffPdFnO3usAS2921ioqyhgWLZyrEuOEOT+pfB4AY=;
 b=TFh0DGutlMxC/AFqZ+UE7p76BNQcLSnXSYs/xyNZ6PMX87dXdASsZDmiT/tyw0ol3Zr0VT
 SSdQSBO6lLbjPoycObbNN3omzsKk3xIWQ8CNddashfRUijnEaLF/1hviFHlvwiL/AJ2RIf
 3FOpN6rtEJXNjocmaAwC5ZZ37X69Thw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-x_2WaXutN8KVEhCFENZijQ-1; Tue, 21 Jun 2022 02:04:44 -0400
X-MC-Unique: x_2WaXutN8KVEhCFENZijQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l17-20020a05600c4f1100b0039c860db521so5908799wmq.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 23:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VYoffPdFnO3usAS2921ioqyhgWLZyrEuOEOT+pfB4AY=;
 b=mI8cy7DZRpwAuBluEqExugADTg0LtytX8i49jtel4CtFraVkIVb+VQ4ZUJJWBo7Oqv
 92Zedq3koX05Nqad9U0BHjKRUbw/jN10HEFOLHB/LzRddeeAW2hTM/Jc0oRpkrMW6lek
 4Vz5X0oG8ZeH9iYjx+EOwOVPsTadAsxJA4VV/08Hqp5IsGHmNfpvcZmu1dCTUDvaKICK
 j/qh0A6OZmS7UfiDJX3d2VgYQPkgAwmQjdyLL9+4WIcin7kNAN9djFQMjMMtrLDSDK/4
 FcnA8DDBy/7pk4H799cEQoCB+x0d8GnTfyh5fKmzx9BXHTD4Iaf1M3eU5JjwdDlUUT9J
 n5wQ==
X-Gm-Message-State: AJIora+7jqmsqg9TKqFfnwEChpH4PIuVG2efHWlJDJ4IRuGFLLtcgSYZ
 uSkX/w0oMsvYvUSfpvQFKHtvGcioEyvPXrk4fKbdQ4D8p+6i1cjG+AXE4kjIDphj2QdFtpssQnR
 IvwmEKLqTCS+BPPY=
X-Received: by 2002:a1c:29c1:0:b0:39d:86c0:3ece with SMTP id
 p184-20020a1c29c1000000b0039d86c03ecemr27544417wmp.138.1655791483017; 
 Mon, 20 Jun 2022 23:04:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uE9/FObnpSIyFONNTOs3CtPZQpGbBc1WZTEu9kmlraLfmFaw6oO6qCdjmfg7NWG8id4HWQLg==
X-Received: by 2002:a1c:29c1:0:b0:39d:86c0:3ece with SMTP id
 p184-20020a1c29c1000000b0039d86c03ecemr27544400wmp.138.1655791482740; 
 Mon, 20 Jun 2022 23:04:42 -0700 (PDT)
Received: from redhat.com ([2.53.15.87]) by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b0039c747a1e8fsm22733232wmi.7.2022.06.20.23.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 23:04:42 -0700 (PDT)
Date: Tue, 21 Jun 2022 02:04:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffman <kraxel@redhat.com>
Cc: Dionna Glaze <dionnaglaze@google.com>, qemu-devel@nongnu.org,
 Xu@google.com, Min M <min.m.xu@intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] hw/i386: Add unaccepted memory configuration
Message-ID: <20220621020150-mutt-send-email-mst@kernel.org>
References: <20220620223300.1555849-1-dionnaglaze@google.com>
 <20220621053702.oqzkmij4b4jm4ysd@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621053702.oqzkmij4b4jm4ysd@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 21, 2022 at 07:37:02AM +0200, Gerd Hoffman wrote:
> On Mon, Jun 20, 2022 at 10:33:00PM +0000, Dionna Glaze wrote:
> > For SEV-SNP, an OS is "SEV-SNP capable" without supporting this UEFI
> > v2.9 memory type. In order for OVMF to be able to avoid pre-validating
> > potentially hundreds of gibibytes of data before booting, it needs to
> > know if the guest OS can support its use of the new type of memory in
> > the memory map.
> 
> I think this should be wired up via sev-guest object (see
> SevGuestProperties in qapi/qom.json and target/i386/sev.c),
> i.e.
> 
> qemu -object sev-guest,accept-all-memory=true,$args
> 
> (and likewise for -object tdx-guest once merged).
> 
> take care,
>   Gerd

Right. As written the patch would allow the flag without SEV-SNP too -
but does it make any sense outside SEV-SNP? It's better not to allow
flag combinations that make no sense since they tend to
become part of ABI that we then need to support.

-- 
MST


