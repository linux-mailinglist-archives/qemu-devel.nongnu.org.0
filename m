Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB522F9B74
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 09:45:08 +0100 (CET)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Q9l-0001n7-Rj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 03:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1Q8i-0001Nn-8O
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 03:43:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1Q8g-0004wE-Ci
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 03:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610959433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/x+WG+vnjluQVbJhtmyH4c9jiwrS1ck2Ee9Tp6iZJ0=;
 b=Ez8khqL02n34f5sJrxwlboOyJkPa5mi6cQfye6BYGKkGQdKw+sPa7qtcp8QwWHWAHlP5qV
 37UHEQT1PjYuuZXIJEo5eD5Ryx/9ib6Yu1Um9QAjzkoVUuyGTOuECljltwkDR0cfY3fmIG
 uLmGTdCI50HO2oJVwNz2XCCl7Z40YVQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-5XFRpO8xPLGDwM6V7pCwqg-1; Mon, 18 Jan 2021 03:43:50 -0500
X-MC-Unique: 5XFRpO8xPLGDwM6V7pCwqg-1
Received: by mail-wr1-f72.google.com with SMTP id u14so7973198wrr.15
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 00:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t/x+WG+vnjluQVbJhtmyH4c9jiwrS1ck2Ee9Tp6iZJ0=;
 b=W4zNYrjjPqyyXATTAwtqUl27K9My4gNUs4g28b7PbXaVxp/LkrlAs+c3UQboZ7eDis
 oklGBm3TFJV60wbqih83IXFBD0B0JWtM4qW8SgD+CaBuXOHzWyb+IGQ9nbTLxoJh3r2X
 lbI7OxcdtcZ4Y5ubuGgyIi5JZSj3SVWRiPtXoPaB4fx1pNqzcXCT8AzwYtNinmsHKiAV
 pLfRDfyOBasTl5zvVjyxvr7tzKGgSaPq/0gYLpJEnkwYSuz6qgOHxiAVDtuPzyktpSpw
 OvOLfge7jGu4QxA1TpIQ/2+4MJI+kBsus0GBTJMAZnieuAu/N38fL4GFPXDfSgkim6TJ
 LHqg==
X-Gm-Message-State: AOAM533hM0u7w1DHNBkPcWbk3b6BZPdJy+ugW4y2+emBLZ47ToLFs2U6
 qaBvW+drupupmI1foP8y98gh1GzbPsrmcMhoZPxA0l/SeumDXwcyUBxHWsLZl4UXTqhMNJpDbnq
 OxfpQwUNFDlObMqY=
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr24853582wrr.326.1610959429645; 
 Mon, 18 Jan 2021 00:43:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5M8E8zniNAs9+9P++4t/gZDvnkP5i6ihCUxQXMWiENfKUcj+RVQhFnNgTkEHdQBSmAnLpkw==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr24853561wrr.326.1610959429407; 
 Mon, 18 Jan 2021 00:43:49 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v1sm24882149wmj.31.2021.01.18.00.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 00:43:48 -0800 (PST)
Subject: pending fuzzing patches (was Re: [PATCH 2/2] fuzz: log the arguments
 used to initialize QEMU)
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210117201014.271610-1-alxndr@bu.edu>
 <20210117201014.271610-3-alxndr@bu.edu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4e63a37a-d9f1-7841-3761-6f8cd7ac9051@redhat.com>
Date: Mon, 18 Jan 2021 09:43:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117201014.271610-3-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/01/21 21:10, Alexander Bulekov wrote:
> This is useful for building reproducers. Instead checking the code or
> the QEMU_FUZZ_ARGS, the arguments are at the top of the crash log.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   tests/qtest/fuzz/fuzz.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index 238866a037..496d11a231 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -159,6 +159,8 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
>       char *target_name;
>       const char *bindir;
>       char *datadir;
> +    GString *cmd_line;
> +    gchar *pretty_cmd_line;
>       bool serialize = false;
>   
>       /* Initialize qgraph and modules */
> @@ -217,7 +219,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
>       }
>   
>       /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
> -    GString *cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
> +    cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
>       g_string_append_printf(cmd_line, " %s -qtest /dev/null ",
>                              getenv("QTEST_LOG") ? "" : "-qtest-log none");
>   
> @@ -226,6 +228,13 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
>       wordexp(cmd_line->str, &result, 0);
>       g_string_free(cmd_line, true);
>   
> +    if (getenv("QTEST_LOG")) {
> +        pretty_cmd_line  = g_strjoinv(" ", result.we_wordv + 1);
> +        printf("Starting %s with Arguments: %s\n",
> +                result.we_wordv[0], pretty_cmd_line);
> +        g_free(pretty_cmd_line);
> +    }
> +
>       qemu_init(result.we_wordc, result.we_wordv, NULL);
>   
>       /* re-enable the rcu atfork, which was previously disabled in qemu_init */
> 

Hi Alexander, can you send _me_ a pull request for all the pending 
fuzzing patches?  I haven't paid much attention, but I have seen 
external contributions and I have the feeling that they aren't being 
applied/reviewed promptly.

Paolo


