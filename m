Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B53F472FD1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:53:28 +0100 (CET)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmhi-0006xe-Q9
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:53:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmew-00048I-1m
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:50:34 -0500
Received: from [2a00:1450:4864:20::32a] (port=34675
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmeu-0000cJ-6V
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:50:33 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so11027733wmi.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CrbFd9xij7mN6UM7d64yzXe7DJGaQ6H2F5CfdzpnhVQ=;
 b=LrQt7rhh2Qy4rtRtdPJkJTjCnMNIq5GHtnDoxjdWZVVxJo58/yZkx5ASLMgtuGjskV
 GHPGuwUkHcLKZTH0QZmGdkabwE3bod7GenbU1IPRwQyg/LEboF0ox9R37hi2M6NDnlCF
 7haeLZ9ku6Tz0V+/8IMcURoJCX0/j+FF82K5vtptCQssu1oh8FA6T/KGY0xlrbaH9aLY
 +lxirBl7Q9oLV/8OaPoRPI48KEoqTi+qYfTIZtaPHydZSeVM7xpvWtiXS9gHHBtAzdEn
 llXySiq8QfCBkrzpNv179hqIyk7lpJjnumCBP+QmkzmflZZxeaSPmtqhATjAC2TY5RsF
 buJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CrbFd9xij7mN6UM7d64yzXe7DJGaQ6H2F5CfdzpnhVQ=;
 b=OHjyWIqoyO6xZO7tmiO2Kn0jrVvZWw7BSaV4fm0nXuowD8A5Djmxg6wKNHrNn9uDOv
 LXE+Agx84LhptPINQSVEmQZQXy4tRP6EtwWYI0AJ6CS87lCNl7nbi1LMWDydDptnrYkC
 GRAwM5nQSShGi0I9iqIsUKMRjaHeDwIRCnHO6iEwc2bVUFUD9ijFwvScv1BQxJ+WnXy+
 gWLGkoowHxyQCqZuQXdD937BmJSSWMDtVlpGvALAzavkEixyVu+S2a/9/itvPyy9ut8l
 7kc1BnN9tVdORVv2M+JZTl/6azyOXLtJ+l21J+Drn7J/TErq2BybH6Evnt56z6t532V/
 4JAA==
X-Gm-Message-State: AOAM530aN9OydHsLne1fkXDXqw3hooSFUGRF6JHNEgWnmq1unJGrY4Ad
 nUrD+WFi/YB9pvmTiNWfwWxneA==
X-Google-Smtp-Source: ABdhPJz43IqU5uRQ6M0TJ+OsWaJyBS25miWVy4ChaDkcrbDOvaX0iPXlXNC4zFDkN5wQH15zthR9jw==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr38591023wmj.13.1639407030109; 
 Mon, 13 Dec 2021 06:50:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h27sm8172055wmc.43.2021.12.13.06.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 06:50:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3CB61FF96;
 Mon, 13 Dec 2021 14:50:28 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-23-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 22/26] hw/intc/arm_gicv3_its: Refactor process_its_cmd()
 to reduce nesting
Date: Mon, 13 Dec 2021 14:50:23 +0000
In-reply-to: <20211211191135.1764649-23-peter.maydell@linaro.org>
Message-ID: <87ilvsk18r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Refactor process_its_cmd() so that it consistently uses
> the structure
>   do thing;
>   if (error condition) {
>       return early;
>   }
>   do next thing;
>
> rather than doing some of the work nested inside if (not error)
> code blocks.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

