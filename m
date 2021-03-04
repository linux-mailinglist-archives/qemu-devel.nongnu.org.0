Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE27932DD85
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 00:00:52 +0100 (CET)
Received: from localhost ([::1]:38840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwxf-00044s-Pd
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 18:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwvK-0001Bd-6k
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:58:26 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwvI-0000SG-G2
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:58:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id l22so48300wme.1
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 14:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y1kapwaWg1fTzBBKwPXK9zLHhecZPb2dxlwSNDbtamI=;
 b=dyR1SZyOZ1qLCAIyZEFhqFyktemQ6oHXX/nxldX0hvWAkDdBcHrwirFMBZzToxOVlX
 EAC6ttnAdTI6yWoD6GLc0Y6zrnadM9FJaJNvOyDS6RiE3Ejj/oDn1rzfbyQAsHj1sY8X
 TNVeu2jNfc4MJquXWcESkUQAQswjkgyaIV/PXr6WT5lhkZX+re/WUrc01moFGdRB43fO
 ODSMCwyTL75miKzc8M8fWHezy/iRmio4opjv26VAhvx3mSsNz1LxHm6rTmneSWdPsGwU
 chrSCxkb5lpnNBMcIC9zeZQkBxL6AeCT7g1cU00b5zdIhyzuDzDvtwD+iXvkLArtapUA
 r5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y1kapwaWg1fTzBBKwPXK9zLHhecZPb2dxlwSNDbtamI=;
 b=fKtf27T5S3iGWJV1P92/+ypz4hicYmpdWwPVgDx9pE4IDKcYyw6c3vdmu0D9I8AnBY
 6mVKkAtIK6T/3mvoTuZHfZymoBmVf2DWCUZFMwgiJ6Z1scuhykDF1APRamXq9uHb+Oq6
 jMO612LBJ+mkVnq5H/84mCllPiHd4pmyTDyFc8TEoShgWW5Q2+OIzpL4Yby35rH9UbJG
 pSCkgPQlp7jdK/wnpn9Dl4hNUnHIobfXKHkuzTWiX+kkshuXvUDLZ7jAzYB18LPB0dI+
 F21gdkVqXA4E5HkwV6/6QfVJP0HrWHUaBAJ01IIKCyrP8uyM4I4gSYA93OK05sog7lZz
 V5LA==
X-Gm-Message-State: AOAM531Br4SjYZL+fGJCzQTeSfnTlbEMENEGG8bNA+1mAffXAWkdxAy8
 lfFYPk5S42RWT7t3sPpGSjFTp3IX3SQ=
X-Google-Smtp-Source: ABdhPJw++29+NFzeBzN8353jvufK7Qa62a89bNn8Q4abnE4RAp9lCl3lRxEmMSK/5ViBVcTzID2QVw==
X-Received: by 2002:a05:600c:3546:: with SMTP id
 i6mr6094430wmq.24.1614898702606; 
 Thu, 04 Mar 2021 14:58:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y10sm1154816wrl.19.2021.03.04.14.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 14:58:22 -0800 (PST)
Subject: Re: [PATCH v3 00/42] esp: consolidate PDMA transfer buffers and other
 fixes
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <af17d866-e7ad-7f58-e1df-8af1a72c904d@amsat.org>
Date: Thu, 4 Mar 2021 23:58:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

On 3/4/21 11:10 PM, Mark Cave-Ayland wrote:
> This patch series comes from an experimental branch that I've been working on
> to try and boot a MacOS toolbox ROM under the QEMU q800 machine. The effort is
...
> v3:
> - Rebase onto master (fix up minor conflicts with Paolo's SCSI error handling changes)
> - Add R-B tags from Philippe and Laurent
> - Check for failure of qdev_realize() in patch 3
> - Touch up the commit messages on patches 9 and 10
> - Remove extra "& 0xff" in patch 9
> - Add deferred command completion interrupt for PDMA in patch 33
> - Remove ti_size assignment comment in patch 38
> - Remove extra "& 0xff" in patch 39

Thanks, series LGTM!

Phil.

