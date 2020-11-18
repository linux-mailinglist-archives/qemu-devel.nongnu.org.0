Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B6D2B8403
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:46:51 +0100 (CET)
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSTi-0001Zj-AN
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfRzu-0004lr-6O
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfRzr-0001hG-6O
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605723358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Ui0hOp51J0M8aAVaLj92KIM+lt6qlAfbuztdbsUGrE=;
 b=ci0kFXUHoHv7negWp6IsFGCamKqFC+9wh2m2PyBKsHAjzONtCrvMfuod/59yPPaT6psN1U
 AFUlAkKSI0/ei5v76o0Hn16Z+rIruvvQSCF5jzhV+jpwsHScmen8SQDGL6DTLPsF2nKKa0
 r1pp05w4HZPt/EIe2TsVjxebsFR9owY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-fsMy1_KlOSuuHrU87l-mDg-1; Wed, 18 Nov 2020 13:15:55 -0500
X-MC-Unique: fsMy1_KlOSuuHrU87l-mDg-1
Received: by mail-wm1-f70.google.com with SMTP id q17so1162919wmc.1
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Ui0hOp51J0M8aAVaLj92KIM+lt6qlAfbuztdbsUGrE=;
 b=jjlWDDQ6qRM6AxGf9cwo38DfRehB8wh30d2lH34XKYt2vY/Wo3y0UZ3RtyWGJU8mw7
 ExIJOqCueO1yWuakixE4h8p7uh0Z3Nrp7Y2GaDos7zvdYlDy3wLZ8zYNYqv5wcHr8RNZ
 Ru6eBhyoebtEgYxggy86aCcME5moSITuX9q865URQb3q4iPceLoAzDOjIB0EaXggUSN3
 /5VwWjvfOsnQcV+AmfTGfLsswej9G2lro+zMPoribOHU6Ah2e3TCZSCBBrJ/z3oDMP2D
 FDLMdPECtY7lH+Ob5yf/d+hisAYo63JrjO7sUEFwTkli9kS6ODWPOMj2S1SpJwCipDYv
 VTHQ==
X-Gm-Message-State: AOAM5339CFmlYew/rdQUXY5gTwcMbLT8BrCjS7NFoKmr+aW7Ss8Yu4PI
 /ZA5nFSA2lOEA5B5FnEqN9eg+fQjml7dprRx2etuZf3ul+TDzzCyaK94jlYTfjbs/G3x5UX/JbK
 tNqOdbUiyBqFka0o=
X-Received: by 2002:a1c:c343:: with SMTP id t64mr402672wmf.140.1605723354651; 
 Wed, 18 Nov 2020 10:15:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVST3uZsHpGiWq368Ig+7M8MED7pI60c13QJvRXzUUGVsGCyD8aHwGNhg8FVamSax7EEr04g==
X-Received: by 2002:a1c:c343:: with SMTP id t64mr402658wmf.140.1605723354486; 
 Wed, 18 Nov 2020 10:15:54 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f2sm37116938wre.63.2020.11.18.10.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 10:15:53 -0800 (PST)
Subject: Re: [PATCH 3/6] configure / meson: Move check for drm.h to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b1406e5c-cc27-ef00-bdf8-7e09870550da@redhat.com>
Date: Wed, 18 Nov 2020 19:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-4-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 6:10 PM, Thomas Huth wrote:
> This check can be done in a much shorter way in meson.build
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure   | 10 ----------
>  meson.build |  1 +
>  2 files changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


