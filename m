Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F6321BD3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:49:10 +0100 (CET)
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDSQ-00051O-1X
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEDP1-0002yq-CE
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:45:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEDOs-0007F0-S3
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614008726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwC18dC67dLMQNWX9tUFIYfhTn9EAgKltABnZU1RjC8=;
 b=YcqTTIZ6r65LKdk/PDvqGwHZjpJLXUfcBmgyWhEs4bv8Q7IICcdnHDs6b4N6Px3SEMv4K/
 /XKn5d1mwG8mlw78ipW5im8G9YKD9qtKZsX3W/KKvvUjH5PpIUOUNeelS2WGxKvMj5ltuR
 22r8V56CRGfGIP9C/4Dxfql1udWozVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-WDaIOiv_MeGOws0s5xK8Dg-1; Mon, 22 Feb 2021 10:45:24 -0500
X-MC-Unique: WDaIOiv_MeGOws0s5xK8Dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC08D8D2C4B;
 Mon, 22 Feb 2021 15:45:08 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C19BA6F998;
 Mon, 22 Feb 2021 15:44:40 +0000 (UTC)
Subject: Probing Meson for build configurations (was: [PATCH v2 3/6]
 tests/acceptance: allow a "graceful" failing for virtio-gpu test)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210222101455.12640-1-alex.bennee@linaro.org>
 <20210222101455.12640-4-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <71dc4eca-d52e-3650-3b23-a96950ecc05e@redhat.com>
Date: Mon, 22 Feb 2021 12:44:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222101455.12640-4-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

Last week I was chatting with Cleber about probing configured features 
so that tests could be skipped (just like on this case). He has a 
implementation which never landed in, and is based on the old build 
system. Now with Meson, I am wondering if it has some sort of API for 
probing, or parsing the JSON files in build/meson-info/ is the proper 
way to inspect the build configuration.

Thanks!

- Wainer

On 2/22/21 7:14 AM, Alex Bennée wrote:
> This is a band-aid with a TODO for cases when QEMU doesn't start due
> to missing VirGL. Longer term we could do with some proper feature
> probing.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20210217121932.19986-7-alex.bennee@linaro.org>
> ---
>   tests/acceptance/virtio-gpu.py | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
> index ab1a4c1a71..ab18cddbb7 100644
> --- a/tests/acceptance/virtio-gpu.py
> +++ b/tests/acceptance/virtio-gpu.py
> @@ -85,7 +85,12 @@ def test_virtio_vga_virgl(self):
>               "-append",
>               kernel_command_line,
>           )
> -        self.vm.launch()
> +        try:
> +            self.vm.launch()
> +        except:
> +            # TODO: probably fails because we are missing the VirGL features
> +            self.cancel("VirGL not enabled?")
> +
>           self.wait_for_console_pattern("as init process")
>           exec_command_and_wait_for_pattern(
>               self, "/usr/sbin/modprobe virtio_gpu", ""


