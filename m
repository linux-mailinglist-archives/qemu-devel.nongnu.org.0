Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75CA31BB60
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:51:05 +0100 (CET)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfDM-0000W6-VP
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBfBH-0008Rl-AT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:48:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBfBE-0003Tq-Gd
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613400530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NyaqlEbbzHzDk59BgtjrpGfqI0PE8B9mOgS0AcnBJA=;
 b=JcXffbKiiKAtZACjPULGOCIQBuriJYkEmCg8FCxiS9/v9tMlm35IwI6K6WBcHFN1+F6nTG
 oaOvCi9lTvs2T/rGrHc+ZySggLwCVxJAiFt2Od8AEH6QAN1hKvuNU8yt94VMrg+zM/aP3M
 UBTWdFsiPP3qVLJckeZs9n4w/2wpI98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-Z8sKN4fkNcG4wYXBb-9c0Q-1; Mon, 15 Feb 2021 09:48:48 -0500
X-MC-Unique: Z8sKN4fkNcG4wYXBb-9c0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03A718030BB;
 Mon, 15 Feb 2021 14:48:47 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 288BC5C241;
 Mon, 15 Feb 2021 14:48:35 +0000 (UTC)
Subject: Re: [PATCH 17/22] Acceptance Tests: fix population of public key in
 cloudinit image
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-18-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <cf961a4f-93e3-0e11-eb5b-2c7fd78e2b79@redhat.com>
Date: Mon, 15 Feb 2021 11:48:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-18-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/3/21 2:23 PM, Cleber Rosa wrote:
> Currently the path of the ssh public key is being set, but its
> content is obviously what's needed.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 472088ae7d..8156224625 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -337,13 +337,15 @@ class LinuxTest(Test, LinuxSSHMixIn):
>           try:
>               cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
>               self.phone_home_port = network.find_free_port()
> +            with open(ssh_pubkey) as pubkey:
> +                pubkey_content = pubkey.read()
>               cloudinit.iso(cloudinit_iso, self.name,
>                             username='root',
>                             password='password',
>                             # QEMU's hard coded usermode router address
>                             phone_home_host='10.0.2.2',
>                             phone_home_port=self.phone_home_port,
> -                          authorized_key=ssh_pubkey)
> +                          authorized_key=pubkey_content)
>           except Exception:
>               self.cancel('Failed to prepare the cloudinit image')
>           return cloudinit_iso


