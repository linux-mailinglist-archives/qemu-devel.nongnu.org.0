Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638D167CD59
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:13:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL2zW-0004Ea-Mh; Thu, 26 Jan 2023 09:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL2zU-0004E5-C6
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:12:36 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL2zS-0005PJ-3v
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:12:36 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m15so1203336wms.4
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 06:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/uYQIFQgdvoulc6g4XrIYkL0SYovlkjTajmCLFj9ac=;
 b=ZNQY4SgA677xviF0058F07Qt1f+Ui6NSK2nwtJDBORIF+/W3+8AJpybL2V1YaHeXmm
 AjjEn9dN1M4ZNyNIrDveyMmH3pM6mEx/IYksNMxNbf6tQ7aGuZOFXItwx4+d00agrC7U
 qjagwElqpNfydq2C+trzxTPxqn7WlW37ZsoSYYBM4j+g6Pv8luiaOOJrHSPtzSQWbbDj
 0huyIsPrF1/w1UWuT/4rL+pBHKpuU04wbImW+aUQZ5NRCwi97kkEQEW7d8mhHyXOOFcX
 dNsBCUi0VeLy+l/La4OiiQWn2hhVXdicBYeHwV61G7IUfqMblRTFW+2fEWUnY+wm/vnT
 DFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q/uYQIFQgdvoulc6g4XrIYkL0SYovlkjTajmCLFj9ac=;
 b=dFbfyfzH8MsLczx/UPpRvpQdN2Bamm42kvLnf8CsC+lEp++BwkLJhkL+TITEaufLmi
 bO0khAIVtu4MR2ei7sHgiuDfxzpNxhxd6hD6nsY2fdN7oufCIWosBd5B7SNenUDrdtTT
 6fJiD0E/+KNsFfOZINctIskvecsyt7De/vJzST0WsO45TNIF2Ttju1rRo/AmOTPPe2NH
 2MAHMZ9o50eofePlWfEO6CYXu5MPpRVp50Lqp7dMihrQIjif/i3OQHtob694yJu5+gq3
 TPQ7E+tbswoit77acAvkYH6cuvxlqi5j73zmIZcdDuzMF3M/eX5GJV9Krt05leoqOlxg
 N4Lg==
X-Gm-Message-State: AFqh2kpwbCEgtm6FmnAX9p5wZx5k5/xFP0pckBH3f/StPM0brlA5fgR7
 +Pm1ZEr6Qavhiu7qF3gzHknWhg==
X-Google-Smtp-Source: AMrXdXtEm4IiKORqpznfSmue87yvc0c9pPEUUM5DCizmcaYrvjxmj9erbZKr0vFam0v0gujcg9ugRw==
X-Received: by 2002:a05:600c:4f42:b0:3db:2e62:1d69 with SMTP id
 m2-20020a05600c4f4200b003db2e621d69mr25291878wmq.31.1674742351970; 
 Thu, 26 Jan 2023 06:12:31 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c26d200b003da28dfdedcsm1860843wmv.5.2023.01.26.06.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:12:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 14A1F1FFB7;
 Thu, 26 Jan 2023 14:12:31 +0000 (GMT)
References: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>, Peter Maydell
 <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] sbsa-ref: remove cortex-a76 from list of supported cpus
Date: Thu, 26 Jan 2023 14:12:26 +0000
In-reply-to: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
Message-ID: <87lelppepc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> Cortex-A76 supports 40bits of address space. sbsa-ref's memory
> starts above this limit.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

