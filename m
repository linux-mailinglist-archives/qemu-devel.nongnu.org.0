Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5AD2A4985
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:26:33 +0100 (CET)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZyCe-0007G6-FR
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kZxnw-0006A6-AR
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:01:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kZxnq-0006kI-UR
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604415653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqI3FPYVHRfZtxTeEpZHmOmAnGBpTISuvVMeXZjixAY=;
 b=CMDehd8EPsrl8pMUL0lyrqUGZei2xMu6f05PNuVTH43Os3mMZ7K2im2SMFZocaEhP1SJST
 94M+w3cYArywx/IA7lbUjgv8kHMi9vIbG8b5OdTJN+2BMVt+4eo1Pvq7UQjTFusXqTIsO3
 MczNyYd0+m8UBQ/1MR5IuE6KX71ksDM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-yXj2XyZOPkqbYDtsqZdlPw-1; Tue, 03 Nov 2020 10:00:51 -0500
X-MC-Unique: yXj2XyZOPkqbYDtsqZdlPw-1
Received: by mail-ed1-f70.google.com with SMTP id t4so7563680edv.7
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 07:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IqI3FPYVHRfZtxTeEpZHmOmAnGBpTISuvVMeXZjixAY=;
 b=tW+eJHTDNLNujf3OMnavpvpBDDlDyoAiDv2GoO8Ua5+2hPPLb2QK5BRqFSGGheD8AV
 lNa9WEYnr/+Qf4tZEqITotaRERlEXiS2iR58jNgpNX4jx3sZyoPMPBPtye7bVHjLSbsr
 vwClTeH/X6XKn8aJ79cIvYYQiAxOIsE5/wBD2AsoPUtBs/Y4A94OoJvajrlwcvMKW5G0
 oX7mbeB+QVZcw4j9njdwsNkLzCGM5+72WcixubWZ9bZCXI3o43FbjfCyh9Yq0uiQTkgO
 Gtu/WF/DohBksaZk3m+LRkd+/zlpaAervNuV/TXoXmcjBvPulCdEzuKimazsl+TYvMCh
 wUAA==
X-Gm-Message-State: AOAM530fyLyQKHsU7HMnTuPIQiuEbCdnPdyZpaCEzM01WnWnymXITn4J
 r8QbueQpEYQLJOjj9rBA38oKINb/IEs2kMDjGd7Bqc9n4dYl9Lm+DsoyH7sjoIQItQzBc/GPfpr
 H9tnvKbqjsPPl2t8=
X-Received: by 2002:a17:906:5793:: with SMTP id
 k19mr21061575ejq.410.1604415649740; 
 Tue, 03 Nov 2020 07:00:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDYDsBxWhG5ctIyZC9R+/4WkX7YmMAA2kYDR4D8fuCPdzyrgHdANkENDCEgGHkcidh8UUxCQ==
X-Received: by 2002:a17:906:5793:: with SMTP id
 k19mr21061560ejq.410.1604415649449; 
 Tue, 03 Nov 2020 07:00:49 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i14sm11099677ejp.2.2020.11.03.07.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 07:00:48 -0800 (PST)
Subject: Re: [PATCH] tests/qtest: Fix potential NULL pointer dereference in
 qos_build_main_args()
To: AlexChen <alex.chen@huawei.com>, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, thuth@redhat.com, lvivier@redhat.com
References: <5FA16ED5.4000203@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a46040dc-14f3-955c-3d8d-1aca9ad29f80@redhat.com>
Date: Tue, 3 Nov 2020 16:00:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5FA16ED5.4000203@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/11/20 15:53, AlexChen wrote:
> In qos_build_main_args(), the pointer 'path' is dereferenced before
> checking it is valid, which may lead to NULL pointer dereference.
> So move the assignment to 'cmd_line' after checking 'path' is valid.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  tests/qtest/fuzz/qos_fuzz.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
> index b943577b8c..cee1a2a60f 100644
> --- a/tests/qtest/fuzz/qos_fuzz.c
> +++ b/tests/qtest/fuzz/qos_fuzz.c
> @@ -70,7 +70,7 @@ static GString *qos_build_main_args(void)
>  {
>      char **path = fuzz_path_vec;
>      QOSGraphNode *test_node;
> -    GString *cmd_line = g_string_new(path[0]);
> +    GString *cmd_line;
>      void *test_arg;
> 
>      if (!path) {
> @@ -79,6 +79,7 @@ static GString *qos_build_main_args(void)
>      }
> 
>      /* Before test */
> +    cmd_line = g_string_new(path[0]);
>      current_path = path;
>      test_node = qos_graph_get_node(path[(g_strv_length(path) - 1)]);
>      test_arg = test_node->u.test.arg;
> 

Queued, thanks.

Paolo


