Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20466E363
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:22:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoie-0007vF-H9; Tue, 17 Jan 2023 11:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHoiX-0007v7-7P
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:21:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHoiV-0005FF-Kr
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673972502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjNFhCfOMUVf5RZOuWj26ij9jMlDRETfAvU9GA1gcnY=;
 b=DzV8CTxf6stbTjWw6lVhgch905cuqfs5dtZcLZqtgu+Kp5KLG5MNaT3Z6KQEKxX/hX4i5c
 0LDgH3/8bxX9lfDnTyDOPb8DhjZdAg2PIXSJd3yhvq6SQpXm6xMhMoJB6g3alIMaCZ1gxw
 /zvhXF5uG07aqXlHnDW3ztj1w9KXl+I=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-GXWrtfKvNYOaN-sy_PNGeg-1; Tue, 17 Jan 2023 11:21:41 -0500
X-MC-Unique: GXWrtfKvNYOaN-sy_PNGeg-1
Received: by mail-qt1-f198.google.com with SMTP id
 cf23-20020a05622a401700b003ab6e87db28so14092544qtb.18
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UjNFhCfOMUVf5RZOuWj26ij9jMlDRETfAvU9GA1gcnY=;
 b=wCPJnqSdybHp6MRBhOKKtUrENaIpGBzNXLE9kCSztxffN05UGHjSF1bKySyErj9qnn
 6gdHKgL7ZpxwrRLc6Gn0TnwUhvli9J/HHZ27a8QQyCubK4xva79KQPDvO76jmzk39Y6s
 sVx5lZTS7QsHxoqa97QSLjcRUP7q4x4KvPrgALfHB84+Wmej8ucHJg0mgzI9A4TWcHH8
 0A21RouacDGXKjpJxTrb1v5fhXpiClYrQZa2weT0znsFKR3ESv4fFWIOd8BtqjroroUR
 ARbY3Bq5YXrgjT35yCnuOaOydW1IKrMJBlim4KhWLYCwyIK2XH5SXHVJ8dhxibD5RBhV
 KNfw==
X-Gm-Message-State: AFqh2kqIiL2zYsHawAj5r5QyBH6mo2pqx2UsJsB2zXXRN3Q0E9X9QmeW
 Rw+r8YRbUTGmoghzbp9YLlcOWtLR0xa7Hvaq/8UVoF+HKozlmb+GjKOBZDtKRxTJaqi3l9w02yU
 Mj4gm5mbyF+AjlZU=
X-Received: by 2002:ac8:608:0:b0:3a8:dae:d985 with SMTP id
 d8-20020ac80608000000b003a80daed985mr31899921qth.14.1673972500849; 
 Tue, 17 Jan 2023 08:21:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvD7Ir+W/7jm9y5FszOwcLyglQqRwVwfLB0gLhV892irj8vixfgBxGbVOTomwrD1Td2Io2Cww==
X-Received: by 2002:ac8:608:0:b0:3a8:dae:d985 with SMTP id
 d8-20020ac80608000000b003a80daed985mr31899902qth.14.1673972500623; 
 Tue, 17 Jan 2023 08:21:40 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 y14-20020ac87c8e000000b003b6347595c9sm2535846qtv.12.2023.01.17.08.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:21:40 -0800 (PST)
Message-ID: <ebdfa917-5740-9821-5945-853144d21d95@redhat.com>
Date: Tue, 17 Jan 2023 17:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
Content-Language: de-CH
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
 <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 17/01/2023 um 17:16 schrieb Warner Losh:
> 
> 
> On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito
> <eesposit@redhat.com <mailto:eesposit@redhat.com>> wrote:
> 
>     QEMU does not compile when enabling clang's thread safety analysis
>     (TSA),
>     because some functions create wrappers for pthread mutexes but do
>     not use any TSA macro. Therefore the compiler fails.
> 
>     In order to make the compiler happy and avoid adding all the
>     necessary macros to all callers (lock functions should use
>     TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers
>     of pthread_mutex_lock/pthread_mutex_unlock),
>     simply use TSA_NO_TSA to supppress such warnings.
> 
> 
> I'm not sure I understand this quite right. Maybe a clarifying question
> will help me understand: Why is this needed for bsd-user but not
> linux-user? How are they different here?
> 
Honestly I just went and fix the warnings that the compiler was throwing
at me. On FreeBSD it complains on bsd-user/mmap.c, but apparently the CI
or even compiling locally in linux doesn't create any issue with linux-user.

Weird. But I guess it won't hurt to add TSA_NO_TSA there too.

Emanuele

> Warner
>  
> 
>     Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com
>     <mailto:eesposit@redhat.com>>
>     ---
>      bsd-user/qemu.h         | 5 +++--
>      include/exec/exec-all.h | 5 +++--
>      2 files changed, 6 insertions(+), 4 deletions(-)
> 
>     diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
>     index be6105385e..711fdd1b64 100644
>     --- a/bsd-user/qemu.h
>     +++ b/bsd-user/qemu.h
>     @@ -37,6 +37,7 @@ extern char **environ;
>      #include "target_os_signal.h"
>      #include "target.h"
>      #include "exec/gdbstub.h"
>     +#include "qemu/clang-tsa.h"
> 
>      /*
>       * This struct is used to hold certain information about the
>     image.  Basically,
>     @@ -235,8 +236,8 @@ int target_msync(abi_ulong start, abi_ulong len,
>     int flags);
>      extern unsigned long last_brk;
>      extern abi_ulong mmap_next_start;
>      abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size);
>     -void mmap_fork_start(void);
>     -void mmap_fork_end(int child);
>     +void TSA_NO_TSA mmap_fork_start(void);
>     +void TSA_NO_TSA mmap_fork_end(int child);
> 
>      /* main.c */
>      extern char qemu_proc_pathname[];
>     diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>     index 25e11b0a8d..4f0c0559ac 100644
>     --- a/include/exec/exec-all.h
>     +++ b/include/exec/exec-all.h
>     @@ -25,6 +25,7 @@
>      #include "exec/cpu_ldst.h"
>      #endif
>      #include "qemu/interval-tree.h"
>     +#include "qemu/clang-tsa.h"
> 
>      /* allow to see translation results - the slowdown should be
>     negligible, so we leave it */
>      #define DEBUG_DISAS
>     @@ -758,8 +759,8 @@ static inline tb_page_addr_t
>     get_page_addr_code(CPUArchState *env,
>      }
> 
>      #if defined(CONFIG_USER_ONLY)
>     -void mmap_lock(void);
>     -void mmap_unlock(void);
>     +void TSA_NO_TSA mmap_lock(void);
>     +void TSA_NO_TSA mmap_unlock(void);
>      bool have_mmap_lock(void);
> 
>      /**
>     -- 
>     2.39.0
> 


