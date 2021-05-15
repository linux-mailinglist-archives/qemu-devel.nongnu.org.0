Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52D3818A6
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 14:08:22 +0200 (CEST)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lht5h-0005tg-2x
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 08:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lht2l-0003YT-57
 for qemu-devel@nongnu.org; Sat, 15 May 2021 08:05:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lht2j-00073k-EC
 for qemu-devel@nongnu.org; Sat, 15 May 2021 08:05:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id r12so1723185wrp.1
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NXzxBvlhcSsBsTudGIxKQWx2ipeMgGy919LJLoDTHTY=;
 b=TCWnUbzwyzuxrcpGGk0tJuT/iwoKiGi5QkOPoKffDb+W7oP0q2Y7cIjcpMCgXfeeAs
 IUbJvNQSkqMtYY3I5rjxrEDUe7g4keo3mDAQsjn758zvUmlVn/8Y1swhYxQoBtMAaZxC
 KRQtKAdeRSqQy8Goue97JW/jQg7LmrqbpS3cV+OagsKTwerTMZlKLxGLKrJmf0INUVKB
 okdbkcrJd0MCkPGLj7INlX0I7LkDlXy3tlyMivGBPrtMlXqvzqply2Kaw0+efhIhX/Ai
 VVJvzC7TNjNiNo+O+TJvfa9TO1qePGiHCeFJyLeqgqhYPuyCEc4quiJlzoXP9Zi2uiBB
 Jp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NXzxBvlhcSsBsTudGIxKQWx2ipeMgGy919LJLoDTHTY=;
 b=UYLONENHRljFdHYwMXGgxjor2qsiP278j7uUmCdFTuqIYFO6IoSOF/pqWYLCTE1aTE
 1eD/TfrWeEalYia7slYazk7BnG4sgem0vwb5w53O7VTfCNIjPN+CFOnEpBHE5yWQPDiF
 puaeFlWuTy3y2VBW8bHAn6Wme0F7lSsxyV0qgaQiXliLJk+HcTPhB9nB4j9apc/nzbL5
 sBbRBZ14jWjmJUdHrktl+HqPTFsIGmKjqIMuwaaXIpynsAye3aACHY05GXSRe244pJMC
 dPVZToPpldz9BV/2JYFqgXxtWspBFr2oP+Pw/nNKfERxZVNIMoh/3oDuxv3ZfaNmuHdV
 OTCQ==
X-Gm-Message-State: AOAM53001HTIL2FVjinbjjm9JiZ1uj3b5v5HuLIIpupVlsdYSM82QrDn
 C/U/knGPxjQ+TvdMi09Xzn4=
X-Google-Smtp-Source: ABdhPJwdZbtmvJS4/E07ki+zdGjjHDjFQEY+NY4aBS5P6xYKYtue8kJNitfAGn3XCZyF7bIT8gBk9Q==
X-Received: by 2002:a5d:514b:: with SMTP id u11mr20635741wrt.350.1621080316008; 
 Sat, 15 May 2021 05:05:16 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id 136sm6293799wmb.7.2021.05.15.05.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 05:05:15 -0700 (PDT)
Subject: Re: [PATCH v3 00/11] PS/2 controller related fixes
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c136dc92-dd3a-4421-b0b7-86c4eadfc942@amsat.org>
Date: Sat, 15 May 2021 14:05:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/21 1:31 PM, Volker Rümelin wrote:
> This patch series fixes two different PS/2 mouse stream corruptions
> and adds a feature that allows some old misbehaving DOS programs to
> have a working keyboard. With the last few patches, the PS/2 con-
> troller behaves more like a real controller.
> 
> v2:
> Introduce the function kbd_pending() in a preliminary patch to ease
> the review of patch "pckbd: correctly disable PS/2 communication",
> as Phillipe suggested.
> 
> v3:
> Patch "pckbd: correctly disable PS/2 communication" exposed a bug
> in SeaBIOS. The updated patch keeps the relevant code. Until
> SeaBIOS is fixed, the PS/2 controller command KBD_CCMD_KBD_DISABLE
> must disable the keyboard interrupt.
> 
> In patch "pckbd: PS/2 keyboard throttle" in function
> kbd_throttle_timeout() an unnecessary if statement was removed.
> The KBD_STAT_OBF flag is never set when kbd_throttle_timeout()
> gets called.
> 
> Volker Rümelin (11):
>   ps2: fix mouse stream corruption
>   ps2: don't raise an interrupt if queue is full
>   ps2: don't deassert irq twice if queue is empty
>   pckbd: split out interrupt line changing code
>   pckbd: don't update OBF flags if KBD_STAT_OBF is set
>   pckbd: PS/2 keyboard throttle
>   pckbd: add state variable for interrupt source
>   pckbd: add controller response queue
>   pckbd: add function kbd_pending()
>   pckbd: correctly disable PS/2 communication
>   pckbd: remove duplicated keyboard and mouse defines

Zoltan, you might want to test this series with your Pegasos2
machine. It makes the keyboard detected correctly.

There is still a problem with the mouse interaction with the
host. Pressing Ctrl+Alt+G to ungrab the mouse, my host mouse
is still responding to guest events... (unrelated to this series).

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
(PPC Pegasos2 so far)

