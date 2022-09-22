Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7535E6A96
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:21:32 +0200 (CEST)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQpC-0006hm-01
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obP1g-00088W-1g
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obP1c-0005QH-Kv
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663863966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ZQ2V5O99s7MFeAqka+Od8n2KtYRjS6+6lNOx0RCA+U=;
 b=fnFtuV0bHdb9vKnKRe5llWL8xA3le9Z5TPlBlqFvVdO3z2H3nQiws5tEIey0ZmmbjKZYjX
 c0MNiuoRwurArnWlkRleInmcRNaVxonYFWCCWzggAwgT6wB9ZvZEog1ScAWSIdKG8b5u4M
 JCaODIeFyP1J/v+mhf2nJfGo5462Rik=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-LS2g6ROxMpmUURQJkJyX8w-1; Thu, 22 Sep 2022 12:26:03 -0400
X-MC-Unique: LS2g6ROxMpmUURQJkJyX8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F29B91C09042;
 Thu, 22 Sep 2022 16:26:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F5D040C6EC2;
 Thu, 22 Sep 2022 16:26:02 +0000 (UTC)
Date: Thu, 22 Sep 2022 18:26:01 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/3] block: Keep auto_backing_file post-migration
Message-ID: <YyyMmav0Uej72Up1@redhat.com>
References: <20220803144446.20723-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220803144446.20723-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.08.2022 um 16:44 hat Hanna Reitz geschrieben:
> Hi,
> 
> https://gitlab.com/qemu-project/qemu/-/issues/1117 reports the following
> issue:
> 
> Say you have a VM with a backing chain of images where the image
> metadata contains json:{} backing file strings, which however will be
> resolved to simple plain filenames when opened[1].
> 
> So when these images are opened, bs->auto_backing_file is first read
> directly from the image header, and will thus contain a json:{}
> filename.  The backing image is opened based off of this filename, and
> bdrv_refresh_filename() simplfies the filename as shown[1].  We then
> update bs->auto_backing_file from bs->backing->bs->filename, so both are
> equal.
> 
> It is quite important that both are equal, because
> bdrv_backing_overridden() checks whether the backing file has been
> changed from the default by comparing bs->auto_backing_file to
> bs->backing->bs->filename.
> 
> Because we did set bs->auto_backing_file from bs->backing->bs->filename,
> both are equal, the backing file is not considered overridden, and
> bdrv_refresh_filename(bs) will not consider it necessary to generate a
> json:{} filename for the overlay.
> 
> Then the VM is migrated.
> 
> The destination side invokes bdrv_invalidate_cache(), which by qcow2 and
> qed is implemented by closing the image and opening it.  This re-reads
> the backing file string from disk, resetting bs->auto_backing_file.
> Now, it will contains the json:{} filename again and thus differ from
> bs->backing->bs->filename.
> 
> Consequentially, a subsequent bdrv_refresh_filename(bs) will find that
> the overlay’s backing file has been overridden and generate a json:{}
> filename, which isn’t great.
> 
> This series fixes that by having qcow2’s and qed’s image-open operations
> not overwrite bs->auto_backing_file unless something has changed since
> the last time we read the backing filename from the metadata.
> 
> 
> Now, generating a json:{} filename can be a nuisance but shouldn’t be a
> real problem.  The actual problem reported in 1117 comes later, namely
> when creating a snapshot overlay post-migration.  This overlay image
> will have a json:{} backing filename in its image metadata, which
> contains a 'backing' key[2].
> 
> 'qemu-img info' uses the BDRV_O_NO_BACKING flag to open images, which
> conflicts with those backing options: With that flag, nobody processes
> those options, and that’s an error.  Therefore, you can’t run 'qemu-img
> info --backing-chain' on that overlay image.
> 
> That part of the issue is not fixed in this series, however.  I’ll send
> a separate RFC series for it, because I’m honstly not quite certain how
> it should be fixed.
> 
> 
> [1] Example:
>         json:{"driver": "qcow2",
>               "file": {"driver": "file", "filename": "img.qcow2"}}
>     Will generally be “resolved” by bdrv_refresh_filename() to
>         "img.qcow2"
> 
> [2] That it contains a 'backing' key is only natural, because the reason
>     why bdrv_refresh_filename() decided to generate a json:{} filename
>     for the image is because it considered the backing file overridden.
>     Hence it must put the actual backing file options into a 'backing'
>     object in the json:{} filename.
> 
> 
> Hanna Reitz (3):
>   block/qcow2: Keep auto_backing_file if possible
>   block/qed: Keep auto_backing_file if possible
>   iotests/backing-file-invalidation: Add new test

Thanks, applied to the block branch.

Kevin


