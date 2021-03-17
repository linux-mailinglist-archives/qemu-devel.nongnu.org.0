Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621B633F25F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:16:07 +0100 (CET)
Received: from localhost ([::1]:38496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWxx-0001W6-Sr
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMWwZ-00014U-Uo
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:14:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMWwX-0002Dk-9r
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615990475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EWruc03gqNya2nMPAbGUPux/i4C+7gBE0BgrVtUVUHs=;
 b=DOW37nSKB2ZE6dt9OfeyzG1qRwK8B7RDA37FdwgTjAPkHoRddmLxqa6XpdeQ05qc8GZFa5
 kt7nn9nmDSRWHlnIZrLewLPA+wh1w0FdUaCTR2+u+j87tGcFWMy9TykYNc7KVqQvNwXAwE
 7A8nFnPeaAPsG/K2HyA7aVKnfeHXmG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-1ulWKPbLORCNhtlDqQ9U9w-1; Wed, 17 Mar 2021 10:14:31 -0400
X-MC-Unique: 1ulWKPbLORCNhtlDqQ9U9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC5C2814314;
 Wed, 17 Mar 2021 14:14:29 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4AED5D6A1;
 Wed, 17 Mar 2021 14:14:21 +0000 (UTC)
Subject: Re: [PATCH v3 3/5] tests/acceptance: Introduce QemuUserTest base class
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210315230838.2973103-1-f4bug@amsat.org>
 <20210315230838.2973103-4-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <3d83bd7b-0efa-5151-97d4-07505b8d56d3@redhat.com>
Date: Wed, 17 Mar 2021 11:14:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210315230838.2973103-4-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
> Similarly to the 'System' Test base class with methods for testing
> system emulation, the QemuUserTest class contains methods useful to
> test user-mode emulation.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 08b3fa1124f..b471bee66e0 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -20,6 +20,7 @@
>   from avocado.utils import cloudinit
>   from avocado.utils import datadrainer
>   from avocado.utils import network
> +from avocado.utils import process
>   from avocado.utils import vmimage
>   from avocado.utils.path import find_command
>   
> @@ -256,6 +257,19 @@ def fetch_asset(self, name,
>                           find_only=find_only,
>                           cancel_on_missing=cancel_on_missing)
>   
> +class QemuUserTest(QemuBaseTest):
> +    def setUp(self):
> +        self._ldpath = []
> +        super(QemuUserTest, self).setUp("qemu-%s")

There is my comment on patch 02 regarding the setUp() argument. Apart 
from that, this code looks good to me:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

> +
> +    def add_ldpath(self, ldpath):
> +        self._ldpath += [os.path.abspath(ldpath)]
> +
> +    def run(self, bin_path, args=[]):
> +        qemu_args = " ".join(["-L %s" % ldpath for ldpath in self._ldpath])
> +        bin_args = " ".join(args)
> +        return process.run("%s %s %s %s" % (self.qemu_bin, qemu_args,
> +                                            bin_path, bin_args))
>   
>   class LinuxTest(Test):
>       """Facilitates having a cloud-image Linux based available.


