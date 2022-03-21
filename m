Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3354E280A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:48:01 +0100 (CET)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIO7-0000wF-SG
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:47:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWIL1-0006IR-3Q
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:44:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWIKz-00043v-BE
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647870284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ta/dF++uooyEnuNpC/BqZ6vpCqFHinH39eqsX3BP8N0=;
 b=MDyOdxxln3Hwhxula4ROEzj1tZO/JvwopVoRJJBiqrNRr2txjGcGRO8CQzgA7tYgHG72Le
 xeeR7asiM89+GvgQCkJB7P7rUgTzbFVdP5GYmVYi3EBnRzocIrcbiNRrKiYRhkNpzZvWPV
 Iijxe07YZlU6ydMxjpbFZhqEg4tXh3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-oM8YKq5hM_GtjXgOt2SZDQ-1; Mon, 21 Mar 2022 09:44:41 -0400
X-MC-Unique: oM8YKq5hM_GtjXgOt2SZDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD3A0804183;
 Mon, 21 Mar 2022 13:44:40 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 592E82166B2D;
 Mon, 21 Mar 2022 13:44:40 +0000 (UTC)
Date: Mon, 21 Mar 2022 08:44:38 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 02/15] iotests/163: Fix broken qemu-io invocation
Message-ID: <20220321134438.6sb4x6awttkj4gth@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220318203655.676907-3-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Mar 18, 2022 at 04:36:42PM -0400, John Snow wrote:
> The 'read' commands to qemu-io were malformed, and this invocation only
> worked by coincidence because the error messages were identical. Oops.
> 
> There's no point in checking the patterning of the reference image, so
> just check the empty image by itself instead.
> 
> (Note: as of this commit, nothing actually enforces that this command
> completes successfully, but a forthcoming commit in this series will
> enforce that qemu_io() must have a zero status code.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/163 | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
> index e4cd4b230f..c94ad16f4a 100755
> --- a/tests/qemu-iotests/163
> +++ b/tests/qemu-iotests/163
> @@ -113,10 +113,7 @@ class ShrinkBaseClass(iotests.QMPTestCase):
>          qemu_img('resize',  '-f', iotests.imgfmt, '--shrink', test_img,
>                   self.shrink_size)
>  
> -        self.assertEqual(
> -            qemu_io('-c', 'read -P 0x00 %s'%self.shrink_size, test_img),
> -            qemu_io('-c', 'read -P 0x00 %s'%self.shrink_size, check_img),
> -            "Verifying image content")
> +        qemu_io('-c', f"read -P 0x00 0 {self.shrink_size}", test_img)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


