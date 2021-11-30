Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E84644B4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 03:02:05 +0100 (CET)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msEwd-0008OE-Jq
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 21:02:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johan@kernel.org>) id 1ms6mV-0002im-PD
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 12:19:03 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:51352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johan@kernel.org>) id 1ms6mS-0002JM-44
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 12:19:03 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 842B1B81A1F;
 Tue, 30 Nov 2021 17:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D05EC53FC1;
 Tue, 30 Nov 2021 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638292727;
 bh=G1WVbS81//21rP0WUcWlWVTfe9CPWo90pxb2Kd7mrbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gy8zqf6BsOoJjGqi3hwrr2n88e862LPIphxiHrpjalScBIMiv++BFm9G/5D36fqyn
 fub9n5mfs7eZRxBJAXFV5JTzRnHCFzGbBmxEPfVSiVNMMdt2kwYgnRcz94Dz3XSvbT
 IzFwmvn/33uokqML+TmF6nlg+QseZuBTdve9VL19HiJtzm+UNgXbhO6ku7eJUN49Wk
 IJ7pQKv2a40SW7c12gA/P1ATJgzbE/HHomL1vHwDj57OMuzQJvbq0MfWygvxlJUw2L
 bNSSnd8edofbgPTD4RCweb88iHglCJBouQBOb5sTvCQsZj9KxqjDI/KSQRcqpHVrBT
 LKp29LskcQ9gA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1ms6ls-0000Ip-OV; Tue, 30 Nov 2021 18:18:25 +0100
Date: Tue, 30 Nov 2021 18:18:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] fw_cfg: Fix memory leak in fw_cfg_register_file
Message-ID: <YaZc4LbX5hrJDnec@hovoldconsulting.com>
References: <20211116114233.29462-1-linmq006@gmail.com>
 <2ced2fae-2ffd-3a70-f02c-175662baf7bc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ced2fae-2ffd-3a70-f02c-175662baf7bc@redhat.com>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=johan@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 30 Nov 2021 20:58:51 -0500
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
Cc: Miaoqian Lin <linmq006@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gabriel Somlo <somlo@cmu.edu>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, Qiushi Wu <wu000273@umn.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 04:28:34PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/16/21 12:42, Miaoqian Lin wrote:
> > When kobject_init_and_add() fails, entry should be freed just like
> > when sysfs_create_bin_file() fails.
> > 
> 
> Fixes: fe3c60684377 ("firmware: Fix a reference count leak.")
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

No, no. This patch is completely bogus and would introduce a double
free.

> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> > ---
> >  drivers/firmware/qemu_fw_cfg.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
> > index 172c751a4f6c..0f404777f016 100644
> > --- a/drivers/firmware/qemu_fw_cfg.c
> > +++ b/drivers/firmware/qemu_fw_cfg.c
> > @@ -608,6 +608,7 @@ static int fw_cfg_register_file(const struct fw_cfg_file *f)
> >  				   fw_cfg_sel_ko, "%d", entry->select);
> >  	if (err) {
> >  		kobject_put(&entry->kobj);
> > +		kfree(entry);

entry would already have been freed by kobject_put() and
fw_cfg_sysfs_release_entry() here.

> >  		return err;
> >  	}
> >  
> > 

Doesn't look like this patch has been picked up yet, so:

	NAK.

Johan

