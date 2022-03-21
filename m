Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B568F4E2F5A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:47:03 +0100 (CET)
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWM7Q-0001KX-Vn
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:47:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWM0h-00087N-MF
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:40:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWM0e-0005EQ-KF
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647884399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTk27zffGoaPiYIvNOVcF81FYeqA0MFn3yfFduyVF2k=;
 b=exn6Dbsrhn4CafHYHDAGwNYgruqJCPSJt5B2t0y3Oi5uv4ZOavka92hrqtibJ56M6HxvMv
 pFMV2dt+K9op++DTMfp9y1z61Ctvr4As8n/7F16dspnhgOaa8VW4bmtvny1QgGNOSIrEqS
 LdSmYGMY73rccqwsvemfoR6/y70pelI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-XHgzfBGuNLyLDLuujvsyRw-1; Mon, 21 Mar 2022 13:39:54 -0400
X-MC-Unique: XHgzfBGuNLyLDLuujvsyRw-1
Received: by mail-wr1-f70.google.com with SMTP id
 88-20020adf8161000000b0020410a1bd93so669393wrm.0
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 10:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gTk27zffGoaPiYIvNOVcF81FYeqA0MFn3yfFduyVF2k=;
 b=a6cQXeTMBmYGTaW15jS/IzrDsURsKFWpFkbkm0piCIH45Rja4OX9ZG4D6+aCWSi5lf
 hpC/7/oJOTLZn0ISRrQ8EqTgvlerkVBkIDR7Pj/105S+261XxlLPE0wSFJ92DP4mGUG0
 Xz5qfOqAYiTBnjhjQLuOmXcECvl5SEfK3pSFWlNe4dhKNlqGKCogAKMJYLZYgYCHRNa3
 qmqI74uc9Uov6LFI1YAxn+MbaR9ARwOTAFY5oQbFPDkR68tpBHF0I+T9XSiobTXYi4bN
 QQqVRRT7dLW8XejnK/tl2n48xI6EmZsABO6tNoQZvrjt/RAhauySu5c54EvZZy7faA6x
 zULQ==
X-Gm-Message-State: AOAM531Blz2dAf2Ccj5IiKzGNa57dA3P0A1LcVLktgc1B5BDzJdqjqIT
 KzjBu92+gIwHF7tFHxjLetCtCbUh6xczu4Ef5yC5EbcXluutTtciL1JtXggQzxOJlyE3amory2x
 yHAAki0HvyAPxIc0=
X-Received: by 2002:a7b:cd01:0:b0:38c:9142:2006 with SMTP id
 f1-20020a7bcd01000000b0038c91422006mr214314wmj.4.1647884393426; 
 Mon, 21 Mar 2022 10:39:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYY74HUqBZRtrd3JlGg/L7ag7W8GztzkiAuVvYlgi8V2Qfq04V9KlpC+LPuyuzk2b1XNCRHg==
X-Received: by 2002:a7b:cd01:0:b0:38c:9142:2006 with SMTP id
 f1-20020a7bcd01000000b0038c91422006mr214290wmj.4.1647884393120; 
 Mon, 21 Mar 2022 10:39:53 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm190638wma.5.2022.03.21.10.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 10:39:52 -0700 (PDT)
Message-ID: <1f14533c-1163-f3c0-72ee-b79eba79480c@redhat.com>
Date: Mon, 21 Mar 2022 18:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1 1/1] test/avocado/machine_aspeed.py: Add ast1030 test
 case
To: Jamin Lin <jamin_lin@aspeedtech.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220321091646.17234-1-jamin_lin@aspeedtech.com>
 <20220321091646.17234-2-jamin_lin@aspeedtech.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220321091646.17234-2-jamin_lin@aspeedtech.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/03/2022 10.16, Jamin Lin wrote:
> Add test case to test "ast1030-evb" machine with zephyr os
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   tests/avocado/machine_aspeed.py | 36 +++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 tests/avocado/machine_aspeed.py
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> new file mode 100644
> index 0000000000..33090af199
> --- /dev/null
> +++ b/tests/avocado/machine_aspeed.py
> @@ -0,0 +1,36 @@
> +# Functional test that boots the ASPEED SoCs with firmware
> +#
> +# Copyright (C) 2022 ASPEED Technology Inc
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +from avocado.utils import archive
> +
> +
> +class AST1030Machine(QemuSystemTest):
> +    """Boots the zephyr os and checks that the console is operational"""
> +
> +    timeout = 10
> +
> +    def test_ast1030_zephyros(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:ast1030-evb
> +        """
> +        tar_url = ('https://github.com/AspeedTech-BMC'
> +                   '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip')
> +        tar_hash = '4c6a8ce3a8ba76ef1a65dae419ae3409343c4b20'
> +        tar_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
> +        archive.extract(tar_path, self.workdir)
> +        kernel_file = self.workdir + "/ast1030-evb-demo/zephyr.elf"
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_file,
> +                         '-nographic')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, "Booting Zephyr OS")
> +        exec_command_and_wait_for_pattern(self, "help",
> +                                          "Available commands")
Looks like this belongs to a new machine type that we do not have in QEMU 
yet? ... in that case, please send it along in a threaded patch series where 
you add the new machine type, otherwise it does not make much sense to see 
this as a single patch on the list.

  Thomas


