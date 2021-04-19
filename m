Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534033649B2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 20:18:17 +0200 (CEST)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYYTQ-00044R-5U
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 14:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYYR6-0003aL-7m
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYYQy-0000Rv-GN
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618856142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EaNDxsXEwalH3//f8//47+H/NWi2yEg0Qzf/rcsJww8=;
 b=gkMpkzzuuNRd6wnwfGsqPIKYUdRc+Wzewv/khooEsVavtmns+Qx6kQuiAUMmnlk0z9GMhb
 xbrHN2iSqJZowv6lh4n/B0PbfLuW8bFqp5PIl55gNNfOCkpv2dstFS5ml8R3PA4CiYdVxn
 iOGrymkkxrUOA06Nt2FaK1K4D3rSpd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-x2_kvd4UNRC5DiZ_UmhWUA-1; Mon, 19 Apr 2021 14:15:41 -0400
X-MC-Unique: x2_kvd4UNRC5DiZ_UmhWUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D526E18397A8;
 Mon, 19 Apr 2021 18:15:39 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-102.gru2.redhat.com
 [10.97.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0040519172;
 Mon, 19 Apr 2021 18:15:01 +0000 (UTC)
Subject: Re: [PATCH 2/8] Acceptance tests: do not try to reuse packages from
 the system
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-3-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <79812130-c3f1-b80f-5470-c8caf61cb23b@redhat.com>
Date: Mon, 19 Apr 2021 15:14:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210415215141.1865467-3-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 4/15/21 6:51 PM, Cleber Rosa wrote:
> The premise behind the original behavior is that it would save people
> from downloading Avocado (and other dependencies) if already installed
> on the system.  To be honest, I think it's extremely rare that the
> same versions described as dependencies will be available on most
> systems.  But, the biggest motivations here are that:
>
>   1) Hacking on QEMU in the same system used to develop Avocado leads
>      to confusion with regards to the exact bits that are being used;
>
>   2) Not reusing Python packages from system wide installations gives
>      extra assurance that the same behavior will be seen from tests run
>      on different machines;
>
> With regards to downloads, pip already caches the downloaded wheels
> and tarballs under ~/.cache/pip, so there should not be more than
> one download even if the venv is destroyed and recreated.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 8f220e15d1..63477c8b4b 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -96,7 +96,7 @@ AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
>   
>   $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
>   	$(call quiet-command, \
> -            $(PYTHON) -m venv --system-site-packages $@, \
> +            $(PYTHON) -m venv $@, \
>               VENV, $@)
>   	$(call quiet-command, \
>               $(TESTS_VENV_DIR)/bin/python -m pip -q install -r $(TESTS_VENV_REQ), \


