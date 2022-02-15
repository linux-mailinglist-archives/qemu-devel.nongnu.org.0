Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FAF4B7B0B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 00:11:40 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6yw-0003od-Ut
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 18:11:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK6wt-0002t0-MX
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 18:09:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK6wr-0007Hk-S2
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 18:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644966569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8k3PPj3ywua7rt9iNdPdO+J2UnJv77HFpQPDP+RiG78=;
 b=RM/2P5F/yvF26NlWmucwTaqUV4RsDrjJZdUvpbhTNLQdShn4117rrQ3O9wimIb3J3xNUfy
 KOZnU9l2DZsLgWetAO2byUfozUOkILWKtgRIgXKhmumsvF0Qb3VuIRNdSJpwzjIm9Cnhs9
 7MWKWqLxRBNYchqfjUCxBH3IfyF4V/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-jVz2FDLMNnOLMh5dxMb1vA-1; Tue, 15 Feb 2022 18:09:27 -0500
X-MC-Unique: jVz2FDLMNnOLMh5dxMb1vA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E6221091DA4;
 Tue, 15 Feb 2022 23:09:26 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A14F95DB9C;
 Tue, 15 Feb 2022 23:09:11 +0000 (UTC)
Date: Tue, 15 Feb 2022 17:09:09 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 4/4] iotests: make qemu_img raise on non-zero rc by default
Message-ID: <20220215230909.qaih2j2mu5au4ys6@redhat.com>
References: <20220215220853.4179173-1-jsnow@redhat.com>
 <20220215220853.4179173-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215220853.4179173-5-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 05:08:53PM -0500, John Snow wrote:
> re-configure qemu_img() into a function that will by default raise a
> VerboseProcessException (extended from CalledProcessException) on
> non-zero return codes. This will produce a stack trace that will show
> the command line arguments and return code from the failed process run.
> 
> Users that want something more flexible (There appears to be only one)

s/There/there/

> can use check=False and manage the return themselves.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/257        |  8 ++++--
>  tests/qemu-iotests/iotests.py | 53 +++++++++++++++++++++++++++++++----
>  2 files changed, 53 insertions(+), 8 deletions(-)
> 

> +def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
> +             ) -> subprocess.CompletedProcess[str]:
> +    """
> +    Run qemu_img, returning a CompletedProcess instance.
> +
> +    The CompletedProcess object has args, returncode, and output properties.
> +    If streams are not combined, It will also have stdout/stderr properties.

s/It/it/

> +
> +    :param args: command-line arguments to qemu_img.
> +    :param check: set to False to suppress VerboseProcessError.
> +    :param combine_stdio: set to False to keep stdout/stderr separated.
> +
> +    :raise VerboseProcessError:
> +        On non-zero exit code, when 'check=True' was provided. This
> +        exception has 'stderr', 'stdout' and 'returncode' properties
> +        that may be inspected to show greater detail. If this exception
> +        is not handled, The command-line, return code, and all console

s/The/the/

> +        output will be included at the bottom of the stack trace.
> +    """

> @@ -469,8 +511,9 @@ def qemu_nbd_popen(*args):
>  
>  def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
>      '''Return True if two image files are identical'''
> -    return qemu_img('compare', '-f', fmt1,
> -                    '-F', fmt2, img1, img2) == 0
> +    res = qemu_img('compare', '-f', fmt1,
> +                   '-F', fmt2, img1, img2, check=False)
> +    return res.returncode == 0

Not sure why there was so much Mid-sentence capitalization ;)

Seems useful, although it is at the limits of my python review skills,
so this is a weak:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


