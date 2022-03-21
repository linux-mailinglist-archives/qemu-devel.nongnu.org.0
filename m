Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634BD4E2FA9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 19:09:05 +0100 (CET)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWMSm-0001Yl-1t
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 14:09:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWMRj-0000lr-OW
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:07:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWMRg-0003qe-Qf
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647886076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m8kmuwkhDFrLHldKaBQY6TYRDIZohDJzTOldLhPfHKs=;
 b=K3jt4RaFOPq1g3StmPa6LjbW/igHCQxTNySOPMNqdViVhVpgh6VAXVPyuhWDzHwRnkwpJT
 pRh39Ymy2Wb0kFNN+Ek6MwR9FA9X97JzB1lxLukaDgONjhJht0q+hQFNKFrPEq96lT59OP
 uDUVzH5uj1FxTG83K8COY10gWLMwu2Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-sZ3T-p9BPDy5NZ98kY0enQ-1; Mon, 21 Mar 2022 14:07:53 -0400
X-MC-Unique: sZ3T-p9BPDy5NZ98kY0enQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5529428035E2;
 Mon, 21 Mar 2022 18:07:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1F1403D178;
 Mon, 21 Mar 2022 18:07:52 +0000 (UTC)
Date: Mon, 21 Mar 2022 13:07:51 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 12/15] iotests/migration-permissions: use assertRaises()
 for qemu_io() negative test
Message-ID: <20220321180751.75zixieer72aahcw@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-13-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220318203655.676907-13-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 04:36:52PM -0400, John Snow wrote:
> Modify this test to use assertRaises for its negative testing of
> qemu_io. If the exception raised does not match the one we tell it to
> expect, we get *that* exception unhandled. If we get no exception, we
> get a unittest assertion failure and the provided emsg printed to
> screen.
> 
> If we get the CalledProcessError exception but the output is not what we
> expect, we re-raise the original CalledProcessError.
> 
> Tidy.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  .../qemu-iotests/tests/migration-permissions  | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)

The 11/15 patch is also included in my R-b of the squashed patch.

For this patch, it's a wash on lines of code, but certainly a more
robust test now than with the hack of the fixup patch 11/15.

> 
> diff --git a/tests/qemu-iotests/tests/migration-permissions b/tests/qemu-iotests/tests/migration-permissions
> index c7afb1bd2c..4e1da369c9 100755
> --- a/tests/qemu-iotests/tests/migration-permissions
> +++ b/tests/qemu-iotests/tests/migration-permissions
> @@ -18,6 +18,8 @@
>  #
>  
>  import os
> +from subprocess import CalledProcessError
> +
>  import iotests
>  from iotests import imgfmt, qemu_img_create, qemu_io
>  
> @@ -69,13 +71,12 @@ class TestMigrationPermissions(iotests.QMPTestCase):
>      def test_post_migration_permissions(self):
>          # Try to access the image R/W, which should fail because virtio-blk
>          # has not been configured with share-rw=on
> -        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img, check=False).stdout
> -        if not log.strip():
> -            print('ERROR (pre-migration): qemu-io should not be able to '
> -                  'access this image, but it reported no error')
> -        else:
> -            # This is the expected output
> -            assert 'Is another process using the image' in log
> +        emsg = ('ERROR (pre-migration): qemu-io should not be able to '
> +                'access this image, but it reported no error')
> +        with self.assertRaises(CalledProcessError, msg=emsg) as ctx:
> +            qemu_io('-f', imgfmt, '-c', 'quit', test_img)
> +        if 'Is another process using the image' not in ctx.exception.stdout:

Wait a minute - is 'ctx' still in scope after the 'with ... as ctx:'
with scope ends?  Python continues to surprise me.

> +            raise ctx.exception
>  
>          # Now migrate the VM
>          self.vm_s.qmp('migrate', uri=f'unix:{mig_sock}')
> @@ -84,13 +85,12 @@ class TestMigrationPermissions(iotests.QMPTestCase):
>  
>          # Try the same qemu-io access again, verifying that the WRITE
>          # permission remains unshared
> -        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img, check=False).stdout
> -        if not log.strip():
> -            print('ERROR (post-migration): qemu-io should not be able to '
> -                  'access this image, but it reported no error')
> -        else:
> -            # This is the expected output
> -            assert 'Is another process using the image' in log
> +        emsg = ('ERROR (post-migration): qemu-io should not be able to '
> +                'access this image, but it reported no error')
> +        with self.assertRaises(CalledProcessError, msg=emsg) as ctx:
> +            qemu_io('-f', imgfmt, '-c', 'quit', test_img)
> +        if 'Is another process using the image' not in ctx.exception.stdout:
> +            raise ctx.exception

The cover letter didn't mention a Based-on: tag, and so my first
attempt to reproduce this hit a rebase error on 5/15 followed by
'./check -raw migration-permissions' on this patch failing with:

+Traceback (most recent call last):
+  File "/home/eblake/qemu/tests/qemu-iotests/tests/migration-permissions", line 77, in test_post_migration_permissions
+    qemu_io('-f', imgfmt, '-c', 'quit', test_img)
+  File "/home/eblake/qemu/tests/qemu-iotests/iotests.py", line 334, in qemu_io
+    return qemu_tool(*qemu_io_wrap_args(args),
+  File "/home/eblake/qemu/tests/qemu-iotests/iotests.py", line 249, in qemu_tool
+    raise VerboseProcessError(
+NameError: name 'VerboseProcessError' is not defined

so it's pretty obvious I didn't apply the pre-requisite patch that
introduced VerboseProcessError in order to fix qemu_img() first.  But
with more churn on my end (applying your v4 qemu_img series first), it
looks like accessing ctx.exception after the with clause ends (even
though the with clause is what brought ctx into existance) works, so:

Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


