Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDFA31A51C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:14:10 +0100 (CET)
Received: from localhost ([::1]:34664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdtJ-0006Bi-2c
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdcE-0000Sv-EH
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:56:32 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdc8-0002Jj-8R
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:56:29 -0500
Received: by mail-wm1-x32e.google.com with SMTP id n10so583365wmq.0
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=58ZifQJ5cLa9p89ASBXus46trt4X1yIazWEMa+unWm0=;
 b=n0Vkk3eY45TB5FwRiDGCvwmYQVDKiQQ55QjAUttc02kJclPhcV19sGyUWEW5J5cbUj
 83/XYMqfb+mFxPKN7TfriSTrTAYw0yZF0G1DuueMq+YnxjsU38xWMrBHeps3Tu0uNS8q
 7xhf9NUne7GWxWfSZtqTk8ebNW/UyDhSPLmTgD1O88Vxb8EBcGJpHuHOkpu8swmQA90L
 H2WwQ/Lh2Sej8UY6/Oex9sTN1ahpFjGnIE726+UAfyXFoo1Js7vmQdCX8FteB+wXynsK
 ka034ZN13yYLdw+Bu9jLThJ0llLNzhiM71zjKkK78ZbFDrCpx0M3G7Zzzr5De5vmZeh4
 ZxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=58ZifQJ5cLa9p89ASBXus46trt4X1yIazWEMa+unWm0=;
 b=BkypkLPZIDFGfqkDd2zK61pX6BDE/CiA5MDq9sR32Km2V9gs6npU/z7rh0AmoMw86h
 pTFmYpc6D7PGr9F75R2EfLWDuT3OgiEHPBFSOQU6KX5yAIS1JVhlVrOxjejD11r4tvJW
 i9CkKKVgH82DvJ+It7Ub8sCinxp9NxgRpB59wnBIT1lXQeuGpcUNEVw/dBHGeor4GZSQ
 JdwK1TCi2vH/GHriq40r/Ea++R3f1SKLdtcw3jatVOtsUhdWe1nFMgaLdhKqDe+2XcRd
 PGXR7GXnBlOfnlcEkurfQY441iy/QhWoWuunTUWZk3v9h2FDfMhPzD2FGb7715OoxA0u
 gQXQ==
X-Gm-Message-State: AOAM530SqUhQybTp3HYpSLRst2pmQpQtFYd7pNadmVtXcVgWtm+43fOM
 mfDLQOqA4nTjB1wldorzYoI=
X-Google-Smtp-Source: ABdhPJw/NvD7AVNQZPvWU3aDB/3nb65iio22ChJck/rzkU2d/j1N7KaxpP9pudhFI9+jT/jPPO0ojg==
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr3920903wmj.96.1613156180747; 
 Fri, 12 Feb 2021 10:56:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u7sm11311275wrt.67.2021.02.12.10.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:56:20 -0800 (PST)
Subject: Re: [PATCH v2 30/42] esp: add 4 byte PDMA read and write transfers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-31-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0978e91b-d2e8-ce30-87de-cba2896ecc16@amsat.org>
Date: Fri, 12 Feb 2021 19:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-31-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 2/9/21 8:30 PM, Mark Cave-Ayland wrote:
> The MacOS toolbox ROM performs 4 byte reads/writes when transferring data to
> and from the target. Since the SCSI bus is 16-bits wide, use the memory API
> to split a 4 byte access into 2 x 2 byte accesses.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Out of curiosity, what is the bus used?

