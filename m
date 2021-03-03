Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC2232B688
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:21:08 +0100 (CET)
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOct-00046m-CU
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOb7-00035r-1p
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:19:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOb3-0002LE-RK
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614766752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7WTncgmWojbh518l+W1nUuduXTehsXJZFemrq8qzzbM=;
 b=HhCbeJ9ayP+TKy3+QpUa7DMn/pqNvgH4VN2k00ezsj7r3VTU8WK3AGaiZ93qWgihct008X
 kfI3F/LmviGZRLasG2wXoR+hOSTnxMh3m+mVAkZfCoDUF5u+k+qPzH52KC18vVUFBHdvGF
 8hjNqL2ebgvqOjryYH+iMIkKAD6Dqck=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-LfKGkiciNSCyVt_ywwywrg-1; Wed, 03 Mar 2021 05:19:11 -0500
X-MC-Unique: LfKGkiciNSCyVt_ywwywrg-1
Received: by mail-ej1-f70.google.com with SMTP id di5so1486447ejc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 02:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7WTncgmWojbh518l+W1nUuduXTehsXJZFemrq8qzzbM=;
 b=Cqt3hqd+KDKsTug2GhLerkyC0wzPn1/IGTpzqFr32vwsq/jf+oMRgbiE8/yFUPekXs
 vZzNmUvFdNq5/HnUrynOmFSS3VnU1l5xs9BD09UdAquPcovmm/VXEeJfmam84qZH9uFn
 THLu6vpZM9lJV+awtWOTNlO6lab9Rq4E9d5LfPjT2/ZgO0O6EV+KIhmy4BpUgC9Q43Bh
 crbmyARcgnFygUMLpV+h6miAU57GhsB637kdYTF1vojbsnOp9qTAYVAET57lC1c9whxd
 BHHZB32tE7d/4o5zN7vcbmFZe3ddCZdco6eURWWjqjEu/l6gjOBC/kAdQnyGKR0v54/j
 9iiQ==
X-Gm-Message-State: AOAM530AX9ff8sJWIP4OsabO4t6knCjmHBPtmYVIl5NwcvnpP4MS39iZ
 ED2MBqfhleWn0k7/if9RD1K9osy/9Mmakz5Kyu9NG5ivxxXk+Y7kBVFzjbXQ6nsCEfyb0629nZl
 4gRHp2iruD1ZwigI=
X-Received: by 2002:a05:6402:12cf:: with SMTP id
 k15mr6242727edx.192.1614766748570; 
 Wed, 03 Mar 2021 02:19:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQe7f0mV+TwyObVyetnw0r6CCddA8KJHeWYLS28wcQxQBNVRdlSn2ICEKxZbtQa+p6Qzz3NA==
X-Received: by 2002:a05:6402:12cf:: with SMTP id
 k15mr6242708edx.192.1614766748310; 
 Wed, 03 Mar 2021 02:19:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i13sm20800731ejj.2.2021.03.03.02.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:19:07 -0800 (PST)
Subject: Re: [PATCH 1/2] tests/acceptance: Test ast2400 and ast2500 machines
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20210303012217.637737-1-joel@jms.id.au>
 <20210303012217.637737-2-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5c772df2-8291-ddd3-d289-1f564ec7c744@redhat.com>
Date: Wed, 3 Mar 2021 11:19:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303012217.637737-2-joel@jms.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 2:22 AM, Joel Stanley wrote:
> Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
> from ASPEED, by booting Palmetto and Romulus BMC machines.
> 
> The images are fetched from OpenBMC's release directory on github.

You need to justify here why this is safe to run that
on anyone workstation, or use AVOCADO_ALLOW_UNTRUSTED_CODE.

> 
> Co-developed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tests/acceptance/boot_linux_console.py | 46 ++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index eb012867997f..2f46a08fdc10 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -1048,6 +1048,52 @@ def test_arm_vexpressa9(self):
>          self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
>          self.do_test_advcal_2018('16', tar_hash, 'winter.zImage')
>  
> +    def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:palmetto-bmc
> +        """
> +
> +        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
> +                     'obmc-phosphor-image-palmetto.static.mtd')
> +        image_hash = ('3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d')
> +        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
> +                                      algorithm='sha256')
> +
> +        self.do_test_arm_aspeed(image_path)


