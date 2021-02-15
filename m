Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B6A31C226
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:06:45 +0100 (CET)
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjCm-0007XA-IN
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBjB8-0006RT-19
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:05:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBjB3-0004xM-2r
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613415894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1rX54mvu2Px1703IWAgaSLKcesly0rgZDKxBihj32I=;
 b=ZKdONOLrZXS3RnjO43Etlv9/K6RiT9mlxmI0dQJmMs+Hl9VfCnDOUPxF0hVPsYt8THK6AP
 g0PBkzf/pCrmQ5NZ5fq4cqAg1ZPOjycxNu5U93Tyvv2emf4zhLlV9XldJzzKtBwuC3VgDw
 1hc1RXhpiw88l7HRYqX4PB/bggZIZT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Nqzh9itGOQmp_N6F2O_Vwg-1; Mon, 15 Feb 2021 14:04:49 -0500
X-MC-Unique: Nqzh9itGOQmp_N6F2O_Vwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B339C298;
 Mon, 15 Feb 2021 19:04:48 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35C215B698;
 Mon, 15 Feb 2021 19:04:38 +0000 (UTC)
Subject: Re: [PATCH 3/6] Acceptance Tests: use the job work directory for
 created VMs
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-4-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <5047c079-ddf0-c23a-bacf-33fb4e1a0745@redhat.com>
Date: Mon, 15 Feb 2021 16:04:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211220146.2525771-4-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, John Snow <jsnow@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/11/21 7:01 PM, Cleber Rosa wrote:
> The QEMUMachine uses a base temporary directory for all temporary
> needs.  By setting it to the Avocado's workdir, it's possible to
> keep the temporary files during debugging sessions much more
> easily by setting the "--keep-tmp" command line option.
>
> Reference: https://avocado-framework.readthedocs.io/en/85.0/api/test/avocado.html#avocado.Test.workdir
> Reference: https://avocado-framework.readthedocs.io/en/85.0/config/index.html#run-keep-tmp
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

The changes look good to me, so:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

But I got confused, the patch's subject states "use the job work 
directory" while the documentation of `workdir` says it is a "writable 
directory that exists during the entire test execution (...)". In the 
end is it a job or test work directory?

- Wainer

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


