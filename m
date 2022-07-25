Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E078B57FF5D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:55:38 +0200 (CEST)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxcX-0006WJ-IO
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFxPa-00008M-Ik
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:42:14 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFxPW-0001gS-TK
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:42:12 -0400
Received: by mail-ed1-x534.google.com with SMTP id p5so2778397edi.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sZ7A5X9s2mTm61vjQaWPsO52yTPkZLIfPfuaQCcLLU0=;
 b=l1xFB8KUArnEUUXq22D2Q1nArGBTdaxi/YJK/Bjqkzdm7Z9R+st6glCera9vpkaJ+g
 AQC+JxjWL8fidB2GDMOlhwfZNVhmYCQ4b20n0U8aUQ4NU1Oi/zI46VlJyEPeUqoPm/zf
 SzknXf6Gx3CgTQeXpaIxg/Kk2P2Ek8CeL6ff1PKKwIsa2MQ6RugbskJJP//jCVQDCzJy
 cUG015qfjjbJgybfdo94KgnBCmOp6kaeBpxt+/jFT/IgO06AytGIXXVX+ck7FU+BBd66
 ZsVAhOnkfsMP38b40C33P4Zile4SCLiXbSpakbtNexrtiBeoEhFSSn8nG6b6wnIhUmy4
 VsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sZ7A5X9s2mTm61vjQaWPsO52yTPkZLIfPfuaQCcLLU0=;
 b=dqOW1s4+qR1ESHw5L7CymktxxB1NKZYurLtwYycYwLP2qx7Nw6b92jO6PkcUfGRcb7
 x3TTnWsUPLiCJFYyBTWp2vWwY11VlsRqb1zXP7Xm2QYPo/j0nGBJJhkH+x3Gkj9Nt19x
 4ZSoFUvIz2gqzWnCraHT1MFBY/pSOowtaaKZc78y0dVl588XeR3MHU9QJHqhQaMXo5SN
 epUeP080RvwtwLlXFqwoFX7L1zQcHkfvCFmmrmQ8BebLWDbORXG7x7Ou6dtcvG7lCojn
 4X/QqwB4AoxRDzPmzfz6s0wlQYFQqWwpG3uDufQfWJY0uuyCsSOGeIVBfmdELDwoyeEy
 dT2A==
X-Gm-Message-State: AJIora8IeajAF6crcjKxn9ISk7ED244ZjpGcWxhBw+jafBXM++l3pEbB
 /uo/1IO9Se+KvZ9FeF0xPTG5dw==
X-Google-Smtp-Source: AGRyM1tArpkX9wx1X+gB8PfZ1vDmXKxEhc8fRcawgdaM679vV3/EUgTJ9brivGj4aXkucJZwDQX0mw==
X-Received: by 2002:a05:6402:3408:b0:43c:2dd3:d86b with SMTP id
 k8-20020a056402340800b0043c2dd3d86bmr1595551edc.108.1658752928226; 
 Mon, 25 Jul 2022 05:42:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b0072fe6408526sm495311ejo.9.2022.07.25.05.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 05:42:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4961D1FFB7;
 Mon, 25 Jul 2022 13:42:06 +0100 (BST)
References: <20220722233614.7254-1-iii@linux.ibm.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/2] accel/tcg: Test unaligned stores to s390x
 low-address-protected lowcore
Date: Mon, 25 Jul 2022 13:41:59 +0100
In-reply-to: <20220722233614.7254-1-iii@linux.ibm.com>
Message-ID: <87h735ictd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Hi,
>
> This is a follow-up series for [1].
>
> The fix has been committed.
>
> I asked Christian what might be a good alternative for the
> mmio-debug-exit device for testing, and he suggested to look into
> shutdown/panic actions.
>
> Patch 1 adds a new panic action.
> Patch 2 tests unaligned stores to s390x low-address-protected lowcore;
> it performs a shutdown on success and panic on failure.
>
> Best regards,
> Ilya

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

