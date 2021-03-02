Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC16832A44C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:39:19 +0100 (CET)
Received: from localhost ([::1]:44960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH77G-0004oB-Ux
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lH76O-0004ML-16
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:38:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lH76L-0001pX-PB
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614699500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cbcYB1CXPQAwoO3yGxHAoP6KCeBIQgUN+9jz69hFSwA=;
 b=PPWpwS+idB5B3xm57Y3TkCtdpqnW8eERmsb527Vdzr8PAOchFV3+mv5FdBlSLMWYTYkmqw
 4XpH6+Sf2+KPDOfgQA2ejP4Th645o+n4a5hCdRZZSN5oXCUx/N+ruehx/tgMzaPwdJkyjP
 WtiLkvM9HeGZMFlzSixj/1GKWbPUJiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-gVMHllDJOgGplOHQSPziKQ-1; Tue, 02 Mar 2021 10:38:18 -0500
X-MC-Unique: gVMHllDJOgGplOHQSPziKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8E5A80196C;
 Tue,  2 Mar 2021 15:38:17 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DE3919D6C;
 Tue,  2 Mar 2021 15:38:05 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] avocado_qemu: add exec_command function
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210225205907.223995-1-willianr@redhat.com>
 <20210225205907.223995-2-willianr@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <73aeddc8-7b60-a935-b58d-faf5354247b1@redhat.com>
Date: Tue, 2 Mar 2021 12:38:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225205907.223995-2-willianr@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/25/21 5:59 PM, Willian Rampazzo wrote:
> Sometimes a test needs to send a command to a console without waiting
> for a pattern as a result, or the command issued do not produce any kind
> of output, like, for example, a `mount` command.
>
> This introduces the `exec_command` function to the avocado_qemu,
> allowing the test to send a command to the console without the need to
> match a pattern produced as a result.
>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index df167b142c..6ea94cc721 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -93,7 +93,7 @@ def _console_interaction(test, success_message, failure_message,
>           if not msg:
>               continue
>           console_logger.debug(msg)
> -        if success_message in msg:
> +        if success_message is None or success_message in msg:
>               break
>           if failure_message and failure_message in msg:
>               console.close()
> @@ -139,6 +139,17 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
>       """
>       _console_interaction(test, success_message, failure_message, None, vm=vm)
>   
> +def exec_command(test, command):
> +    """
> +    Send a command to a console (appending CRLF characters), while logging
> +    the content.
> +
> +    :param test: an Avocado test containing a VM.
> +    :type test: :class:`avocado_qemu.Test`
> +    :param command: the command to send

It's missing the command type. With that:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

> +    """
> +    _console_interaction(test, None, None, command + '\r')
> +
>   def exec_command_and_wait_for_pattern(test, command,
>                                         success_message, failure_message=None):
>       """


