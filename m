Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CFA33F00A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:12:07 +0100 (CET)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMV1y-00005l-Sd
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMV0w-00085x-F2
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:11:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMV0r-0004HS-3g
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615983055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7Cj//LWAJkl8KJZCw0oewx2cwKajCd8C1krlelUyH4=;
 b=PjgYHPsN1chmwCg3WOnDQainsFFmZGkjiC8xkPA8/kUpGzZlDXcwKvxrmK1nerlOn7mYDY
 EH0IQNqDpyBItyCwgPlCMfA8nKelQnFyuKh/WcuCxcAXn31WIVBd5rBxaRXaW54BZmebOu
 OsmeC77V7ruYKvuFFI98f9mcP3k69IQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-XT8faEWfML-IBleRZVmB4w-1; Wed, 17 Mar 2021 08:10:52 -0400
X-MC-Unique: XT8faEWfML-IBleRZVmB4w-1
Received: by mail-wr1-f71.google.com with SMTP id i5so18306890wrp.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 05:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f7Cj//LWAJkl8KJZCw0oewx2cwKajCd8C1krlelUyH4=;
 b=UySmLgXRp/Ws+d74yqFx3Tn5cFzUUDkATP3m029BKX0RiyhfSv/NA9DIw7FnorsH7K
 hfo6fmCcjoHQLPgTZjmIEoskW4NsHTIRVb4/eOglKParTP8+BHrSBND++2y2ZJScVRbo
 bkXCxhWGCXqI+Zxh4N29h2mu/AKqo6ck99VLvc2fEDc3/jPftOQwEaa7aaPW/1oEnsxT
 iR+ddyZRCuTQgZQpEpgz5nnmuY3974aEsmLXOZzKwaMi9oaoxOXWF+gp5PogkgB5aGP6
 K/XP0p4cZlP1+vdeRYK6KvoiTLh2I8flV3RX0ZTYnTVoEEsXi5I18L5TDsMnE4SEV1K5
 +MdQ==
X-Gm-Message-State: AOAM530zozJRulKT2zV2opbkEoANeuv0n6ZeX3/chyFYIhX6xctsGnI9
 T2CclFKJUB3uAF/eiU3liuFrsjMCUu3wefrKHuDiAn0jLXZ0rAFN9sB5HPBLxkLWPLfvn+/ltJc
 iyhfBKcRwJxMkHx0=
X-Received: by 2002:a1c:9845:: with SMTP id a66mr2397850wme.156.1615983050926; 
 Wed, 17 Mar 2021 05:10:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4ExUvvaAk3L8UIwND+ddH8B3B52R04jL6fAzSOUcWZEmpEywRpHcsNfdQeg/zg84Cw4S8bg==
X-Received: by 2002:a1c:9845:: with SMTP id a66mr2397836wme.156.1615983050745; 
 Wed, 17 Mar 2021 05:10:50 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c2sm1364214wme.15.2021.03.17.05.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 05:10:50 -0700 (PDT)
Subject: Re: [PULL v2 15/15] hw/core: Only build guest-loader if libfdt is
 available
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210317072216.16316-1-alex.bennee@linaro.org>
 <20210317072216.16316-16-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <053eb0d7-82ee-7c72-d1fb-46fc44ded858@redhat.com>
Date: Wed, 17 Mar 2021 13:10:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317072216.16316-16-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 3/17/21 8:22 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Add a Kconfig entry for guest-loader so we can optionally deselect
> it (default is built in), and add a Meson dependency on libfdt.
> 
> This fixes when building with --disable-fdt:
> 
>   /usr/bin/ld: libcommon.fa.p/hw_core_guest-loader.c.o: in function `loader_insert_platform_data':
>   hw/core/guest-loader.c:56: undefined reference to `qemu_fdt_add_subnode'
>   /usr/bin/ld: hw/core/guest-loader.c:57: undefined reference to `qemu_fdt_setprop'
>   /usr/bin/ld: hw/core/guest-loader.c:61: undefined reference to `qemu_fdt_setprop_string_array'
>   /usr/bin/ld: hw/core/guest-loader.c:68: undefined reference to `qemu_fdt_setprop_string'
>   /usr/bin/ld: hw/core/guest-loader.c:74: undefined reference to `qemu_fdt_setprop_string_array'
>   collect2: error: ld returned 1 exit status
> 
> Fixes: a33ff6d2c6b ("hw/core: implement a guest-loader to support static hypervisor guests")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <20210315170439.2868903-1-philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

On Mon, Mar 15, 2021 at 06:04:39PM +0100, Philippe Mathieu-Daudé wrote:
>Add a Kconfig entry for guest-loader so we can optionally deselect
>it (default is built in), and add a Meson dependency on libfdt.
>
>This fixes when building with --disable-fdt:
>
>  /usr/bin/ld: libcommon.fa.p/hw_core_guest-loader.c.o: in function
`loader_insert_platform_data':
>  hw/core/guest-loader.c:56: undefined reference to `qemu_fdt_add_subnode'
>  /usr/bin/ld: hw/core/guest-loader.c:57: undefined reference to
`qemu_fdt_setprop'
>  /usr/bin/ld: hw/core/guest-loader.c:61: undefined reference to
`qemu_fdt_setprop_string_array'
>  /usr/bin/ld: hw/core/guest-loader.c:68: undefined reference to
`qemu_fdt_setprop_string'
>  /usr/bin/ld: hw/core/guest-loader.c:74: undefined reference to
`qemu_fdt_setprop_string_array'
>  collect2: error: ld returned 1 exit status
>
>Fixes: a33ff6d2c6b ("hw/core: implement a guest-loader to support
static hypervisor guests")
>Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
>Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

If you have to post a v3 due to merge conflict, this patch
also had:

Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
Tested-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

(but it was sent off-list).

Thanks,

Phil.


