Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF91A33A1F7
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 00:56:28 +0100 (CET)
Received: from localhost ([::1]:56802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLE7P-000856-SA
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 18:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLE6Q-0007Zm-Cs
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:55:26 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLE6O-0001Gx-E8
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:55:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so18023031wml.2
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 15:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yxANUag8lugOTHaKyZb7LYtZ02daXrBhrXQ5w8KKBLI=;
 b=peiE3GYbjiwOAXzMIOqqB63MBFfn5uMXFx5gEKwJps2oU4wrnDSUaX9ajRM6K/MzfY
 GXP27F4ME14IXKZjznsyeRACHzFmRRouUCdgdUN1+EskxiLIlvdOH2j3SjiqqP+dFBVT
 RSyROX1TpA3UpIhDjlQvURpYNrtI0SXavQz7ewecBVwmUH+fyw/625ozK+mB3rQDYTWL
 NPeFbHt2RE31/eY40BZJ3dMB5MaDu3eWB9FEgkDExyeUWT0D6TuYvktNdDQ+zmNVasCV
 Xbr665DV9GE1srcgcOG05HGVFDokJPyPJz2Gg8uhG67+y/nARsLGITS9FgpHnaojozIy
 hLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yxANUag8lugOTHaKyZb7LYtZ02daXrBhrXQ5w8KKBLI=;
 b=czgl7FyOpuJRZYWz1wdKURtsXwX5xSVyBc1nOBrFCUbQTd6+1HDvcE8MwS+SfqjcGk
 ZB6A2Yb0k4+LKuoQL3CgXTIZHXIXZWhBDvTcTe9CxzhwLs0nNxwqmIrVbmTU8OVFkzJR
 1WbGxgVgD1KfR0ync4qrxXvlN/tC+5ze9hY8UE3PgCg/nhvf6lJlFtWH6TUBUSDRZ/KG
 mvrw2TUFv+Ija13V9YmzDJZheoLsr7iFD/aukMNPqveGLp66UV+KnSoW9m0JxFVHYf5b
 rLnyMqA6bD4ou8VS+7pkln1ojooZc7wZnGMQyXs0T8rbFEG9o+AzVW1Z/HsQvU6XoKbW
 tCjA==
X-Gm-Message-State: AOAM533YBcgjPj381IJLaUSb5mXsNyHHedUdRWRCyutUdid4M/WaFx1z
 +PHxyaXfNSCFFUEdUUXYBqU=
X-Google-Smtp-Source: ABdhPJwbSHHNAQAzSXjNXf/HG+Qg0Xw4okmn7i1FtNbZVe23qXxlcnlOrg1TBVLwDDlndhM/SOySmA==
X-Received: by 2002:a1c:8005:: with SMTP id b5mr19801702wmd.130.1615679722469; 
 Sat, 13 Mar 2021 15:55:22 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p6sm13556604wru.2.2021.03.13.15.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 15:55:21 -0800 (PST)
Subject: Re: [RFC PATCH v2 0/8] cpu: Move CPUClass::has_work() to TCGCPUOps
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6f073071-2e37-4cd9-6ffb-c5e03efdf7ce@amsat.org>
Date: Sun, 14 Mar 2021 00:55:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 3/4/21 11:23 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> cpu_has_work() isn't used out of TCG, so restrict it to it.
> RFC because maybe it could?
> 
> Since v1:
> - finished PPC
> - check cc->tcg_ops->has_work non-null (thuth)
> 
> Based-on: <20210227232519.222663-1-richard.henderson@linaro.org>
> 
> Philippe Mathieu-Daudé (8):
>   sysemu/tcg: Restrict tcg_exec_init() to CONFIG_TCG
>   sysemu/tcg: Restrict qemu_tcg_mttcg_enabled() to TCG

Patches 1 & 2 are reviewed, could you take them via your
TCG tree?

Regards,

Phil.

