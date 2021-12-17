Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782C479776
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 00:20:52 +0100 (CET)
Received: from localhost ([::1]:59192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myMWx-0006F0-Fd
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 18:20:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myMVF-0005Qe-AC
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:19:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myMVD-0004iV-Uh
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639783143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Gs7uKgfq5Y5jXF1MHXsFKzyJX7GpF7IvmThp6X2kF8=;
 b=IIWyAXhjqM72KeGgDkreI4Buyz/G+GRcOydnyRAF3ULfL0PDm9pQgG+hyM8XwyEhb3uIEJ
 h36jXpwVkw31WG34gHEliIDgLc5l/8mLnSPkm0rdQuxUT8H0iliz90m1TPzCZNyHi0BY6L
 7BeSStUYdViiOGGhG+B8TmqpA+iWcuI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-1bFOZy3DP7qCpKkCLG2ZQw-1; Fri, 17 Dec 2021 18:19:02 -0500
X-MC-Unique: 1bFOZy3DP7qCpKkCLG2ZQw-1
Received: by mail-wm1-f71.google.com with SMTP id
 p13-20020a05600c1d8d00b0034565e7e5c6so1285453wms.9
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 15:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4Gs7uKgfq5Y5jXF1MHXsFKzyJX7GpF7IvmThp6X2kF8=;
 b=2/ZhgVbbqiwIdG3XWVDUO/49cGghuyuz3vSd4pIUZWStMS9MvaGD6KIdASp+e/B2Oz
 yKm5oDFADSkAANEb84PBGZ2/9gmJdxXSptQOhVmFgOZO4BwXbQoxwhhgnC0VTJiyWeiW
 Qqv51YQthMes4Ef9LTGTCmm8TuTGEI7rIi5QY0v8wj8Aeq07kX4PPCCPewZs2PyFQV9J
 nouG/OWr++1WsbVRRY4sWv4CMbSh+ETA+e9udCvYp0qF4cPCWiMZ28Hn1VQWzD5cLc12
 QKqTxp3xEnvSzztM3xj7iVvKP973oSS9OSIr0XPe8fwOy6nF8IzE+B1/4vsKsaIIiLlh
 zFXg==
X-Gm-Message-State: AOAM53020I4+VjpNv8PiCk+8l6C97339hDV6YeXUyWbHN+/lf6UHX0Lp
 q/ee9MLdljLNigzSzcGVh1fpll3jq9CnOAJwZIaM1e/eipdVjzRLuhq1bVb9LkuqAQKSNCG9arn
 KfotqdJw5SmGQ4vM=
X-Received: by 2002:a05:6000:3c4:: with SMTP id
 b4mr4301623wrg.172.1639783141148; 
 Fri, 17 Dec 2021 15:19:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxilR32rQ5cEpOToxiOAzjHPyt9U3MyjQRk2RetXLsmX9rC4IDqZGz93x9rFZ15SDnst2M1zQ==
X-Received: by 2002:a05:6000:3c4:: with SMTP id
 b4mr4301610wrg.172.1639783140990; 
 Fri, 17 Dec 2021 15:19:00 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m17sm3674010wms.25.2021.12.17.15.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 15:19:00 -0800 (PST)
Message-ID: <f07f6b9c-ac81-62a1-be71-6c82267bdaf7@redhat.com>
Date: Sat, 18 Dec 2021 00:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-4-philmd@redhat.com>
 <CAFEAcA_UKFHT=PbwNtyqV4G2Vdw7LVUjUj_X_DZ5Kk6=yF+EBg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAFEAcA_UKFHT=PbwNtyqV4G2Vdw7LVUjUj_X_DZ5Kk6=yF+EBg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 23:34, Peter Maydell wrote:
> On Wed, 15 Dec 2021 at 18:24, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Add the 'memory' bit to the memory attributes to restrict bus
>> controller accesses to memories.
>>
>> Introduce flatview_access_allowed() to check bus permission
>> before running any bus transaction.
>>
>> Have read/write accessors return MEMTX_BUS_ERROR if an access is
>> restricted.
>>
>> There is no change for the default case where 'memory' is not set.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/exec/memattrs.h |  9 +++++++++
>>  softmmu/physmem.c       | 43 +++++++++++++++++++++++++++++++++++++++--
>>  2 files changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
>> index 95f2d20d55b..f0063583ee2 100644
>> --- a/include/exec/memattrs.h
>> +++ b/include/exec/memattrs.h
>> @@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
>>      unsigned int secure:1;
>>      /* Memory access is usermode (unprivileged) */
>>      unsigned int user:1;
>> +    /*
>> +     * Bus interconnect and peripherals can access anything (memories,
>> +     * devices) by default. By setting the 'memory' bit, bus transaction
>> +     * are restricted to "normal" memories (per the AMBA documentation)
>> +     * versus devices. Access to devices will be logged and rejected
>> +     * (see MEMTX_BUS_ERROR).
>> +     */
>> +    unsigned int memory:1;
>>      /* Requester ID (for MSI for example) */
>>      unsigned int requester_id:16;
>>      /* Invert endianness for this page */
>> @@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
>>  #define MEMTX_OK 0
>>  #define MEMTX_ERROR             (1U << 0) /* device returned an error */
>>  #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
>> +#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */
> 
> This is kind of odd naming, because MEMTX_DECODE_ERROR already means
> "bus/interconnect returned an error" and it generally translates
> into what at the OS level gets called a "bus error"...

MEMTX_DECODE_ERROR is "nothing at that address". We want a name
for "there is something, but you don't have access to it".
Maybe MEMTX_ILLEGAL_ERROR?


