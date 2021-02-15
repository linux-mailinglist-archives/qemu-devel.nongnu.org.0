Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9097E31C439
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 00:15:18 +0100 (CET)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBn5J-00028t-KA
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 18:15:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBn4B-0001Tg-J2
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:14:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBn47-00045W-Ej
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613430842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzatACuGJT08dxTa0zpP5lxI18PbNkXGw7QeAXop7Y4=;
 b=V2NqjFXWoc119sglhvjbDAgzkCwxR0P/BaB3VosQqlTYIyv6CkzUlitu5GInBnMb+7noP9
 pYpQi8jI8efXazC7kua/lStg2+ez9fPBkIdC2zcLONm4fc/z7bH7NXWtfV290mCYWbCA32
 VIs5q6hSaM0FpuWjPnHFFlfleZ2FnF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-XotSubIvN_61pBLUVZGNEA-1; Mon, 15 Feb 2021 18:14:00 -0500
X-MC-Unique: XotSubIvN_61pBLUVZGNEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E06F801962;
 Mon, 15 Feb 2021 23:13:59 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7C7D1F0;
 Mon, 15 Feb 2021 23:13:53 +0000 (UTC)
Subject: Re: [PATCH 3/6] Acceptance Tests: use the job work directory for
 created VMs
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-4-crosa@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <fdddac6f-3da2-d9e3-ac8f-7b0ab6d52b47@redhat.com>
Date: Mon, 15 Feb 2021 18:13:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211220146.2525771-4-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 5:01 PM, Cleber Rosa wrote:
> The QEMUMachine uses a base temporary directory for all temporary
> needs.  By setting it to the Avocado's workdir, it's possible to
> keep the temporary files during debugging sessions much more
> easily by setting the "--keep-tmp" command line option.
> 

Makes sense, kinda-sorta.

Is this a band-aid?

QEMUMachine has this gem in _post_shutdown():

         if self._temp_dir is not None:
             shutil.rmtree(self._temp_dir)
             self._temp_dir = None

we probably do want a way to adjust the deletion policy that QEMUMachine 
has. Kevin and I discussed this (extremely briefly) in January. One note 
is that the QEMU logs are read into memory when the process closes, so 
iotests et al have a chance to show you those logs on failure cases. Not 
relevant here for your purposes.

Meanwhile, we could also change the behavior of QEMUMachine, and create 
a temp dir deletion policy tunable:

(1) Always delete
(2) Never delete
(3) Delete on success (keep on failure)
(4) Delete on success and anticipated failures.

(About #4: QEMUMachine has a condition where it will not report 
AbornalShutdown if .kill() is called and the retcode is observed to be 
-SIGKILL. We treat this as a kind of success.)

These avocado tests could then just use a "never delete" policy, use the 
avocado runner's working dir, and then never worry about the cleanup.

iotests could do something similar with a temporary directory 
established by the top-level runner that we could modify the behavior of 
with --keep-files[ <on-failure|always>] or similar.

It might be time to just make this less stupidly annoying for all users 
of the library once and for all.

> Reference: https://avocado-framework.readthedocs.io/en/85.0/api/test/avocado.html#avocado.Test.workdir
> Reference: https://avocado-framework.readthedocs.io/en/85.0/config/index.html#run-keep-tmp
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index bf54e419da..b7ab836455 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -172,7 +172,8 @@ class Test(avocado.Test):
>   
>       def _new_vm(self, *args):
>           self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
> -        vm = QEMUMachine(self.qemu_bin, sock_dir=self._sd.name)
> +        vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
> +                         sock_dir=self._sd.name)
>           if args:
>               vm.add_args(*args)
>           return vm
> 

But, you know, absent all that extra work, sure:

Reviewed-by: John Snow <jsnow@redhat.com>


