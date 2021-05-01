Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4BB3706C6
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 12:18:41 +0200 (CEST)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcmhr-0003MH-IG
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 06:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcmgS-00027i-14; Sat, 01 May 2021 06:17:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcmgP-0008Hl-2L; Sat, 01 May 2021 06:17:11 -0400
Received: by mail-wm1-x332.google.com with SMTP id m5so440611wmf.1;
 Sat, 01 May 2021 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tVmaOWZP+ED+mIM0Kfl1+t5xsVUJf4Hwh+3o1AC1bSM=;
 b=IKiKyPVRP3VzA0Hfr6FHk1nyemBwB95jcHwqNOV0yMRIYWmeaeRlOMI807Q9XwQ3Po
 KfkdZNpEQiVc5axOIHsmNuem/+l3KZu4SETOg9cABni/bCO23cb58O/EDi0/qw+9TuOW
 RxF9LIdJ0kHcCuRlNi3xFXCpOfqSHB8E3959fgNDUr+oaBn4zbIkT9IXWW9eRykX5b4Q
 NTgLDN3aPaL3USVtUrTvcTHmg8rrfdQ9PEG0i2BEZmuW9fB5FHdQH8acT2AU0YhsFuXu
 ydweO/g4H6+9kub9vfmGJdSQrV7WXpFEVCl3Ezx+2KRh6MaGzC29YgbdQEMhj8O10Xof
 D+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tVmaOWZP+ED+mIM0Kfl1+t5xsVUJf4Hwh+3o1AC1bSM=;
 b=CXCqhGSWD68RS15IGo7aqhh0MMHNfaH7YTSr5+mvX0LFWO/xW+yPwKKvYKr6WeqctC
 k37DW73xYAsY4AAYii+nJ0/f5Sr0puAqLZTAJjvHqQDj8hOOYzk2nTvAInMKqBICmJez
 yaVBLodGYGYkqXrcpa2I/2YLl7sbivgqjoyX9ZBNv43J8wPUsQ2OMDmuaAione/5lqTa
 UuRlqbOCQaBu6q4lgSCkr6HhXv1hliKc3OMIu4gVb6mMbCHyTb4Nmyr6CSen4gimmsa5
 hElFzZuNV/vrK2PpRWTdyMAtgf0DV4ISWR3VAO++RFEqrNn8dziMiipc3uTtgSpuQOIX
 WrqA==
X-Gm-Message-State: AOAM531s0ePaTXY57m/noLD7KhDp5PetzqEERD43rjCKZHvx8a6DlF2R
 1ikRhE2ZAk7fZBUZcayZxZQ=
X-Google-Smtp-Source: ABdhPJzfE4BQ7X6OYrlIlXBBajfNs2MrZj6G1CRYtRKiaXGDeGISsO1xaguJRnfBvKAky4P/XbYKsw==
X-Received: by 2002:a05:600c:322a:: with SMTP id
 r42mr12507459wmp.187.1619864226066; 
 Sat, 01 May 2021 03:17:06 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id n7sm5240707wri.14.2021.05.01.03.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 03:17:05 -0700 (PDT)
Subject: Re: [PATCH 0/2] hw: Qdev'ify reset() for mc146818rtc & etraxfs_timer
To: qemu-devel@nongnu.org
References: <20210423233652.3042941-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5ffe72c9-f564-2d6d-baa6-b756f49fcd34@amsat.org>
Date: Sat, 1 May 2021 12:17:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423233652.3042941-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 4/24/21 1:36 AM, Philippe Mathieu-Daudé wrote:
> Remove qemu_register_reset() when a qdev type has a qbus parent.
> 
> Philippe Mathieu-Daudé (2):
>   hw/timer/etraxfs_timer: Qdev'ify reset()
>   hw/rtc/mc146818rtc: Qdev'ify reset()
> 
>  hw/rtc/mc146818rtc.c     | 35 +++++++++++++++--------------------
>  hw/timer/etraxfs_timer.c |  6 +++---
>  2 files changed, 18 insertions(+), 23 deletions(-)
> 

