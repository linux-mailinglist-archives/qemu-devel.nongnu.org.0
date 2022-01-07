Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC1B487D9A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:20:55 +0100 (CET)
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5vjK-0004kw-Ne
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 15:20:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5vgs-0002pf-Jr
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:18:22 -0500
Received: from [2607:f8b0:4864:20::536] (port=34522
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5vgr-0004pc-4P
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:18:22 -0500
Received: by mail-pg1-x536.google.com with SMTP id g22so6357648pgn.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 12:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H/I3ku4vsffsSeA5K0YyXrYX/tBYelSxhAOG8t1TM48=;
 b=sr2hB0CRGHwm6TnUlGSJL1Y8BxN/Vdu+rFUTTrUKOuuuY3oJYyTpcWrGpqIY+XFG6d
 BnRTUJ8Y8MS4U0fo53emVvL0txzYPPmxUWvucoX8EjzuqoxQtbv+4Qqv39buXEeF6WyA
 D3wTzjI47cedkFrurGaLmhldMXgod8c5VF246AzNdI7FolGkcD7CYP0K4rEB7RNlLTQb
 8luWid0Nm39yYZQiL2uQ4O5n6C7Xi+lpA0cjWBM+1+hWl9VxPims2EIfoYc+BnvvJx4+
 TtbrEekx7lXDfBz7DFqGLexZXS2nMhFipzZ8u9Gar2xP00OHmrKiYr08oYMaJvSWJjoU
 er3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H/I3ku4vsffsSeA5K0YyXrYX/tBYelSxhAOG8t1TM48=;
 b=L1WqNA3kE78OFd+/4jwPWlkKauh1TGjW93kWLxaIwMl0pEy6+fPeXVPsVSCJ9DZ+Rc
 NyCP2nxhCHM28BYt1sMOSMfmyvLYcThZHW+M50CSZtZQc3y0cusWA18l/aTh29IB3HKr
 5cTVxbnlyXn/Gf+M9C3RL7mfBcVjgac+dAN8Cec8hXeIQMjCcdZISBptbFJoaXviSUdX
 /+EW3bLsCkUcfMhbDbP3T2sZ4aWAUkoX8RUY79g6gVKnNyAQHhcTvpQvO41Srq2WuUbp
 QAvF6ExXfUJt8MxtnNbkLqHZtEEHpbr1HJrt7SCwn8bce5eIMgWdw4R0vNcKHxaHo+rH
 INhA==
X-Gm-Message-State: AOAM531VSXWOME7tvyDz89pTiJQCdCO2/NHGV2J6QHziiNYb953Mz3wv
 lO743BbeQgl59DEZM+0yYf2dCQ==
X-Google-Smtp-Source: ABdhPJxkATvUTuARJTbEuulCWoSCJJ55iHOBRNWIdbBf2Ni43JpvrFT4ToveYbSPAYVYWfV/eBkEtg==
X-Received: by 2002:a05:6a00:1254:b0:4bb:68cc:58b1 with SMTP id
 u20-20020a056a00125400b004bb68cc58b1mr66274933pfi.19.1641586699834; 
 Fri, 07 Jan 2022 12:18:19 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id o184sm6479783pfb.90.2022.01.07.12.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 12:18:19 -0800 (PST)
Subject: Re: [PATCH] softmmu/device_tree: Silence compiler warning with
 --enable-sanitizers
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20220107133844.145039-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4aa47d06-ba24-fb92-c2e0-cd207f7d17b5@linaro.org>
Date: Fri, 7 Jan 2022 12:18:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107133844.145039-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, qemu-trivial@nongnu.org,
 Andrew Jones <drjones@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 5:38 AM, Thomas Huth wrote:
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3965c834ca..9e96f5ecd5 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -564,7 +564,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>           return -1;
>       }
>   
> -    while (p) {
> +    do {
>           name = p + 1;
>           p = strchr(name, '/');
>           namelen = p != NULL ? p - name : strlen(name);
> @@ -584,7 +584,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>           }
>   
>           parent = retval;
> -    }
> +    } while (p);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

In addition, the copy between 'path' and 'p' is unnecessary -- one of the variables should 
be removed.  Either rename the parameter to 'p', or rename all uses to 'path'.


r~

