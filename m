Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782AE3335D6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 07:32:02 +0100 (CET)
Received: from localhost ([::1]:35222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJsO1-0002Q3-IO
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 01:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJsMi-0001ac-Au
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 01:30:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJsMg-0007do-2G
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 01:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615357837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bw2bmU0rWIucuNsRVX45Zv78XBiPkhLe8Y/J+DUlyO0=;
 b=e7BB17wh8mfyaYIBxVi9ivnKptm4LGZW//88dfF7Y20Pl5K9M3jAvTck3pP1WsbC+Fj+kj
 8BQRvaKZ+BJJLPaVFcefnMZdCiDSXOU90W6t3U7sv2A5QbmZUioqhgJOQ+6nrl2PDXu4r9
 Rr/mLSJZk6OKb3/g/bpbcJL5krBZNSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-o8g-ojUvOMOAXJOwBkOZeQ-1; Wed, 10 Mar 2021 01:30:34 -0500
X-MC-Unique: o8g-ojUvOMOAXJOwBkOZeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71F71192CC41;
 Wed, 10 Mar 2021 06:30:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC13860C0F;
 Wed, 10 Mar 2021 06:30:24 +0000 (UTC)
Subject: Re: [PATCH] fuzz: don't leave orphan llvm-symbolizers around
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210310061236.947182-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a5f16baa-3cb3-93be-c0f8-9469fc37a7b2@redhat.com>
Date: Wed, 10 Mar 2021 07:30:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310061236.947182-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, f4bug@amsat.org,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2021 07.12, Alexander Bulekov wrote:
> I noticed that with a sufficiently small timeout, the fuzzer fork-server
> sometimes locks up. On closer inspection, the issue appeared to be
> caused by entering our SIGALRM handler, while libfuzzer is in it's crash
> handlers. Because libfuzzer relies on pipe communication with an
> external child process to print out stack-traces, we shouldn't exit
> early, and leave an orphan child. Check for children in the SIGALRM
> handler to avoid this issue.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   tests/qtest/fuzz/generic_fuzz.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index ee8c17a04c..387ae2020a 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -583,6 +583,21 @@ static void handle_timeout(int sig)
>           fprintf(stderr, "[Timeout]\n");
>           fflush(stderr);
>       }
> +
> +    /*
> +     * If there is a crash, libfuzzer/ASAN forks a child to run an
> +     * "llvm-symbolizer" process for printing out a pretty stacktrace. It
> +     * communicates with this child using a pipe.  If we timeout+Exit, while
> +     * libfuzzer is still communicating with the llvm-symbolizer child, we will
> +     * be left with an orphan llvm-symbolizer process. Sometimes, this appears
> +     * to lead to a deadlock in the forkserver. Use waitpid to check if there
> +     * are any waitable children. If so, exit out of the signal-handler, and
> +     * let libfuzzer finish communicating with the child, and exit, on its own.
> +     */
> +    if (waitpid(-1, NULL, WNOHANG) == 0) {
> +        return;
> +    }
> +
>       _Exit(0);
>   }

Acked-by: Thomas Huth <thuth@redhat.com>


