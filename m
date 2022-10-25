Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0499260D192
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:24:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMif-0005xU-CI; Tue, 25 Oct 2022 12:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onMid-0005gR-Kg
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:23:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onMiS-0006jr-0s
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666715027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urNNwEE37ZEfUkLNLz4u2KsheXRqU1/xA97pNSd+LRY=;
 b=hXii/c4z1E9vaOOQL3qGFpHYSjC2zGOxuw0mbC6DNxdLvtxZuv+bIwvgerOTADbjhSXYd+
 Rnz2yae/1rI9G8HrTbjFkzVNS8MEGpB9wwsS3CeC/M3ZZrdXZ0LN8CLTVysZQY3s0oKKq1
 BsR/zx6q0TNtIQc0BXi8Ioy9gE57fFc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-7ckGXu24MGGOfgcarArZuw-1; Tue, 25 Oct 2022 12:23:45 -0400
X-MC-Unique: 7ckGXu24MGGOfgcarArZuw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s11-20020adfbc0b000000b0023659af24a8so4229335wrg.14
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=urNNwEE37ZEfUkLNLz4u2KsheXRqU1/xA97pNSd+LRY=;
 b=jV5JTaBziTpq8+P5qWnAPihmJIvznEsshsBP62q3HkhbE974T5TWUWtdTaC2UYHwcH
 +nC3SYWdlyqK5d11R6vqNdrYun+dcQWXb7YZL6djGsepXaal/J5OIydLHcWxnmOcsMBr
 PRPI/ajHgiomfOmOSdHhjGPr2tx5SlRkotxyzhyP1SsL3EO+SP4pux0w1Sa09EdFUX7e
 LcgVK4xFp60Toiosq7XBJMKxCpJAtfUZTMq3mY7GwETajKk484X+5l6ofImXcb6VcVlI
 DpKkJ2slRSzoIySKxlq0vUN61ckFlEZFxvp1BCjguVY6OSN4g4tl4IPWUFMVdrYXd9PV
 GU6g==
X-Gm-Message-State: ACrzQf2PnBTDgFkNt990DZU9DmIZt4c3+Ke7O4NaNEvI3NR5TQzHM+9E
 bvlO8cM35cGWAAs6Wtj2LXGvp/DYgQtbHgIUMnkp1EYntkgoQuhbPrrkEyEuxPC9ne++9bG/wDq
 tN/JzBLMqIpPML9Y=
X-Received: by 2002:a1c:e90b:0:b0:3b4:fb6c:7654 with SMTP id
 q11-20020a1ce90b000000b003b4fb6c7654mr26302586wmc.98.1666715023391; 
 Tue, 25 Oct 2022 09:23:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4xN8siLLU9HvSz1ox87huvyqCrqIE7PaIBjpXGFnuBWvY5QW2oovYwTPIj5QGoelG0R6npyg==
X-Received: by 2002:a1c:e90b:0:b0:3b4:fb6c:7654 with SMTP id
 q11-20020a1ce90b000000b003b4fb6c7654mr26302576wmc.98.1666715023248; 
 Tue, 25 Oct 2022 09:23:43 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-58.web.vodafone.de.
 [109.43.176.58]) by smtp.gmail.com with ESMTPSA id
 r7-20020a1c2b07000000b003c6f3e5ba42sm11305023wmr.46.2022.10.25.09.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 09:23:42 -0700 (PDT)
Message-ID: <81210688-27a4-2156-9310-4550fa839b09@redhat.com>
Date: Tue, 25 Oct 2022 18:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 1/4] ui: fix tab indentation
Content-Language: en-US
To: Amarjargal Gundjalam <amarjargal16@gmail.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, vr_qemu@t-online.de
References: <cover.1666707782.git.amarjargal16@gmail.com>
 <9a0d0718aafaa52029fad76a149f3200b6bba0dd.1666707782.git.amarjargal16@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9a0d0718aafaa52029fad76a149f3200b6bba0dd.1666707782.git.amarjargal16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/2022 16.28, Amarjargal Gundjalam wrote:
> The TABs should be replaced with spaces, to make sure that we have a
> consistent coding style with an indentation of 4 spaces everywhere.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Signed-off-by: Amarjargal Gundjalam <amarjargal16@gmail.com>
> ---
>   ui/vgafont.h                 | 9214 +++++++++++++++++-----------------
>   ui/vnc-enc-zywrle-template.c |   20 +-
>   ui/vnc-enc-zywrle.h          |   16 +-
>   ui/vnc_keysym.h              |    2 +-
>   4 files changed, 4626 insertions(+), 4626 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


