Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE265F02C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 16:35:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSFx-0007j0-Kb; Thu, 05 Jan 2023 10:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDSFw-0007ij-22
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:34:12 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDSFu-0004qo-HJ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:34:11 -0500
Received: by mail-pg1-x534.google.com with SMTP id 36so24721186pgp.10
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 07:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vOfm6dIMpXZoHwwmPSX8+AwHDYvmaG+W3cMGo0+TrYw=;
 b=fA8e04dL73uduTe1MMKOxUZpiBWxfR/K8Z/QDYeXlROz69C9mO52mCjHYHqNRpWKuY
 1NND10wwe28r62wqCuyrZPjWMOweISlwYTuoqGYuFRwU7fHCY6TjMd7Uuqi041g36SEv
 /NNi4jcg7gCUv4bFs7BJNtDIXl73Ux1GMcOccUnF6iqQq7y+fFVsvKHI1/D3aCNa3Ch4
 YDW29VSIpxklh+xEz/Pb5tnG32CLhclfSYmEUx4c5+UkHOVFsKJRO9JETkf6zRXvPAz4
 IUbL/lbEpQKebRN3mRB0SRUALi8CnROTAUTpf9xMaA+t49Nv5lVfb6ks/L3C0cRRH8oW
 6/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vOfm6dIMpXZoHwwmPSX8+AwHDYvmaG+W3cMGo0+TrYw=;
 b=PefVxbyEg7RPplMJzh4xixSWeGgogM0jf+6N3weiKZu/cEN5EqriqoONBlhVW4ENZR
 kSR6Cy6tbWVh3u3yF3RdIrSr9xmvHi0zII7vaBnhE3uz+1gLJU80fcg+NclWq2+cWEmV
 6gNQa29B3yycTZfVqzZkKbkN+3a2na8UBASDDdOOwihvvCJ8g4iiF1mAYBLaKXp+HofZ
 RC+kdJuoimEEPNP9FuUFvMn1u9vA7jkQVnN8YmRkGMpWY/Ooza2c/N2H3vqXgER0hI+v
 7bNlNCOJ2+OJ9mto6IublDkKHlbD4xpAD2+JG3VJmDqvw7MLlBLaWfledfzyj4b/saZ8
 BeQw==
X-Gm-Message-State: AFqh2krVBE4W7WDRPzeg60wBp/Z+4xgHMDlHH8mT/czRd9GMAVRn95Ov
 jxq9PD0K17nXDVlwRCYYOfVOa8Pqy9vbOysjVFjDPQ==
X-Google-Smtp-Source: AMrXdXuf0RvyitFTKEms+L5IYTNms7dQ1O7cPFT644pZ2Uku9h6aw3keeIFQp4/bX008XH7z9vpShhNuX1RMyEyzT8I=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr3277920pgh.105.1672932848586; Thu, 05
 Jan 2023 07:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20221221183202.3788132-1-slongfield@google.com>
In-Reply-To: <20221221183202.3788132-1-slongfield@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 15:33:57 +0000
Message-ID: <CAFEAcA-zv_ny28MJGf4s9T1+3PwK8WRurVgiQnA+8UWbkRawkQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in imx_fec.
To: Stephen Longfield <slongfield@google.com>
Cc: clg@kaod.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, wuhaotsh@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 21 Dec 2022 at 18:32, Stephen Longfield <slongfield@google.com> wrote:
>
> Size is used at lines 1088/1188 for the loop, which reads the last 4
> bytes from the crc_ptr so it does need to get increased, however it
> shouldn't be increased before the buffer is passed to CRC computation,
> or the crc32 function will access uninitialized memory.
>
> This was pointed out to me by clg@kaod.org during the code review of
> a similar patch to hw/net/ftgmac100.c
>
> Change-Id: Ib0464303b191af1e28abeb2f5105eb25aadb5e9b
> Signed-off-by: Stephen Longfield <slongfield@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>

Applied to target-arm.next, thanks.

(Looking at other ethernet device models we do indeed want to crc
just the packet, not "packet plus 4 0 bytes" or something.)

-- PMM

