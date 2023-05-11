Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CC96FF474
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:33:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7Ly-0004Qp-6z; Thu, 11 May 2023 10:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7Lw-0004Oy-7m
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:33:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7Lu-00018S-My
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:33:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f41d087b3bso59549065e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683815585; x=1686407585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KpHzLOSJrTCY3XJh7eVaSPkQ6h945WIPK/8UNUd2XSQ=;
 b=se1oSMrLpho2+tfA02dn9DLPuw9mcNtZgx3zp+Hh2G4W/xpkCQXbUKOwQcCKV4JSw2
 9nV5amOnw1cf6eTGeIs7K9cvJ5YfpHfTZn/DOe16qF6AZ7uF019eNVV733ikVtSPW7V2
 pKEwHh4BWzDPd59fbD6FcEjVs2c3SydqD8LEzQ4jfMKKqY8AwLbmt+dz7uyNcDFVBheh
 MFFjDw6fzP7z2U49mA/eFMRV9Te7MYqmaxtGQF0tOI3Pf5vFqWHHkCR6lMod+/of9DxF
 ZGQypNeRx/VFDd2gJN7QOO8rTjYmvPvmYxRg4cmShEVoDHjn/51N8bDb/p3OFRHwhtiZ
 WRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683815585; x=1686407585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KpHzLOSJrTCY3XJh7eVaSPkQ6h945WIPK/8UNUd2XSQ=;
 b=kXteUGFqiDafDKWwq7qivXIG75bRFJCszlJGvtft+soYQCSPy75kAYge8unw8+jPxd
 /SmSwmGkQaesraLDmAOnn+ItJIdbRp+EdQyFGb+1I8LS/jeAabwop3w5tLFnk2fcu/rc
 a/dTO94CY14KkfGwL9tc66yzmAvKfFvx17wrJtVszVTXSUEQnyCsJjzZEp7LJktZeunK
 cqmyq5HRev7tyelmSEWlUSm5+sSZiaP8n2ezyknox0cOB7yGUN2L7ILzoQcGgQeh/03j
 0EvwY90dEagn/t25KS8A/FaY8u5TUmxX8ORv/yKWHeAb1UQuzuVgQZi6FaW2PsYij16l
 +gJg==
X-Gm-Message-State: AC+VfDwbFBJcXAxPgnR0FU1AKVSasiGSlm1JAM+xptuJnhu2DiZzvFa7
 xbwVLkghhtnaxK8CWMXEgzY=
X-Google-Smtp-Source: ACHHUZ4P9KuQYmmiafte5mMjC9Qc0TLL7eBZpQj9OgS0ETheLOf9eOcUWZgk3zw4FBwLAgKZe7skzQ==
X-Received: by 2002:a05:600c:243:b0:3f4:28db:f60b with SMTP id
 3-20020a05600c024300b003f428dbf60bmr7630206wmj.29.1683815585169; 
 Thu, 11 May 2023 07:33:05 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c1d0b00b003f1978bbcd6sm12077257wms.3.2023.05.11.07.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 07:33:04 -0700 (PDT)
Date: Thu, 11 May 2023 15:33:04 +0100
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Linux OpenRISC <linux-openrisc@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] target/openrisc: Setup FPU for detecting tininess
 before rounding
Message-ID: <ZFz8oJ+hYdsoZeoi@antec>
References: <20230510153228.264954-1-shorne@gmail.com>
 <20230510153228.264954-4-shorne@gmail.com>
 <390d7ef2-1240-55a3-4b13-ab8796921b7a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <390d7ef2-1240-55a3-4b13-ab8796921b7a@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 10, 2023 at 05:16:20PM +0100, Richard Henderson wrote:
> On 5/10/23 16:32, Stafford Horne wrote:
> > OpenRISC defines tininess to be detected before rounding.  Setup qemu to
> > obey this.
> > 
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> > Since v1:
> >   - Remove setting default NaN behavior.  I discussed with the FPU developers and
> >     they mentioned the OpenRISC hardware should be IEEE compliant when handling
> >     and forwarding NaN payloads, and they don't want try change this.
> 
> There is no such thing as IEEE compliant for NaN payloads.
> All of that is implementation defined.

I see, I haven't yet seen to IEEE 754 spec so I don't know how much is covered.
It was incorrect to assume forwarding semantics was covered.

> All OpenRISC needs to do is document its intentions (and then double-check
> that fpu/softfloat-specialize.c.inc does what is documented).

Understood, that makes sense, also reading that code I see how all other
architectures are able to ifdef their way to a specific behavior.  I will see
what our current implementions do and update the spec and qemu as a separate
task.

> 
> Anyway, back to this patch,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> :-)

Thank you ^_^

-Stafford

