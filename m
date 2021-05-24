Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350F38F2D8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:19:55 +0200 (CEST)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFBC-0000km-Cl
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llF8V-0006tY-RU
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1llF8U-0001oD-1q
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621880224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hwnmAE+4Usi8hyIek5zIc17WTkpfQ2YGrZsq9LzRzLo=;
 b=Vhfnf2IF3aIdaxsOttvnTbcpby7F+oMtaBBlA3J1tbfkMzaV/gjmaYA2osV24/8D0J3xuy
 /r6ct5M7G23EiW1XRF2++23+q94QZ2kBbMs/k4QmovEsvkjBhOKkkz7paLSNRsplcaqM40
 pVgcXYk1fE2DGkyOKQhLOIclHEQC0h8=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-5WSwH2mzO1uRJuDq7zdLdw-1; Mon, 24 May 2021 14:17:02 -0400
X-MC-Unique: 5WSwH2mzO1uRJuDq7zdLdw-1
Received: by mail-ua1-f70.google.com with SMTP id
 o4-20020ab037640000b0290218107a4549so5802195uat.14
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hwnmAE+4Usi8hyIek5zIc17WTkpfQ2YGrZsq9LzRzLo=;
 b=MrAQ5t3K2YvUvX3HBG0SPoJ3ExXwPuLoiXupA2SlaxFar1EnModtecqYMt1/0rSb4X
 ayx7fqfvL5kTHXMQSWraWMNloAFXlMB1k6kfqKWQFSyOjyjw6d0Oz1WWesGO9XrI/yAW
 n1vY586IdxIDgiD5N97yEIOck5onTGkMMifYquG88Ua3v2Bl+hqRdpxY2+RR0sOQbXMe
 itou4qPmw4knqbPxp/JMeuuJnWgjGLQN01dk9WBsZuwvRK7bvng0oiwei8tnaibJP+VL
 l6ED50OXQX2RKOCB7/k6LQKcir8zv6LmGl3AcviPGsUg5LnQcecvUhFqLD6auz3BSIRQ
 FsAw==
X-Gm-Message-State: AOAM531PdDryeBhQSATeoXrdrc99W8wlabgX25OxRkZ29LmtqbJtdmUz
 FbvoR4L1IT3cr1YBUkXfPxSx5EyNy5ds8oZ+swnpmqcIwL6EaDa7MogvcrPNlNMlWZgVMeTWkAH
 jFZL6ui+uWnwDZEGicvrvHG9jjBX8rHQ=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr21781666vsj.50.1621880222000; 
 Mon, 24 May 2021 11:17:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEegKHwgUh9dIi2l556cwLXi9dqJHestBbNMgUqYFOfLj6TVPnW4Zeg25HgPM3LGOBsReO1ghG+oUjEvPZ62s=
X-Received: by 2002:a67:c31c:: with SMTP id r28mr21781645vsj.50.1621880221798; 
 Mon, 24 May 2021 11:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210503224326.206208-1-wainersm@redhat.com>
 <20210503224326.206208-3-wainersm@redhat.com>
In-Reply-To: <20210503224326.206208-3-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 24 May 2021 15:16:35 -0300
Message-ID: <CAKJDGDY3mrL89phNku7eukrV97CGvd2TwBpQzxegjv1t74iHWA@mail.gmail.com>
Subject: Re: [PATCH 2/7] tests/acceptance: Move exec_command to ConsoleMixIn
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 3, 2021 at 7:43 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> This moved exec_command() to ConsoleMixIn class.
>
> Only the multiprocess.py file were touched by that change, so its tests
> were adapted.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 22 ++++++++++------------
>  tests/acceptance/multiprocess.py          |  6 +++---
>  2 files changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 6f4e0edfa3..4d3b869765 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -114,18 +114,6 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
>      """
>      _console_interaction(test, success_message, failure_message, None, vm=vm)
>
> -def exec_command(test, command):
> -    """
> -    Send a command to a console (appending CRLF characters), while logging
> -    the content.
> -
> -    :param test: an Avocado test containing a VM.
> -    :type test: :class:`avocado_qemu.Test`
> -    :param command: the command to send
> -    :type command: str
> -    """
> -    _console_interaction(test, None, None, command + '\r')
> -
>  def exec_command_and_wait_for_pattern(test, command,
>                                        success_message, failure_message=None):
>      """
> @@ -145,6 +133,16 @@ def exec_command_and_wait_for_pattern(test, command,
>  class ConsoleMixIn():
>      """Contains utilities for interacting with a guest via Console."""
>
> +    def exec_command(self, command):
> +        """
> +        Send a command to a console (appending CRLF characters), while logging
> +        the content.
> +
> +        :param command: the command to send
> +        :type command: str
> +        """
> +        _console_interaction(self, None, None, command + '\r')
> +
>      def interrupt_interactive_console_until_pattern(self, success_message,
>                                                      failure_message=None,
>                                                      interrupt_string='\r'):
> diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
> index 96627f022a..41d3e51164 100644
> --- a/tests/acceptance/multiprocess.py
> +++ b/tests/acceptance/multiprocess.py
> @@ -9,10 +9,10 @@
>
>  from avocado_qemu import Test
>  from avocado_qemu import wait_for_console_pattern
> -from avocado_qemu import exec_command
> +from avocado_qemu import ConsoleMixIn
>  from avocado_qemu import exec_command_and_wait_for_pattern
>
> -class Multiprocess(Test):
> +class Multiprocess(Test, ConsoleMixIn):

Same comment here from the previous patch regarding the order of classes.

>      """
>      :avocado: tags=multiprocess
>      """
> @@ -59,7 +59,7 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
>          self.vm.launch()
>          wait_for_console_pattern(self, 'as init process',
>                                   'Kernel panic - not syncing')
> -        exec_command(self, 'mount -t sysfs sysfs /sys')
> +        self.exec_command('mount -t sysfs sysfs /sys')
>          exec_command_and_wait_for_pattern(self,
>                                            'cat /sys/bus/pci/devices/*/uevent',
>                                            'PCI_ID=1000:0012')
> --
> 2.29.2
>


