Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD86A4B9309
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 22:14:57 +0100 (CET)
Received: from localhost ([::1]:42654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKRdY-0005Ls-Lf
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 16:14:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nKRcM-0003SF-JD
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 16:13:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nKRcH-0004Ki-6w
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 16:13:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645046014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CNvRko9CHo/Psk/DWoFavyrmMQgy7Vs4RhFZyMHTD/4=;
 b=I3Kg2CGNKsDa8ut1AsTSUJd34qC86jP42t8fqjpK2Q7VjCnqTLNgZ/0VO2ZBm6sa02mIWu
 FdeKYw6Yj9876wOCTl2lDd+DEM4IRR71rRD8Te93s/pd6y3Fo7PJ55QC0lCaBT9v59Cywa
 eq9N2LRCyF60BfLbInnE2dv4w2lDGJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-zVNQkvwwOsiBcb_qjjeGVw-1; Wed, 16 Feb 2022 16:13:28 -0500
X-MC-Unique: zVNQkvwwOsiBcb_qjjeGVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 771051006AA0;
 Wed, 16 Feb 2022 21:13:27 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33163E2D0;
 Wed, 16 Feb 2022 21:13:08 +0000 (UTC)
Date: Wed, 16 Feb 2022 15:13:06 -0600
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] tests/qemu-iotests: Rework the checks and spots using
 GNU sed
Message-ID: <20220216211306.cbsj7q3t6gk53iup@redhat.com>
References: <20220216125454.465041-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216125454.465041-1-thuth@redhat.com>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 01:54:54PM +0100, Thomas Huth wrote:
> Instead of failing the iotests if GNU sed is not available (or skipping
> them completely in the check-block.sh script), it would be better to
> simply skip the bash-based tests that rely on GNU sed, so that the other
> tests could still be run. Thus we now explicitely use "gsed" (either as
> direct program or as a wrapper around "sed" if it's the GNU version)
> in the spots that rely on the GNU sed behavior. Statements that use the
> "-r" parameter of sed have been switched to use "-E" instead, since this
> switch is supported by all sed versions on our supported build hosts
> (most also support "-r", but macOS' sed only supports "-E"). With all
> these changes in place, we then can also remove the sed checks from the
> check-block.sh script, so that "make check-block" can now be run on
> systems without GNU sed, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  I've checked that this still works fine with "make vm-build-freebsd",
>  "make vm-build-netbsd" and "make vm-build-openbsd" and the Cirrus-CI
>  macOS tasks.
> 
>  tests/check-block.sh             | 12 ------
>  tests/qemu-iotests/271           |  2 +-
>  tests/qemu-iotests/common.filter | 65 ++++++++++++++++----------------
>  tests/qemu-iotests/common.rc     | 45 +++++++++++-----------
>  4 files changed, 57 insertions(+), 67 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


