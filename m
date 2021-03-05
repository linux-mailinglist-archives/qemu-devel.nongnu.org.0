Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D96B32F290
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:31:36 +0100 (CET)
Received: from localhost ([::1]:35906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFEd-0001Y6-Ez
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEeb-0003um-P3
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:54:25 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEeZ-0002hZ-8k
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:54:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id d15so3024120wrv.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YDOWLsDN5jfQEU4KWFfDrHQ5E5dyr2gWna54gP5ZEyc=;
 b=iCzQl0Fk4Di/Np/pyrARACjc75/7PHDleVn79KAS9RvlSVR01wPNidEhKoLwWOONcM
 wBwESiUhwQBHuIjZJf7ZtbfKsO+j2AvsxROG26eSb1K2tOvzns67Sp3ZvuNNCedHTTGo
 ldVgIjtcwyPcKdhgEVLkekAAa9bE9D9hSFxmgeFk59wJ1iK+/CLN9KNcWrOj5ez+N2aa
 Q9VY8TdG9eT4Y8GuyzXGnUywSuaTRHN3aLp3WIYA6KYe/t2R3JrE3KTWwqAPWlr3Gh00
 TfM3+a4Z/KV5qrt6ogLa3oracsBMcVFoGdjphzmuN+ICkJ7noYV1y9/3VCXmwUzkQg/Y
 YRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YDOWLsDN5jfQEU4KWFfDrHQ5E5dyr2gWna54gP5ZEyc=;
 b=A4TV7v8/HfPG+/Yg6y9qfJnle3aB3dK3D6McHa9x6t/mR4UIkd9oRwMsC7ChByRp0s
 Y/Izh6vm00sJwrN0oYj4pR2QAgYM6wELT2kPN+xRnocdTQFA1WbXSPk7rg+pNZklIrZD
 fpCnQDxNHQHgNXe4yKHWwTn8EBMOscJdRCAcq+6vUHEEmbNp+MBwWcVIDrUTuerghppC
 zP1mslRhByV+VNn9F4C3q7JGCNJE3SRM+mmCqJEls/v6ii7VbFM2RbHmNj09rO9ZSpZY
 LXne5dAgs4SK8CDWOTedMurUUS7ji9thwzfmwLDIu4+HrFtyxs92khw1gn/CEXli1Ck6
 bnSw==
X-Gm-Message-State: AOAM530YVjDVAmGhP+hOFR/kTjKh9B0Vv+Hz5XVmTw0sL/glme9b+Ae+
 I3/kctS/JdVFQVLcDYXvtuWqecqUCsQbaA==
X-Google-Smtp-Source: ABdhPJxnBp7pcTNYwZylN+uoYihcIhkDD+VUDx/Wt36m50J45yf74MzzcgWpMFxiwwuvl3JIYVHaNA==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr10398007wrq.136.1614966857636; 
 Fri, 05 Mar 2021 09:54:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d7sm5321025wrs.42.2021.03.05.09.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:54:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 026F31FF91;
 Fri,  5 Mar 2021 17:54:15 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-20-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 19/27] tcg/tci: Merge basic arithmetic operations
Date: Fri, 05 Mar 2021 17:54:09 +0000
In-reply-to: <20210302175741.1079851-20-richard.henderson@linaro.org>
Message-ID: <87sg59cwqh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This includes add, sub, mul, and, or, xor.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

