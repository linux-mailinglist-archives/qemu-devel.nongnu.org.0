Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419431019A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 01:27:31 +0100 (CET)
Received: from localhost ([::1]:42004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7oyA-00035K-Mx
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 19:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7owt-0002EW-2u
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 19:26:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7owp-0008R7-WE
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 19:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612484765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vArOK9+QkMcn1aI+aSlLI5LvZ1z+Xpw9LUyBfdDNsJ0=;
 b=hkER5+Yi/tiODmYWZWLF8+zKz9fc3qu4b4Nde70fRoQooTCXkjFnbFTAxffezf0uEP2pXx
 IMpAY1biF8VOvvV7L+VWLrh44pvFOBbDx7RsPffqXvbdxuwtYVTXI0ejlsFrKRG9/3pxoy
 M5vHkQHqjjT2bxAk58nclhGKUmtbSv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-pbS3eKM4MveBN5VdbIjzAQ-1; Thu, 04 Feb 2021 19:26:02 -0500
X-MC-Unique: pbS3eKM4MveBN5VdbIjzAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD57F80196E;
 Fri,  5 Feb 2021 00:26:00 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 199D160BE2;
 Fri,  5 Feb 2021 00:25:53 +0000 (UTC)
Subject: Re: [PATCH 10/22] Python: add utility function for retrieving port
 redirection
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-11-crosa@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <98809672-6cce-cd59-74e8-8976c1fec770@redhat.com>
Date: Thu, 4 Feb 2021 19:25:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-11-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 12:23 PM, Cleber Rosa wrote:
> Slightly different versions for the same utility code are currently
> present on different locations.  This unifies them all, giving
> preference to the version from virtiofs_submounts.py, because of the
> last tweaks added to it.
> 
> While at it, this adds a "qemu.util" module to host the utility
> function and a test.
> 

qemu.utils, with the s!

And, OK, this makes me feel less weird about creating a qemu.utils 
package, actually.

ACK (but not reviewed, tested or linted) for the new code heading into 
python/qemu/.

--js

> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   python/qemu/utils.py                     | 35 ++++++++++++++++++++++++
>   tests/acceptance/info_usernet.py         | 29 ++++++++++++++++++++
>   tests/acceptance/linux_ssh_mips_malta.py | 16 +++++------
>   tests/acceptance/virtiofs_submounts.py   | 20 +++-----------
>   tests/vm/basevm.py                       |  7 ++---
>   5 files changed, 77 insertions(+), 30 deletions(-)
>   create mode 100644 python/qemu/utils.py
>   create mode 100644 tests/acceptance/info_usernet.py
> 
> diff --git a/python/qemu/utils.py b/python/qemu/utils.py
> new file mode 100644
> index 0000000000..89a246ab30
> --- /dev/null
> +++ b/python/qemu/utils.py
> @@ -0,0 +1,35 @@
> +"""
> +QEMU utility library
> +
> +This offers miscellaneous utility functions, which may not be easily
> +distinguishable or numerous to be in their own module.
> +"""
> +
> +# Copyright (C) 2021 Red Hat Inc.
> +#
> +# Authors:
> +#  Cleber Rosa <crosa@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +
> +import re
> +from typing import Optional
> +
> +
> +def get_info_usernet_hostfwd_port(info_usernet_output: str) -> Optional[int]:
> +    """
> +    Returns the port given to the hostfwd parameter via info usernet
> +
> +    :param info_usernet_output: output generated by hmp command "info usernet"
> +    :param info_usernet_output: str
> +    :return: the port number allocated by the hostfwd option
> +    :rtype: int

We can probably delete the :rtype: field, can't we? Annotations should 
handle this information now.

(Unless some tool needs it for compatibility reasons, but we don't use 
this field anywhere else in ./python/ yet.)


