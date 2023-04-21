Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B386EA388
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:09:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjwf-00016B-FI; Fri, 21 Apr 2023 02:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppjwa-00015h-Ax
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:08:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppjwY-0000ln-P8
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:08:28 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso830838f8f.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682057303; x=1684649303;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mLyJ/EC+PgJUB+sGBBZPVyTomnWxMc3JVf5Eb4U86vs=;
 b=d6r1Vs3z4Ts7DO/heHAT/UkEgjjgR0J1lAYXbIhOd50tXX5ICvpc+cWuw81dYCmt3g
 EnNyNu2CtivIB3JEdEbObe/5IUzOSjauRPhvlyqVgVoPPezaxd8VxDhNd9fMhog68y1r
 XgepbqOKHmxRMJEOf35zgJdVeNl5cWR5e/gTL9irH8jwwMJ8cIBGT6XsKWSGCEzDj9oP
 tQpgWA8XFe19blPF4zPSUUp5LPjlKfTBFhf1i3U7R4FyL2mLz564dzzYfW8VuGwZIwgM
 cpDqKtoOxpTfWkkMHIwHzbLxJFiXyJN3K+mif59th05a8eJjYLpuDmOKvLF3uCfob5lx
 bLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682057303; x=1684649303;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mLyJ/EC+PgJUB+sGBBZPVyTomnWxMc3JVf5Eb4U86vs=;
 b=aXTuwiU9dJekFRCAIreAiF22FY8ESdF9Of69bV6QEbBvf/abmmCtBx3S7lVm2viaME
 3DIbdp+gbDu99yFVXC8KqwRVbtFVUMiWP1iE/7VXoRgBuWACOuKEk9U8AWbCqvmeJYEz
 qGVTzXsAtaBG5ED3p+n3rDHMi5NI2A5CdTSYH9AL9geVDDwdVLbV/e2bFiubuJTCSYOg
 ncD6CrdFh544QvPAReM5vQslHW2FHQ0dkfg9ZI2wLH9LdTnrkQon0IHIH1TfQu4jEj7e
 13xcAi8WL9JiAXduQeoISzsuVMeBsr2SoxVCh13GEmuy0rCtmixWCfxyI+rWVlfKCyb6
 X6GA==
X-Gm-Message-State: AAQBX9df5IGhcFHHMTKVCjKJtiPSebEMTXs/yfAhOa2wWJ/9MoSF8qaH
 FruzF3AxtGLhLajPSOSo16H/vA==
X-Google-Smtp-Source: AKy350ZeQWv2uc5014c5+RKDyuz0w4ytkLVmzy/B0iLs5kL5VOHMpCOlZHpYTRwbNnJTkfyBUoUEEQ==
X-Received: by 2002:a5d:6886:0:b0:2f0:6192:92db with SMTP id
 h6-20020a5d6886000000b002f0619292dbmr2606523wru.46.1682057303569; 
 Thu, 20 Apr 2023 23:08:23 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 z18-20020adfd0d2000000b002fae7408544sm3563606wrh.108.2023.04.20.23.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:08:23 -0700 (PDT)
Message-ID: <e04c4409-ba3e-47d5-0ada-b5007fa5983d@linaro.org>
Date: Fri, 21 Apr 2023 08:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230420202939.1982044-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420202939.1982044-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/4/23 22:29, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../util/async.c: In function ‘aio_bh_poll’:
> include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
>    303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
>        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
>    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>        |     ^~~~~~~~~~~~~~~~~~~~
> ../util/async.c:161:17: note: ‘slice’ declared here
>    161 |     BHListSlice slice;
>        |                 ^~~~~
> ../util/async.c:161:17: note: ‘ctx’ declared here
> 
> But the local variable 'slice' is removed from the global context list
> in following loop of the same routine. Add a pragma to silent GCC.
> 
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   util/async.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


