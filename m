Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F91B2E31AD
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 16:28:10 +0100 (CET)
Received: from localhost ([::1]:40946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXxp-00040q-7u
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 10:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXvS-0002vk-TM
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:25:42 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXvR-0001sb-FG
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:25:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id v14so7419872wml.1
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 07:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xlZetnIeb6OuMPnENm7/ys7FTWR8Cfvi6tCLkTjTjyg=;
 b=WzYjEBFNIrycfHbkwOeD5yLK2rzUh2sLqhZEf2yO0qciwzoDh/pGBGTzQZPpBO4jhg
 xW9OdD1n7coCOAgnVU0/J6LI34gHL1YLiGmAMAaLaldc6EyrDEXxkjGeThEtSuxY8DMD
 gHsTX8MEUBNdGqyQ1GvGe9bOxZ5TJivI+LT+YKpxiHSpjYixr45SgxY6RZ0a88k6z3DL
 aTWFLhaNkZ+dc5xDRqqcMTsqce21Kc5H2Gpl+KEJVPq6IAZqkOKwv0QHif3YPq5ZHHFY
 1HTyo6wR8+c/jNHfF4c7XUx9HBxv8cBhf+YNfLzriyOQHd1qUpSI8kS+H7tDHKYPn7Gc
 iPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xlZetnIeb6OuMPnENm7/ys7FTWR8Cfvi6tCLkTjTjyg=;
 b=DiGWGQoux/+sbNm/ypwSbWz0ZXkBCmweEJ6LuO7AGvEIhd9xCav1EY9TfVtdTp59AF
 rVgIx0UinFGCbgFaeVpc0IGowT67r1fb3Vg+omOdiqu/m4dyWlS7CIsLFHMkDx0m6J+r
 HEAIz4tSCwFohCjBiPpiW4Rb4/IJfYTbi+1SbXVFbPhoiSp+9bc755rH1t/wtNkBCiYK
 xvmlc4uZ3d5E9n69mmKInzUk880MsDQgrofGQvdATNA33zcQyDaMVAjq5N7eiD03JWxQ
 thVjJT5d1ZnZdyZvos//FlymNaUEPrM/U2MHq47+5nxBHMfoLnLWiw25ClCS5x86+VSh
 ypGg==
X-Gm-Message-State: AOAM532bzmJTt3GGoRT9ZDjgD6QfGpPs7Flx4764VyUD3Nu4tUnbSuCY
 XPoOTrxzEQTuf75DuIZIifs=
X-Google-Smtp-Source: ABdhPJzPyTMjUw9zp5d74DzqOy1F2IEp/+3tfeC7V2cGDOz0xr+ZMgM7SqZ2qCIRvrGSFTPxqLa+KQ==
X-Received: by 2002:a1c:e142:: with SMTP id y63mr17485298wmg.28.1609082739377; 
 Sun, 27 Dec 2020 07:25:39 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id i18sm52982157wrp.74.2020.12.27.07.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 07:25:38 -0800 (PST)
Subject: Re: [PATCH 02/16] tcg/s390x: Change FACILITY representation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201225201956.692861-1-richard.henderson@linaro.org>
 <20201225201956.692861-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1230742c-dc12-c66a-f42b-7bd092d76351@amsat.org>
Date: Sun, 27 Dec 2020 16:25:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201225201956.692861-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/25/20 9:19 PM, Richard Henderson wrote:
> We will shortly need to be able to check facilities beyond the
> first 64.  Instead of explicitly masking against s390_facilities,
> create a HAVE_FACILITY macro that indexes an array.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Change name to HAVE_FACILITY (david)
> ---
>  tcg/s390x/tcg-target.h     | 29 ++++++++-------
>  tcg/s390x/tcg-target.c.inc | 74 +++++++++++++++++++-------------------
>  2 files changed, 52 insertions(+), 51 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

