Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8686864F8FD
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 13:56:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6WiW-0000FB-6r; Sat, 17 Dec 2022 07:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6WiQ-0000F3-Pd
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 07:54:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6WiO-0004Fe-R7
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 07:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671281695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kWiqGRrG5xUOfMyffLlTtEfNFM3t7gBm5n+S4s5okwE=;
 b=WfULYuIgWXGQizMzHYkINtMQMeYUbP22Vec1rMRUzvBMEmv5i70+66pDOGKeeETpIBH6Hk
 zKr+jYjVO4v2OgkYT1DI3eiPPZWgnSEU58wQT7MSrxmGUbqEo1oLMLpram8rRFS0tHOvEe
 lmrPDpvb8Ay5CP+koFoHPs1yuY11ooU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-9fIC7VZOOjWLne1AXjzTsw-1; Sat, 17 Dec 2022 07:54:54 -0500
X-MC-Unique: 9fIC7VZOOjWLne1AXjzTsw-1
Received: by mail-ed1-f70.google.com with SMTP id
 f15-20020a056402354f00b00475a6378738so3028000edd.8
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 04:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kWiqGRrG5xUOfMyffLlTtEfNFM3t7gBm5n+S4s5okwE=;
 b=zeOP1DY+iiDGM1OqHKZvtVh2EAzubjWN+yotIdzi7jG1NyaV5h6S8tlvWmcQaXdRCK
 7DLCsCEOzz0ocu/Z9iv8i0hYy8jWxSZbNPyyA27/J0f6c3AL4T5LBE0YXfTsJxgbTkk0
 tEIfYtuwjfeu5E0tGgJ8ITqdJrT3wMKUNAMGrxk2+8Z2Ul/uUI4s4ZGAWsZDYIiudVF7
 b0hdbNH35xAJu6B+uDhW1eGvKYcWT6BJUIORf+URiOIcAFZeCgJKtZp41OHp9W3IEGvj
 tkHdirpoCRKICmK0Wo2fKk0rnFPy+BLSkX51OfBBnXsCRXBkB/kM+XaUCaCe6F5wFqQU
 huiQ==
X-Gm-Message-State: ANoB5pnaTkWAPH/GQfUzKHMvPtwideqzDA5UuER2XrtqgobAHOKKw9e7
 LpnTcIQeJ12HNvFo/auYKGFrS8iOBswbkFWLhEFzJHfO2PZYdjZdbPeG2aD988KtwqGtZhqu61w
 +7SJoGSowNOdWGaE=
X-Received: by 2002:a17:907:b60f:b0:7c1:6e53:dd02 with SMTP id
 vl15-20020a170907b60f00b007c16e53dd02mr24021688ejc.64.1671281693195; 
 Sat, 17 Dec 2022 04:54:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf72htTO5NyIbvNLjAbnhS9fEjKs0oZWfA1r5f+qx44ffUeVbndE1wWcqmG7IotumXWOlsS0eQ==
X-Received: by 2002:a17:907:b60f:b0:7c1:6e53:dd02 with SMTP id
 vl15-20020a170907b60f00b007c16e53dd02mr24021679ejc.64.1671281693013; 
 Sat, 17 Dec 2022 04:54:53 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928?
 ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.googlemail.com with ESMTPSA id
 a22-20020a170906671600b007806c1474e1sm1937356ejp.127.2022.12.17.04.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 04:54:52 -0800 (PST)
Message-ID: <3987ba90-3d8e-f232-ba72-f79bef4a39c7@redhat.com>
Date: Sat, 17 Dec 2022 13:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 00/30] Meson changes for QEMU 8.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <Y5yQXFxgf+12G153@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y5yQXFxgf+12G153@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 16:35, Daniel P. Berrangé wrote:
> So after applying this series, at least on Fedora, I barely needed
> configure at all, in so muc as the following successfully built AFAICT:
> 
> $ mkdir build
> $ cat > build/config-host.mak <<EOF
> all:
> GIT=git
> GIT_SUBMODULES=ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
> GIT_SUBMODULES_ACTION=update
> CONFIG_POSIX=y
> CONFIG_LINUX=y
> SRC_PATH=/home/berrange/src/virt/qemu
> TARGET_DIRS=x86_64-softmmu
> CONFIG_PLUGIN=y
> HAVE_GDB_BIN=/usr/bin/gdb
> ENGINE=podman
> ROMS=pc-bios/optionrom
> MAKE=make
> PYTHON=/usr/bin/python3 -B
> GENISOIMAGE=/usr/bin/genisoimage
> MESON=/usr/bin/meson
> NINJA=/usr/bin/ninja
> PKG_CONFIG=
> CC=cc
> EXESUF=
> TCG_TESTS_TARGETS= x86_64-softmmu
> EOF
> $ meson build
> $ ninja -C build

Yep.  It wouldn't build the firmwares though, or be able to run TCG or 
Avocado tests.  This kind of build system orchestration is the remaining 
task of configure (see new docs in patch 28).  It's not really possible 
for it to go away, it's beyond Meson's capabilities and intentions.

I would also like to move Python virtual environment configuration to 
configure.  This would give a lot more flexibility in whether to use 
network or not, for example, and is in line with submodule handling that 
is already in configure.

> Out of the things in config-host.mak there, a few meson already knows,
> like CC, SRC_PATH, 50% would be just a meson find_program() command,
> a couple would need meson args (eg TARGET_DIRS), and some just look
> redundant, eg CONFIG_LINUX largely duplicates __linux__, and
> CONFIG_POSIX is effectively  !_WIN32.

There are a couple like ENGINE or HAVE_GDB_BIN that are only needed by 
non-QEMU parts of the build system, and I don't think it makes much 
sense to move those detections out of configure.

But yeah, the OS symbols are pretty low-hanging fruit.  In fact 
meson.build recomputes them:

   config_host_data.set('CONFIG_POSIX', targetos != 'windows')

... and with Windriver's patches to get much closer to POSIX/Windows 
feature parity, the Makefiles don't use them as much as they did.

Paolo


