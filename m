Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9363267AB42
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 08:59:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKag1-00080C-VL; Wed, 25 Jan 2023 02:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKag0-000803-T7
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 02:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKafz-0007Dp-0W
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 02:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674633514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fv886kjrQJymLC26y6gcI9Cr3G7XhDYkbOZY3nZbwqU=;
 b=M1EiXegYdWIsZhE+vdXzU5+1/gqB1tiXf0pDf8Yi+7tYzurUXD3qTIDr0NojfFb/8ztVD1
 24w/wWrOoqJuvdhUlJyTTKcaVF5XKYEsvJK4fVyCpsZcgW8dwFtzsI5+6l/icVy+Jmlf4E
 FADAg6m92rdVh6ogal2tNeN1sPbsgis=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-NQwF7puUOr2IZVmTyL8BMg-1; Wed, 25 Jan 2023 02:58:32 -0500
X-MC-Unique: NQwF7puUOr2IZVmTyL8BMg-1
Received: by mail-qk1-f198.google.com with SMTP id
 q21-20020a05620a0d9500b0070572ccdbf9so12528308qkl.10
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 23:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fv886kjrQJymLC26y6gcI9Cr3G7XhDYkbOZY3nZbwqU=;
 b=GGSQvcBhNTP5NPiKJkh+MFySWD0p4RJqfqZHLZDnrPFpEbUC8v+u8qUG2s1vo5KGp8
 yf0LUqbfBYcmH8kueO3T0fhV6UOPWlj0zQqXVzrYHyyUuQBPgNhByigntsvgokyssoOZ
 qCmKJ798ifOPZHvqEtojIz3Nq/zmlS5A4rqIzARgxChUOe/w9Z9FNmk7gjuLnGtRmUOH
 ZjhsBkWYmaJqRDv72JBG8UaZ+dWV1bowQszo/RkQCdxbVsRQNKiJkCJzluS9xs6FlWud
 l932OE1snJ4Sp7PJkkxG3LHaL8yAL8tMPfmY0Wzib/VLLos6S+bXUWss2nVLJT5OKts4
 5gmw==
X-Gm-Message-State: AFqh2koROG4sNRUbqRoLBZBxvi/zxD83DdzsUK34Mij1XGzkU9ps1qfU
 43Sl8GF3yGrQ/GGqYBN51jGLWDtTS/9t2ltMy4EF3f+c4V8BuiWWmi+CdSRYZd2y0sz8xAizWOY
 cve84j5sB2VmjNbk=
X-Received: by 2002:ac8:1301:0:b0:3b6:2cc8:e120 with SMTP id
 e1-20020ac81301000000b003b62cc8e120mr41384721qtj.39.1674633512330; 
 Tue, 24 Jan 2023 23:58:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvaykEZmUQl7UiWqKsic4wwNGBwsnZRjIdK/4L84NukqPs62Ann+8Qysd+VJozc+T7bBS7eHQ==
X-Received: by 2002:ac8:1301:0:b0:3b6:2cc8:e120 with SMTP id
 e1-20020ac81301000000b003b62cc8e120mr41384699qtj.39.1674633512070; 
 Tue, 24 Jan 2023 23:58:32 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de.
 [109.43.178.209]) by smtp.gmail.com with ESMTPSA id
 e2-20020ac80642000000b0039cba52974fsm2791620qth.94.2023.01.24.23.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 23:58:31 -0800 (PST)
Message-ID: <f21ac8e6-911f-b156-18ff-3929d89ba3d1@redhat.com>
Date: Wed, 25 Jan 2023 08:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-21-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 20/35] docs: add a new section to outline emulation
 support
In-Reply-To: <20230124180127.1881110-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 24/01/2023 19.01, Alex Bennée wrote:
> This affects both system and user mode emulation so we should probably
> list it up front.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - HPs -> HP's
>    - MIPs-like -> MIPS-like
> ---
>   docs/about/emulation.rst      | 103 ++++++++++++++++++++++++++++++++++
>   docs/about/index.rst          |   1 +
>   docs/devel/tcg-plugins.rst    |   2 +
>   docs/system/arm/emulation.rst |   2 +
>   4 files changed, 108 insertions(+)
>   create mode 100644 docs/about/emulation.rst
> 
> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
> new file mode 100644
> index 0000000000..bdc0630b35
> --- /dev/null
> +++ b/docs/about/emulation.rst
> @@ -0,0 +1,103 @@
> +Emulation
> +=========
> +
> +QEMU's Tiny Code Generator (TCG) gives it the ability to emulate a

I'd maybe rather say "provides" instead of "gives it".

> +number of CPU architectures on any supported platform. Both

I'd maybe add a "host" between "supported" and "platform.

> +:ref:`System Emulation` and :ref:`User Mode Emulation` are supported
> +depending on the guest architecture.
> +
> +.. list-table:: Supported Guest Architectures for Emulation
> +  :widths: 30 10 10 50
> +  :header-rows: 1
> +
> +  * - Architecture (qemu name)
> +    - System
> +    - User-mode

Maybe just use "User" instead of "User-mode" to make the column smaller?

> +    - Notes
> +  * - Alpha
> +    - Yes
> +    - Yes
> +    - Legacy 64 bit RISC ISA developed by DEC
> +  * - Arm (arm, aarch64)
> +    - Yes
> +    - Yes
> +    - Wide range of features, see :ref:`Arm Emulation` for details
> +  * - AVR
> +    - Yes
> +    - No
> +    - 8 bit micro controller, often used in maker projects
> +  * - Cris
> +    - Yes
> +    - Yes
> +    - Embedded RISC chip developed by AXIS
> +  * - Hexagon
> +    - No
> +    - Yes
> +    - Family of DSPs by Qualcomm
> +  * - PA-RISC (hppa)
> +    - Yes
> +    - Yes
> +    - A legacy RISC system used in HP's old minicomputers
> +  * - x86 (i386, x86_64)
> +    - Yes
> +    - Yes
> +    - The ubiquitous desktop PC CPU architecture, 32 and 64 bit.
> +  * - Loongarch
> +    - Yes
> +    - Yes
> +    - A MIPS-like 64bit RISC architecture developed in China
> +  * - m68k
> +    - Yes

Would it be possible to link the "Yes" entries in the "System" column to 
corresponding target-*.rst files? E.g. docs/system/target-m68k.rst for the 
m68k entry?

> +    - Yes
> +    - Motorola 68000 variants and ColdFire
> +  * - Microblaze
> +    - Yes
> +    - Yes
> +    - RISC based soft-core by Xilinx
> +  * - MIPS (mips, mipsel, mips64, mips64el)

The table renders very badly for me, the last column is cut off and you need 
to scroll to see its contents. This seems mainly to happen since this MIPS 
entry is very long. Could the information in the parentheses maybe be 
shortened to "(mips*)" or be dropped completely?

  Thomas


