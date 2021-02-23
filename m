Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD5232333A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 22:26:47 +0100 (CET)
Received: from localhost ([::1]:57446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEfCg-0006NR-RQ
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 16:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEfBp-0005sr-5k
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:25:53 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEfBn-0004gm-PY
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:25:52 -0500
Received: by mail-wr1-x434.google.com with SMTP id c7so7268822wru.8
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 13:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9IsHbY1Cg2md9Kn7zp4Cp7dOCc6NeZ134oC4n5kBXB8=;
 b=adGU6NdlQ6vFofqgKCIjaKMck9or33t3zEOvV9wvAhNYLJpWdPh6gB5Z7dj7O8hne2
 /acy6m+S+U8CewSd9T2iSIzMOpSHP+0jXk3opt/pzFlQg7OLLvXGmug5zIY5bJYe8Wkr
 XHnGLy9AtMrTJ/Hus6SLSes1dXtkbGTJQRxnYZW0ZSiuaJFUezIz5mQgBIeLlryUSI9N
 6bkaCmu4igDkP7T5KH0ygMhB1ShU0DAef6R7Bm8e18EwrBttqdcd9tPmCs7YkQOwDqLH
 b8LIAusUp6tkwXgvdUhYTvaTDm5PAx2ozUU0PoA4t6ffmqR8twoq5wNh1j7QYQ2HQjyY
 n3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9IsHbY1Cg2md9Kn7zp4Cp7dOCc6NeZ134oC4n5kBXB8=;
 b=hmM2eJ2Vm+0UKzkx3+wK1YEFDxNu2vScIBA0zbICHTIRwxUlItszM6fs2lNVAwd/G1
 XKYn8jO4ThTJ82DvZ+CSceWcoxemdYWWHFz4YBVE8P81XBF7+WJGiACLubgG4bL4Nnyv
 NX1e4cY+Av8eibj2I5JbOPP9yOrQL1TQm7ypiYA0/HRKfXtsIKviehsPINILm/vQHFRP
 HlAVmsx44D/FoeGITZJELLOKTEdN5LbCitbKFgnAcqriP3QtVLcvPQU0Kd8B7z37PRG8
 jPbD8cGWysZtu96nFk/S9q4TQ9ol+RvnU+84Nj5wuPSEMR/NRLCQdzmuWoPzyXb7EPSO
 /DXg==
X-Gm-Message-State: AOAM530cbOiimnmdjZiEppCQCR/ouY5jVQirSulUTZ+q+mfJcgvSx8i6
 pd+gq++TwzUScuMMRfDP/iN67S9E+Oc=
X-Google-Smtp-Source: ABdhPJxdmvAaLBGnc96Ilx6mr1BiddzqY3ioeVbDkbbMFgiIS+ip+4v8UWgoKgthjwi7DBms53dDgw==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr27691493wrm.303.1614115550088; 
 Tue, 23 Feb 2021 13:25:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h13sm22134wrv.20.2021.02.23.13.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 13:25:49 -0800 (PST)
Subject: Re: [PATCH v2 18/42] esp: accumulate SCSI commands for PDMA transfers
 in cmdbuf instead of pdma_buf
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-19-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <49a16c87-376b-d365-3b45-e4d0d231a59c@amsat.org>
Date: Tue, 23 Feb 2021 22:25:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-19-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
> ESP SCSI commands are already accumulated in cmdbuf and so there is no need to
> keep a separate pdma_buf buffer. Accumulate SCSI commands for PDMA transfers in
> cmdbuf instead of pdma_buf so update cmdlen accordingly and change pdma_origin
> for PDMA transfers to CMD which allows the PDMA origin to be removed.
> 
> This commit also removes a stray memcpy() from get_cmd() which is a no-op because
> cmdlen is always zero at the start of a command.
> 
> Notionally the removal of pdma_buf from vmstate_esp_pdma also breaks migration
> compatibility for the PDMA subsection until its complete removal by the end of
> the series.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 56 +++++++++++++++++++------------------------
>  include/hw/scsi/esp.h |  2 --
>  2 files changed, 25 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

