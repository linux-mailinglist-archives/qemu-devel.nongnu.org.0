Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469155B8D9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:05:00 +0200 (CEST)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kfy-0006wF-Tt
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5kd3-00047m-Fe
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:01:58 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5kcy-0006mf-RA
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:01:57 -0400
Received: by mail-wr1-x434.google.com with SMTP id v14so12027075wra.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 02:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s/jY0f9ZAL+0isEbOjXjeUHFPklFXZ5YQvSIHHHFvWM=;
 b=SA4c0EXxADxuoaiyyfYoNbdWWR5ocuImj/zLbJu8v/HDbJD/XZmSR3BolbJss9ezNz
 mf2x8yP7muvWn7imBLDjQp3Z2JQFgmcuBxk4N6grjCCsoYvUtszd44CuB2OfrDkdz/8S
 Be4w3QuzpYwk5B5nafbuAJqFQ3wa7zG0Yz6Tp/npObiGG4/BfeknAWOLUyvQQJZjGlmH
 3+ZaPNKgtGWYIkYITal42HI/wJWas7+XRMUDk0thdmfsmp81l5rl6jYrjU26GypCZKsa
 hyqGVXJv1AOxvAEcT3LgvOlZdJgvHxLpC837g6EfZU53otnkGFRT4iIxcPBIT7qIMKvF
 7xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s/jY0f9ZAL+0isEbOjXjeUHFPklFXZ5YQvSIHHHFvWM=;
 b=YjEDBx9Nzb/Bcf89Xm/A8ECnv7PoXseQw9nu63ulHMk1rYxh91xtG2l1jgUBuvxBqK
 ACj9PXQAFuTzsKqdnB0MXIu3Ve5En4H3gWuE0d/HYri8UfiQ3rn5tE9Q/cbFs34H0wHT
 /U7aeM4LfKuSx9IKP64oLl8aKF/SbISaU3tsUEdpBb7mQHW2kdvD/KVD/BFoDuBf5BQj
 Y+gVR2hB614ff8RtN0SqT5nVk1y3wSYK0OCb/qxYSCl47n4EqMnPRZECwaBeUZzAwlmO
 9ZFqWZyLxD3biFF9iQnEuwqfj6nRHfth/vLVN9nI556/8XoGK560ayD+HdhWmT0HwGTo
 P6JA==
X-Gm-Message-State: AJIora9SjDDa8T/+QFaNoIXrT4TcqwSYgjg+8nhQRkNvy6Yv9tHyDX0l
 JjuDpe+OXWkKwAYNZOaL2yuApg==
X-Google-Smtp-Source: AGRyM1vqYge81cpXClvfLNEUDKilTyCM5svHLBTISRi8N98qRcFCx2/dn9QOgZw76xsiEtSccLzSoA==
X-Received: by 2002:a5d:5231:0:b0:21b:838e:65ba with SMTP id
 i17-20020a5d5231000000b0021b838e65bamr11401217wra.412.1656320511226; 
 Mon, 27 Jun 2022 02:01:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adff90f000000b0021b90cc66a1sm9943355wrr.2.2022.06.27.02.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:01:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6306B1FFB7;
 Mon, 27 Jun 2022 10:01:49 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-48-richard.henderson@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 47/53] semihosting: Create qemu_semihosting_guestfd_init
Date: Mon, 27 Jun 2022 10:01:45 +0100
In-reply-to: <20220607204557.658541-48-richard.henderson@linaro.org>
Message-ID: <87fsjqlbsy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


Richard Henderson <richard.henderson@linaro.org> writes:

> For arm-compat, initialize console_{in,out}_gf;
> otherwise, initialize stdio file descriptors.
>
> This will go some way to cleaning up arm-compat, and
> will allow other semihosting to use normal stdio.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

