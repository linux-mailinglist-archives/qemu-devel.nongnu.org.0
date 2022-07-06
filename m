Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41C8568555
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:22:09 +0200 (CEST)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o92Aa-0001fR-Qd
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o925t-00055X-V9
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o925o-0006YG-3S
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657102630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIO3WsvoPc3xNMGPlE8bcNqQRPrhl2HgqMFbaRCOaXY=;
 b=Inu3jnen9Ls21zSH3d7JZBmk3lkR5kHF1ACqon2z1w9qQasKmRdq2lAps3pa8DXgIioELw
 SLZISoipHgtR6e8iF5NW0k8K9Ky+4Kf9K69Nzizi+jOrMGwgPK3BWtCUiE893FVIxDIQCz
 LmkGA44tgj4HQzVOWfp3kceqQNi74Ro=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-LJJkHCMOM8yKhT3BGeF3FA-1; Wed, 06 Jul 2022 06:17:09 -0400
X-MC-Unique: LJJkHCMOM8yKhT3BGeF3FA-1
Received: by mail-wm1-f69.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so6443643wma.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 03:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iIO3WsvoPc3xNMGPlE8bcNqQRPrhl2HgqMFbaRCOaXY=;
 b=LEKm1yuf6vR9JOpLtjiKzBdF1BweFd1/lQfE3yDtedgxrZbI2eHCpBYbhwm8CIR9kG
 0IbOr7gnxTX5TPuPi8l2qyFUIwFrzrWVfrRRVtVd0D9kt49ZPeUpDiKMRUD/4wjdJ3R9
 bx7KE5OVS+bCDbbd32jk/ZfbmyXfEOo87GcfqE/bxChWIbU1mxED21Cz4/YzeZB6VOdl
 RWfQ3TAZMuWNgdBzSnWskjPkFJVd7IdmJMCjbWAu56DAGfcZ8oN+avcH3OPtmsv/XqhS
 pNXXkBqZCDrBxlllfaKpuAyJxEmFU0Mi9meK4Os+IHrCpw561/okOZ0m1QdjnDU2YkTr
 cinw==
X-Gm-Message-State: AJIora/O4zpQjPSNUvMa3iydvh2USPqj61fRGi3LR+WFvXGqoYSkE9dC
 VqSDbL/qwT9c3RhPr3xqp9BSd98/B7xrQ8W5UoXeJwIyU8DmiUWLmYnderTH/+SWe0scx7PwaZV
 FfL9CqUxEN+xXryk=
X-Received: by 2002:a5d:6048:0:b0:21d:68e5:7cf0 with SMTP id
 j8-20020a5d6048000000b0021d68e57cf0mr16166872wrt.678.1657102627944; 
 Wed, 06 Jul 2022 03:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v9AoM6bnDUbL6c1E0G7d+VH7PXzhTrGdwD/Jydn5ToqA8ZAbrhCDQSuzAoJl26B5geWkMt6A==
X-Received: by 2002:a5d:6048:0:b0:21d:68e5:7cf0 with SMTP id
 j8-20020a5d6048000000b0021d68e57cf0mr16166840wrt.678.1657102627704; 
 Wed, 06 Jul 2022 03:17:07 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 t8-20020a7bc3c8000000b003a050a391e8sm25339237wmj.38.2022.07.06.03.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 03:17:07 -0700 (PDT)
Message-ID: <09c2108b-87bb-06a7-3877-7ad15106b32e@redhat.com>
Date: Wed, 6 Jul 2022 12:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] target/s390x/tcg: SPX: check validity of new prefix
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20220630094340.3646279-1-scgl@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220630094340.3646279-1-scgl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/06/2022 11.43, Janis Schoetterl-Glausch wrote:
> According to the architecture, SET PREFIX must try to access the new
> prefix area and recognize an addressing exception if the area is not
> accessible.
> For qemu this check prevents a crash in cpu_map_lowcore after an
> inaccessible prefix area has been set.
> 
> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/tcg/misc_helper.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
> index aab9c47747..10dadb002a 100644
> --- a/target/s390x/tcg/misc_helper.c
> +++ b/target/s390x/tcg/misc_helper.c
> @@ -158,6 +158,13 @@ void HELPER(spx)(CPUS390XState *env, uint64_t a1)
>       if (prefix == old_prefix) {
>           return;
>       }
> +    /*
> +     * Since prefix got aligned to 8k and memory increments are a multiple of
> +     * 8k checking the first page is sufficient
> +     */
> +    if (!mmu_absolute_addr_valid(prefix, true)) {
> +        tcg_s390_program_interrupt(env, PGM_ADDRESSING, GETPC());
> +    }
>   
>       env->psa = prefix;
>       HELPER_LOG("prefix: %#x\n", prefix);

Thanks, queued to my s390x-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next

  Thomas


