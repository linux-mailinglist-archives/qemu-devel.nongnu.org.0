Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92830DF50
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:12:12 +0100 (CET)
Received: from localhost ([::1]:59248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KlH-0003nN-MA
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l7Kjr-0002Ia-Rr
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:10:43 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:55884
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l7Kjq-0007aS-FW
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:10:43 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 36F0A1234A4; Wed,  3 Feb 2021 08:10:40 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 35AA4122C69;
 Wed,  3 Feb 2021 08:10:34 -0800 (PST)
Date: Wed, 3 Feb 2021 08:10:32 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH 3/3] hw/cxl/cxl-device-utils: Allow incorrect read
 lengths
Message-ID: <20210203161032.ifusdstess7i3ni3@mail.bwidawsk.net>
References: <20210201152655.31027-1-Jonathan.Cameron@huawei.com>
 <20210201152655.31027-4-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201152655.31027-4-Jonathan.Cameron@huawei.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 linuxarm@openeuler.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-01 23:26:55, Jonathan Cameron wrote:
> This is currently needed to avoid an issue in the Linux RFC
> in which a read is issued that is not a multiple of DW.
> On arm64 that results in byte reads being issued and a bus
> error returned.
> 
> It is not yet obvious at what level this should be fixed,
> so paper over it to get things working.
> 
> Not-signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/cxl/cxl-device-utils.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> index d0d0a47122..52dd03384a 100644
> --- a/hw/cxl/cxl-device-utils.c
> +++ b/hw/cxl/cxl-device-utils.c
> @@ -181,11 +181,11 @@ static const MemoryRegionOps mailbox_ops = {
>      .write = mailbox_reg_write,
>      .endianness = DEVICE_LITTLE_ENDIAN,
>      .valid = {
> -        .min_access_size = 4,
> +        .min_access_size = 1,
>          .max_access_size = 8,
>      },
>      .impl = {
> -        .min_access_size = 4,
> +        .min_access_size = 1,
>          .max_access_size = 8,
>      },
>  };

I think this is now addressed in my v3. I'm happy to carry these patches around
in my branch if it helps.

They all lgtm

