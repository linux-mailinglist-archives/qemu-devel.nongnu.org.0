Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2673B29DA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:05:53 +0200 (CEST)
Received: from localhost ([::1]:60890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKMy-00074k-Fs
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwKKl-0005dQ-2T
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:03:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwKKa-0002Aa-S4
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624521803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gdh3FW5FBx+LRCNrQ1CFnpX81rDcOIzdUWTAK7l1qLQ=;
 b=G4UYnc1lMELTWyaAnOrTkzxsjg0ftnI/pNauVnBvXhrI0Jb193c/9cfDibFc1+/8A27+9g
 hbeHhPVOpXoZEHPO1LZSxVQrMM6HRpLy5uJ9EYVQPp+P/LPemEJtTBnX5djJWPOuOz0nqD
 Jv8siycP3rev0g+HhzdrWIfJkXC2NtM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-NREirQZxMfmiqM2JUEsL8w-1; Thu, 24 Jun 2021 04:03:21 -0400
X-MC-Unique: NREirQZxMfmiqM2JUEsL8w-1
Received: by mail-wr1-f70.google.com with SMTP id
 j2-20020a5d61820000b029011a6a8149b5so1884112wru.14
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 01:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gdh3FW5FBx+LRCNrQ1CFnpX81rDcOIzdUWTAK7l1qLQ=;
 b=XuJ3CO9Tmx2f8D9mFsbZg+Ikwpy2GpCUDE7II1L7nN47JSVEpdQxz9xmHm8D6ptWvB
 qw7sPNgZKNyK+OtL/+iW1Vmp0uk1YWeHGqjdqjY1a0ZUb7mzirpD7zGKpz+yjTDt2GNj
 u1VUhnsZVfg9ChuyFdE6P7UcOE8taUZkJn0ArfbyxBLdzmva2moEfEt5SrAGPkUVIi1D
 Cjpid8mZPTDtX/YuhvtmbAXWwQt4f/UWjJKliq/K2ySSUlp5x2qJ7HJtCmLguerpZLJL
 zGV00ekC8jNb8gf1A4DASNHfybbLZ4DSREvz0mEyYBSLKDeX1/t7Xb74iwXhWeelZYxk
 bccQ==
X-Gm-Message-State: AOAM530ljPj1m1T9/PZu5CDgfDH5XmCGXtoxrTqhkm1nMM3YmSiUGFs3
 diPyusjNE3OsssYVVsspOzlup2Ai/zcoeNxHTBsS6F2zJQYoogxuDkfO2dy8ZcS4H7No660lbEd
 QKqYnYCrAryzuiG0=
X-Received: by 2002:adf:fc43:: with SMTP id e3mr2891830wrs.212.1624521800488; 
 Thu, 24 Jun 2021 01:03:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0K2YUI3gF2VFss7a5Hon2rSajn3MpfaF4fck5hQQQJ2RzhG7YUvitlW4o5edo5rvGBwPf1w==
X-Received: by 2002:adf:fc43:: with SMTP id e3mr2891799wrs.212.1624521800253; 
 Thu, 24 Jun 2021 01:03:20 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w8sm2288476wre.70.2021.06.24.01.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 01:03:19 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] fuzz: add an instrumentation filter
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210624034503.86256-1-alxndr@bu.edu>
 <20210624034503.86256-3-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cd900b47-46ae-ad2e-d665-23774cefe678@redhat.com>
Date: Thu, 24 Jun 2021 10:03:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624034503.86256-3-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: darren.kenny@oracle.com, Thomas Huth <thuth@redhat.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 5:45 AM, Alexander Bulekov wrote:
> By default, -fsanitize=fuzzer instruments all code with coverage
> information. However, this means that libfuzzer will track coverage over
> hundreds of source files that are unrelated to virtual-devices. This
> means that libfuzzer will optimize inputs for coverage observed in timer
> code, memory APIs etc. This slows down the fuzzer and stores many inputs
> that are not relevant to the actual virtual-devices.
> 
> With this change, clang versions that support the
> "-fsanitize-coverage-allowlist" will only instrument a subset of the
> compiled code, that is directly related to virtual-devices.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  configure                               | 11 +++++++++++
>  scripts/oss-fuzz/instrumentation-filter | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 scripts/oss-fuzz/instrumentation-filter

>  # Thread sanitizer is, for now, much noisier than the other sanitizers;
> @@ -6101,6 +6106,12 @@ if test "$fuzzing" = "yes" ; then
>      # rule for the fuzzer adds these to the link_args. They need to be
>      # configurable, to support OSS-Fuzz
>      FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
> +
> +    # Specify a filter to only instrument code that is directly related to
> +    # virtual-devices.
> +    if test "$have_clang_coverage_filter" = "yes" ; then
> +        QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=$source_path/scripts/oss-fuzz/instrumentation-filter"

Wouldn't it be more useful if we copy the instrumentation-filter
template to the build directory and use it from there? So we could
easily adapt individual fuzzing sessions while using the same
branch (not modifying the source). At least that would be my use
case :)

If so, then better rename as instrumentation-filter-template.txt, and
copy it as [fuzzer-]instrumentation-filter.txt.

Regards,

Phil.


