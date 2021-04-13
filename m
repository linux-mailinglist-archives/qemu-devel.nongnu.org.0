Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D08C35E381
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:10:41 +0200 (CEST)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLcd-00088j-Mc
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWLRO-0005Se-UV
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:59:03 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWLRM-0001rg-GH
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:59:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 z24-20020a1cf4180000b029012463a9027fso9017365wma.5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KufRUWz94TFWh1HTdxGQzUR/gZ668c5Muk/EgM4MMjY=;
 b=Nh0q1Anw7LE11WLU6RLcSFugQvR9lh6r1raQe5AYsGuzhsFGbLcWJKojbmpQ40AWeY
 aJfDASr1MCJS7iWvP+PlWU9KCCgUMwsaQ0XJAhwc2ONUhNSDaCdLWuz6pVlf554oSPe3
 9xGnxQoRVhJt0cSdlYx8lKNUUEGo+DgeKTpVIRX616WWh93uT1YV7Fx5ie9jjO3Nohyf
 hqTB8zVqz707elioRfxZRlNW3crmm4zwBqhdrUE2m86oNgjMSRuYmQOY6w/AyIgjILy/
 E3JNMPGE8j4x/pKKhe4deCqWEx5nRUzU+zdz/VWtE1SPj7EcWzb91dkDf6cJHau7Kj+T
 USKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KufRUWz94TFWh1HTdxGQzUR/gZ668c5Muk/EgM4MMjY=;
 b=md69cCYAIY8bstLf3+YQHZ1hlPIEhXvf6fQrmYa9gr1b5aP7nHsEEVup70M0yQbzgA
 xfVIF7TeDqnVB/5bMWRcwnfSHQYqCK+n9Kbbrhx3/KM/Xt+sqnbecaSNuW3RlnqVv9KY
 N2GVFCxoiuYDJXlVKvkc34siHp5HISxWbWJd05opOrqfSLwyboS5CmpNJm44yC6EjXxg
 nlfk7juqpUuATIn+nRePL2nTn2hFhIaF/V7T8XMAj8zA1+U3dgsmZYa3BQQyhVgEnr7N
 64jH7Ru8UvJoI4mHSEAaAexBNuK7SQJDpcnXV2DI29VQtc9j1BjTXsE6sMb+pk2fWU1k
 THng==
X-Gm-Message-State: AOAM530J81AsWkvzcTennKcaqAlltqA4eiGclMzkklUwkBnrTsqm8cVF
 PbCdJzTnlY5Y6TK+sQaWwOc=
X-Google-Smtp-Source: ABdhPJwD6MVkdGYznc6UCHSaZtCZo4StGRCjE/iIGuk83Zzuu/vxI09cQmUKTWY9KtH11o3w2LbEPQ==
X-Received: by 2002:a05:600c:49a4:: with SMTP id
 h36mr683416wmp.102.1618329538264; 
 Tue, 13 Apr 2021 08:58:58 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f6sm9298430wrt.19.2021.04.13.08.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 08:58:57 -0700 (PDT)
Subject: Re: [PATCH 0/2] osdep: allow including qemu/osdep.h outside extern "C"
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210413113741.214867-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <847ddb28-7dd6-58c3-b9c6-facecee6e133@amsat.org>
Date: Tue, 13 Apr 2021 17:58:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413113741.214867-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: peter.maydell@linaro.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 berrange@redhat.com, Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Vince.DelVecchio@mediatek.com, Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing MediaTek reviewers.

On 4/13/21 1:37 PM, Paolo Bonzini wrote:
> qemu/osdep.h is quite special in that, despite being part of QEMU sources,
> it is included by C++ source files as well.
> 
> disas/nanomips.cpp is doing so within an 'extern "C"' block, which breaks
> with latest glib due to the inclusion of templates in glib.h.
> 
> These patches implement Daniel Berrangé's idea of pushing the 'extern "C"'
> block within glib.h and including system headers (including glib.h,
> and in fact QEMU's own glib-compat.h too) *outside* the block.
> 
> (CI has not finished running yet, but it seems encouraging).
> 
> Paolo
> 
> Paolo Bonzini (2):
>   osdep: include glib-compat.h before other QEMU headers
>   osdep: protect qemu/osdep.h with extern "C"
> 
>  disas/nanomips.cpp      |  2 +-
>  include/qemu/compiler.h |  6 ++++++
>  include/qemu/osdep.h    | 13 +++++++++++--
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 


