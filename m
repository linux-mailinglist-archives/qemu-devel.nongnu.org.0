Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FE373EB4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:39:28 +0200 (CEST)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJcV-0000xG-RD
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leJUu-0002Sv-D1
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:31:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leJUs-0005V1-92
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620228693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLMgVyHKNcS/XcllqN7QtoSTPj06eNceS6Y/dbeH9sA=;
 b=eeiBZmvHKhSywrUOiaa/mwufekbej/cJsTJ9ydFRdM/mqifpOk/TeWcDxAORmp8p7VBIqV
 JgMnaTKmI9vur35ngOJjKp1Z5wjsjdljEgmkc7XcDMlt9x4Xw5IC+TsvEFoofQdM61akDI
 lTz2jZSYbY6dQG9yNp8AttPZENj+Fm4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-4TolmTE1MuG0w6LMbHaSlQ-1; Wed, 05 May 2021 11:31:31 -0400
X-MC-Unique: 4TolmTE1MuG0w6LMbHaSlQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 d199-20020a1c1dd00000b02901492c14476eso463001wmd.2
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 08:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZLMgVyHKNcS/XcllqN7QtoSTPj06eNceS6Y/dbeH9sA=;
 b=ALyCRjEQptRf+e/tFph4Imy1tgKZ2uymRf6nW3PERyx0kTDucqE92U5kfDyCpSOgLu
 +T1FXeH9205cu8q+UHAHbHxsgcZhDd/97nJD4ZavAruGX4ni7l+2CS23NRKF5bEqlSXR
 VyH+FBylEEo2uipezlm5ogAt4hz19j2iurW44vN6BZMqmLmCJ2Sl6cVTsWjPw7lAevgk
 xA6GsnsHW6daSw4Bug8GuBLNjbix3/eXdAVlidPpPIZV0xkBUYdiXWIFdTn3ML2B981l
 uAFbryv8RCCWbHGizuGrbei0PGfcQxFyyk71esNY/aJ8qYCI3AFtsfbPgZVKvB226Mrb
 ivaw==
X-Gm-Message-State: AOAM533D72cp0MsVNef/0QcLI/vMiCdNtXC+wXP3pf8B8hUAYuorJX0E
 zBS5+Ed+BmvtbiZYoDkzDxa68FgbJIZcIP4jl9/BhYiWY3AEP48Qo15FCjWmTG5GXEsYCAibUec
 U2UY5S/Phb5Wy2FA=
X-Received: by 2002:a7b:c382:: with SMTP id s2mr29434941wmj.75.1620228690436; 
 Wed, 05 May 2021 08:31:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbIh+H7eMnd+qRgvuxlG4u2IY8OBVd+zwClxoSMFHCC46CUBiktqB7CToXuBbs18poW1c7bg==
X-Received: by 2002:a7b:c382:: with SMTP id s2mr29434918wmj.75.1620228690171; 
 Wed, 05 May 2021 08:31:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y5sm6183150wmj.25.2021.05.05.08.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 08:31:29 -0700 (PDT)
Subject: Re: [PATCH v1] softmmu/vl: make default prealloc-threads work w/o
 -mem-prealloc
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210311085918.284903-1-den-plotnikov@yandex-team.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1554e090-f26d-d676-c045-d45747acc570@redhat.com>
Date: Wed, 5 May 2021 17:31:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210311085918.284903-1-den-plotnikov@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 09:59, Denis Plotnikov wrote:
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ff488ea3e7db..e392e226a2d3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2300,14 +2300,17 @@ static void qemu_validate_options(void)
>   
>   static void qemu_process_sugar_options(void)
>   {
> -    if (mem_prealloc) {
> -        char *val;
> +    char *val;
>   
> -        val = g_strdup_printf("%d",
> -                 (uint32_t) qemu_opt_get_number(qemu_find_opts_singleton("smp-opts"), "cpus", 1));
> -        object_register_sugar_prop("memory-backend", "prealloc-threads", val,
> -                                   false);
> -        g_free(val);
> +    val = g_strdup_printf("%d",
> +              (uint32_t) qemu_opt_get_number(
> +                             qemu_find_opts_singleton("smp-opts"), "cpus", 1));
> +
> +    object_register_sugar_prop("memory-backend", "prealloc-threads", val,
> +                                false);
> +    g_free(val);
> +
> +    if (mem_prealloc) {
>           object_register_sugar_prop("memory-backend", "prealloc", "on", false);
>       }

Hi Denis, this patch breaks make check-qtest-arm:

G_TEST_DBUS_DAEMON=/home/pbonzini/work/upstream/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_IMG=./qemu-img MALLOC_PERTURB_=45 QTEST_QEMU_BINARY=./qemu-system-arm /home/pbonzini/work/upstream/qemu/+bb/tests/qtest/npcm7xx_emc-test --tap -k
# random seed: R02Sac2b21edc4fb48abab9f9723147ddbd5
1..6
# Start of arm tests
# Start of npcm7xx_emc tests
# Start of emc[0] tests
# starting QEMU: exec ./qemu-system-arm -qtest unix:/tmp/qtest-839596.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-839596.qmp,id=char0 -mon chardev=char0,mode=control -display none -machine quanta-gsj -accel qtest
qemu-system-arm: Invalid SMP CPUs 1. The min CPUs supported by machine 'quanta-gsj' is 2

Paolo


