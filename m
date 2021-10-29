Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76AE440473
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:56:17 +0200 (CEST)
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYvA-0002wX-Ru
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgYja-0004TJ-1q
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 16:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgYjW-0002Lh-KH
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 16:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635540253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l2d72+vgyYCZ1XSxK2vdAGa87Y7rw7GJ0KQomShvCCs=;
 b=QVtoh9aZ1e+pwK15lPVrFYQNmBIFKhmpet9lSZWDngLz3igM8s7ftu8XXx5SGEBr/XaTCr
 qPuaNT14A4vimRLxeQ2/okoxKdH/Ny0Dq58Z9rqzBTSfJrvYtNYEBMny/LtG9pg836TwJ/
 B2hNavA/YKxaWCv/L/Iid7Qd985E6ZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368--IY4L6rJO5KtGI4cu9btGA-1; Fri, 29 Oct 2021 16:44:10 -0400
X-MC-Unique: -IY4L6rJO5KtGI4cu9btGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4F88362F9;
 Fri, 29 Oct 2021 20:44:09 +0000 (UTC)
Received: from redhat.com (ovpn-112-232.phx2.redhat.com [10.3.112.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AC26100EBAD;
 Fri, 29 Oct 2021 20:44:08 +0000 (UTC)
Date: Fri, 29 Oct 2021 15:44:02 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 3/4] qemu-img: add --shallow option for qemu-img compare
Message-ID: <20211029204402.flo6xeps4pexlujg@redhat.com>
References: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
 <20211028102441.1878668-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211028102441.1878668-4-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20211022
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, nikita.lapshin@virtuozzo.com,
 qemu-devel@nongnu.org, nsoffer@redhat.com, hreitz@redhat.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 12:24:40PM +0200, Vladimir Sementsov-Ogievskiy wrote:
> Allow compare only top images of backing chains. This is useful to

Allow the comparison of only the top image of backing chains.

> compare images with same backing file or to compare incremental images
> from the chain of incremental backups with "--stat" option.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  docs/tools/qemu-img.rst | 9 ++++++++-
>  qemu-img.c              | 8 ++++++--
>  qemu-img-cmds.hx        | 4 ++--
>  3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index 9bfdd93d6c..c6e9306c70 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -176,6 +176,13 @@ Parameters to compare subcommand:
>      - If both files don't specify cluster-size, use default of 64K
>      - If only one file specifies cluster-size, just use that.
>  
> +.. option:: --shallow
> +
> +  This option prevents opening and comparing any backing files.
> +  This is useful to compare images with same backing file or to compare
> +  incremental images from the chain of incremental backups with
> +  ``--stat`` option.

If I understand correctly, your implementation makes --shallow an
all-or-none option (either both images are compared shallow, or
neither is).  Does it make sense to make it a per-image option
(--shallow-source, --shallow-dest), where --shallow is a synonym for
the more verbose --shallow-source --shallow-dest?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


