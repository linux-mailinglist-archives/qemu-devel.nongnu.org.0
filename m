Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15902662784
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsDT-0000md-E0; Mon, 09 Jan 2023 08:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pEsDO-0000lg-Cq
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:29:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pEsDM-0000en-G9
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673270963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ea6gowjU6th9nzASDBvBVoNppLGwT6aF0cAsjBNbciw=;
 b=U8MpldSfSExTrQ7juRP0Q5i5qXiE2I+qVEHiVQWkIIlaGeUMV82tl1ykaUaSiWV20Xs1dl
 XcxXvD6PbWQenV0x8E+hLJ6RhEoamgns50Bq7eFqKDUeYyh5IvaQkU4xKhORvQ7G0M9Wkj
 G9vgh/ZqhhBI4FllPMArr0Na0ZCCjis=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546--2h-3FhPP06Tb5u_XLdB8A-1; Mon, 09 Jan 2023 08:29:19 -0500
X-MC-Unique: -2h-3FhPP06Tb5u_XLdB8A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CEFA85A588;
 Mon,  9 Jan 2023 13:29:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BB71492C14;
 Mon,  9 Jan 2023 13:29:17 +0000 (UTC)
Date: Mon, 9 Jan 2023 14:29:15 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: qemu-devel@nongnu.org, Michael Kropaczek <michael.kropaczek@solidigm.com>,
 qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 pkrempa@redhat.com, armbru@redhat.com
Subject: Re: [PATCH v4 0/2] hw/nvme: Support for Namespaces Management from
 guest OS
Message-ID: <Y7wWq/joPxKqHFfl@redhat.com>
References: <20221228194141.118-1-jonathan.derrick@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228194141.118-1-jonathan.derrick@linux.dev>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 28.12.2022 um 20:41 hat Jonathan Derrick geschrieben:
> Here is the approach:
> The nvme device will get new parameter:
>  - auto-ns-path, which specifies the path to the storage area where back-end
>    image and necessary config files located stored.
> 
> The virtual devices representing namespaces will be created dynamically during
> the Qemu running session following issuance of nvme create-ns and delete-ns
> commands from the guest OS. QOM classes and instances will be created utilizing
> existing configuration scheme used during Qemu's start-up. Back-end image files
> will be neither created nor deleted during Qemu's startup or running session.
> Instead a set of back-end image files and relevant config will be created by
> qemu-img tool with createns sub-command prior to Qemu's session.
> Required parameters are: -S serial number which must match serial parameter of
> qemu-system-xx -device nvme command line specification, -C total capacity, and
> optional -N that will set a maximal limit on number of allowed
> namespaces (default 256) which will be followed by path name pointing to
> storage location corresponding to auto-ns-path of qemu-system-xx -device nvme
> parameter.
> 
> Those created back-end image files will be pre-loaded during Qemu's start-up
> and then during running Qemu's session will be associated or disassociated with
> QOM namespaces virtual instances, as a result of issuing nvme create-ns or
> delete-ns commands. The associated back-end image file for relevant namespace
> will be re-sized as follows: delete-ns command will truncate image file to the
> size of 0, whereas create-ns command will re-size the image file to the size
> provided by nvme create-ns command parameters. Truncating/re-sizing is a result
> of blk_truncate() API which utilizes co-routines and should not block Qemu main
> thread while scheduling AIO operations. It is assured that all settings will
> retain over Qemu's start-ups and shutdowns. The implementation makes it
> possible to combine the existing "Additional Namespace" implementation with the
> new "Managed Namespaces". Those will coexist with obvious restrictions, like
> both will share the same NsIds space, "static" namespaces cannot be deleted or
> if its NsId specified at Qemu's command line will conflicts with previously
> created one by nvme create-ns (and retained), this will lead to an abort of
> Qemu at its start up.

This looks like a valid approach for a proof of concept, but from a
backend perspective, I'm concerned that this approach might be too
limiting and we won't have a good path forward.

For example, how can we integrate this with snapshots? You expect a
specific filename for the image, but taking an external snapshot means
creating an overlay image with a different name.

How do we migrate storage like this? If the management tool (probably
libvirt) knows about all the namespace images and the config file (!),
it can possibly migrate them individually, but note that while a mirror
job is active, images can't be resized any more.

What if we don't want to use a directory on the local filesystem to
store the images, but some network protocol?

It seems to me that we should define proper block layer APIs for
handling namespaces, and then we can have your implementation as one
possible image driver that supports these APIs, for which we can accept
these limitations for now. At least this would already avoid having
backend logic in the device implementation, and allow us to replace it
with something better later without having to change the design of the
device emulation code.

Eventually, I think, if we want to have dynamic namespaces properly
supported, they need to be a feature on the image format level, so that
you could keep all namespaces in a single qcow2 file.

Kevin


