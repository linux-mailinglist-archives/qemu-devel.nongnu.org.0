Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C01E1C67
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 09:40:34 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdUCP-000817-M7
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 03:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jdU8x-0003yG-Pd
 for qemu-devel@nongnu.org; Tue, 26 May 2020 03:36:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28736
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jdU8x-0007KH-2U
 for qemu-devel@nongnu.org; Tue, 26 May 2020 03:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590478617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S7NJpqlZP7uKorEWA3iemh5O3gn/X14OkJ+PtixJnqI=;
 b=L11a6pKF4ie+14d4Ydw/f7/qPC+MgSca/BbLlPSb7SU8ngsWbRV3DxP+3i2ng+tLHqQzRX
 c40YSjjjzGSx8vfhKTyN5ESeiSnZtuCkcPFdEoULnQZHAIr+NnSV0arWiR4Dk4M4NeBqYa
 hNUlapxIF1nGDVTo7oEjHJsy9/gD/mY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-Vpquw_V7M8K4-UuwdzGW-w-1; Tue, 26 May 2020 03:36:56 -0400
X-MC-Unique: Vpquw_V7M8K4-UuwdzGW-w-1
Received: by mail-wr1-f71.google.com with SMTP id h6so8594225wrx.4
 for <qemu-devel@nongnu.org>; Tue, 26 May 2020 00:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S7NJpqlZP7uKorEWA3iemh5O3gn/X14OkJ+PtixJnqI=;
 b=iNq4L6H13PJf5XrZKIhRn0kU3MqCL+w1bf50UMH2sSAs6WRnp7t/nfaD0bbJW2hLjl
 canC/uCyevzdR4gwgfwWdaeBg3HSalHFIC/njVtk77qEeiGs6CfO4ImfpdFuB1WyezAN
 yCpiEyRcclhVAcvaAwJ4AJ3jzhsJod81VDhEOIBoFED2l7VLpuY+qiGV2mUlMamX/H+E
 hOMV5100YtXPmlhYmlYpPcDXe1MevJ1kCvJZCAmolaDuSdeiSoAiui5Wop6yBwYM90GM
 HQBjMs/Pi0n0z3x/Xq2wlv/AZ/3BSgZp2fMdhbNqBJaxINyMDP8zQQzwPiyEPxImSlaU
 Omhw==
X-Gm-Message-State: AOAM533QbbfryVszaV09AbYPlgOXLUmzNGiJfN3UaaAy5R8d9krwbl2p
 qOBPJ6Mm6JVFdh2iWkGSIIrWDSVG5SSsTPl/JYT0DJuDRdHgitszKNdL1/IEMwt40cj0XY54K+M
 8ApQee0musd1zBS0=
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr100100wmi.9.1590478614954;
 Tue, 26 May 2020 00:36:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGMr5OBq4767LlhnawWTpRb2Rt+7aXoeCARM5Fm61NemwSpdZnRPgmC0e9j/IS6C8C6jVgCg==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr100082wmi.9.1590478614773;
 Tue, 26 May 2020 00:36:54 -0700 (PDT)
Received: from steredhat ([79.49.207.108])
 by smtp.gmail.com with ESMTPSA id z6sm5853334wrh.79.2020.05.26.00.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 00:36:54 -0700 (PDT)
Date: Tue, 26 May 2020 09:36:51 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: About the PVH in Seabios
Message-ID: <20200526073651.mqnawlzjcqz2452t@steredhat>
References: <20200526071826.GA28145@yangzhon-Virtual>
MIME-Version: 1.0
In-Reply-To: <20200526071826.GA28145@yangzhon-Virtual>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:19:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yang,

On Tue, May 26, 2020 at 03:18:26PM +0800, Yang Zhong wrote:
> Hello all,
> 
> The current PVH has been implemented in Qemu and Qboot/uefi, i am not
> familiar with the PVH implementation history, and found there is no
> PVH support in Seabios, my question is do we have plan to support
> PVH in Seabios? thanks.

We developed an optionrom in QEMU (pc-bios/optionrom/pvh*) that is used
with SeaBIOS to boot a PVH image.

So we don't need to change SeaBIOS since it already supports optionroms.
Currently when you use a PVH image in QEMU, SeaBIOS is used as default
choice with the PVH optionrom.

Cheers,
Stefano


