Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1D2FC199
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:54:25 +0100 (CET)
Received: from localhost ([::1]:44720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1y1B-00031w-0F
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1xDV-0002v9-KP
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:03:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1xDO-00053F-LU
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611086577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khsJiiDVzqhi+f3Klq5RPknJMwYgzRVFwNSG4UOmci8=;
 b=MADLq0WAhqf7xdTuprncKjAe7sK1+pci+JciqyfWIb8Np0qt9ncr1Qma9A+DweCn3MGDGk
 hwvpygOf9PcqG76RTnUYVZHEeaS9BA0vYBfUUFIyeQBjmnOIM5IkGPOT3Rph448COGIK0n
 3fyGTCn2rTYlJBN4oGiKVvGj60wzMLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-4Ulrpz7FPWWps1QUr5_3XQ-1; Tue, 19 Jan 2021 15:02:52 -0500
X-MC-Unique: 4Ulrpz7FPWWps1QUr5_3XQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1C16427C2;
 Tue, 19 Jan 2021 20:02:51 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41A149935;
 Tue, 19 Jan 2021 20:02:51 +0000 (UTC)
Subject: Re: [PATCH] qmp-shell: Suppress banner and prompt when stdin is not a
 TTY
To: Dov Murik <dovmurik@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210117072742.119377-1-dovmurik@linux.vnet.ibm.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <f6b88346-9dac-2679-385c-17d4a0e245c4@redhat.com>
Date: Tue, 19 Jan 2021 15:02:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117072742.119377-1-dovmurik@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 2:27 AM, Dov Murik wrote:
> Detect whether qmp-shell's standard input is not a TTY; in such case,
> assume a non-interactive mode, which suppresses the welcome banner and
> the "(QEMU)" prompt.  This allows for easier consumption of qmp-shell's
> output in scripts.
> 
> Example usage before this change:
> 
>      $ printf "query-status\nquery-kvm\n" | sudo scripts/qmp/qmp-shell qmp-unix-sock
>      Welcome to the QMP low-level shell!
>      Connected to QEMU 5.1.50
> 
>      (QEMU) {"return": {"status": "running", "singlestep": false, "running": true}}
>      (QEMU) {"return": {"enabled": true, "present": true}}
>      (QEMU)
> 
> Example usage after this change:
> 
>      $ printf "query-status\nquery-kvm\n" | sudo scripts/qmp/qmp-shell qmp-unix-sock
>      {"return": {"status": "running", "singlestep": false, "running": true}}
>      {"return": {"enabled": true, "present": true}}
> 
> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>

Hiya! I've been taking lead on modernizing a lot of our python 
infrastructure, including our QMP library and qmp-shell.

(Sorry, not in MAINTAINERS yet; but I am in the process of moving these 
scripts and tools over to ./python/qemu/qmp.)

This change makes me nervous, because qmp-shell is not traditionally a 
component we've thought of as needing to preserve backwards-compatible 
behavior. Using it as a script meant to be consumed in a headless 
fashion runs a bit counter to that assumption.

I'd be less nervous if the syntax of qmp-shell was something that was 
well thought-out and rigorously tested, but it's a hodge-podge of 
whatever people needed at the moment. I am *very* reluctant to cement it.

Are you trying to leverage the qmp.py library from bash?

--js

> ---
> 
> Notes:
>      Note that this might be considered a breaking change; if users have
>      automated scripts which assume that qmp-shell prints 3 lines of banner,
>      this change will break their scripts.  If there are special
>      considerations/procedures for breaking changes, please let me know.
>      
>      The rationale behaind the TTY check is to imitate python's behaviour:
>      
>          $ python3
>          Python 3.7.5 (default, Apr 19 2020, 20:18:17)
>          [GCC 9.2.1 20191008] on linux
>          Type "help", "copyright", "credits" or "license" for more information.
>          >>> print(19+23)
>          42
>          >>>
>      
>          $ echo 'print(19+23)' | python3
>          42
> 
>   scripts/qmp/qmp-shell | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
> index b4d06096ab..9336066fa8 100755
> --- a/scripts/qmp/qmp-shell
> +++ b/scripts/qmp/qmp-shell
> @@ -288,6 +288,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>           self.__completer_setup()
>   
>       def show_banner(self, msg='Welcome to the QMP low-level shell!'):
> +        if not self._interactive:
> +            return
>           print(msg)
>           if not self._greeting:
>               print('Connected')
> @@ -300,6 +302,15 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>               return "TRANS> "
>           return "(QEMU) "
>   
> +    def read_command(self, prompt):
> +        if self._interactive:
> +            return input(prompt)
> +        else:
> +            line = sys.stdin.readline()
> +            if not line:
> +                raise EOFError
> +            return line
> +
>       def read_exec_command(self, prompt):
>           """
>           Read and execute a command.
> @@ -307,7 +318,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>           @return True if execution was ok, return False if disconnected.
>           """
>           try:
> -            cmdline = input(prompt)
> +            cmdline = self.read_command(prompt)
>           except EOFError:
>               print()
>               return False
> @@ -322,6 +333,9 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>       def set_verbosity(self, verbose):
>           self._verbose = verbose
>   
> +    def set_interactive(self, interactive):
> +        self._interactive = interactive
> +
>   class HMPShell(QMPShell):
>       def __init__(self, address):
>           QMPShell.__init__(self, address)
> @@ -449,8 +463,9 @@ def main():
>       except qemu.error:
>           die('Could not connect to %s' % addr)
>   
> -    qemu.show_banner()
>       qemu.set_verbosity(verbose)
> +    qemu.set_interactive(sys.stdin.isatty())
> +    qemu.show_banner()
>       while qemu.read_exec_command(qemu.get_prompt()):
>           pass
>       qemu.close()
> 


