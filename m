Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C2F62A27E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 21:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov2Ch-0007sz-UJ; Tue, 15 Nov 2022 15:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1ov2Cf-0007si-Pp; Tue, 15 Nov 2022 15:06:41 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1ov2Ce-0008MN-7n; Tue, 15 Nov 2022 15:06:41 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6701F3200937;
 Tue, 15 Nov 2022 15:06:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 15 Nov 2022 15:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668542794; x=
 1668629194; bh=blMSC6rHWmqBaSq87I6Gq4+okisjjnzCanjRRO0aYOM=; b=H
 xIv8LTn79rt/jvnUCX5KKiqvJNMoHHlaJ7UKtN0BPMWYTcRWPhdkpb/btKdM0BrX
 MRpXWMccYEwi6zDo/MYjwSD5G3LRE2Y1dL7agrR970RG03LpMzkA0nKCZYNoTabI
 XjMGyeEDVTbgACz8eWv2iDZiYVnSuQ7wINytgk8fL9Mau6CNX51l2qSprcF657Dl
 VXtZtOIJUtoUGO4263desvoxZmK3W4Vi5bXRpoEKmpZqPH4HC4yuWuoEDawu3cEb
 fCV8rGxQxftXijC2rMazwzRwwgiZN2Q4uFGyoUXOYZQjhC1SkgOr07S5Baj82KWK
 ONMBU6GQhoe7mfKeXp0WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668542794; x=
 1668629194; bh=blMSC6rHWmqBaSq87I6Gq4+okisjjnzCanjRRO0aYOM=; b=S
 u8fdR/OLlVQSHRlnmpRQx/EszNNGrodTuqLJxUcPkbR7xBS97iQ7ez99hdLi28cV
 aI113s81UepPwE2foaXsy0OtYEicaRAUo49uI635ae6LBH8Ri0A+30i4wfMADMYv
 isccS9fRywEZBAKJbSCQxkWbEAJnnREGallOXlkRh+bLyTdx4EzD7pKHaD6OkFyp
 A+B11qiGF2QWvcc5iWbKYSYFX/3poSFF49V4POmWweU4FGs7kst58UqvZRAeN4k7
 I4cnySFvqvlbSVqpH8Y7RSoQToXyEqOJOdU1AORaz4cT1ru49bsD6Ovxyx2hZcO2
 pIbtZB4xYours0nG2sspw==
X-ME-Sender: <xms:SfFzY73mJ57l0b5T7Uf_8CsRGFJ7hp6-ZSGboEAqLwNS92tirZuMgA>
 <xme:SfFzY6EofRRaHyt3xn43pfCudXkF2jyYRkWeu33jOY_s-e9vGHX-h8QnAh_Iqb_uE
 04KXzYXwvqrhrfm4cM>
X-ME-Received: <xmr:SfFzY75KlzXZEDB7BmIrtPBK-H181gAnc05VgQ-v3E_x-_jSfsfaG9GSWmeoY3s1oZR1HqkMaWkC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:SfFzYw3znK6ofcREpMykVuapOVce7BLIpGgxc_Dig6VHbh_t-SzI5A>
 <xmx:SfFzY-HucO1AbuBYNYMEkApIykjP4b6dB7ZQQ8UMBB41Ae5v7g5x0A>
 <xmx:SfFzYx94BmY_w8UZeEMY6AIeXiGu5ALMjDGfuVWah_a3d5cGJxeW7A>
 <xmx:SvFzYx0ddunej5xV8_4DQOpa9rBDK_Er3osGMphBHVGhT_K1un2DrQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 15:06:32 -0500 (EST)
Date: Tue, 15 Nov 2022 12:06:30 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, patrick@stwcx.xyz,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Automatically zero-extend flash images
Message-ID: <Y3PxRst9n5zmDx3V@pdel-fedora-MJ0HJWH9>
References: <20221114190823.1888691-1-peter@pjd.dev>
 <890395fe-ed58-8a5d-be76-b28d99e6289a@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <890395fe-ed58-8a5d-be76-b28d99e6289a@kaod.org>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=peter@pjd.dev;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On Tue, Nov 15, 2022 at 02:06:57PM +0100, Cédric Le Goater wrote:
> Hello Peter,
> 
> On 11/14/22 20:08, Peter Delevoryas wrote:
> > I've been using this patch for a long time so that I don't have to use
> > dd to zero-extend stuff all the time. It's just doing what people are
> > doing already, right? I hope it's not controversial.
> 
> I simply run :
> 
>    truncate --size <size>

Ohhh I always forget about that command. That's certainly easier
than what I was doing.

> 
> on the FW file when needed and it is rare because most FW image builders
> know the flash size of the target.

welllllll my yocto builds don't, I'm not sure we would want them to either?

Because that would be extra data with no value to transfer to the BMC/etc.

flashcp erases the whole flash initially, which is why I don't worry
about providing a firmware image that is only covering the first 30 MB of
flash.

> 
> However, the current error message is confusing and the following could
> be an improvement :
> 
> @@ -1606,6 +1606,13 @@ static void m25p80_realize(SSIPeripheral
>      if (s->blk) {
>          uint64_t perm = BLK_PERM_CONSISTENT_READ |
>                          (blk_supports_write_perm(s->blk) ? BLK_PERM_WRITE : 0);
> +
> +        if (blk_getlength(s->blk) != s->size) {
> +            error_setg(errp, "backend file is too small for flash device %s (%d MB)",
> +                       object_class_get_name(OBJECT_CLASS(mc)), s->size >> 20);
> +            return;
> +        }
> +
>          ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
>          if (ret < 0) {
>              return;
> 
> I can send a patch for the above.

Ohhh yay! Thanks!

> 
> <hack>
> 
> I mostly run the QEMU machines with -snapshot, this hack  :
> 
>   blk_set_allow_write_beyond_eof(s->blk, true);
> 
> makes it work also ...

!!! Ohhh! interesting...that seems more sketchy but certainly simpler.

> 
> </hack>
> 
> 
> Thanks,
> 
> C.
> 
> > One note: I couldn't figure out how to make it work without changing the
> > permissions on the block device to allow truncation. If somebody knows
> > how to avoid the `blk_get_perm`, `blk_set_perm` calls here, let me know!
> > 
> > Thanks,
> > Peter
> > 
> > Peter Delevoryas (1):
> >    hw/arm/aspeed: Automatically zero-extend flash images
> > 
> >   hw/arm/aspeed.c | 40 +++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 39 insertions(+), 1 deletion(-)
> > 
> 

