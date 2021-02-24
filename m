Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904BD3240DF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:33:56 +0100 (CET)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwAk-00045t-Qy
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lEw9T-0003UC-LJ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:32:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lEw9P-0007j4-EY
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614180749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=brvuPGV1SrosHnOXedtKg8QhtNjmSRHszz8PNbaiWnI=;
 b=BAFQ+jsAJ/EJv4ig6h3MCUHJAJ4CJsZpl2qiF6dom4Bvi1GCv5CiWWCzNTk7D9UPeQpB0f
 JC86ESukisJ1zpjrG43HaJZbUhAXMEV1EEykJxP4+B5Havvkd3YhXB8mXObalXgDFaHCje
 Kpb22GekztVnwcG4kK2wlXkcRlALdXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-MxEmbSe-P5GhRvJWTwWTqA-1; Wed, 24 Feb 2021 10:32:27 -0500
X-MC-Unique: MxEmbSe-P5GhRvJWTwWTqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F10120174A;
 Wed, 24 Feb 2021 14:58:58 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-86.rdu2.redhat.com [10.10.115.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 566805D6A8;
 Wed, 24 Feb 2021 14:58:52 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E76E822054F; Wed, 24 Feb 2021 09:58:51 -0500 (EST)
Date: Wed, 24 Feb 2021 09:58:51 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs@redhat.com
Subject: Re: [PATCH v3 0/2] virtiofsd: Enable posix_acl by default
Message-ID: <20210224145851.GC3148@redhat.com>
References: <20210223225250.23945-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223225250.23945-1-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lhenriques@suse.de, dgilbert@redhat.com, stefanha@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 05:52:48PM -0500, Vivek Goyal wrote:
> Hi,
> 
> This is V3 of the patches. Changes since v2 are.
> 
> - I dropped the patch to give user an option to enable/disable acls.
>   Now acls are enabled by default if xattrs are enabled and fuse
>   client offers FUSE_POSIX_ACL capability.
>  
> Miklos mentioned that ACLS might not have lot of overhead as these
> can be cached. So it might make sense to enable these by default.

Maybe ACL caching will only work well with cache=auto and cache=always.
With cache=none it probably will show most extra overhead.

For example, with cache=none, I did "su test". And then did "cat foo.txt"
and every time it results in two GETXATTR(system.posix_acl_access) calls.

2021-02-24 09:56:09.45-0500] [ID: 00000004] lo_getxattr(ino=1, name=system.posix_acl_access size=4096)
[2021-02-24 09:56:09.45-0500] [ID: 00000004] lo_getxattr(ino=2, name=system.posix_acl_access size=4096)

So this will definitely impact the performance with cache=none negatively.

I am now inclined to respin the patches and add options to enable/disable
acl and keep acl disabled by default. Those who need it, can enable it.

Vivek

> 
> If we run into performance issues, then we can add another patch to
> give option to enable/disable and disable it by default.
> 
> Luis Henriques reported that fstest generic/099 fails with virtiofs.
> Little debugging showed that we don't enable acl support. This
> patch series should fix the issue
> 
> Vivek Goyal (2):
>   virtiofsd: Add umask to seccom allow list
>   virtiofsd: Enable posix_acls by default if xattrs are enabled
> 
>  tools/virtiofsd/passthrough_ll.c      | 29 +++++++++++++++++++++------
>  tools/virtiofsd/passthrough_seccomp.c |  1 +
>  2 files changed, 24 insertions(+), 6 deletions(-)
> 
> -- 
> 2.25.4
> 


