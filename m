Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E620A4B7AD8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:57:34 +0100 (CET)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6lJ-0004AO-L9
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:57:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK6j6-0003Fk-L4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:55:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK6j3-0005Ia-B1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644965711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJWFLkadVXNvVmU/4eT3OqlvclBHzanc4rW/+yfD6Zw=;
 b=MLRvTH9ZxBCi/FutI1fqK3stO6kWeotQj/l/1BBzp3Yg1YC9VzYOnOfKk9P2/VB86vdzYi
 ikCCGfOS53dtjGRj0t/IqRxI9Yqlb7W+xHZLZV7QmU4B71u6PHAutae0BLROeHYl/oGD2L
 4y0frn0Zop9Ky7u0BYVhAFfvmHNNRxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-1_N_xh_tPl6Q0rLsi52NkA-1; Tue, 15 Feb 2022 17:55:07 -0500
X-MC-Unique: 1_N_xh_tPl6Q0rLsi52NkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A9E51853020;
 Tue, 15 Feb 2022 22:55:06 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C88B105B1EE;
 Tue, 15 Feb 2022 22:55:04 +0000 (UTC)
Date: Tue, 15 Feb 2022 16:55:02 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/4] python/utils: add enboxify() text decoration utility
Message-ID: <20220215225502.uuqqjkbbhqwuajn2@redhat.com>
References: <20220215220853.4179173-1-jsnow@redhat.com>
 <20220215220853.4179173-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215220853.4179173-2-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 05:08:50PM -0500, John Snow wrote:
> >>> print(enboxify(msg, width=72, name="commit message"))
> ┏━ commit message ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
> ┃ enboxify() takes a chunk of text and wraps it in a text art box that ┃
> ┃  adheres to a specified width. An optional title label may be given, ┃
> ┃  and any of the individual glyphs used to draw the box may be        ┃

Why do these two lines have a leading space,

> ┃ replaced or specified as well.                                       ┃

but this one doesn't?  It must be an off-by-one corner case when your
choice of space to wrap on is exactly at the wrap column.

> ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/utils/__init__.py | 58 +++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
> index 7f1a5138c4b..f785316f230 100644
> --- a/python/qemu/utils/__init__.py
> +++ b/python/qemu/utils/__init__.py
> @@ -15,7 +15,10 @@
>  # the COPYING file in the top-level directory.
>  #
>  
> +import os
>  import re
> +import shutil
> +import textwrap
>  from typing import Optional
>  
>  # pylint: disable=import-error
> @@ -23,6 +26,7 @@
>  
>  
>  __all__ = (
> +    'enboxify',
>      'get_info_usernet_hostfwd_port',
>      'kvm_available',
>      'list_accel',
> @@ -43,3 +47,57 @@ def get_info_usernet_hostfwd_port(info_usernet_output: str) -> Optional[int]:
>          if match is not None:
>              return int(match[1])
>      return None
> +
> +
> +# pylint: disable=too-many-arguments
> +def enboxify(
> +        content: str = '',
> +        width: Optional[int] = None,
> +        name: Optional[str] = None,
> +        padding: int = 1,
> +        upper_left: str = '┏',
> +        upper_right: str = '┓',
> +        lower_left: str = '┗',
> +        lower_right: str = '┛',
> +        horizontal: str = '━',
> +        vertical: str = '┃',
> +) -> str:
> +    """
> +    Wrap some text into a text art box of a given width.
> +
> +    :param content: The text to wrap into a box.
> +    :param width: The number of columns (including the box itself).
> +    :param name: A label to apply to the upper-left of the box.
> +    :param padding: How many columns of padding to apply inside.
> +    """

Where's theh :param docs for the 6 custom glyphs?

> +    if width is None:
> +        width = shutil.get_terminal_size()[0]
> +    prefix = vertical + (' ' * padding)
> +    suffix = (' ' * padding) + vertical
> +    lwidth = width - len(suffix)
> +
> +    def _bar(name: Optional[str], top: bool = True) -> str:
> +        ret = upper_left if top else lower_left
> +        right = upper_right if top else lower_right
> +        if name is not None:
> +            ret += f"{horizontal} {name} "
> +
> +        assert width is not None
> +        filler_len = width - len(ret) - len(right)
> +        ret += f"{horizontal * filler_len}{right}"
> +        return ret
> +
> +    def _wrap(line: str) -> str:
> +        return os.linesep.join([
> +            wrapped_line.ljust(lwidth) + suffix
> +            for wrapped_line in textwrap.wrap(
> +                    line, width=lwidth, initial_indent=prefix,
> +                    subsequent_indent=prefix, replace_whitespace=False,
> +                    drop_whitespace=False, break_on_hyphens=False)

Always nice when someone else has written the cool library function to
do all the hard work for you ;)  But this is probably where you have the off-by-one I called out above.

> +        ])
> +
> +    return os.linesep.join((
> +        _bar(name, top=True),
> +        os.linesep.join(_wrap(line) for line in content.splitlines()),
> +        _bar(None, top=False),
> +    ))
> -- 
> 2.34.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


