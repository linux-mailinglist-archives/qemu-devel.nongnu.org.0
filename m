Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A64E307A96
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:23:48 +0100 (CET)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5A5D-00050x-7t
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A17-0002fH-Dk
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:19:33 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A15-0003FK-Uk
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:19:33 -0500
Received: by mail-wm1-x32c.google.com with SMTP id y187so5042177wmd.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=11iKn8e2NRTvdcPPHlzqTDSQna5yDqrDhY4PxaCOCEI=;
 b=koBFepu6E4hDouDjtLMKCELaKocY7MKglCqVcB6kOoC7oV9enHLxbe192eSAGnzMe2
 j5RzqTyAM/l7+uEr/OeA3+BvZa3xBJiQ1c+N4FhyWfAMfNgYBQMhahltyw27HLUBbe0f
 UrJkzuCCatfVEjNcAED1hvlRvIV4V8kAhcUJ4wmheeK4DZDCMDyjfRCofBYl8L+492VB
 96i2+zEgGGY/umaAKo+KujMe/dlJGQL6zdwZTFmADU1osuSfw0YIyibQYit+t4cf/LxD
 4GKfoXx9cmYpbNz2dM6GzBEA1xzP10wLsL5qC+ZOZSWcSc4NBw0YphBZ2RXWbfsgmwKJ
 ATRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=11iKn8e2NRTvdcPPHlzqTDSQna5yDqrDhY4PxaCOCEI=;
 b=R4ursRj9B15Oma0acHbnfXzbhyDiybQ8N/j5+p5SzTWauWmN4Ekz7VzxP+vU/ms3aS
 o+TSjdGGoza/c35LoHrOKDXPB+BneLQO3xMNteyMxuzWpHqm+ZvqpI/QR5thxb0z286R
 Fq/YKPOyAjY04KcVfiH5PVg/MlQEEaz0Vt1va4hQlZJ6KWEFHbV6IqsWpaMkEw0HWjLi
 ODteeBrAnJzWFO4c2QVZfTFsvLzjGAIm5JhxBUmLYfWAEsf364USt6g1240Lb59KqOkC
 84Xt961bBkDE0/UT+TVsQTDfCxREFPFzOrizKqzVrVbayyEuVjFvrHR7/qCL4CQbkTFE
 mAtg==
X-Gm-Message-State: AOAM533Xl12zVw9Tx8VPHSaX/rUsVddsXgEGDnQpXmpUCizRqJyUpM2J
 iLPF9X2d4BT/xbgvRTXg4dUI+Q==
X-Google-Smtp-Source: ABdhPJxFjUBjooc8URQH+nsCnFaXBQxBIinwidxj1eL0eCTQmW9G1OYm971n3rdrswVDGP+IMFLUvg==
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr17213wme.154.1611850770605;
 Thu, 28 Jan 2021 08:19:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d3sm8136299wrp.79.2021.01.28.08.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:19:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9106B1FF7E;
 Thu, 28 Jan 2021 16:19:28 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-14-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 13/23] tcg/tci: Merge INDEX_op_ld16u_{i32,i64}
Date: Thu, 28 Jan 2021 16:19:24 +0000
In-reply-to: <20210128082331.196801-14-richard.henderson@linaro.org>
Message-ID: <87zh0tt4of.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Eliminating a TODO for ld16u_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

