Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A553B3245B5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 22:22:54 +0100 (CET)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF1cT-0007JT-GF
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 16:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF1b2-0006VH-7Z
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:21:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF1ay-0000Qh-Ej
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614201679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBb3ywUbQCpSK1+Dj8YFEUS+uIncm4+VXfEC5jOaKMk=;
 b=Ivb3zbCS0aHFTl2kgwHLru/77cuWz+5m/1yVVGYQMxHy2qBj8taTvmWtv7GKSIJ92iaK/H
 oAfPhzjRAweSCOZ+qeIGLQLFpkDVxi70of5+R11A6qeUthWruIThtSDni7ZQ46MuZywCvH
 cou9/951P0NFQeN7TEPfwh3n4pyTkqs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-GfCFDmWjM-en3evzDQn9sw-1; Wed, 24 Feb 2021 16:21:16 -0500
X-MC-Unique: GfCFDmWjM-en3evzDQn9sw-1
Received: by mail-wr1-f72.google.com with SMTP id e13so1618723wrg.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 13:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kBb3ywUbQCpSK1+Dj8YFEUS+uIncm4+VXfEC5jOaKMk=;
 b=NmU0R+O34HpcXGFLS1UUkJfP7nd5sty+ofjyboxcGkjW63oKTfE5Oda/LbggXgrb4M
 H+TI+Yzb9GbuOOdHrRLQuwEI28EXtVC7I7XcSe99kX8fPFybBTNwRnzgrrHszYIkR1Qi
 2yZZuQlXf8mY58kPKzvT1D8x5qN9pBqmkp+GJ3Zt0q8opn3Er9KzEcnjlLjKIex6gbNI
 XABnTQ8VpTMqy9rOOchd5OkfwptuYygNt9pw4ADmxnD4/WrRZS4gWiEbrqvBvICIveY0
 1F4BTE7bmqRifD+up9u+35CUU0s4UE/oJKM2kiQlelMJxs3hTAHCwuWbmCsp/dV05W6A
 4WwQ==
X-Gm-Message-State: AOAM53062HS/iW2guIGSmyS3D6K3PQ7p7nM1Ar7Jy+Ga9BCjHVuxovrf
 FlKIxFXoC6rE0YfI0CneGPDawONxXvxoHwHox3oqTvLxzjOIdYVb3k4d8imvjV3Vl/TIupqhQTn
 6obmFUoKBK7ZOB/FJDyrv3yFjEp739XtA2p6inliJnxtlpVDJbaw/BfbRL8o03EP0
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr12955wmk.63.1614201675015;
 Wed, 24 Feb 2021 13:21:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVvumde/K6kAc5eH1cKA67cAtCY4ix18osW7cGvIp2VzKKYjjvuVP2hw/9+ISG+NtaZ2LsKw==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr12932wmk.63.1614201674755;
 Wed, 24 Feb 2021 13:21:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm4393686wmh.39.2021.02.24.13.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 13:21:13 -0800 (PST)
Subject: Re: [PATCH v22 06/17] meson: add target_user_arch
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-7-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ab323577-c68e-c215-655f-1b45d2e9b112@redhat.com>
Date: Wed, 24 Feb 2021 22:21:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-7-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 2:34 PM, Claudio Fontana wrote:
> the lack of target_user_arch makes it hard to fully leverage the
> build system in order to separate user code from sysemu code.
> 
> Provide it, so that we can avoid the proliferation of #ifdef
> in target code.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
> [claudio: added changes for new target hexagon]

Again, this line goes ...

> ---

... here. Else it is not stripped by git-am and ends
burried in the repository (see commit 940e43aa30e).

>  meson.build                   | 5 +++++
>  target/alpha/meson.build      | 3 +++
>  target/arm/meson.build        | 2 ++
>  target/cris/meson.build       | 3 +++
>  target/hexagon/meson.build    | 3 +++
>  target/hppa/meson.build       | 3 +++
>  target/i386/meson.build       | 2 ++
>  target/m68k/meson.build       | 3 +++
>  target/microblaze/meson.build | 3 +++
>  target/mips/meson.build       | 3 +++
>  target/nios2/meson.build      | 3 +++
>  target/openrisc/meson.build   | 3 +++
>  target/ppc/meson.build        | 3 +++
>  target/riscv/meson.build      | 3 +++
>  target/s390x/meson.build      | 3 +++
>  target/sh4/meson.build        | 3 +++
>  target/sparc/meson.build      | 3 +++
>  target/tilegx/meson.build     | 3 +++
>  target/tricore/meson.build    | 3 +++
>  target/xtensa/meson.build     | 3 +++
>  20 files changed, 60 insertions(+)


