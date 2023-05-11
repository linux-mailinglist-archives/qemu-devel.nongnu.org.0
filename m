Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85CD6FF069
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:11:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4Bq-0004me-23; Thu, 11 May 2023 07:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px4Bo-0004mA-7K
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:10:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px4Bi-00074J-JK
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683803420;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asHmG+9xlIkBLFp53LtCf/l5MjN8TcX5/UEih5bwihg=;
 b=JJEZraWw8it0QTzxtiCzscG/arKyTL8QyGCEG/ZXOK7BnLw28Wmu8Fss2usgCy+a9P1CGz
 733owwgVRUZ/l8zkP0w9PdlIEiAfXKzo+s3mIUFarkptvYuC84Z0iU5+ZdKUzFq5nlCdhg
 6jXgQxMVoBCyI5GZSNqeUjXSSl1cBuY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-Jnq9Vti3NiK0GXQcT7r3xQ-1; Thu, 11 May 2023 07:10:19 -0400
X-MC-Unique: Jnq9Vti3NiK0GXQcT7r3xQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3078ad2f421so3655606f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683803418; x=1686395418;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=asHmG+9xlIkBLFp53LtCf/l5MjN8TcX5/UEih5bwihg=;
 b=XLM0CCym8E+TIs2GEcqklJ9m/UG9Flu3evUcd4nc+HOacvJpwf8Zgz2bVYYMr8n0ME
 5kcY/afXQFZbl3m1JNV9S6LtUzfRM8pstxAJHDuVQfgPXJyU6RqiROnaNxHrIqnMtKd/
 XzeexDZ/FVGOU0erXF11yUkQPSasi2FOjvipIFjhXQdCEjdOjzfbGXQQ1iAn5Bb35q7O
 0b0XbO9UQyYqEmi7u1fLviTITyGDPRb4t+7rFZdmU6tMQVJuDFJUn6UmzH2GxqZAI9YJ
 9/lvDDYZvVZQ/Wlq5mDtqMnat9T/Fk8AvOzZ4krK+qWpkpbL1Na310GvpXckIGcvtdtz
 2o+w==
X-Gm-Message-State: AC+VfDxIIwyIehIOzpNVi5TKDk5YaPVIwYj9JAgklOomHWhUdJM2c+N3
 p7qd5+G+l0BlBs+cSBppgmNJ4j7DDWFO2fGNbqUIeIwGJsR4yNtl5iluFRej/a0ayZQa+LspY13
 clhW+j4BnPTVj22k=
X-Received: by 2002:adf:e58b:0:b0:306:2df6:fa1f with SMTP id
 l11-20020adfe58b000000b003062df6fa1fmr13038127wrm.13.1683803418186; 
 Thu, 11 May 2023 04:10:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+Ml//ayXSgVnwzdjTQaWa0mlqESrC+dsY5qSkfe5uG/2gtREq/fCfuFfsEAEiST3E7PVUkw==
X-Received: by 2002:adf:e58b:0:b0:306:2df6:fa1f with SMTP id
 l11-20020adfe58b000000b003062df6fa1fmr13038109wrm.13.1683803417815; 
 Thu, 11 May 2023 04:10:17 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 y25-20020a05600c365900b003f42456c490sm12460896wmq.33.2023.05.11.04.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 04:10:17 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] linux-user: Drop uint and ulong
In-Reply-To: <f1c3df75-dcc2-7c93-5c41-0cedbea72d25@vivier.eu> (Laurent
 Vivier's message of "Thu, 11 May 2023 12:38:22 +0200")
References: <20230511085056.13809-1-quintela@redhat.com>
 <f1c3df75-dcc2-7c93-5c41-0cedbea72d25@vivier.eu>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 13:10:16 +0200
Message-ID: <877ctf5dk7.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Laurent Vivier <laurent@vivier.eu> wrote:
> Le 11/05/2023 =C3=A0 10:50, Juan Quintela a =C3=A9crit=C2=A0:
>> These are types not used anymore anywhere else.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/mmap.c    | 2 +-
>>   linux-user/syscall.c | 8 ++++----
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
>> index 0aa8ae7356..55dd143a10 100644
>> --- a/linux-user/mmap.c
>> +++ b/linux-user/mmap.c
>> @@ -859,7 +859,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong=
 old_size,
>>     static bool can_passthrough_madvise(abi_ulong start, abi_ulong
>> end)
>>   {
>> -    ulong addr;
>> +    abi_ulong addr;
>>         if ((start | end) & ~qemu_host_page_mask) {
>>           return false;
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 69f740ff98..dd0349712b 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -309,16 +309,16 @@ _syscall0(int, sys_gettid)
>>   #endif
>>     #if defined(TARGET_NR_getdents) &&
>> defined(EMULATE_GETDENTS_WITH_GETDENTS)
>> -_syscall3(int, sys_getdents, uint, fd, struct linux_dirent *, dirp, uin=
t, count);
>> +_syscall3(int, sys_getdents, unsigned int, fd, struct linux_dirent *, d=
irp, unsigned int, count);
>>   #endif
>>   #if (defined(TARGET_NR_getdents) && \
>>         !defined(EMULATE_GETDENTS_WITH_GETDENTS)) || \
>>       (defined(TARGET_NR_getdents64) && defined(__NR_getdents64))
>> -_syscall3(int, sys_getdents64, uint, fd, struct linux_dirent64 *, dirp,=
 uint, count);
>> +_syscall3(int, sys_getdents64, unsigned int, fd, struct linux_dirent64 =
*, dirp, unsigned int, count);
>>   #endif
>>   #if defined(TARGET_NR__llseek) && defined(__NR_llseek)
>> -_syscall5(int, _llseek,  uint,  fd, ulong, hi, ulong, lo,
>> -          loff_t *, res, uint, wh);
>> +_syscall5(int, _llseek,  unsigned int,  fd, unsigned long, hi, unsigned=
 long, lo,
>> +          loff_t *, res, unsigned int, wh);
>>   #endif
>>   _syscall3(int, sys_rt_sigqueueinfo, pid_t, pid, int, sig, siginfo_t *,=
 uinfo)
>>   _syscall4(int, sys_rt_tgsigqueueinfo, pid_t, pid, pid_t, tid, int, sig,
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

I assume this goes through your tree, right?

Later, Juan.


