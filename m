Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDB35854EE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 20:12:10 +0200 (CEST)
Received: from localhost ([::1]:52508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHUT2-0004zp-P1
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 14:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oHUQK-0002r5-U0
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 14:09:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oHUQH-000752-R6
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 14:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659118157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UzbI0o6/KZkCLc1thriZbEGL7tn6lNWesz7QQT2ZBNo=;
 b=HAoYmzbu1moYEmLLsjASmFX7WQez8juAwmL6GE2verrvs75Be9aeSCsS162v2r3TF/v69a
 VfWqOghvMT3Ldicf05T2tBYCW7K77jPkPF3SR1SjV8u8NBoNxB/wgso7ftRNrH6PGjj0PM
 0jignVdKUMWMg4sxjM2DtV3Kcqnn3Uk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-yffWDslNPZ6p3_k9viqNbA-1; Fri, 29 Jul 2022 14:09:15 -0400
X-MC-Unique: yffWDslNPZ6p3_k9viqNbA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B2B2185A7BA;
 Fri, 29 Jul 2022 18:09:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7E551415118;
 Fri, 29 Jul 2022 18:09:11 +0000 (UTC)
Date: Fri, 29 Jul 2022 20:09:10 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Denis V. Lunev" <den@virtuozzo.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Peter Krempa <pkrempa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/1] block: add missed block_acct_setup with new block
 device init procedure
Message-ID: <YuQiRj1dJFRMRh1j@redhat.com>
References: <20220711110725.425261-1-den@openvz.org>
 <1aa3921a-0e67-d580-9bf2-c098d242e380@yandex-team.ru>
 <66373021-7dad-953b-b244-75a4756a0b33@virtuozzo.com>
 <YuOkvmbvhzD2dsGq@redhat.com>
 <0d0b7c13-9dd5-49a8-86cd-30a748959b7b@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d0b7c13-9dd5-49a8-86cd-30a748959b7b@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 29.07.2022 um 14:36 hat Denis V. Lunev geschrieben:
> On 29.07.2022 11:13, Kevin Wolf wrote:
> > Am 28.07.2022 um 21:27 hat Denis V. Lunev geschrieben:
> > > On 28.07.2022 16:42, Vladimir Sementsov-Ogievskiy wrote:
> > > > On 7/11/22 14:07, Denis V. Lunev wrote:
> > > > > Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
> > > > > the first glance, but it has changed things a lot. 'libvirt' uses it to
> > > > > detect that it should follow new initialization way and this changes
> > > > > things considerably. With this procedure followed, blockdev_init() is
> > > > > not called anymore and thus block_acct_setup() helper is not called.
> > > > I'm not sure that 5f76a7aac156ca is really the corner stone.. But yes,
> > > > libvirt moved to "blockdev era", which means that we don't use old
> > > > -drive,
> > > > instead block nodes are created by -blockdev / qmp: blockdev-add, and
> > > > attached
> > > > to block devices by node-name.
> > > > 
> > > git bisected, thus I am sure here
> > > 
> > > 
> > > > And if I understand correctly blockdev_init() is called only on -drive
> > > > path.
> > > > 
> > > > I have some questions:
> > > > 
> > > > 1. After this patch, don't we call block_acct_setup() twice on old path
> > > > with -drive? That seems safe as block_acct_setup just assign fields of
> > > > BlockAcctStats.. But that's doesn't look good.
> > > > 
> > > hmmm
> > I don't think it's actually correct because then a value that was
> > explicitly set with -drive will by overridden by the default provided by
> > the device.
> > 
> > A possible solution would be to switch the defaults in the BlockBackend
> > initialisation back to true, and then have a ON_OFF_AUTO property in the
> > devices to allow overriding the default from -drive. With -blockdev, the
> > BlockBackend default will be hard coded to true and the options of the
> > devices will be the only way to change it.
> > 
> > > > 2. Do we really need these options? Could we instead just enable
> > > > accounting invalid and failed ops unconditionally? I doubt that someone
> > > > will learn that these new options appeared and will use them to disable
> > > > the failed/invalid accounting again.
> > > > 
> > > I can move assignment of these fields to true int
> > > block_acct_init() and forget about "configurable"
> > > items in new path. I do not think that somebody
> > > ever has these options set.
> > Well, whether anyone uses the option is a different question. I don't
> > know. But it has existed for many years.
> I have said about very small patch like the following
> 
> iris ~/src/qemu $ git diff
> diff --git a/block/accounting.c b/block/accounting.c
> index 2030851d79..c20d6ba9a0 100644
> --- a/block/accounting.c
> +++ b/block/accounting.c
> @@ -38,6 +38,8 @@ void block_acct_init(BlockAcctStats *stats)
>      if (qtest_enabled()) {
>          clock_type = QEMU_CLOCK_VIRTUAL;
>      }
> +    stats->account_invalid = true;
> +    stats->account_failed = true;
>  }

Yes, this looks good to me and we'll need it either way, even if we add
the ON_OFF_AUTO property to devices (because we need to set the right
default for 'auto').

>  void block_acct_setup(BlockAcctStats *stats, bool account_invalid,
> iris ~/src/qemu $
> 
> but your proposal with ON_OFF_AUTO will work for me too.
> 
> The real question - do we really need to publish this option
> for the external to configure it?

As I said above, I don't know if anyone uses the option.

It would be needed for full feature parity of -blockdev with -drive,
but if the option isn't used by anyone, maybe full feature parity isn't
something we even want.

> > > The real question in this patch is that this initialization
> > > was a precondition for old good "long IO" report
> > > configuration, which should be "enableable".
> > > 
> > > But  we could move this option to "tracked request"
> > > layer only and this will solve my puzzle. So, I'll move
> > > "long IO report" to tracked request level only and will
> > > create an option for it on bdrv_ level and will avoid
> > > it on blk_ accounting.
> > > 
> > > What do you think?
> > I'm not sure what you mean by "long IO report". Don't these switches
> > just change which kind of operations are counted into statistics rather
> > than changing the structure of the report?
> > 
> > Conceptually, I would like accounting on the block node level, but it's
> > not what we have been doing, so it would be a big change.
> > 
> I have to say sorry again. I have found this place once I have
> reverted to my very old series discussed here + some late
> additions on top of it done by Vladimir.
> https://lists.defectivebydesign.org/archive/html/qemu-devel/2020-07/msg03772.html

Oh, we never merged this upstream it seems?

> I will definitely have to come back to this later.
> 
> Den

Kevin


