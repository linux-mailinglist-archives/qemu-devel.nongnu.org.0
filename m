Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128542D747A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 12:06:54 +0100 (CET)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kngGD-0006QY-3S
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 06:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kngEe-0005TR-5r
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:05:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kngEc-0004l8-8R
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607684713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqmLZSM3P/FmRkj+b6oUF1RxdizXS3kAOsdm9YbR65s=;
 b=GdRsoWFrCdHH5rA34QblinbQMaWbzWegvZgVpjmBosorOYE7uPzdvMcj/bBzagBRo6w/eN
 Ia/EeplRVsYz3kb9n8Woao/xnleMkSBaNPP/RmTLLVvxoWNB1LCaoPX2jH+2IQ9r3vw5d/
 nqjUWL+4BfV9EksCFKHwND8rUHA3dUo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-VKwCb7TTM6C7Q-75_zlQqQ-1; Fri, 11 Dec 2020 06:05:11 -0500
X-MC-Unique: VKwCb7TTM6C7Q-75_zlQqQ-1
Received: by mail-ed1-f72.google.com with SMTP id y19so2126951edw.16
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 03:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oqmLZSM3P/FmRkj+b6oUF1RxdizXS3kAOsdm9YbR65s=;
 b=j0m+Oh6MNwhMTJ+ZG/Qq3sjAaBHi1HNgo2kCqAKl+RcO+jje4/M0P8lJ58bLwQY5aW
 jdu8LbOCk2zlV5/aKBnFDc78d42evuPNDeYemA8P9SIXNfHpouEMGYR7vrGJ6hTYvEwt
 7oKG2iPKb/z/DgaYL/30muOs+encF8Zhfi2h18skiapgR/Ax7YCK3pQJD2hZKNkh+fmE
 aOP1fuIknpYS+2A7gMnDGLp+xbSg6+27n97PeMVD6mLHfS3vznNxf2KqnJ1pCZDS1Lvy
 nCWhrg3CbJOkliDtWF6ZaYeWagpWHosFY34BUi3f1AQlxwucTvBeZWvA5bm3HuWtsy8R
 KESA==
X-Gm-Message-State: AOAM5326fMNtS49zudjLWb/JykbulIPVH5GIi3th2Rf+i4kdlPAjqPrk
 cTNZpNsAsroLaNVTXvsdTMxDIUXgoWvLNELwsPm0GXoG/oNwkxMr8RI61BQEidvPmOY8/Rp+TDU
 8G3Bf0Gh+tlq1yag=
X-Received: by 2002:a50:ee1a:: with SMTP id g26mr11389004eds.68.1607684710408; 
 Fri, 11 Dec 2020 03:05:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHulbtyRtsUHSRhEJmssW1ge+r5TxqRltZyYoENfJGXIinjQp/V6oAmubccQeHFtQ2Y6NNiw==
X-Received: by 2002:a50:ee1a:: with SMTP id g26mr11388985eds.68.1607684710271; 
 Fri, 11 Dec 2020 03:05:10 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id mc25sm6533077ejb.58.2020.12.11.03.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 03:05:09 -0800 (PST)
Subject: Re: [PATCH v11 14/25] cpu: Remove unnecessary noop methods
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-15-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d851d31b-f314-05eb-7fb1-e4568bc7f751@redhat.com>
Date: Fri, 11 Dec 2020 12:05:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-15-cfontana@suse.de>
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
> From: Eduardo Habkost <ehabkost@redhat.com>
> 

Either add:

"In the previous commits we made cpu_exec_* and
 debug_excp_handler handlers optional, we can now
 remove these no-op handlers."

Or squash in each commit...

Anyhow:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/core/cpu.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 576fa1d7ba..994a12cb35 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -199,15 +199,6 @@ static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
>      return target_words_bigendian();
>  }
>  
> -static void cpu_common_noop(CPUState *cpu)
> -{
> -}
> -
> -static bool cpu_common_exec_interrupt(CPUState *cpu, int int_req)
> -{
> -    return false;
> -}
> -
>  #if !defined(CONFIG_USER_ONLY)
>  GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
>  {
> @@ -410,11 +401,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
>      k->gdb_read_register = cpu_common_gdb_read_register;
>      k->gdb_write_register = cpu_common_gdb_write_register;
>      k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
> -    k->debug_excp_handler = cpu_common_noop;
>      k->debug_check_watchpoint = cpu_common_debug_check_watchpoint;
> -    k->cpu_exec_enter = cpu_common_noop;
> -    k->cpu_exec_exit = cpu_common_noop;
> -    k->cpu_exec_interrupt = cpu_common_exec_interrupt;
>      k->adjust_watchpoint_address = cpu_adjust_watchpoint_address;
>      set_bit(DEVICE_CATEGORY_CPU, dc->categories);
>      dc->realize = cpu_common_realizefn;
> 


