Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39983B9855
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:51:43 +0200 (CEST)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4b0-0005Q9-OV
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4ZM-0003Kv-3V
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:50:00 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:47103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4ZK-0002C1-Nl
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:49:59 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so3930293wms.5
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 14:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0bV1kBH8bXzzuOtImw9CqA7hBjyEpZgF/XOmHaMVc2g=;
 b=r7liN2qnnaFhPirzQm01qmnNE7G6RkmqN1d1ACNaBXtFD120+fPB30oToiceduQfJb
 8KVKW0T4KQEhUSxpUWjAzYYE6tnjYNK9S7fQTBA6bKW4fpvFOzRezb6gYGuHRfi2tpbV
 l98y/kFJG2+rEsHKzrXwC0L5PapKo6bcVNuCplteDx2HG8t5w7I2q1i2QPcV5e6FQzn9
 nIjUKvzUWHR59BD/3KBRcHtyw4VWXsErvUHzYujFcum/x+nyL3ZzEdR5QCk2/5ZRgogD
 /eKqTwE0f2p/Yqid0aKWR/4JZG5+c3p0rxwTScNs021BbaDWnLMqXkDJMcaU3k6jZr6k
 HEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0bV1kBH8bXzzuOtImw9CqA7hBjyEpZgF/XOmHaMVc2g=;
 b=HJzePziPtFo7vvMM4WNLN5g2Qee9BBkDMrwuVOe8CjjHvxlECbqNrwUMgtpICHJTvJ
 A/Mdu3TSoWMGxyDjG9HE0k/aqel2J54fY7RM1CwXI6PzO0caHoPAuwpdh2N5RpDBvFJC
 bGqJs5GvEBHYxftbkHDS0o99/VwW4OU5fPvderqJM9wk0FepBcRs5u8YKpPwOgrznzce
 nI4TH+UlQv1OwkrDdBYOL10gCpA+cmzsUOeXaieCKTyqjVPJn3jbPhKyAoVI+jGBssjG
 nZuFbRLZdM9YnVnqKC31fuK3igj/3yj9Qo47Enmxc+WnzGoyaj1vNEV96sqbujdYn9PE
 49AQ==
X-Gm-Message-State: AOAM532uvpMJn5wNtoz/A4f/AGH/j6AMixTeXnvAYGAvvvpP+boIDIiO
 CqbWhyFh1POY3tSvRIhVyG8=
X-Google-Smtp-Source: ABdhPJzOVuzDWXRWpkrY2OaLeQsJy7/RnxXcbJjFLg6Aw6/SXPZZuq3wRgsv7NpQnEN8hFrDsGz6AA==
X-Received: by 2002:a1c:7ec3:: with SMTP id z186mr1863556wmc.83.1625176196888; 
 Thu, 01 Jul 2021 14:49:56 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id y17sm1099858wma.48.2021.07.01.14.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:49:56 -0700 (PDT)
Subject: Re: [PATCH 0/5] hw/mips: Fix the Fuloong 2E machine with PMON bios
To: qemu-devel@nongnu.org
References: <20210624202747.1433023-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5185bff0-d66d-f4a5-ebed-c2dfe4cf58b4@amsat.org>
Date: Thu, 1 Jul 2021 23:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624202747.1433023-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 10:27 PM, Philippe Mathieu-Daudé wrote:
> Commit 911629e6d37 ("vt82c686: Fix SMBus IO base and configuration
> registers") exposed a "bug" in the Bonito north bridge. Fix it
> and add tests.
> 
> Thanks to Zoltan for support while debugging :)
> 
> Philippe Mathieu-Daudé (5):
>   hw/isa/vt82c686: Replace magic numbers by definitions
>   hw/pci-host/bonito: Trace PCI config accesses smaller than 32-bit
>   hw/pci-host/bonito: Allow PCI config accesses smaller than 32-bit
>   tests/acceptance: Test Linux on the Fuloong 2E machine
>   tests/acceptance: Test PMON on the Fuloong 2E machine

Patches 2-4 queued to mips-next.

