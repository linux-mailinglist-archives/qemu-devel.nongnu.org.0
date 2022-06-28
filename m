Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A6355BF62
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:20:24 +0200 (CEST)
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66SN-0001QQ-JS
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o65k8-0007O7-TL; Tue, 28 Jun 2022 03:34:41 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:47300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o65k4-0004q0-OT; Tue, 28 Jun 2022 03:34:39 -0400
Received: from myt5-4c5921969858.qloud-c.yandex.net
 (myt5-4c5921969858.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3b1a:0:640:4c59:2196])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 622A72E1170;
 Tue, 28 Jun 2022 10:34:25 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-4c5921969858.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 ZxxDCJxwii-YIJqpxoF; Tue, 28 Jun 2022 10:34:25 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656401665; bh=P/pIbwD9Y1G3KQrboEMHEGGNCqrzEZMVEO26yB4nGb8=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=YsbU2C1tDge/VuM/4dImW1F8ckDhrJGLaYU0+sI76dApApFJGnqLAl0Qa1DALKA40
 ISCEALwBG8SDS7tCMeiGnfAfEp4/wfvQtVzTKoKGaD3jGde2DFKCaPrvO4jIhDXqdJ
 0O5e93gxSvQ1TGw463/N3qonBf1lveZ2PTAhoE8s=
Authentication-Results: myt5-4c5921969858.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b686::1:1f] (unknown
 [2a02:6b8:b081:b686::1:1f])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 q8bHOCIUFm-YIMGEBmd; Tue, 28 Jun 2022 10:34:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <e9f1e31c-5457-79fd-b1e1-c6ea2c25fa10@yandex-team.ru>
Date: Tue, 28 Jun 2022 10:34:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 3/7] iotests: add copy-before-write: on-cbw-error tests
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 stefanha@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 v.sementsov-og@mail.ru, jsnow@redhat.com, vsementsov@openvz.org
References: <20220407132726.85114-1-vsementsov@openvz.org>
 <20220407132726.85114-4-vsementsov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220407132726.85114-4-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had a long and not fun debugging session through gitlab pipelines with this:)

The problem is that pure QEMUMachine doesn't work on arm in gitlab. And we have to specify at least machine. And we don't want qtest, as described in commit message.

So, the following fix helps:


On 4/7/22 16:27, Vladimir Sementsov-Ogievskiy wrote:
> Add tests for new option of copy-before-write filter: on-cbw-error.
> 
> Note that we use QEMUMachine instead of VM class, because in further
> commit we'll want to use throttling which doesn't work with -accel
> qtest used by VM.
> 
> We also touch pylintrc to not break iotest 297.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   tests/qemu-iotests/pylintrc                   |   5 +
>   tests/qemu-iotests/tests/copy-before-write    | 132 ++++++++++++++++++
>   .../qemu-iotests/tests/copy-before-write.out  |   5 +
>   3 files changed, 142 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/copy-before-write
>   create mode 100644 tests/qemu-iotests/tests/copy-before-write.out
> 
> diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
> index 32ab77b8bb..f4f823a991 100644
> --- a/tests/qemu-iotests/pylintrc
> +++ b/tests/qemu-iotests/pylintrc
> @@ -51,3 +51,8 @@ notes=FIXME,
>   
>   # Maximum number of characters on a single line.
>   max-line-length=79
> +
> +
> +[SIMILARITIES]
> +
> +min-similarity-lines=6
> diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
> new file mode 100755
> index 0000000000..6c7638965e
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/copy-before-write
> @@ -0,0 +1,132 @@
> +#!/usr/bin/env python3
> +# group: auto backup

[..]

> +
> +    def setUp(self):
> +        qemu_img_create('-f', iotests.imgfmt, source_img, size)
> +        qemu_img_create('-f', iotests.imgfmt, temp_img, size)
> +        qemu_io('-c', 'write 0 1M', source_img)
> +
> +        self.vm = QEMUMachine(iotests.qemu_prog)

Will fix to be:

   +        opts = ['-nodefaults', '-display', 'none', '-machine', 'none']
   +        self.vm = QEMUMachine(iotests.qemu_prog, opts,
   +                              base_temp_dir=iotests.test_dir,
   +                              sock_dir=iotests.sock_dir)


> +        self.vm.launch()
> +


So, if no objections, I'm going to resend a PULL request (v1 was "[PULL 00/10] Block jobs & NBD patches") with this fix and small improvement in 06.


-- 
Best regards,
Vladimir

