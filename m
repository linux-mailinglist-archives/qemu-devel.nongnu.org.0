Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A396FF5EC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:27:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8Bu-0004Jc-UN; Thu, 11 May 2023 11:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8Bt-0004IO-43
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:26:49 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8Br-0006W9-L7
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:26:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f4ad71b00eso13889775e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683818806; x=1686410806;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KWKnmxZOZwNrHDCTGTcW/phuN/AvnD7KFTfFTgogys=;
 b=W9Ckagf7MAXeVfd7+ouGFr4/Uf+ITaMQD6IS3Rs8TZCGI4GQYBSv8U1hlYhbID6mEI
 4rJrGUBvI92AXtNYmOAJahz9iGMBI5gXJ5Ds99xsxu5uV7q2yxayTXcV+fqu90afLZHG
 D0F9UotC/e0RbiMYHX7t79SlgQZVwHmEq1wsORIZFhKthO4yJtaaIHN+a2zTmCmk1gpm
 n0y2jI2bqf3b+ISvitCIbNy7f3NM0QIHe2W9QlDb8vBJB1L7A8HhOkabhYpoUeRSlvb8
 3np1PSp1sXCv8e2k6+eQITYdgva0dapskr1WGuWYw1VF1SsxuCOiSCOAdzEJxcSpigDL
 qQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683818806; x=1686410806;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6KWKnmxZOZwNrHDCTGTcW/phuN/AvnD7KFTfFTgogys=;
 b=b0fA4mE3W0zxym8w/zXb9Wx7UAxTZXECowpCzmZ3yQ9BfbSA0Ty+YphN5V00ZQVBWO
 9WNeNrV3II1/C3PsyWIP8dFZC0cP55nMyo0VlI7OkdFM/yfroZgs24BGk9fb7i3e6Ct8
 wMSsHeDuNori6z+8wv/9E+YlM5xUujUEkl4froT5mTE43GOKMgxT6SuwmglGOOtLiuod
 KfCK92aXM/Ip5Nb8kaU0zS4ItNOjSbLAGWZk3jkEBLK6r83bG8Bswh3VUWK4cXGzd5+N
 mHiXB1VoaQzWa56lGrMU+WG5qXVIPD6RTIvfrpDdDiL8qFuaxwWSg0I8GqQWcc9MCPlq
 cd+Q==
X-Gm-Message-State: AC+VfDyf+rEMLEMMuWqR2E41gAgNt/YV6p0YViO9mUhenHWuQA1tolZt
 i8Exzc20Lug18aFOn7BJv6+rUQ==
X-Google-Smtp-Source: ACHHUZ5Td/PZvLAjdw3zsxkbhPav7L8Y2KPNf+InKXQRg9ClpLLjMPjxgOaeytwKyGyPCoEmVv58rA==
X-Received: by 2002:a5d:4485:0:b0:2fe:c0ea:18b4 with SMTP id
 j5-20020a5d4485000000b002fec0ea18b4mr14687971wrq.24.1683818805977; 
 Thu, 11 May 2023 08:26:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b0030795b2be15sm13091692wrx.103.2023.05.11.08.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:26:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 025711FFBB;
 Thu, 11 May 2023 16:26:45 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-4-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 03/84] accel/tcg: Widen tcg-ldst.h addresses to uint64_t
Date: Thu, 11 May 2023 16:26:40 +0100
In-reply-to: <20230503072331.1747057-4-richard.henderson@linaro.org>
Message-ID: <87lehu3n4b.fsf@linaro.org>
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Always pass the target address as uint64_t.
> Adjust tcg_out_{ld,st}_helper_args to match.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

