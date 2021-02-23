Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8D9323347
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 22:31:01 +0100 (CET)
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEfGm-0007iB-6o
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 16:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEfF2-0007Ft-3A
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:29:12 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEfF0-00064M-Re
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:29:11 -0500
Received: by mail-wm1-x32c.google.com with SMTP id j187so77966wmj.1
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 13:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fz4GZ965cHOZc+sblaj671QffEw2VhfO8okUSjXpimI=;
 b=payFMWPiAvmqnTUv2/t5wLkTE4jcPy3mNBaDdFDWDNzucb0ts28VMdumITwlsAwnJ4
 uKoAKA6ImD+njafPY/MWTMRI+CWo7nKAsjQtJ/CuohDaQR6u2VIlwbnCKw5l8gyATVIe
 OQbXMPFqPo+CM7VDQno4HLV4yBWgrGCHmJWHV7eQLCYmkoRAjb5bn+9Jgkwrpofo70NG
 mxreSoWfX70a1XU1XRm0PIcHfBYnmDScGWJ6KpDBCbbYUoG1l198POxZwfUuGZ1gW5cv
 EPH3hj0SEZGEbABpPyhPlU4Vb5J/K1qQ58A4XQNY4ZLkgsoNyVrbD+Ry56d/K0opQFWL
 NapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fz4GZ965cHOZc+sblaj671QffEw2VhfO8okUSjXpimI=;
 b=tftupw0VU8D1Gj8ZFJkzbrEf9Jbq4xL1XPb+ckI2XOHuGCNHt95oLBnHO7vix6DBxt
 SNwiv5UyHggDBhn/5a1sKh6HUe1J2ZWZ/yjg/vr2PpFuow/UtfuuodS2UTSIh1wOx3SM
 PClTQsTozf74jHr4vUpLuGKDgcxR+wccNqljCrl0Rn/x0X054Z1ghSBZO9YlMTURAc5q
 Lv0FRryE/1YKigNUTWdqG3syCThDnMqjjKESxz8biReG7Ev/4uQ1YlsFEfm4jw77o7WT
 NHhQnLPAj18IqAuyTYZwP5/WYHFNO/020SIIPt3YT2ffVGLZhzwI3JfTCKlWjYtIb43j
 OikA==
X-Gm-Message-State: AOAM5334TRjEqkr6AGOuasa5pdCPggufLomKTA3oPxSxa4eG2Zl3JqWV
 UjQ638E6zDyaEpL+tL4IzwY=
X-Google-Smtp-Source: ABdhPJzoZKyEHf6XToYVI7ox62gswDTlGl7btkWFdRGtyQV2tnR7cqr1g62iqMKXM7W16Rw2vgdMFw==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr609830wmq.81.1614115749411; 
 Tue, 23 Feb 2021 13:29:09 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h20sm3896373wmb.1.2021.02.23.13.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 13:29:08 -0800 (PST)
Subject: Re: [PATCH v2 23/42] esp: use ti_wptr/ti_rptr to manage the current
 FIFO position for PDMA
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-24-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b266411a-f4b9-2033-ab42-b918c3a81ecc@amsat.org>
Date: Tue, 23 Feb 2021 22:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-24-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> This eliminates the last user of the PDMA-specific pdma_cur variable which can
> now be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 23 ++++++++---------------
>  include/hw/scsi/esp.h |  1 -
>  2 files changed, 8 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

