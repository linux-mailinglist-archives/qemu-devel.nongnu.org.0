Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B354C40D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 10:59:01 +0200 (CEST)
Received: from localhost ([::1]:34000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Orb-00038D-CB
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 04:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1OYu-0004b1-V0
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:39:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1OYr-00084z-6f
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:39:39 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m24so14317403wrb.10
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 01:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Ie6VNmwmFTKFn95rJd664vk44nKnPaghFlxACJQHH0=;
 b=M6Aq5Wr8QVnHCx3PyWXdie4ut2OGBV88+yCE5cSo7iRnQ/LpS6Xr5d5o9YHsKm2dts
 kAAGkzOcfVmuU1TxRU52Tmuij7R9HaLZ/4Xava71xFyEw3e61956hMerBuMhBSKc/d5g
 HBQKtYtvQze4b9ELJEtuVdy/AFKuMjZglnKHF8DcA7xF4BKbuMVjy2nOy9MjOgTcHg2i
 4HnN7LbgRJrZJBycJoKJI+uiuR1ZhY/sEeIbbEVzcKbkTUFuFNlB4zMnwCoj3qpBNJpJ
 q4YUtzUCelQ1kM9n4vIcLLKM8bnCvHAFjwI23CeDO23+BnoJbDg0O3o0TrdZU1qK/BAx
 8IKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Ie6VNmwmFTKFn95rJd664vk44nKnPaghFlxACJQHH0=;
 b=l4FVz+4wDd7vK6JppNChptqmo6HNzgBitInwxj2YSW0PqzrVxN3QXLLotfui5leM8F
 R6YCGODAd8ibGgFre8aCNYD0WOF4eOMlUIld9ob83jrBhJLuT7DeBrprePYf8BJYBrH0
 2C/Wu/8z110SH+1fwQQ3Uxah2oRAzxZvuSSFg6oU1Es/OID0Drz1fKEBkjnoTEJcFTuk
 2+JK0kLAsB7mPSruLfVqkflzu0IXohZ6/+jaee+MA0svypc+X2HB/Wst/eOGmehr02k8
 1NY8JrLVo8ScITPR3JXTtlLS2KF7zHiO5qqDgmdB3WkRQeFFBlPXEisK+zFnE/N3/+FO
 LHOw==
X-Gm-Message-State: AJIora/lsDtptnxvxaAso96OGWoYkYB51VcBwU36FaGhaKHpw8+2f7eL
 PUMXFnapDOMqRgQhZ9siVT8=
X-Google-Smtp-Source: AGRyM1urYRShzZcyKijPipz08Rd8iRhOZoDphw+UYTaLwpkpDC5H7imYCd6P7uNlp/JPLOMSGXkUog==
X-Received: by 2002:adf:dd8e:0:b0:213:bbe1:ba56 with SMTP id
 x14-20020adfdd8e000000b00213bbe1ba56mr8961086wrl.559.1655282370595; 
 Wed, 15 Jun 2022 01:39:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 v13-20020a5d610d000000b0020c5253d914sm14277710wrt.96.2022.06.15.01.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 01:39:30 -0700 (PDT)
Message-ID: <dc3cff18-e8ad-2817-d484-53f7197bf6f7@redhat.com>
Date: Wed, 15 Jun 2022 10:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/4] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220614210746.78911-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/14/22 23:07, Akihiko Odaki wrote:
> Developers often run QEMU without installing. The bundle mechanism
> allows to look up files which should be present in installation even in
> such a situation.
> 
> It is a general mechanism and can find any files located relative
> to the installation tree. The build tree must have a new directory,
> qemu-bundle, to represent what files the installation tree would
> have for reference by the executables.
> 
> v4:
> * Add Daniel P. Berrangé to CC. Hopefully this helps merging his patch:
>    https://mail.gnu.org/archive/html/qemu-devel/2022-06/msg02276.html
> * Rebased to the latest QEMU.
> 
> v3:
> * Note that the bundle mechanism is for any files located relative to the
>    installation tree including but not limited to datadir. (Peter Maydell)
> * Fix "bridge" typo (Philippe Mathieu-Daudé)
> 
> v2: Rebased to the latest QEMU.

I like the idea, but I have a couple issues with the implementation:

- at the meson level, there is some repetition of mkdir and ln 
run_commands.  Perhaps you could just fill in a dictionary, and then do 
something like

   created_paths = {}
   foreach source, dest: var
     path = fs.parent(qemu_bundledir / dest)
     created_paths += {path: true}
   endforeach
   run_command('mkdir', '-p', created_paths.keys())
   foreach source, dest: var
     run_command('ln', '-sf', meson.project_source_root() / source,
                 qemu_bundledir / dest)
   endforeach

at the end of the toplevel meson.build.

- at the code level, it seems to me that this could reuse a lot of the 
logic of get_relocated_path().  In particular, I would include $prefix 
in the qemu_bundledir, so that the files in the bundle directory would 
look like qemu-bundle/usr/share/qemu/bios.bin: just like an install that 
uses DESTDIR.  Then, if an uninstalled QEMU somehow returns 
$exec_path/qemu-bundle/$prefix/$bindir for qemu_get_exec_dir() instead 
of $exec_path, then get_relocated_path() will automatically return the 
correct paths from qemu-bundle/.

Thanks,

Paolo

