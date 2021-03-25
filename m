Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC97349611
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:51:22 +0100 (CET)
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSGX-0000qg-6O
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPS3V-00014g-4c
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:37:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPS3M-0007Ru-5E
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616686659;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UIJxEAlQj/HbemPN4KZdxgk+VH926zNpI+GeMP35nDc=;
 b=LTuGJTYY6Kiv+yWvnd4O9hlBUyfHOImfyAVrYZ/Z/nhjBMsb5uxe7yWgO76RITTeP4+Lcu
 WzKs6tg72GMyfLMtaAzS55x7RHt4q2A2fmNkPwlw4NOEKdyjo609/Wjo6E57iA2Qdv5/GB
 FYM+Tx7GcCPUNomi3hBknt10CdvsnXs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-bt4FcRvZPuGaoRxX44FrNw-1; Thu, 25 Mar 2021 11:37:38 -0400
X-MC-Unique: bt4FcRvZPuGaoRxX44FrNw-1
Received: by mail-wr1-f71.google.com with SMTP id n17so2827085wrq.5
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=UIJxEAlQj/HbemPN4KZdxgk+VH926zNpI+GeMP35nDc=;
 b=BJNCAK8PJGzvPm0F7KfuqaKnTt9eYw+YHHN3FI9xeu1N6xo1sdra/M/PJxG/aAVP7y
 h1fu+1p6At2pi3iguINBI8/tDtfFT1uKMO0gxDAHqpmNMLfOp8Od3Tndd58AQbyTphZs
 UYuMnwYoNarCS2lbY6vfWdvUKb1OF2j6ZirS1SxhjLQA/KsonipF6GTjrakwZlR5uD5t
 JekRJoVEcW/bTreNf72MVomFrkw8h5oGbQ6WytZ+TmV/5kHvBuQVCemmsi0pEt1ovWpS
 P4nu7rY2JIEtemiNIMiD//MS6re4EF+DtNrennNwtRVhlE78ArhERwILumnmcnrLc3UN
 3eig==
X-Gm-Message-State: AOAM533MR8e94O4lwkHfHk/EtdBS8Cul9CIm7NvFxXzoyTUPiRwabfv8
 N2rxhaguSZ66DS2OADbBmmOk/adiedgWUznaqPMZaxWjGrTUvm7+RfVO0rREVN6MaMSc/4pU3Ch
 xUu/q85Lu2SxFexw=
X-Received: by 2002:adf:f852:: with SMTP id d18mr9970691wrq.210.1616686657012; 
 Thu, 25 Mar 2021 08:37:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNFv28g1sTevOMyfx6IUJn6YfpSsCQjIkMWc5RiMhvmACS4vkylLtH96csvFwM+VQpf9SsHw==
X-Received: by 2002:adf:f852:: with SMTP id d18mr9970665wrq.210.1616686656712; 
 Thu, 25 Mar 2021 08:37:36 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id u20sm8445764wru.6.2021.03.25.08.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:37:36 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [RFC PATCH v2 4/5] Add migration support for KVM guest with MTE
In-Reply-To: <881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org>
 (Haibo Xu's message of "Wed, 17 Mar 2021 09:28:23 +0000")
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Thu, 25 Mar 2021 16:37:35 +0100
Message-ID: <87y2ebmegw.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 dgilbert@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Haibo Xu <haibo.xu@linaro.org> wrote:
> To make it easier to keep the page tags sync with
> the page data, tags for one page are appended to
> the data during ram save iteration.
>
> This patch only add the pre-copy migration support.
> Post-copy and compress as well as zero page saving
> are not supported yet.
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>


>  #define RAM_SAVE_FLAG_XBZRLE   0x40
>  /* 0x80 is reserved in migration.h start with 0x100 next */
>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> +#define RAM_SAVE_FLAG_MTE              0x200

Flags are really a scarce resource.  You are using one here, when you
know that you will always have the feature enable (or not), so you can
do better during negotiation IMHO.



> +void precopy_enable_metadata_migration(void)
> +{
> +    if (!ram_state) {
> +        return;
> +    }
> +
> +    ram_state->metadata_enabled = true;
> +}

My understanding is that in your following patch, if mte is enabled, you
will always sent mte tags, for all pages needed, right?

> +static int save_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
> +{
> +    uint8_t *tag_buf = NULL;
> +    uint64_t ipa;
> +    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;
> +
> +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> +        /* Buffer for the page tags(one byte per tag) */
> +        tag_buf = g_try_malloc0(size);

size of the buffer is known at start of migration.  Just get a buffer
and reuse it?

Do zero pages have mte tags?  From migration point of view, a zero page
is a page that is just full of zeros, i.e. nothing else special.
Because you are not sending any for them.



> @@ -1148,6 +1219,10 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>  static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>                              uint8_t *buf, bool async)
>  {
> +    if (rs->metadata_enabled) {
> +        offset |= RAM_SAVE_FLAG_MTE;

You don't really need the flag, for you normal pages are just
TARGET_PAGE_SIZE + (TARGET_PAGE_SIZE/MTE_)


> +    }
> +
>      ram_counters.transferred += save_page_header(rs, rs->f, block,
>                                                   offset | RAM_SAVE_FLAG_PAGE);
>      if (async) {
> @@ -1159,6 +1234,11 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>      }
>      ram_counters.transferred += TARGET_PAGE_SIZE;
>      ram_counters.normal++;
> +
> +    if (rs->metadata_enabled) {

See?  You are not checking the flag, you are checking the bool setup at
the beggining of migration.

> +        ram_counters.transferred += save_normal_page_mte_tags(rs->f, buf);
> +    }
> +
>      return 1;
>  }
>  
> @@ -2189,6 +2269,7 @@ static void ram_state_reset(RAMState *rs)
>      rs->last_version = ram_list.version;
>      rs->ram_bulk_stage = true;
>      rs->fpo_enabled = false;
> +    rs->metadata_enabled = false;
>  }
>  
>  #define MAX_WAIT 50 /* ms, half buffered_file limit */
> @@ -3779,7 +3860,7 @@ static int ram_load_precopy(QEMUFile *f)
>              trace_ram_load_loop(block->idstr, (uint64_t)addr, flags, host);
>          }
>  
> -        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
> +        switch (flags & ~(RAM_SAVE_FLAG_CONTINUE | RAM_SAVE_FLAG_MTE)) {

Creating the flag is hurting you here also.

>          case RAM_SAVE_FLAG_MEM_SIZE:
>              /* Synchronize RAM block list */
>              total_ram_bytes = addr;
> @@ -3849,6 +3930,9 @@ static int ram_load_precopy(QEMUFile *f)
>  
>          case RAM_SAVE_FLAG_PAGE:
>              qemu_get_buffer(f, host, TARGET_PAGE_SIZE);
> +            if (flags & RAM_SAVE_FLAG_MTE) {
> +                load_normal_page_mte_tags(f, host);
> +            }

I don't claim to understand the MTE, but my understanding is that if we
are using MTE, all pages have to have MTE flags, right?

So, somtehing like

is_mte_enabled()

that I told in the other thread looks like a good idea.

Later, Juan.

>              break;
>  
>          case RAM_SAVE_FLAG_COMPRESS_PAGE:


