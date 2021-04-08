Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BCA3581B0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 13:25:19 +0200 (CEST)
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSmk-0002ex-0k
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 07:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUSlD-00028s-Pu
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:23:43 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUSlB-0007t1-S7
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:23:43 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so3846948wmq.1
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 04:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+/y9AE7i9FX7xy39DqwOF9jp705+6fcrb2lPwxIF0FQ=;
 b=Dm4TIO1q6EImy5S7AKBtDAAmw/D4PzbU7ML9FnREkfCs6QqkgRG+RGBnneqzeLZj0/
 9cPZP1wcb3yeJfwCYp7Rj7vGc3feRe3HWgHn75UjyzmQh66yPvZhySJnnN5pmfWUUOLj
 grf0TK6Yer5oFTWZ3TlhJaa7rdckdvMXdz+2bvfM+a80EO1yzsK7KwjjGDAjdKy2RRJl
 utObjl/+L9hflqTet5vXsct8+ontsm+J25ONZUr6mIJcJfkCsWZrmMJ2qx1qZcPvN7xv
 BjOopC3RUskt+f3A6TrcXY5D/Vk7gCyhpHCKWHc2PQhB0UwY3O0mrO+ElV4zeNWbRoMG
 Gtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+/y9AE7i9FX7xy39DqwOF9jp705+6fcrb2lPwxIF0FQ=;
 b=NWkJJfLQirtpzWBFOA4aTiNngWnuoWUKx13tZUHdtffeeyaZhytQK0PsXr+9sRD043
 kNajjQZ0ExogICR9Zxqf3ZU71zILD+fVY31WuDH2Hf2nD7yGY9yeUzCUPPZKk4XU8RDl
 5XC5pnHUOOCIC0pncBAP/bs1VjEQl5L67YuGT6c0XIhgkcV0JcU5y1J16qOaGPC2q/5e
 S47gmLZTM06/RfgnBTjOW3FEt7vVgqmrytp+3ji8Q+DaN8tGfmVRE2i/nwZ3xsZ5eczN
 zAxAoGUf9wRyqT3GQSV1K8d5cIG58xH7dPtMDHNxzYn6MoOC6OVASCFJPsNjBphUCm6C
 QeGw==
X-Gm-Message-State: AOAM530weD5++wUYE+P1wtdV6DPhkLcBFjsFD5udphG8a7Xdknpu3Txo
 YS5Ymlof+2l+EarHnVX0BbAR9Q==
X-Google-Smtp-Source: ABdhPJzPkBef6XXpRhD0WCYjTQP+lMHeqitPOfjrb8yE4ufMmrwlkVnHP4n4HVfib/VbDmaZiVkE5g==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr8078644wmk.150.1617881019890; 
 Thu, 08 Apr 2021 04:23:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s8sm44886699wrn.97.2021.04.08.04.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:23:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5AB731FF7E;
 Thu,  8 Apr 2021 12:23:38 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-11-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 10/12] target/arm: Simplify sve mte checking
Date: Thu, 08 Apr 2021 12:23:32 +0100
In-reply-to: <20210406174031.64299-11-richard.henderson@linaro.org>
Message-ID: <878s5tt3yd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Now that mte_check1 and mte_checkN have been merged, we can
> merge sve_cont_ldst_mte_check1 and sve_cont_ldst_mte_checkN.
>
> Which means that we can eliminate the function pointer into
> sve_ldN_r and sve_stN_r, calling sve_cont_ldst_mte_check directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

