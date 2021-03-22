Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFE934487B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:02:43 +0100 (CET)
Received: from localhost ([::1]:58176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOM4o-0002hK-A7
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOLQ9-00005Q-UP
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:20:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOLQ8-00070j-3t
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:20:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id z2so17137963wrl.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9bYqvIxTsrOZoq0RcrywqWC8WcegfbPgLJYDoEecQL4=;
 b=kNYWwS5DIXDrb8bZpKSqmW5ebbbJZMBbaHxhkmCps6diKSSQ+87qN2ub48KJN5ZcmG
 JmLRnZDNHZAVW37JGZPVHATGliFeS8FSIQNvwQ/6HQrifRNPB4uWI9PLFf5Vb9UmE/sY
 khY+9nDOJEZUjvVyn2u7T1ep5GJ2gR0uqnrwouu5yiiFDDDaZ7iqceNB0VyuEj/oC7RK
 MATfGYfDLscjf64w0O2An5irkQRHlYpdI5GovCi3nkIipR3MiWgt3x4hBjf8bXFqpJWf
 cbxIQ04bSLs9xQbnDTHv9z/izpuOEVxnA2nDLc4kbMR0iBtpXHqC3jXE+H3mUJ0S7itc
 dE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9bYqvIxTsrOZoq0RcrywqWC8WcegfbPgLJYDoEecQL4=;
 b=QuEanMKDWPS+wTO1i+KnvSDvDQivsIExgM5TRTbJhyUydXm7J2cZS7niXvj3Fo3dHH
 9D/iq5/Z8w8RFGiYzqpqCeQgQ1BjpLLYzv3jQvZeWBYggiRIjakv5Q5sjj9TPOKrgmc8
 YbIOCd4LL9H9GIRj0iEZBNQb2RT0n/zbOEMXO+mTC2zY3n53cYemT6iIUj0gDn/ohoVF
 ECilU6y+Qy7svn4qH58Zs4rc4xKncUvghhGdDLlbemFP8s+gjBJN/O71XMOmPwS1OVDp
 12ueoVWIXWaUOoUI93wO+jfTTiiRjoH7ztyNNo/Rz6BI/rCZPHxTrI4wVNM0cYPTheoX
 V76w==
X-Gm-Message-State: AOAM530OZ3FXmXktBbma2rlT07aU+vYEDnNARmfRy6sDBUA3D8XTt7nu
 pA8gArAjauNwNj7rdhRu+As=
X-Google-Smtp-Source: ABdhPJxFpwmEG3rTI6Qj5Glu+KdCnUcjpiLFSpPl+e9gdm0+WtOXyIyO4XhH4dv1u+tg4akPx4WgoA==
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr65512wmg.171.1616422834681; 
 Mon, 22 Mar 2021 07:20:34 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q15sm19775419wrx.56.2021.03.22.07.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:20:33 -0700 (PDT)
Subject: Re: [PATCH] fuzz: Avoid deprecated misuse of -drive if=sd
To: Alexander Bulekov <alxndr@bu.edu>, Markus Armbruster <armbru@redhat.com>, 
 pbonzini@redhat.com
References: <20210319132008.1830950-1-armbru@redhat.com>
 <20210319144016.cxbkgsh2u7ot5vlg@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <631b4088-e6f1-c6d5-2226-e50cd47f1adf@amsat.org>
Date: Mon, 22 Mar 2021 15:20:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319144016.cxbkgsh2u7ot5vlg@mozz.bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, bsd@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 3:40 PM, Alexander Bulekov wrote:
> On 210319 1420, Markus Armbruster wrote:
>> qemu-fuzz-i386-target-generic-fuzz-sdhci-v3 uses -drive=sd where it
>> should use -drive if=none instead.  This prints a deprecation warning:
>>
>>     $ ./build-oss-fuzz/DEST_DIR/qemu-fuzz-i386-target-generic-fuzz-sdhci-v3 -runs=1 -seed=1
>>     [ASan warnings snipped...]
>> --> i386: -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive: warning: bogus if=sd is deprecated, use if=none
>>     INFO: Seed: 1
>>     [More normal output snipped...]
>>
>> Support for this usage will be gone soon.  Adjust the test.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

This patch doesn't apply:

$ git am -s 20210319_armbru_fuzz_avoid_deprecated_misuse_of_drive_if_sd.mbx
Applying: fuzz: Avoid deprecated misuse of -drive if=sd
error: patch failed: tests/qtest/fuzz/generic_fuzz_configs.h:182
error: tests/qtest/fuzz/generic_fuzz_configs.h: patch does not apply
Patch failed at 0001 fuzz: Avoid deprecated misuse of -drive if=sd
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Which makes sense because it is already in the tree as commit
9585376ab5e.

To ease maintainer/reviewers email based workflow, does it make
sense to configure patchew to reply "this patch/series has been
merged as sha1..range" or or "this patch/series has been superseded
by this one: [link of v(N+1)]"?

Thanks,

Phil.

