Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C91768EAA6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:10:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgRR-0008It-Q5; Wed, 08 Feb 2023 04:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPgRO-0008IQ-Jg
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:08:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPgRM-0006r2-UF
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675847311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=84WN5CccIb4mlx3XnB4r9pQcdCoy0CLHpPREkMqoI80=;
 b=MYrlvPpyX8SRPmr48U15Y9BGe7jbq7BszNzXLdJMTZQUCmn9brM4bHWUmjHLx5lHWC3gTI
 kReO6Umtcqhm7e3Lm2/kjUYGK0SRld2sE/RjsCpJ77w1PRumDXfxapTtP2F1H4qYfPT7rP
 rAiL9eH998mFJUqxHH9tsAnGLvQ44KM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-160-nxchuAMfO_Cx_6gdfzd4NQ-1; Wed, 08 Feb 2023 04:08:30 -0500
X-MC-Unique: nxchuAMfO_Cx_6gdfzd4NQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 f14-20020a0560001a8e00b002c3b562d76cso2614976wry.12
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 01:08:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=84WN5CccIb4mlx3XnB4r9pQcdCoy0CLHpPREkMqoI80=;
 b=E2jHprE9PEoucY4TcJsc30Co/E5hOl4F/ALFkire9o3ed+AnW7MfjkaMp0g9Iwnyfi
 9A/OTsf6uoZ6nmzK9ivzSrKkh2UpoP5U/DlYCZXyMcJIt95Uh47u3PoKnPUHm1wgxAQu
 0Ag7ycP9iDUtjQZGDKyvwAMPUZEia2DxQg6sMXgz6Zo8aAZ8agRw3jAAw/Hc5VCit3xU
 Jjuaz5NuOInBkdefMX9M9B5C2DKZbox9YXSVXxKQsJOP+cQdu+7YZphjck2RCF+1DP1m
 pzDM6Suf8SXUw8duOpBybJPm3DN+tHX+j1Y+jVtT775r+SRfEfmobZSdmij9IyC4R03Q
 KA5A==
X-Gm-Message-State: AO0yUKVFasMiIazW9064YVGo68fveCL6ky/LorvtX1jU6m5K0UyxNiwf
 6iWyMhpTFfNLGLfxuSAva8k2k3km/mYEjZIEbFgj67OJ05XBRCQNhgmnyguYaOdhjbF7Q/qAWv7
 TkS72ZNAc7UeR5HY=
X-Received: by 2002:a05:600c:1613:b0:3df:b5ae:5289 with SMTP id
 m19-20020a05600c161300b003dfb5ae5289mr5679002wmn.8.1675847309379; 
 Wed, 08 Feb 2023 01:08:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9z5VUKniyrQYEpwuPl5CI/zKdtztjkfCIw6xLsMrr1OJE5WOLXnLsTryhFiEI397FeJ0OTzw==
X-Received: by 2002:a05:600c:1613:b0:3df:b5ae:5289 with SMTP id
 m19-20020a05600c161300b003dfb5ae5289mr5678996wmn.8.1675847309244; 
 Wed, 08 Feb 2023 01:08:29 -0800 (PST)
Received: from ?IPV6:2003:cf:d71d:64b4:b0d4:7b71:b8bd:d2cc?
 (p200300cfd71d64b4b0d47b71b8bdd2cc.dip0.t-ipconnect.de.
 [2003:cf:d71d:64b4:b0d4:7b71:b8bd:d2cc])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003dc34edacf8sm1419544wmq.31.2023.02.08.01.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 01:08:28 -0800 (PST)
Message-ID: <648e9201-eb76-61bd-d127-11c8605c9531@redhat.com>
Date: Wed, 8 Feb 2023 10:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/4] qemu-io: add -r option to register I/O buffer
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Fiona Ebner <f.ebner@proxmox.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>
References: <20230207203719.242926-1-stefanha@redhat.com>
 <20230207203719.242926-4-stefanha@redhat.com>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230207203719.242926-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07.02.23 21:37, Stefan Hajnoczi wrote:
> The blk_register_buf() API is an optimization hint that allows some
> block drivers to avoid I/O buffer housekeeping or bounce buffers.
>
> Add an -r option to register the I/O buffer so that qemu-io can be used
> to test the blk_register_buf() API. The next commit will add a test that
> uses the new option.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   qemu-io-cmds.c | 204 +++++++++++++++++++++++++++++++------------------
>   1 file changed, 129 insertions(+), 75 deletions(-)

Reviewed-by: Hanna Czenczek <hreitz@redhat.com>

> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 1f60c23ba4..e7a02f5b99 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -414,24 +419,23 @@ static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
>       fclose(f);
>       f = NULL;
>   
> -    if (len > pattern_len) {
> -        len -= pattern_len;
> -        buf += pattern_len;
> -
> -        while (len > 0) {
> -            size_t len_to_copy = MIN(pattern_len, len);
> -
> -            memcpy(buf, buf_origin, len_to_copy);
> +    if (register_buf) {
> +        blk_register_buf(blk, alloc_buf, alloc_len, &error_abort);
> +    }
>   
> -            len -= len_to_copy;
> -            buf += len_to_copy;
> -        }
> +    end = buf + len;
> +    for (char *p = buf + pattern_len; p < end; p += pattern_len) {
> +        memcpy(p, buf, MIN(pattern_len, end - p));
>       }

Cool rewrite of this loop!


