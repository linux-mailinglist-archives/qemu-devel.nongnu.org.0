Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210CC68D187
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:39:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJUn-0004eO-JH; Tue, 07 Feb 2023 03:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pPJUh-0004dk-JY
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:38:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pPJUf-0002SR-Hl
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675759105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOxHLd50Zlo6d5jf9IeP6gzV/OtnvaXDdQxPA4IEIkA=;
 b=QFEod7MeUJOwX0N6sbVKKF5BrRp6xsxLCEu/ATmRP5+ZxXx7YE73F475vY2kM16MoUaVg/
 cJq6CeiCckdu6wH5yyKmb4bhAKjyFHbDZvVf2Ulnvtj8ye0yQkJbytQNmUDymWoY/1DfYk
 B37XUPq/5fcyctW5PNEs/7QJISWb1zA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-n5YRPIXxOFaRw3sM-A058w-1; Tue, 07 Feb 2023 03:38:21 -0500
X-MC-Unique: n5YRPIXxOFaRw3sM-A058w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53AB93C10221;
 Tue,  7 Feb 2023 08:38:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3032C492B21;
 Tue,  7 Feb 2023 08:38:20 +0000 (UTC)
Date: Tue, 7 Feb 2023 09:38:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-block@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 kraxel@redhat.com, Xiang Zheng <zhengxiang9@huawei.com>
Subject: Re: [PULL 03/38] pflash: Only read non-zero parts of backend image
Message-ID: <Y+IN+xWlJUl6I2u9@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
 <20230120122633.84983-4-kwolf@redhat.com>
 <be61e573-1713-472c-899e-ac51b8a22345@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be61e573-1713-472c-899e-ac51b8a22345@kaod.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 06.02.2023 um 16:54 hat Cédric Le Goater geschrieben:
> On 1/20/23 13:25, Kevin Wolf wrote:
> > From: Xiang Zheng <zhengxiang9@huawei.com>
> > 
> > Currently we fill the VIRT_FLASH memory space with two 64MB NOR images
> > when using persistent UEFI variables on virt board. Actually we only use
> > a very small(non-zero) part of the memory while the rest significant
> > large(zero) part of memory is wasted.
> > 
> > So this patch checks the block status and only writes the non-zero part
> > into memory. This requires pflash devices to use sparse files for
> > backends.
> > 
> > Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> > 
> > [ kraxel: rebased to latest master ]
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > Message-Id: <20221220084246.1984871-1-kraxel@redhat.com>
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> This newly merged patch introduces a "regression" when booting an Aspeed
> machine. The following extra m25p80 patch (not yet merged) is required
> for the issue to show:
> 
>   https://lore.kernel.org/qemu-devel/20221115151000.2080833-1-clg@kaod.org/
> 
> U-Boot fails to find the filesystem in that case.
> 
> It can be easily reproduced with the witherspoon-bmc machine and seems
> to be related to the use of a UBI filesystem. Other Aspeed machines not
> using UBI are not impacted.
> 
> Here is a tentative fix. I don't know enough the block layer to explain
> what is happening :/

I was puzzled for a moment, but...

> @@ -39,7 +39,7 @@ static int blk_pread_nonzeroes(BlockBack
>              return ret;
>          }
>          if (!(ret & BDRV_BLOCK_ZERO)) {
> -            ret = bdrv_pread(bs->file, offset, bytes,

'bs->file' rather than 'bs' really looks wrong. I think replacing that
would already fix the bug you're seeing.

Just to be sure, how did you configure the block backend? bs->file would
happen to work more or less with raw over file-posix (which is probably
what Gerd tested), but I think it breaks with anything else.

> +            ret = blk_pread(blk, offset, bytes,
>                               (uint8_t *) buf + offset, 0);

blk_*() makes even more sense conceptually, but it should behave the
same.

Kevin


