Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B5B33F0E1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:09:53 +0100 (CET)
Received: from localhost ([::1]:60292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVvs-0005gX-N5
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMVuU-00056V-Rl
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:08:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMVuS-0003oH-HN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615986503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A48WwSoFYfHNhBMqKRae/JWJIJCGH66a0UN4/w8jjBE=;
 b=MJmtrnOz3tg3Ga433ueaSLWJQHV8vfdGy2ObZ82wxgFdRDVerknciKg9NUjHCun1MtnIyw
 Pr2kuqNY3sJFlpLQbGaMnHXxSVGfEsfqOPO4oTG+qvjsSaHcb6381Ir8E8zOD2YmircYe8
 2VQwv0y6FAiEf+OHO9sNbVMGkX1rKt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-UdwoUw_zOpqytLgIhaqiNw-1; Wed, 17 Mar 2021 09:08:21 -0400
X-MC-Unique: UdwoUw_zOpqytLgIhaqiNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD03107B783;
 Wed, 17 Mar 2021 13:08:20 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EB271045E83;
 Wed, 17 Mar 2021 13:08:11 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] tests/acceptance: Extract QemuBaseTest from Test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210315230838.2973103-1-f4bug@amsat.org>
 <20210315230838.2973103-2-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <7d97e67e-e09d-a3cd-8b54-49d7fe51fc15@redhat.com>
Date: Wed, 17 Mar 2021 10:08:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210315230838.2973103-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 3/15/21 8:08 PM, Philippe Mathieu-Daudé wrote:
> The Avocado Test::fetch_asset() is handy to download artifacts
> before running tests. The current class is named Test but only
> tests system emulation. As we want to test user emulation,
> refactor the common code as QemuBaseTest.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index df167b142cc..4f814047176 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -155,7 +155,7 @@ def exec_command_and_wait_for_pattern(test, command,
>       """
>       _console_interaction(test, success_message, failure_message, command + '\r')
>   
> -class Test(avocado.Test):
> +class QemuBaseTest(avocado.Test):

The QemuBaseTest class still defines require_accelerator() which is only 
used by qemu-system tests (thus, it should rather live on the Test 
class). Same thing for self.machine, unless that property is used on 
qemu-user tests.

>       def _get_unique_tag_val(self, tag_name):
>           """
>           Gets a tag value, if unique for a key
> @@ -188,8 +188,6 @@ def require_accelerator(self, accelerator):
>                           "available" % accelerator)
>   
>       def setUp(self):
> -        self._vms = {}
> -
>           self.arch = self.params.get('arch',
>                                       default=self._get_unique_tag_val('arch'))
>   
> @@ -202,6 +200,25 @@ def setUp(self):
>           if self.qemu_bin is None:
>               self.cancel("No QEMU binary defined or found in the build tree")
>   
> +
> +    def fetch_asset(self, name,
> +                    asset_hash=None, algorithm=None,
> +                    locations=None, expire=None,
> +                    find_only=False, cancel_on_missing=True):
> +        return super(QemuBaseTest, self).fetch_asset(name,
> +                        asset_hash=asset_hash,
> +                        algorithm=algorithm,
> +                        locations=locations,
> +                        expire=expire,
> +                        find_only=find_only,
> +                        cancel_on_missing=cancel_on_missing)
Do you overwrite this fetch_asset() on class Test on purpose? I didn't 
get why fetch_asset() is defined on the classes inherited from QemuBaseTest.
> +
> +# a.k.a. QemuSystemTest for system emulation...
Above comment could become the class docstring.
> +class Test(QemuBaseTest):
> +    def setUp(self):
> +        self._vms = {}
> +        super(Test, self).setUp()
> +
>       def _new_vm(self, *args):
>           self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
>           vm = QEMUMachine(self.qemu_bin, sock_dir=self._sd.name)


