Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E55EE127
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:02:13 +0200 (CEST)
Received: from localhost ([::1]:50630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZVi-0006MP-NJ
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYzV-0006Tr-ND
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:28:53 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYzU-0000IJ-4s
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:28:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q35-20020a17090a752600b002038d8a68fbso2796949pjk.0
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=WaWKHPX5pAoxlejy9SWUVa1DsgIQN93ixnmM97D7Kxk=;
 b=N7TtIFpxIuNQ6tliZ9x6ufHqChQun1crFFu7CdBFhGca9qrlZM7gl4rYHmNRDWTS6a
 njcwwfREq+lje6K3auTfYUt1BJ+NWU0NstQAhyF29U885f4knnR8PKNl2m+xGYfyKcyT
 D5c56d9Dm4/BhxbALy37IdOyprfPsXNczD/CbHRtc9bOvX9dKyKJXHvvQwzwWVuzyYoS
 14oCBsivBBSykm8Xs6JvGfGgihZpUkAqBC+0LEd1C38eTpUvVJR11ZJ3fzjo2PAKosMt
 onGHPLuDep/91v1vQhpajCWkZbWa7udILzH1S6R0HrLGSbhbwrXBTaCrGXvxOX9IGMaC
 GHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WaWKHPX5pAoxlejy9SWUVa1DsgIQN93ixnmM97D7Kxk=;
 b=fPyMvJ9qlxotn3dFAASY7f9rtCIiZJvrfOp+NkqghIfL64tbBWFlX47F1iznyU8xpP
 qU8McNCvOjanLuwQPL2xp0QI6IXLUdOZTMjr2M85+54bSukd0bDX402FHFMKLi1wE/CI
 Zbs+SbFOqKMgquog5KCMziNeIHzSJE40M2olspREiihN1TK8Tp+IVfj8wg2VSWOaWCRw
 xsB+y+D0ZX0wr0FtsZGpYQMmQrFc2klobN+aPKqX3xbGBoionGSvgOk8Qsi4u2zz9VNj
 vR/OXTRBDyTTGNDq0eIHICiAo++PcxhP7vp0Syn8BEKxqJpCG6PC8QgyrTOUkXkzyFRT
 12NQ==
X-Gm-Message-State: ACrzQf2MQNpQADTQBjM3aVLXrtQwVaAZurojxroiBRCdEUztXhT5VS87
 7Pv0WKaTC7Y+AMTl8Flogy7w9Q==
X-Google-Smtp-Source: AMsMyM6WCk3galcik15eh9h7OyfQD6FXblqFpm8AX5q3WytjjJDG/EtSq3MvDOdTHbuUDK0i22apcw==
X-Received: by 2002:a17:902:6907:b0:179:c9bc:dd73 with SMTP id
 j7-20020a170902690700b00179c9bcdd73mr325522plk.159.1664378930600; 
 Wed, 28 Sep 2022 08:28:50 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 195-20020a6216cc000000b0055a9c9cfc63sm2342710pfw.201.2022.09.28.08.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 08:28:50 -0700 (PDT)
Message-ID: <a1178ec7-0263-7069-68f2-d479280fbe8a@linaro.org>
Date: Wed, 28 Sep 2022 08:28:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 2/5] module: rename module_load_one to module_load
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220928122959.16679-1-cfontana@suse.de>
 <20220928122959.16679-3-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220928122959.16679-3-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/22 05:29, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   audio/audio.c         |  2 +-
>   block.c               |  4 ++--
>   block/dmg.c           |  4 ++--
>   hw/core/qdev.c        |  2 +-
>   include/qemu/module.h | 10 +++++-----
>   qom/object.c          |  4 ++--
>   softmmu/qtest.c       |  2 +-
>   ui/console.c          |  6 +++---
>   util/module.c         | 14 +++++++-------
>   9 files changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

