Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310583230D7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:35:16 +0100 (CET)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcWh-0000MK-5M
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:35:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcUZ-0007ia-7b
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:33:03 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcUX-00029a-Nl
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:33:02 -0500
Received: by mail-ej1-x630.google.com with SMTP id k13so34202666ejs.10
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bkls2pf5ioJid4omazxUVIriPEmNanz4i60MQ0dgZ1o=;
 b=DivA7YiXYu4xDsDTf8PX+8EqbQ2Q1k20KATDwQIMeWRlhPrAcpHYi+3SU6KmYFb1Ox
 lnqwnSSaygNwV4h5ofCMVs6IHbe6/boZwlon5Ks5U4vWhlzbyB7gFjWVx9Q7IVbGReBL
 Iuj+VT/fvh6TzID3ioRzFg9YRnbXgrZec0m4mfeLR1uuYWTaqsh72bzXiMt1wEyUMDpy
 CVbFgJhIEOHHKio7kG2qABYHwMjLwFP3iJam9Ul4AcqPLBrL3wjSmLLg51/0EgzCt/HF
 IZ9hjZme0t7z6RD0vUpeDnoJCQx54i9BcMIUHUH5LDsGJHijPnNTDjMEHSvqtGBHhWIU
 1RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bkls2pf5ioJid4omazxUVIriPEmNanz4i60MQ0dgZ1o=;
 b=lNK2K2IUJPf6ve71bf8jsyNw18EHR/SGhTDqGqNWkAg43KSVFGPo8e2z4crUOBqdXS
 pbglXKquni8UjLO0kmYCqAdAxJxjq16trbi2lo5pQcq1tKFc+goliP84EO/SeVKqGpm7
 ZnL9UHb4Q1qUhNkEq2JSzJLg3z7JAOdDnM42ZhHWxYArEN2Ffys4i5q5omRkUmN+4EPs
 /nBCGzGP5dVpt/FMbCOnXgzFHl5qBNgy69UmO3/5WClJZrMi5JQPBM3Jqh0pwRJs7TvM
 p2nNUa4ez2mWKBJfSbI7U49HcEH8gXB8OpGUdIcBxqb3VQUq1PiWl1HxSxzD1Jwkhkug
 IAMA==
X-Gm-Message-State: AOAM5330gFEKa9XJKpb+w+zf48F74EKtaE8jjdRD+ryw39xJpUUQzndT
 r4bmAJrZcd27Y5ITle+aqMM=
X-Google-Smtp-Source: ABdhPJxiGX7MM7sxCh5zT+AR5iwLZ+wRe+ROHospjQgvo+yMKjgn8ZSqIK1ZtFZG9uM23WJ+sF+9FA==
X-Received: by 2002:a17:906:c0cd:: with SMTP id
 bn13mr26546765ejb.368.1614105180015; 
 Tue, 23 Feb 2021 10:33:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p20sm11682641ejo.19.2021.02.23.10.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:32:59 -0800 (PST)
Subject: Re: [PATCH v2 24/42] esp: use in-built TC to determine PDMA transfer
 length
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-25-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9cb2b1b1-7254-ae1c-19f7-21384ecc6bef@amsat.org>
Date: Tue, 23 Feb 2021 19:32:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-25-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
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

On 2/9/21 8:30 PM, Mark Cave-Ayland wrote:
> Real hardware simply counts down using the in-built TC to determine when the
> the PDMA request is complete. Use the TC to determine the PDMA transfer length
> which then enables us to remove the redundant pdma_len variable.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 28 +++++++++++++---------------
>  include/hw/scsi/esp.h |  1 -
>  2 files changed, 13 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

