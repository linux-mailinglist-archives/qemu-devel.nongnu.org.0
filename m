Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053DD30C4F7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:08:20 +0100 (CET)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yDz-0001aP-2S
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6xyp-0001VC-O1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:52:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6xyj-00009c-D9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Ce3l4D4cUiAS0DjmN/n6T9k+ocYAFe+ZUcrN/DatV8=;
 b=AX/aWLD6JYgymhbH3xuCVH8oyQNUmwDF/h68ynq1/j9SKWa7Nb3NDQIfO+k2mcQZlml80S
 SHg2nFgEctBhpDwUOrgdcuP2Lu7I5oz3I73gyYOU4oVqeSo0f4WFcw7dzJ9Ba+hgUHzsPt
 cCW2tN4pXwashC23Y3ClNR4MxfBdTh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-NnKmpm6hOjWtDBJVWiBKSg-1; Tue, 02 Feb 2021 10:52:28 -0500
X-MC-Unique: NnKmpm6hOjWtDBJVWiBKSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5180100A663;
 Tue,  2 Feb 2021 15:51:57 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 220A56249C;
 Tue,  2 Feb 2021 15:51:57 +0000 (UTC)
To: Peter Lieven <pl@kamp.de>, qemu-block@nongnu.org
References: <20210128140704.6547-1-pl@kamp.de>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH] qemu-img: add seek and -n option to dd command
Message-ID: <99982043-ed89-5fbe-afe2-691a9c19280d@redhat.com>
Date: Tue, 2 Feb 2021 09:51:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128140704.6547-1-pl@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 8:07 AM, Peter Lieven wrote:
> Signed-off-by: Peter Lieven <pl@kamp.de>

Your commit message says 'what', but not 'why'.  Generally, the one-line
'what' works well as the subject line, but you want the commit body to
give an argument why your patch should be applied, rather than blank.

Here's the last time we tried to improve qemu-img dd:
https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg02618.html

where I also proposed adding seek=, and fixing skip= with count=.  Your
patch does not do the latter.  But the bigger complaint back then was
that 'qemu-img copy' should be able to do everything, and that qemu-img
dd should then just be a thin shim around 'qemu-img copy', rather than
having two parallel projects that diverge in their implementations.

Your patch does not have the typical '---' divider and diffstat between
the commit message and the patch proper; this may be a factor of which
git packages you have installed, but having the diffstat present makes
it easier to see at a glance what your patch touches without reading the
entire email.  I had to go hunting to learn if you added iotest coverage
of this new feature...

...and the answer was no, you didn't.  You'll need to add that in v2
(see the link to my earlier attempt at modifying dd for an example).

> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index b615aa8419..7d4564c2b8 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -209,6 +209,10 @@ Parameters to dd subcommand:
>  
>  .. program:: qemu-img-dd
>  
> +.. option:: -n
> +
> +  Skip the creation of the output file
> +
>  .. option:: bs=BLOCK_SIZE
>  
>    Defines the block size
> @@ -229,6 +233,10 @@ Parameters to dd subcommand:
>  
>    Sets the number of input blocks to skip
>  
> +.. option:: sseek=BLOCKS

Typo: seek=

> +
> +  Sets the number of blocks to seek into the output
> +
>  Parameters to snapshot subcommand:
>  
>  .. program:: qemu-img-snapshot
> diff --git a/qemu-img.c b/qemu-img.c
> index 8597d069af..d7f390e382 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -213,12 +213,17 @@ static void QEMU_NORETURN help(void)
>             "  '-s' run in Strict mode - fail on different image size or sector allocation\n"
>             "\n"
>             "Parameters to dd subcommand:\n"
> +           "  '-n' skips the target volume creation (useful if the volume is created\n"
> +           "       prior to running qemu-img). Note that he behaviour is not identical to\n"

the

> +           "       original dd option conv=nocreat. The output is neither truncated nor\n"
> +           "       is it possible to write past the end of an existing file.\n"

and hence why you spell it -n rather than the more dd-like conv=nocreat.
 We absolutely want a different spelling to emphasize the different
behavior.

Is it worth splitting this patch in two parts, one for -n, the other for
seek=?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


