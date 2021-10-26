Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7979543B550
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:17:49 +0200 (CEST)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOCy-00015v-In
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfO5m-0000mK-8P
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:10:22 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfO5k-00043Y-KL
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:10:21 -0400
Received: by mail-pg1-x52d.google.com with SMTP id l186so7995590pge.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FdA8SHTA0FBg8jN09V8bNpAp9wK1CHXA1aYUJDxAVPs=;
 b=TuxLGz2y1pzWWjOwCXigaHXEcE6Xwpc+XFOmlfFm+SEJgIQDMgeyFSjxzFUEnee5MQ
 88n8hXzod4HmBcv/x3/AoHl9sbwzH2fTQ6M+a1ZBIe2SMdBwE5uxIZtw7TJFV60b+A5g
 8elyHWIaEWUpgU4HeXz+fhXhf9EwO/1Ox21IjAjCqu4iSi80AqD6r3HGJTB6UNc1ZScS
 8+dgagn1F8+BRul1CF8k0ImnFI0G0cJDY6a2j4taRhLLi1gYhfnU4BBzj5c8paAXzm1O
 h1NKACVVRamEwzSbkkbno1Kd6zJ9AUpolVzeqI3lWE+9wHW7VHwgCrsDFpC4fQTcFEUI
 XypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FdA8SHTA0FBg8jN09V8bNpAp9wK1CHXA1aYUJDxAVPs=;
 b=0YpOy6XIFJz5OIUPe4lcThqBw+d7teoTCZ1rZb/8I5flECrG7d0Igh6HWCarOb08R8
 bDnL6K4eZHxP2nT9Ef+/Z3fsLgepLaAXh/2L7rs63IUIfNKM+CVhcWmO+ogsDWKIxX4u
 EYaN/sGA8VhQiFMXu4in4oAtHtGuEruCcaRcOTHIRZx1tb9zJkKaSkeqVLtRQmxxUdhK
 Nz2dE4DgEzFk+70UwwGC8tWayuhzGfxBRQKzQS6Dq3dkUOOzC2KDgEtBi1H5Kdk1/D5i
 MJekF6rKnqBXuAJxGL5uJEUnPxXeIUtkKSAcgf6rUPKf9CBaUsfwmt9a1b9qId6miSjz
 t43A==
X-Gm-Message-State: AOAM531HpsYFLZ+JN7rm9l8WOqs3hUdVTEm61oozVSa/DwgfsfvkSQqB
 DSkXwnZ1U+EaXU+KthiIVOJgOA==
X-Google-Smtp-Source: ABdhPJyur7o50XgrhybkoJirBPXezn/b4YSzN/fDDCgBfnpG0uItGgnf64unf6Kbt3v7fVrvr+5ngA==
X-Received: by 2002:a05:6a00:2410:b0:409:5fbd:cb40 with SMTP id
 z16-20020a056a00241000b004095fbdcb40mr26625680pfh.8.1635261019003; 
 Tue, 26 Oct 2021 08:10:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z10sm10519943pfh.106.2021.10.26.08.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:10:18 -0700 (PDT)
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>, Warner Losh <imp@bsdimp.com>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
 <CANCZdfr5TAUYeZaRrm0TM-iEaV+BNwWw_JTUHbcr5QwPWhO0iQ@mail.gmail.com>
 <YXgBArG7wRi+hpMx@stefanha-x1.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85df7de0-cebb-efe9-d26b-f459a37a6621@linaro.org>
Date: Tue, 26 Oct 2021 08:10:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXgBArG7wRi+hpMx@stefanha-x1.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 6:22 AM, Stefan Hajnoczi wrote:
> If "safe" TLS variables are opt-in then we'll likely have obscure bugs
> when code changes to access a TLS variable that was previously never
> accessed from a coroutine. There is no compiler error and no way to
> detect this. When it happens debugging it is painful.

Co-routines are never used in user-only builds.


r~

