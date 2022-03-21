Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A404E2B99
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:15:14 +0100 (CET)
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJkX-0006fk-5F
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:15:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWJij-0005qA-1w
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWJid-0000Lo-N6
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647875592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V4qKu18LeZtWEuvqFXXiNAmfjcsTZdaTsTOExxNCkUk=;
 b=afNc3DIK0lLwJmNXLPVo+23pe7LYNLfiQsIgaWwbiJ+4xhGwuAhEwT9T81XDuUdypDvxRf
 1mvZWKNy6PW3XziLYWMuqChDidH3FYgRWMvei3hZY3frVZOyr2XEwoyHtsOPJquXqNFOrH
 vBN+f6SOz6MpPQjkWJ7L8kzmOFh8y1U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-Su6feSxmMue8hg5Aj4FURg-1; Mon, 21 Mar 2022 11:13:09 -0400
X-MC-Unique: Su6feSxmMue8hg5Aj4FURg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F8273C14CC5;
 Mon, 21 Mar 2022 15:13:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA4671121319;
 Mon, 21 Mar 2022 15:13:08 +0000 (UTC)
Date: Mon, 21 Mar 2022 10:13:07 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 05/15] iotests: create generic qemu_tool() function
Message-ID: <20220321151307.mvf4zob2sr4fqobq@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220318203655.676907-6-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 18, 2022 at 04:36:45PM -0400, John Snow wrote:
> reimplement qemu_img() in terms of qemu_tool() in preparation for doing
> the same with qemu_io().
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 37 +++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 6cd8374c81..974a2b0c8d 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -207,15 +207,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
>  
>      return result
>  
> -def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
> +
> +def qemu_tool(*args: str, check: bool = True, combine_stdio: bool = True
>               ) -> subprocess.CompletedProcess[str]:

Does this line need reindentation?

> @@ -227,14 +225,13 @@ def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
>          handled, the command-line, return code, and all console output
>          will be included at the bottom of the stack trace.
>  
> -    :return: a CompletedProcess. This object has args, returncode, and
> -        stdout properties. If streams are not combined, it will also
> -        have a stderr property.
> +    :return:
> +        A CompletedProcess. This object has args, returncode, and stdout
> +        properties. If streams are not combined, it will also have a
> +        stderr property.

Should this reflow be squashed in some earlier patch?

As those are both cosemetic only,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


