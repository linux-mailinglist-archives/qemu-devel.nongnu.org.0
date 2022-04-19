Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140925069BD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 13:21:48 +0200 (CEST)
Received: from localhost ([::1]:49400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nglvW-0004Li-34
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 07:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglqY-0008QL-GO
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:16:38 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:36558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglqX-0003HH-0K
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:16:38 -0400
Received: by mail-ej1-x631.google.com with SMTP id k23so32164278ejd.3
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FTz/EifYevEfRJUpkmXrJSbI7BVb1qxS5BSat36D7Iw=;
 b=jAlNNYNDpV+vtMqS4qdQABybp9lcrq4MfOLw+wQPCAMXWnhUL7/d8gOXfo1yCDc6tb
 xFDfJyXSzF/ZtvMpRbRkCRwTRbHv4/0mWJaAZiarNNLfAO9Md67ALp0erLmRl3Wty8Yg
 pbnp8JtId24d15ZEn0g1Udob6zcpOivO5eDOUje+gkcWofGPWVeXxJCKCtix3QWLHrjU
 /8xmeM097cTRfbpqa3TqqEQBKQ/5vrYrqF9YGBaFU1MXuVauZDPdTvqGj02/GAZD5Mhi
 jG6QD4JMjbWQx3UmEDlpae+01ZBGGA8InqQuvkbYSUe+Nuf8hIgzkQjX/p90s5gPF9qD
 9R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FTz/EifYevEfRJUpkmXrJSbI7BVb1qxS5BSat36D7Iw=;
 b=juHSyAm4VySqBuOO8ux/Mvm6zoftAoAcwGf7+DLB1ILktzXNLN6oi6gF8PQ9PcP2Cm
 wa0UevEpr54/2oew226C4q2WVyQT9pQbhGbBYUZpufnaEq9R+zoqnkLtHgdba95SuVE5
 cdI7BXQPwGIa9ta1pIWnyaYAsWVYYdUI71wBGjM5bnyM9CGk+sduOWkEr8Mr63AihNs5
 nknDosiRJjdc/3tJ7H1Dj49HDHVBz/8uWiCVXN2OIlaeTCseh6wm/yWITiNKZqiU6+3E
 ucYR8lvfiuTtbs4biwsNsWjY3v3I3JDYvXW/vTnOB/mOolo9QobqNwO64Bm31KeqCKew
 W2gg==
X-Gm-Message-State: AOAM533ACTpzRgoVra/MDRYdBhiiMSqQpIVBB7rVtkz+48MGdourgpfn
 nIhWWN1GNehdTYkgJso6K432nA==
X-Google-Smtp-Source: ABdhPJzEWRzfYJ+Kw76Hu4sgkX9sNvIIVUs5j34PESU0yE7kf/9AwLC+XRDe5pY5Yt/Sdm+GaJlE0A==
X-Received: by 2002:a17:907:7e92:b0:6e8:8df7:cf92 with SMTP id
 qb18-20020a1709077e9200b006e88df7cf92mr12426789ejc.541.1650366995692; 
 Tue, 19 Apr 2022 04:16:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ce21-20020a170906b25500b006e89869cbf9sm5593359ejb.105.2022.04.19.04.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:16:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B0EC1FFB7;
 Tue, 19 Apr 2022 12:16:34 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-5-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 04/60] target/arm: Update SCTLR bits to ARMv9.2
Date: Tue, 19 Apr 2022 12:16:29 +0100
In-reply-to: <20220417174426.711829-5-richard.henderson@linaro.org>
Message-ID: <87tuapwcfh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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

> Update SCTLR_ELx fields per ARM DDI0487 H.a.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

