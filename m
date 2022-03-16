Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50504DAC14
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 08:53:05 +0100 (CET)
Received: from localhost ([::1]:58256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUOSu-0001XY-Jl
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 03:53:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nUORd-0000l6-BZ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 03:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nUORZ-0005nB-Vv
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 03:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647417100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncV+Hja7xAk/EYrvItaa0H11/lcsgs/OF4861NrXUfw=;
 b=ifdHL80GFYhtiY9Ux7FLyFP0lvLW/CczIvfI6ycUJYzU8/9XFtFa6/naNMCga7BnlVlDFR
 8zBRyiZkC29VzmBdjVaLbDxATn1/UuRLabcXv4kAtP/euk32+B9Wm72vWGmKrhqF4j/XdB
 IiFa0jUq2LhSCfvuWfdZZ/6Xnx4Ng4M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-tmeHru0MM6KipuW5xdbiZg-1; Wed, 16 Mar 2022 03:51:39 -0400
X-MC-Unique: tmeHru0MM6KipuW5xdbiZg-1
Received: by mail-wm1-f71.google.com with SMTP id
 h127-20020a1c2185000000b0038c6f7e22a4so416871wmh.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 00:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ncV+Hja7xAk/EYrvItaa0H11/lcsgs/OF4861NrXUfw=;
 b=WCR6YMguTxf81EV+oFqxJFhB/cBR0Z1qyo+axHIjDv1pAxWNCM4iXooE6NuSjIp+C6
 hR8Iskvjkpj23wBzSFMhVX50pvfQWPsthb+bToHnSJ5CljzWlfA5etiM4Tn1ywVn+1Cv
 mTzDhLPh4haJZILLWIc53VjQVgZYMsEs5nVqazq9sKFmVnXa3NqlKhkFofup+FPlUPDI
 +eCEX8QJ+D8+M4o8FXx5KrNCKuOPQStKcBgvB53cnWJhCfBJ1HBmgRbguSttn27QUs/0
 w45ctGX0qo8GUnDNiMpFUshTOIg7UNW7aCqkr9q3XUNt4MsHM5YfG6LAlfbC2SX33kkA
 xm+g==
X-Gm-Message-State: AOAM530kGOxhoDibpsrXCxlja21lWS/JLBR6fi9N3Myg3gXYXpsDjRSX
 AJoJGGAKN96YNbVUUwcDljRY4vMoIoIpncB5WoPQe418oTrvLJiy2BcOrvTqt4/rDyQ/plG435J
 MZTu2yMbQcnsTBUw=
X-Received: by 2002:a7b:c30d:0:b0:381:4bb9:eede with SMTP id
 k13-20020a7bc30d000000b003814bb9eedemr6361441wmj.74.1647417098149; 
 Wed, 16 Mar 2022 00:51:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4nQFOX6oMtsnM1mwa5wsuB6sp/xAyZTQWSUBSpeysvkQis5aQ3xj8Vd8QUjH+c4C3uEXIJA==
X-Received: by 2002:a7b:c30d:0:b0:381:4bb9:eede with SMTP id
 k13-20020a7bc30d000000b003814bb9eedemr6361428wmj.74.1647417097838; 
 Wed, 16 Mar 2022 00:51:37 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:f900:aa79:cd25:e0:32d1?
 (p200300cbc706f900aa79cd2500e032d1.dip0.t-ipconnect.de.
 [2003:cb:c706:f900:aa79:cd25:e0:32d1])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056000022a00b001f017dfb5cdsm1375386wrz.90.2022.03.16.00.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 00:51:37 -0700 (PDT)
Message-ID: <9c36fe6b-39e1-0bfc-d2bb-97b106828ee1@redhat.com>
Date: Wed, 16 Mar 2022 08:51:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] softmmu/physmem: Use qemu_madvise
To: Andrew Deason <adeason@sinenomine.net>, qemu-devel@nongnu.org
References: <20220316040405.4131-1-adeason@sinenomine.net>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220316040405.4131-1-adeason@sinenomine.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.03.22 05:04, Andrew Deason wrote:
> We have a thin wrapper around madvise, called qemu_madvise, which
> provides consistent behavior for the !CONFIG_MADVISE case, and works
> around some platform-specific quirks (some platforms only provide
> posix_madvise, and some don't offer all 'advise' types). This specific
> caller of madvise has never used it, tracing back to its original
> introduction in commit e0b266f01dd2 ("migration_completion: Take
> current state").
> 
> Call qemu_madvise here, to follow the same logic as all of our other
> madvise callers. This slightly changes the behavior for
> !CONFIG_MADVISE (EINVAL instead of ENOSYS, and a slightly different
> error message), but this is now more consistent with other callers
> that use qemu_madvise.
> 
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> ---
> Looking at the history of commits that touch this madvise() call, it
> doesn't _look_ like there's any reason to be directly calling madvise vs
> qemu_advise (I don't see anything mentioned), but I'm not sure.
> 
>  softmmu/physmem.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 43ae70fbe2..900c692b5e 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -3584,40 +3584,32 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
>                           rb->idstr, start, length, ret);
>              goto err;
>  #endif
>          }
>          if (need_madvise) {
>              /* For normal RAM this causes it to be unmapped,
>               * for shared memory it causes the local mapping to disappear
>               * and to fall back on the file contents (which we just
>               * fallocate'd away).
>               */
> -#if defined(CONFIG_MADVISE)
>              if (qemu_ram_is_shared(rb) && rb->fd < 0) {
> -                ret = madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_REMOVE);
>              } else {
> -                ret = madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_DONTNEED);

posix_madvise(QEMU_MADV_DONTNEED) has completely different semantics
then madvise() -- it's not a discard that we need here.

So ram_block_discard_range() would now succeed in environments (BSD?)
where it's supposed to fail.

So AFAIKs this isn't sane.

-- 
Thanks,

David / dhildenb


