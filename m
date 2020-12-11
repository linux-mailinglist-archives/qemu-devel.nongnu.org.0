Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B692D2D7E1E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:33:29 +0100 (CET)
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnEO-0000U9-Nl
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmVE-0008GG-EH
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:46:48 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmV9-0007Tr-97
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:46:48 -0500
Received: by mail-ot1-x342.google.com with SMTP id d8so8962451otq.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+vsdahSGz4XTWAlYbxK2gAT5GiQCvfZxgrBri7qcNQs=;
 b=LF9gHQNc5ZJ/YMMsgf6p7yBefJNeopzLciHl5i1LUfTop4zTWnCjWYuX3g+QMAIokW
 UvOw1+2r5uFbcV/87mv5ab9OLU5u2zbVBF+w6bPHjBxDgJrcbXJO+XUwmMA5xg+S0Tct
 ky7mc33AxHGuJGgTz+EtT0G/KtYCz0pX904UEWdYLpNasKr7ef9HAcpIJ+w4Tf/j9tcI
 m+s3TEUaUEf/EtCjFfp/0c97EFGEnZWQafvM4gF4V8ciKOYkvYveHizLJvaSZXFEzDo7
 0F8UZZky1T2rylpvPRr6wOaUgkf8i3pfl6RnsZmabH5USVlzI/JXJg65JnEmgal700TL
 Kvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+vsdahSGz4XTWAlYbxK2gAT5GiQCvfZxgrBri7qcNQs=;
 b=CMSxN0W9bUVZKMkTvcq4mkeIhMK5ZKi3f7Cso0K0meLssZYnhfwDhHFwZkAG95zWmy
 rYCI97dg9mW5vpohcTaRe/kLUusQXa0gnl2qeEAawmwwwo5PPcZuxRItnwbT3hCN1yUf
 GMq2qrJV0CsWEEY9fAqysJpZzwBzy5go4EfFJRzz7iewrp6bWYL34DxriKlC0bhw2v0a
 gxP8+KSZ95jeZtjZASPk99q4hlQt4/5dwzJJbahQcKhqerYGk/mT8SjVjUUACTIdeD10
 wKdqeRx52H7ILnjnHolagzYApsw+Nt9tZcIcNRlOI7frmN0lt9ZHeGEeFNOw6kmiSUHd
 VMJg==
X-Gm-Message-State: AOAM532gm7a8INxmzRR3L9MPHownbiFYW4fKIZK8PsaZrAPUplkvaj1o
 RH4p/ZG5oCyMYP+tzqvE92S7Bg==
X-Google-Smtp-Source: ABdhPJwYxMN+gIpUQp944ao8yuvRNlg923yG1Gq9D5HGYz4AzVuB6NqBVJMVryqhfNOe0IOeMjWTAQ==
X-Received: by 2002:a9d:62d7:: with SMTP id z23mr4786182otk.353.1607708802094; 
 Fri, 11 Dec 2020 09:46:42 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c18sm1946765oib.31.2020.12.11.09.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 09:46:41 -0800 (PST)
Subject: Re: [PATCH v11 23/25] cpu: move cc->do_interrupt to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-24-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06d5d176-def5-fa14-5dbe-17dc747d2b39@linaro.org>
Date: Fri, 11 Dec 2020 11:46:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-24-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/cpu.h           |  2 --
>  include/hw/core/tcg-cpu-ops.h   |  3 +++
>  accel/tcg/cpu-exec.c            |  4 ++--
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  4 ++--
>  target/arm/cpu_tcg.c            |  9 ++++-----
>  target/avr/cpu.c                |  2 +-
>  target/avr/helper.c             |  4 ++--
>  target/cris/cpu.c               | 12 ++++++------
>  target/cris/helper.c            |  4 ++--
>  target/hppa/cpu.c               |  2 +-
>  target/i386/tcg/tcg-cpu.c       |  2 +-
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  4 ++--
>  target/moxie/cpu.c              |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  target/ppc/translate_init.c.inc |  2 +-
>  28 files changed, 42 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


