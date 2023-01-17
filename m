Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C366E536
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:48:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHq3h-0006DX-Mr; Tue, 17 Jan 2023 12:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHq3f-0006DB-3A
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:47:39 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHq3d-00036w-JM
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:47:38 -0500
Received: by mail-wm1-x32f.google.com with SMTP id m15so1707328wms.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S70hy7hnAxt29XEEJxeHBbBUW/HBjwefMHzH1X/OuoM=;
 b=th1CC5v+di+U1vm6ZatTikIAR/V2gNNOk5ksZ1hQ7n052GhSQR1wIFpbKWp8cAbZQO
 pKbtw/CpJzUWewALDRyqnsu7C2Qxpqgn/qX4T18HvQWo+r0uOcmg7VLTtf/mQGPAWlWV
 FqlMNazKzTMykfh8uebrAlYyFOBvi3fzZudVhEJBDBk4NkwnqeYdqcxcDYD/TdIgrH/N
 x+VtpnPKCgueuWh9jT6HvTWVLbDK905sQAkTmVfs/NCDF9JBstLOcCjKyCYXiexD/TIa
 NmlirzCkB/Oy4HNsIjO/mPGvLq7T1cQ9peHOvOngZyxA6qbqhuaMDt373DsZSIKRTulZ
 sR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S70hy7hnAxt29XEEJxeHBbBUW/HBjwefMHzH1X/OuoM=;
 b=EEdxdlOquJvuDiDmhXtlpgDcQHXhVrB/ejffdGLKFbw1t7fuV3/Q+jCJ/5GrReW3Z6
 JtV3C3N8dWfbXPUqvXNre9oSlWzwVURWRuY5qqOIupS+W7G2EA5GUy/JXUAEk7rOm6fB
 8st7W4KKqVnJoVKvDkcO0grvlM+3BT3T/c4oO4qNguYtWyxKEB1TKjfF6QB0KQoUDtNk
 bc4ynAa1IzGfqSli7iD1G34eTJlNndFtwbCjQbdEgFxQsp7JfP/5n1bsuIJvyAGcKjaJ
 tpqeePk5puMXYVj2wHAIwITYafF283xxjGSV+6MgisZ73gT5FxyqiVWig0JqRRznuC4n
 aVtA==
X-Gm-Message-State: AFqh2kqL17BRaMn3IhiZRfkZtaLVGTAuch44iqaRuyXXC7G4ym2svYo4
 o4mwOQpuHROFSe+muVXhVVpGUF19MnwtbQ41
X-Google-Smtp-Source: AMrXdXsc+vIP3g7l4TrFluRPuzhcOj7nw9wJQvL9bswMq+9O897nmni8MMqJpCmCPP2INqkGsBPQfQ==
X-Received: by 2002:a05:600c:3d99:b0:3d2:381f:2db5 with SMTP id
 bi25-20020a05600c3d9900b003d2381f2db5mr3879683wmb.22.1673977655689; 
 Tue, 17 Jan 2023 09:47:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a1c5412000000b003db01178b62sm5258365wmb.40.2023.01.17.09.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:47:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E38961FFB7;
 Tue, 17 Jan 2023 17:47:34 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-5-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 04/22] tcg/sparc64: Remove unused goto_tb code for
 indirect jump
Date: Tue, 17 Jan 2023 17:47:30 +0000
In-reply-to: <20230109014248.2894281-5-richard.henderson@linaro.org>
Message-ID: <87a62h3vex.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

