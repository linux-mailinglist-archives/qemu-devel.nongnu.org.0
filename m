Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E121650B965
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:02:40 +0200 (CEST)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtrs-0000mb-1G
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhtoG-0007RV-NA
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:58:57 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhtoE-0006Ez-FH
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:58:55 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x18so11233350wrc.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5FB1ThhI6Y5OjYAlQpKk8M6+YZ6GDZETZ9Ra9wg6zd8=;
 b=I9eeNj8kXDeFSIKAykybXKA2zANBnQlCBZm1ZeQhZQn5nCCIdncXur6WdEzFsbWIpI
 VCysqjmXSgadsbdNwCelk22+gmJqKqa3SBDuIP92SVXLty/VyqFyNhEILkdf4REFuG6D
 rx3rJj2PVEIY8IzANUMAxMQ3CjyobCW97Iy7svv/jhViu2lrmI++qMu0Et+0WMLre3PT
 mH4kG6j/lmxTtUdBAC/IuRi3W29+fNdY2XWcZRQk7WQ5Wx7YPmb5zOK072QnEDORWxDO
 dDixAzkoh4RuyXnmurNdmay7n7MecBHOLXakcNIPAl6mg6X4BApIytWhDRn9OlJHwzjh
 6l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5FB1ThhI6Y5OjYAlQpKk8M6+YZ6GDZETZ9Ra9wg6zd8=;
 b=Zz0yk0Vpkm0Wj3VeRM+Al5Gv0c9rucZOBNQs0AZ1VZjENhQnP0+NGopU5QL/wXI9SR
 Ho6JG0j1895oeI5ien8d74Rm+pIIyohAP5SYDgTNK5g+1wCCZZKvWvrb8csk9wox3JH2
 DCNW7sNl2zmljqgmp/Nl7m+Pf69af/YlPw0L5zRPjwo+xXRLBOYCWTcMCzLVVimWWiWq
 HHl1lKKFpYmCmOw5GBtGpQIly55tyur2ptztexGiIE40rV+J9hJ6BhzSy3MuN07Uanqv
 mLN8bUnhsPtzHGKzJfa5mL8/wxitObTxwxLvTpDGjFgSQ2QXV/TIyvHAbCjZLeSPGZtk
 O0kg==
X-Gm-Message-State: AOAM531a18g3KP0KIDSft8ikRh+xJstdL3dSlc6v4tgdnN7KQUzEqOlH
 94T6LK37FcTEtdgNI9seueKEtg==
X-Google-Smtp-Source: ABdhPJx/qhdkiUi+I5F/SwOVxCQ4PjnCAZ9Lu6wGvtWpVwheAi1+unmQVaOoUaymmeOykkHIHY57Ug==
X-Received: by 2002:adf:e112:0:b0:206:d12:9c3a with SMTP id
 t18-20020adfe112000000b002060d129c3amr3825686wrz.391.1650635932490; 
 Fri, 22 Apr 2022 06:58:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003918d69b334sm5005544wmq.42.2022.04.22.06.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 06:58:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E99E1FFB7;
 Fri, 22 Apr 2022 14:58:50 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-8-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 07/60] target/arm: Extend store_cpu_offset to take
 field size
Date: Fri, 22 Apr 2022 14:58:39 +0100
In-reply-to: <20220417174426.711829-8-richard.henderson@linaro.org>
Message-ID: <87a6cdusmd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Currently we assume all fields are 32-bit.
> Prepare for fields of a single byte, using sizeof.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

