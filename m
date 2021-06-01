Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666D8396BE1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 05:29:15 +0200 (CEST)
Received: from localhost ([::1]:50056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnv5e-0001jc-8h
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 23:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnv3l-0000v6-GI
 for qemu-devel@nongnu.org; Mon, 31 May 2021 23:27:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnv3f-0001Y2-PD
 for qemu-devel@nongnu.org; Mon, 31 May 2021 23:27:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso575505wmh.4
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 20:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2f1Skp3a6/7WMQtgFRWpou6VjmqMg5VlNrqD33gdkYo=;
 b=RfLR+y6yL5xhc7Fy7iNVqxgfqv5EYC6hMtxFqlQYR772A3GhtaoIQZ9R8+C6GCru2J
 jBbGqNvSMjV6DGD8sYkpWwfoE8S/rnlXzRIovsWcnatBcIXbK/tzo4I39K+LsymWU8tH
 St6xe6NFjeEtcrDKGZxgY4l4Iu7yLJ9q291+TGlFOCb2rom7X6ypD8y9oO+DtJkOavdM
 /6+ZVDctcP0GbXsqNgDf1QR6iFZhKT0FNIFyO6kLa+L2kY0sS5sfQ/YWwDwnejIQwSTo
 YZiGrQhylkqJgy5Fec/pvzMpHWW9yC2mykEH+sPjTaLO6Um/sdrVpgrEZ5KaJYBh/713
 5hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2f1Skp3a6/7WMQtgFRWpou6VjmqMg5VlNrqD33gdkYo=;
 b=iifVclSlkkMNMb6ZaPBIEtZI9K06A/YIJUKt47AZ2VQQfMlKDhzk58USt1hK6DeL86
 /T/rp1I6gXnnq5ZkoUWlEHF8LxDeOe4T+5lukkl7oDEXPRSmOKrBiIy10zvZFAE2TBrU
 OQ79HdjAxRyFnKK9rU9UxVWfoMbINsa7D7EGWPyXknWWmKMpIQo13w8SRqY1cGCzVwoS
 SGBtzGIachRxlg2EreYPb3QO8kjRhkKRb6NvVBH7OsHki8kBh2B2rNiCJRJDXuVHbNxH
 4sBFs7BAAqRFuWvAiELVPu556r2pJboALR7cyH6/bAnPaneU7xIfuzDxRDSOAklzGuIp
 RIDQ==
X-Gm-Message-State: AOAM5307BY50TX3qEDHKM/bv2EQXLt+PCD4rFNkE2NOmnAVpYp/Mz8od
 6/3U2FfFQrWCWjC+v/L+/LE=
X-Google-Smtp-Source: ABdhPJzGNZ5gE/EzwhDrrtdfz7YCdmle2xwfkLdgtv5hGb7cAw7yLBZ7GDpMe+yeCEb/OvPbOpyM6A==
X-Received: by 2002:a1c:2805:: with SMTP id o5mr332502wmo.103.1622518027302;
 Mon, 31 May 2021 20:27:07 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id n12sm1654999wrs.19.2021.05.31.20.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 20:27:06 -0700 (PDT)
Subject: Re: [PATCH 07/11] target/rx: Use FloatRoundMode in helper_set_fpsw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <90750cb5-30f1-eeec-bfba-d47419c3a9e0@amsat.org>
Date: Tue, 1 Jun 2021 05:27:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527041405.391567-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.591,
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
Cc: mmorrell@tachyum.com, alex.bennee@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 6:14 AM, Richard Henderson wrote:
> Use the proper type for the roundmode array.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/rx/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


