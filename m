Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBC42D746E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 12:02:59 +0100 (CET)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kngCQ-0004Z5-2u
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 06:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kngAk-0003ap-3b
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:01:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kngAf-0003TQ-TI
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607684467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lhCQLUJU09XYXixfCdh5Ezo/hlOJfQKGHXBT8YMxBvk=;
 b=U/DYIxCgl3OE9qVRU/+EbM0nyL2Bd7Fkig0i86vs6tIO9K5KsJVEu6pRSi4KhUiwHou5+T
 O0ePAvAoH/ucWvSQjhMvaEFHLE0p361SQvKwWYnQadyDgzOrENQJVlvfA5ZwfhX59t2iCE
 TXf6EGFqGroDsi7UcYTRIqRPIs/K0VQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-SiBeCN10O4OeD9ZI245vsQ-1; Fri, 11 Dec 2020 06:01:06 -0500
X-MC-Unique: SiBeCN10O4OeD9ZI245vsQ-1
Received: by mail-ed1-f71.google.com with SMTP id dc6so3749667edb.14
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 03:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lhCQLUJU09XYXixfCdh5Ezo/hlOJfQKGHXBT8YMxBvk=;
 b=Yf3JSZ3bLyimYWNwaAEBmlLiuZ+bDSfQmPqlcxIbZpSG8g5bbkUYo+RFCKB7K0pWru
 nBjj2Hv/NZJlQ82ELMzTl+IW+HskKq33tUnFc4wKpSEr6WZ1RxIKR2P9t6M6pLBeShrB
 Gp54s5dmqyrKPeMoKnoua2Ws6DiUSKhGC3t4AQDypCF2/WwKHudLZBlk/fS3urqhmTDn
 SxA8fGxoCWwOUq7P3br45RbEIZ0Q3pHYGjp7GlM8+Sp9qWrqBsoLuKokx6yJjpHkj3Bi
 sAE5Iog7pg2IZgqAwUuOMPNu6mCxMpIsjJRJqA6oxgasnKG1fbdwO7WBrSJ1IY/7vXOl
 GwQw==
X-Gm-Message-State: AOAM530/q4ZsS2R71zdNWh1nW8SiudgUgXQ7Dt42GcimLKGyT8oUbd4R
 4sh4RBMRaMXMP+TZW710cPcMXt3UcteIT7N+kABjX9FudF8ekGvN0MRajyMWVYZ/MEs/I5oPVRE
 1BGcsTE2rkyTfrBs=
X-Received: by 2002:aa7:c44b:: with SMTP id n11mr10966885edr.216.1607684464962; 
 Fri, 11 Dec 2020 03:01:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKjVnz8Y7Cb6NflpFTfcGjthP8SffnJfdbRUXpkWyFwj5kVrJ8JYUv6StB2MdYVy/8ZYVj9Q==
X-Received: by 2002:aa7:c44b:: with SMTP id n11mr10966851edr.216.1607684464723; 
 Fri, 11 Dec 2020 03:01:04 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z9sm6591567eju.123.2020.12.11.03.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 03:01:04 -0800 (PST)
Subject: Re: [PATCH v11 25/25] cpu: move do_unaligned_access to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-26-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8e592f6e-4d2a-7fb6-f3f0-449a60010478@redhat.com>
Date: Fri, 11 Dec 2020 12:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-26-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 12/11/20 9:31 AM, Claudio Fontana wrote:
> make it consistently SOFTMMU-only.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/cpu.h           | 17 +++--------------
>  include/hw/core/tcg-cpu-ops.h   |  7 +++++++
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  2 +-
>  target/hppa/cpu.c               |  4 +++-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  3 ++-
>  target/nios2/cpu.c              |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/s390x/excp_helper.c      |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  target/ppc/translate_init.c.inc |  2 +-
>  15 files changed, 26 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


