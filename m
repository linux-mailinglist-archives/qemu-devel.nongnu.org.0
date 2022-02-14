Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1C24B542D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:07:45 +0100 (CET)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcx6-00038i-9c
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nJcQm-0004lk-PC
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:34:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nJcQg-0000Nk-9y
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644849253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zAQmDY0qUh990W+qiyXGjrxeq3ELx8SqbrjXzA9E5Zc=;
 b=X/jpLeP5FC95fC9lr+qjD6DODjXEP1dzs0HoQ3XdMRCy1eO6jK1NN3NWcF8mQpncFNIIR4
 OtPNHYmhm8goItpMsg47DlIMX6nzT2j7McKzyPrmZ9UNKSV7Itwbbqm+daS77LBC7Xvmrq
 HJfH203CM0NneeVtaU23esCFgLaDsaA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-1zlL2C_KPCmoes0SK-l2Hw-1; Mon, 14 Feb 2022 09:34:12 -0500
X-MC-Unique: 1zlL2C_KPCmoes0SK-l2Hw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k30-20020a05600c1c9e00b0037d1bee4847so1256017wms.9
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 06:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zAQmDY0qUh990W+qiyXGjrxeq3ELx8SqbrjXzA9E5Zc=;
 b=LPlTFP0pZYGdR/JPzCIsihOrpDFym/ozoMhBtn8gjIu7BXg7v4yXXiNjTkyqiCgz9L
 qFM7nellS80O5g3r0fTyeI5r9UlNXc9/+fN4oeGz4+wy6O0KSsFjKX7Wv/FUZu/F1gi9
 37EHAX/TE7w8aa56HyBkrMW4y5RWesekGd4ord5Izzfv6Jt5BcdM8mAOlfV6tElUPqdl
 a0xR+aKSHlCMorOldBlbwblGtf6f6nmuwvVVI+H/WGLIJEmFDGXXuF6bG5ZihUIlU/+U
 zCMjsIFmqYs1rJ82UtVi9GQpc9AU4YaWtVfzhd2Sd9+ubpQSpKLaMWuwuahbRAAV0BLw
 jItw==
X-Gm-Message-State: AOAM533o8GtIx8yXsIdwia9A8fQCPiSmivH/9JtVNGL/kaQRDUG042R5
 k15s/Gs8lkODC9+y+tNsMhUsvMTuRygf1cc7x72MYJUWxWWFIeHwb0Vyu9tSARXt+jvJXYLSOpX
 kMtjO+awol5N9dU0=
X-Received: by 2002:a05:600c:1d22:: with SMTP id
 l34mr11161252wms.174.1644849250873; 
 Mon, 14 Feb 2022 06:34:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmAHWGfWOgYHoOopPK69cf99XZB1TPAdY6eie0IfYFbODcAnReom50GtcDEdSLOjcsemMk0w==
X-Received: by 2002:a05:600c:1d22:: with SMTP id
 l34mr11161241wms.174.1644849250643; 
 Mon, 14 Feb 2022 06:34:10 -0800 (PST)
Received: from redhat.com ([2.55.156.76])
 by smtp.gmail.com with ESMTPSA id p16sm5312688wmq.18.2022.02.14.06.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 06:34:10 -0800 (PST)
Date: Mon, 14 Feb 2022 09:34:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2 0/3] hw/smbios: fix table memory corruption with large
 memory vms
Message-ID: <20220214093313-mutt-send-email-mst@kernel.org>
References: <20220207113129.2701722-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20220207113129.2701722-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On Mon, Feb 07, 2022 at 05:01:26PM +0530, Ani Sinha wrote:
> This patchset tries to address the issue raised in
> https://bugzilla.redhat.com/show_bug.cgi?id=2023977 .
> 
> Patch 2 and patch 3 are dependent on patch 1. 
> Patch 1 makes some code cleanup to make thing more readable and also is
> a preparatory patch for patches 2 and 3. Patch 2 is the actual fix.
> Patch 3 adds an additional assertion because of changes introduced in
> patch 2.


Ani, typically it is best to copy everyone on the cover letter.
There are exceptions e.g. when the patchset is huge and the
CC list would grow too big, but that is the rule. Thanks!

> Ani Sinha (3):
>   hw/smbios: code cleanup - use macro definitions for table base
>     addresses
>   hw/smbios: fix table memory corruption with large memory vms
>   hw/smbios: add an assertion to ensure tables 19 and 32 do not collide
> 
>  hw/smbios/smbios.c | 58 ++++++++++++++++++++++++++++++++++------------
>  1 file changed, 43 insertions(+), 15 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
> 


