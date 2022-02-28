Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7702D4C6E76
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:41:59 +0100 (CET)
Received: from localhost ([::1]:36970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgHm-0000cn-90
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:41:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOgCg-0005jj-BO
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOgCc-0004eU-QQ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646055397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=APftX7YIpYc0tB9gtIi3fPCMV+d8ZrFeI7z4nQ8Fpu8=;
 b=GHXreJ310NNyuODbKwd9YU99CRxg16Mcq4gbOoWZSryXd+MByoiprMY3PJyxxpd19CCQEd
 nImfNWb+7Fc+BOptMqRWVY8a7eSIYAAVQy0rMR1mR14DrqE+55Ik4JF9YM+zHzYx/Escc4
 E8HLQ03vjE3ldbISIWhzQrf/zBZs7Bs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-qDXSziBhO8eHvM8hWrigEQ-1; Mon, 28 Feb 2022 08:36:33 -0500
X-MC-Unique: qDXSziBhO8eHvM8hWrigEQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b00380e3425ba7so6080390wms.9
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 05:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=APftX7YIpYc0tB9gtIi3fPCMV+d8ZrFeI7z4nQ8Fpu8=;
 b=7FihagY0XJnPJ0W+k0DW0OY5NtK+exR6U8nvwPt4jl13Gqigl+tKLt9s9lJ8GIPYuw
 /1G1sjQO1YiLoRDLLseuPYMa4XcafpV1STRZbxCUPUtSAyofVeCH4PzUZ/dblqobsafB
 c6Z5XeNTBmMgezQcY6ozuWb0IPoAaHRUS8zLGI5OUTpbTnZa7Hk5G+l6oO5pkiortqwX
 02E0ecMFrOhIr92qES+JSOol7oE3dhnbsblwPNv/BJA34oSkwm0e6S0lHmUdDSqleQjh
 jUwlubUatiRNQiU0n2Ze1WmdM5YxOq29Xs+AYFOymJswsTuEH50Svcrs6yqmMLWqhovX
 Y0KA==
X-Gm-Message-State: AOAM531PR7+46y5SbrAUPkG/EkC2s9ip49rzmLGSIUq3eVqFpEUSrxVi
 xtPgXa3+I9Wai85SoPIvucCLA9+GjF3z1RP9gEu5Go8pH5xNf+dIOr3+Rq+GuTEX2Z1dAd2j1ay
 mfaRE507ec2qZsB8=
X-Received: by 2002:a7b:c939:0:b0:37b:c13f:6fa3 with SMTP id
 h25-20020a7bc939000000b0037bc13f6fa3mr13269340wml.72.1646055392261; 
 Mon, 28 Feb 2022 05:36:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSXR+fLIaBX+NPE0AXC8TxRCMur6WKegdJHhZVjwrr8dql7o8L81xZWOueDpLfLO9Y5EpcFA==
X-Received: by 2002:a7b:c939:0:b0:37b:c13f:6fa3 with SMTP id
 h25-20020a7bc939000000b0037bc13f6fa3mr13269311wml.72.1646055391983; 
 Mon, 28 Feb 2022 05:36:31 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b00380e3225af9sm11392948wms.0.2022.02.28.05.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 05:36:31 -0800 (PST)
Message-ID: <493ea7b6-4e62-5c6e-682b-d5a787ae9299@redhat.com>
Date: Mon, 28 Feb 2022 14:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <20220227223522.91937-10-wwcohen@gmail.com> <5277572.8N0aQqchxN@silver>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <5277572.8N0aQqchxN@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/02/2022 14.20, Christian Schoenebeck wrote:
> On Sonntag, 27. Februar 2022 23:35:20 CET Will Cohen wrote:
>> From: Keno Fischer <keno@juliacomputing.com>
>>
>> Darwin does not support mknodat. However, to avoid race conditions
>> with later setting the permissions, we must avoid using mknod on
>> the full path instead. We could try to fchdir, but that would cause
>> problems if multiple threads try to call mknodat at the same time.
>> However, luckily there is a solution: Darwin includes a function
>> that sets the cwd for the current thread only.
>> This should suffice to use mknod safely.
>>
>> This function (pthread_fchdir_np) is protected by a check in
>> meson in a patch later in this series.
>>
>> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
>> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
>> [Will Cohen: - Adjust coding style
>>               - Replace clang references with gcc
>>               - Note radar filed with Apple for missing syscall
>>               - Replace direct syscall with pthread_fchdir_np and
>>                 adjust patch notes accordingly
>>               - Declare pthread_fchdir_np with
>>               - __attribute__((weak_import)) to allow checking for
>>                 its presence before usage
>>               - Move declarations above cplusplus guard
>>               - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
>>                 presence in 9p-util
>>               - Rebase to apply cleanly on top of the 2022-02-10
>>                 changes to 9pfs
>>               - Fix line over 90 characters formatting error]
>> Signed-off-by: Will Cohen <wwcohen@gmail.com>
>> ---
>>   hw/9pfs/9p-local.c       |  4 ++--
>>   hw/9pfs/9p-util-darwin.c | 33 +++++++++++++++++++++++++++++++++
>>   hw/9pfs/9p-util-linux.c  |  6 ++++++
>>   hw/9pfs/9p-util.h        | 11 +++++++++++
>>   meson.build              |  1 +
>>   5 files changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
>> index a0d08e5216..d42ce6d8b8 100644
>> --- a/hw/9pfs/9p-local.c
>> +++ b/hw/9pfs/9p-local.c
>> @@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
>> *dir_path,
>>
>>       if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
>>           fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
>> -        err = mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
>> +        err = qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
>>           if (err == -1) {
>>               goto out;
>>           }
>> @@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
>> *dir_path, }
>>       } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
>>                  fs_ctx->export_flags & V9FS_SM_NONE) {
>> -        err = mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
>> +        err = qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
>>           if (err == -1) {
>>               goto out;
>>           }
>> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
>> index cdb4c9e24c..bec0253474 100644
>> --- a/hw/9pfs/9p-util-darwin.c
>> +++ b/hw/9pfs/9p-util-darwin.c
>> @@ -7,6 +7,8 @@
>>
>>   #include "qemu/osdep.h"
>>   #include "qemu/xattr.h"
>> +#include "qapi/error.h"
>> +#include "qemu/error-report.h"
>>   #include "9p-util.h"
>>
>>   ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char
>> *name, @@ -62,3 +64,34 @@ int fsetxattrat_nofollow(int dirfd, const char
>> *filename, const char *name, close_preserve_errno(fd);
>>       return ret;
>>   }
>> +
>> +/*
>> + * As long as mknodat is not available on macOS, this workaround
>> + * using pthread_fchdir_np is needed.
>> + *
>> + * Radar filed with Apple for implementing mknodat:
>> + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
>> + */
>> +#if defined CONFIG_PTHREAD_FCHDIR_NP
>> +
>> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>> +{
>> +    int preserved_errno, err;
>> +    if (!pthread_fchdir_np) {
>> +        error_report_once("pthread_fchdir_np() not available on this version of macOS");
> 
> You took the code style error message a bit too literal; this line is still
> too long:
> 
> WARNING: line over 80 characters
> #199: FILE: hw/9pfs/9p-util-darwin.c:81:
> +        error_report_once("pthread_fchdir_np() not available on this version of macOS");
> 
> total: 0 errors, 1 warnings, 91 lines checked
> 
> However this is too trivial to send a v10 just for this. If there are no other
> issues in this v9 then I'll simply fix this on my end. My plan is to queue
> this series tomorrow.

For lines less than 90 characters, it's just a warning, and I think it's ok 
in such cases to keep it longer than 80 characters, if the result of 
breaking it up would look more awkward otherwise.

  Thomas


