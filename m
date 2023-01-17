Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B3B66E609
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:32:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqkn-0008TG-Fz; Tue, 17 Jan 2023 13:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqkQ-0008PA-RZ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:31:51 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqkP-0007Wd-Cg
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:31:50 -0500
Received: by mail-wr1-x430.google.com with SMTP id k8so17057991wrc.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S1hSmE7u2ADP6JT7mN+F9pBpcsgzSyExs15UbggO6FU=;
 b=rfsHADJ2WlL54MXh0G0Z+UEba9isNkoY3324FWMEqwah6PE9hSxDavSMaS1ne2wV+Y
 lGVFNPLd4FEwc2w/R64qTIR4bhjrcRREVAp1EvXqyivEaFobmyTo7Kjb6TC99ewuwE9D
 m0PRZSxe1WPoEB4BXitOtJbraY1g36MdMeH39Dyn41MpSSNpjPMg0UeNRGNpHAY8y7jA
 PGRHnWD91PFedXyUVPg5NhdlPq58DyaQv+ne32oQ01Pq1tXldsglqXEsuMie9nazxm5S
 CLR2hTYhkM1yVfmaSbxtDwtZMVaftJXz4h2+/ND8M6GbnbfocvMQEo8erSNTMl72gh7H
 B98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S1hSmE7u2ADP6JT7mN+F9pBpcsgzSyExs15UbggO6FU=;
 b=KZdFHZ04VH2OCsVGLSx4FzOAh5KD8atCieO9sa9eGRZ6FuQGeI8i9/JHKV/qo7Yr06
 Xh/RKWcMaaHUq9qqihXnuEmSEoZ5yUP47KyU3BfwdS3FkFMcSUpj1zgjHpt4AdPAFcQo
 RFRRO53ypNHcylFIxjeaMn5J6/oCoY28g1QGQoO4ciP7jq5YT3FGIVFT+Ier/m9fIoud
 JaMRWLmJw+g705jvlhqNWMi1p2JXB45t+IsF/6SEjaIrQ7dc17IfqDPYUWsl2fqW9PUn
 xecOrm3JmVFDVZ68UnWQEXj49O8lPzkQiwQuFGX/EqIwE+Mfddwyct/4G2rq8q/5erlR
 qP9w==
X-Gm-Message-State: AFqh2kpxxrRV3H/CnMJziWGQIwaai0zW9NV/BfdgFQc6foWt4Be9+qRs
 WxRLWTCyf/pCa8mEm5YJVPEcVg==
X-Google-Smtp-Source: AMrXdXtQzx5bIlHmLjeXPXHydGHMaPIRDUpmW2zQ89wTfJZTON3oS5ZBwKxKilQsEvLTEGh1jUhAMw==
X-Received: by 2002:a05:6000:1f95:b0:2be:143a:fdf3 with SMTP id
 bw21-20020a0560001f9500b002be143afdf3mr3733247wrb.43.1673980308017; 
 Tue, 17 Jan 2023 10:31:48 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4bc6000000b0027323b19ecesm29204468wrt.16.2023.01.17.10.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:31:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 42BF51FFB7;
 Tue, 17 Jan 2023 18:31:47 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-19-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 18/22] tcg/sparc64: Remove USE_REG_TB
Date: Tue, 17 Jan 2023 18:31:43 +0000
In-reply-to: <20230109014248.2894281-19-richard.henderson@linaro.org>
Message-ID: <87lem1108c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> This is always true for sparc64, so this is dead since 3a5f6805c7ca.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

