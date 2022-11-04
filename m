Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2690B6198D9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 15:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqxN9-0000BD-Hz; Fri, 04 Nov 2022 10:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqxN7-00009j-0E
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 10:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqxN4-0007oM-No
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 10:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667570913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F81pttFdbfmsLNaUHX8ip+H3ml9caj4SrX+nqGEF1IU=;
 b=bMFgJc/aOtxL3o+tZU3+c+rxU32FUc+KVkCpsZw9vKsNY1QT0fhZUQwNUVZIwKq/nOFwl7
 rWQMO6Pq9YOY8Fb0UnrjRgUnFYp4pqsL4j1DdNTFdCcDh0zeiTp5mHRNm2/TZPZCrXVUW9
 kax+wbUh2AgMjAcJc80LCadix2tmzHQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-9FvT7gZoM3i0E3GhzqKuCw-1; Fri, 04 Nov 2022 10:08:32 -0400
X-MC-Unique: 9FvT7gZoM3i0E3GhzqKuCw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so3787125wmb.0
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 07:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F81pttFdbfmsLNaUHX8ip+H3ml9caj4SrX+nqGEF1IU=;
 b=ROFP8M/GiNHRgSgCjYYHAnawdNL6jRrmBaIEF8ufaXfiESE1O/5pNCFmSiFb7kypeK
 GLQyKLyRCgeI1a1rJRQo6muCJiHMTR4Zs8bkCJnPyap5B+kFiQbVQBJYKpMYuF/pe90d
 dPF8CPL3kPIqetbl3jgobkQI0iRgFv8Cbe46o2ULhQKN9g7HmRycMASpJk3K1pgFkrVs
 KEAnf7q5H/peHENu5ur2gNPbgkke0WGuj7FkGmbj0VT5rjHepINXCn26wOO+b2xWaioB
 0SZUh/SNxfprF3dqe2wE1i7w3Ds6NiW5YZONz9sJXh06fAwr62v7FVeJKJJTHbMsBwAV
 IABw==
X-Gm-Message-State: ACrzQf23Y+8Momgat/jWqtMtWBB0GC8XUCZyvtmwZXGU5E2VwNc/c+1A
 ZXL7+32gyBkBc49TgL6v+JBPF7xeILshk2vyH7MXBFEYQYsWKJwNURm4H1ULyQwYOYskU1lbpzq
 mz8ltIpgh8WimBrA=
X-Received: by 2002:a5d:4ac8:0:b0:236:781a:8d2d with SMTP id
 y8-20020a5d4ac8000000b00236781a8d2dmr23214126wrs.715.1667570909885; 
 Fri, 04 Nov 2022 07:08:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+iBh09v+z6Ziw9YViIfjc6YDRFYTdxTcQ3thrnKrPZN0Qh5T6Ge04zrc7gn5th3ePfm3LgA==
X-Received: by 2002:a5d:4ac8:0:b0:236:781a:8d2d with SMTP id
 y8-20020a5d4ac8000000b00236781a8d2dmr23214098wrs.715.1667570909498; 
 Fri, 04 Nov 2022 07:08:29 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c358700b003c6b9749505sm1002842wmq.30.2022.11.04.07.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 07:08:28 -0700 (PDT)
Message-ID: <6d2f8cc3-f2de-d13a-8691-f71efcba5b81@redhat.com>
Date: Fri, 4 Nov 2022 15:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] gitlab-ci: increase clang-user timeout
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221104113659.427690-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221104113659.427690-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/11/2022 12.36, Stefan Hajnoczi wrote:
> The clang-user test exceeds the 1 hour timeout occassionally.
> 
> Philippe Mathieu-Daudé has pointed out that the number of tcg tests has
> increased since QEMU 7.1. The execution time therefore probably reflects
> a legitimate increase in tests rather than a performance regression.
> 
> Bump the timeout to prevent CI failures.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
> - Increase the timeout instead of splitting tests [Thomas]
> ---
>   .gitlab-ci.d/buildtest.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 6c05c46397..7173749c52 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -327,6 +327,7 @@ clang-user:
>     extends: .native_build_job_template
>     needs:
>       job: amd64-debian-user-cross-container
> +  timeout: 70m
>     variables:
>       IMAGE: debian-all-test-cross
>       CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system

Reviewed-by: Thomas Huth <thuth@redhat.com>


