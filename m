Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825684CD676
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:31:44 +0100 (CET)
Received: from localhost ([::1]:42334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8y7-00079v-GI
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:31:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ8Cb-00064L-HX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ8Ca-0001JW-2C
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kn0IKh744fvmpBg658av060X4hxwm7Z9U2iuyfhxp38=;
 b=Ymkr8DKTh1utqs/3X6UcBpx+5AVLP9AFZ9pVQFN5jOZPL2yZKn5BmlYzbAdy/E1rXhP4Kc
 xCFFhstKmrJ8omi8CWLvUW0NdxYVhhapUz1I+cRenbyEEa4V5Y6Qi/eLdwsoegK2Y+bDLJ
 6iUqnfd8nET2NsvIq+272tGfopslICU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-piGADg5rMD2bXMdmPDo9RA-1; Fri, 04 Mar 2022 08:42:32 -0500
X-MC-Unique: piGADg5rMD2bXMdmPDo9RA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 274B4824FA7;
 Fri,  4 Mar 2022 13:42:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E632C7ADAE;
 Fri,  4 Mar 2022 13:42:25 +0000 (UTC)
Date: Fri, 4 Mar 2022 14:42:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] tests/qemu-iotests: Rework the checks and spots using
 GNU sed
Message-ID: <YiIXQKPw2GLMU+N8@redhat.com>
References: <20220216125454.465041-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216125454.465041-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.02.2022 um 13:54 hat Thomas Huth geschrieben:
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

Thanks, applied to the block branch.

Kevin


