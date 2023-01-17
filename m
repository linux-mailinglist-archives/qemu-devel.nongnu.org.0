Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FDF66E5AB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:11:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqQI-00006g-Vc; Tue, 17 Jan 2023 13:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqQG-0008Vr-Nt
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:11:00 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqQF-0002td-A2
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:11:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so5364623wmb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbxdRlLt1QBXSBE5S6WfT5I5aAOS1544DeYJ9dIXrnY=;
 b=NPTnKXOgO4Eg2aqHC6jhXQf/rev6BdQcOoJFvrhcWQsCGGMvwBUQP151gYlr94iwc0
 ELpwRu+MHUPKly75BbGSu4iiJl/kQ5OcsiWN+v2Ycq7y7oOAOeIHpnjnzuQl8w+zL2YM
 9tkfQjzon7xtKG3DQ/04g3/pzqEmkXx/Gvbxe/EG/3tvuOqN2/scvjUkxPe+Tp1G5jVB
 HHGmLBMn1ze3rZmRIDcba3SZiy8m0UovBN6NqI3KwSMt0Lj1bNSdXm741uDsfh5Q6krC
 WwdM+EsKNXj0I7SVP1ngu1I50ZDvCspbwszVnD2VSONc19cvpqoc6rfKNJrAx39azGry
 wZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WbxdRlLt1QBXSBE5S6WfT5I5aAOS1544DeYJ9dIXrnY=;
 b=gUvF1ItxSXV+uPkWV51LySwA2oEOVFrdVGbjtf2gp/07DdoLFuNMZdtYb0+nS5aMQi
 qdh5Rh0Ng43kShbUSVG03aXMOfOCNti99un7XaUWHOHbGNyF+7ZDYKMRwo922wwOMB7U
 eVyxnSqR7JBzxWXSA0w9HPzHMvjCF0G0iilcTWyEMawatHWeE2lxweWsRaDrNTvAOvOW
 k49GuQd0LfnjNhFY210K3o0RDJ0mWcHHgluqLhg2iTSKYMP26nT3l5ubwgXSEAQ0dQge
 y+bbwE3GLhRtGl8Ma7cqktFVq1j4Zbo0DxjR/0tE9x6muDT5/f2Q7dzk0Cvzk63wMK99
 6H3g==
X-Gm-Message-State: AFqh2kqY4PFB3yO/zgLmjlcoqH+2JjqFayzYSt95ReY+knTvyTgAShQ8
 zXmdV1GaF9HNDTD2/cwLO9TORw==
X-Google-Smtp-Source: AMrXdXtsSJPvk57/aVf94vEcAnsRYBft7+M8A3AYBsOwTVIReundRCeHh0sntieQvQk7lFnrt9t+4g==
X-Received: by 2002:a05:600c:281:b0:3da:1132:4b63 with SMTP id
 1-20020a05600c028100b003da11324b63mr3990836wmk.5.1673979057634; 
 Tue, 17 Jan 2023 10:10:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003c6bbe910fdsm52371423wmq.9.2023.01.17.10.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:10:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C3BC81FFB7;
 Tue, 17 Jan 2023 18:10:56 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-14-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 13/22] tcg: Move tb_target_set_jmp_target declaration
 to tcg.h
Date: Tue, 17 Jan 2023 18:10:52 +0000
In-reply-to: <20230109014248.2894281-14-richard.henderson@linaro.org>
Message-ID: <877cxl2frj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

