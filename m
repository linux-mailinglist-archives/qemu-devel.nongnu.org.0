Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5222A6610A7
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 18:55:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEDNY-0000oE-GH; Sat, 07 Jan 2023 12:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEDNW-0000nz-Bb
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 12:53:10 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEDNU-0004hD-TX
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 12:53:10 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d3so5039255plr.10
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 09:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oHrPmumkI2PTGdh4ZkVi7/9RgKP51jEy87tMgeP6DXU=;
 b=k3Uk0I9W76gOITB/QZdjIK4IZDSTIjdbLU60dqimoq+2Ut2pjNPqfJZrEKr94iFXiw
 Y1QS5t4e640UdND+iTHDRyCLb9Ke38rswDNnnKD6931QiBKMkaM4f9TZnOOvDr24NjbG
 y1ODVbG4snrbUgM9LNQENuRrj77qfgtUSsxNKZnmsJbRjEO+3VoN3/7kKlOJUnrKhVLK
 mCR7xUlXjSg0+HjyHqj+jnORo+Nk3tNKDzEBhuzkbMzDO/ZXeqxfznGLWYYIYyKLq5kz
 OvdtrnyzWM6JPWMfhoAY2epoSCYewsFQdDPKusZwODJPE4UOj2o+THgFFcyYpoiF/oIq
 fu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oHrPmumkI2PTGdh4ZkVi7/9RgKP51jEy87tMgeP6DXU=;
 b=vRtC2kTszWqCQR2Tc8M62sNfYWO3sj4GF+yye+1xy00UNOHxn1YFX0EFnU6ic90DM7
 c9FHgJ7wHYdrfypR2GlbuHCnp+3Ej7ihUUu4olt1TjSTBfSnEnsI9Pl8/6AUA7nYt0zz
 W+a2VnguX8/mRvoFZM7msmrZVz7mjbxa+wZtNjGDwSX2ppMNs3jAuUxIPYjTARBZhdn+
 1hVCacYyuU5mo9vwPCQPXqwXqSNeKu6eb9OcZcbOATngEDysTpGtzeTEvHJMkz3N1Q8Q
 cbS9O5C/0EkUoRSIw0b7dvF06a0/RbmCEJVDArbb40ddrMYxyBkTeMrTuqP4zhGqOCR7
 7yKQ==
X-Gm-Message-State: AFqh2kpjF3/CwY7LiKT1Y2X+8/DLFe9sBd/XMfQe6CdhpUug2umxEMWo
 O6r8rswCAOyQ04wHviCAuTaPgg==
X-Google-Smtp-Source: AMrXdXtyM3iV76fxfXT/PXQutE8tWenzSDqaR5OXg5+L+SgMRv1OyLOoQqT/c2kvzy/lNo8+GDuDdw==
X-Received: by 2002:a17:903:41cf:b0:192:a69d:11f7 with SMTP id
 u15-20020a17090341cf00b00192a69d11f7mr43032813ple.27.1673113987220; 
 Sat, 07 Jan 2023 09:53:07 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:8a2d:2011:f402:6f82?
 ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a170902c94700b00192dcd1b0e5sm2979986pla.265.2023.01.07.09.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 09:53:06 -0800 (PST)
Message-ID: <2c840f1b-35ca-3bdf-c412-430daaea601c@linaro.org>
Date: Sat, 7 Jan 2023 09:53:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 00/40] Toward class init of cpu features
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <CAFEAcA8K=1CNZfDG8i3bSXXSWT7D2oWg4jyupwYmw8oR7MJVsQ@mail.gmail.com>
 <9f9a6c22-315b-de1e-958e-89963c5e7e90@linaro.org>
 <CAFEAcA8cxJFpB9V826DjSsFOy7VYh5TWXb4vRYDUeOMjQgk-eQ@mail.gmail.com>
 <874jt32ppl.fsf@linaro.org> <7e695013-7261-50b5-a779-34640701eb6c@linaro.org>
 <87v8li1w67.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87v8li1w67.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.114,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/7/23 02:19, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 1/6/23 15:43, Alex Bennée wrote:
>>> What about cloning objects after they are realised? After all that is
>>> what we do for the core CPUClass in user-mode.
>>
>> No we don't.  Where do you get that idea?
> 
> Well linux-user does cpu_copy which involves a create step followed by a
> reset and then a bunch of copying state across. Can we assume all CPUs
> get reset before they are actively used?

The hash table creation happens during qdev_realize, there in cpu_create.

> Would it be too hacky to defer the creation of those hash tables to the
> reset phase and skip it if already defined?

Even then you have the copy after the reset, so no, that won't work.


r~

