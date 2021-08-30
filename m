Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760433FBEB9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:09:37 +0200 (CEST)
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpT9-0005MH-4y
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpR0-0002Y6-BW
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:07:18 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpQx-0003U3-Ar
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:07:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z4so24468949wrr.6
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 15:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fNQeoODls1XrMsRnMuPJCtKOGoAm/4L++pvu5GQbwQo=;
 b=SAZX+f9e7Ikq2Db34fEae2dH19qN1fJ3HuYSAlxRJsbQIRgUeZKM7XGkQfMVGG2WYK
 hp/hMn7h52dqNNKhY4nJW6yMody1GMl0sjvhHHoUeGvEq/Bfa+KfuEkgdWHWGFlSU+KM
 oAZdSUbGQYE/NcM/9vTACgW7D0AqKocHBcC64ucCsQ8qGs5HYDpKgpgZWCuSoS41kTfF
 v2/ShSR30NhOzCs+y3WMli0zSCvk+1dYrhDHUKWl4w0ZBewbnuMihQTY7kHoH6VUu6jf
 QqvZ3vQB5x/cWltGH5NNLU1vAKZXBxlYhDuaC9PX3uh8GraQyIUfNimMPfdDhekEoljB
 Jo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fNQeoODls1XrMsRnMuPJCtKOGoAm/4L++pvu5GQbwQo=;
 b=plMO6pEgV8VOLevA2yJxmUIRpFQCFgOyrvc1XuXe0wNm1Ya5FaM3+HP2h94hSr5dtg
 6/AJQLMn7c4D2w99UB6cBcrWs85nt//ZMoSTjKUsbJ5wB9C8W4pCyAFwF3+mGeIcdyG9
 sEijYVchPqnuSM2eThX+mDuZNwMvyN3YnWw4xNww5m7JiAXCNWHJhPl4ZQw3WfdhZayr
 +uurKjfsnsZsBex5+ux5gEiuEfk2z9XMtxdyRob/rLC4vM6UCNO4TzQ/o72IVB+ui3vT
 i4/kTcY7jOViKauwSmN15TCTjkxRbJQavzpZJFt/8dZuat6gjYj0m7j1i9mUwUo81sNg
 9PTw==
X-Gm-Message-State: AOAM530VA9L/2Y4qnuKbIyY4dLrzKmNyf2IPJN2Ps8oit4jhFV6FHkPV
 tqip2qzIKprY5HuPYspzE6E=
X-Google-Smtp-Source: ABdhPJziGMIK89dcLKh0FhnqPsRPvYFk5ftWXlWYYAW2CMloyW7GD/WziaGDEuwID/zFziRMIna7Sw==
X-Received: by 2002:adf:c3c9:: with SMTP id d9mr26521663wrg.339.1630361233852; 
 Mon, 30 Aug 2021 15:07:13 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a133sm712770wme.5.2021.08.30.15.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 15:07:13 -0700 (PDT)
Subject: Re: [PATCH 04/12] mac_via: move PRAM/RTC variables to
 MOS6522Q800VIA1State
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8a56eb64-3199-1d2b-3004-6f538c049ad8@amsat.org>
Date: Tue, 31 Aug 2021 00:07:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 12:24 PM, Mark Cave-Ayland wrote:
> The PRAM/RTC is accessed using clock and data pins on q800 VIA1 port B and so
> can be moved to MOS6522Q800VIA1State.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c         | 135 +++++++++++++++++++-------------------
>  include/hw/misc/mac_via.h |  21 +++---
>  2 files changed, 77 insertions(+), 79 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

