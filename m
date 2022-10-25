Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D360C725
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:02:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFmD-0004W7-Ry; Tue, 25 Oct 2022 04:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFdV-0007Ww-U0
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:14 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFdL-0007Vc-A5
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:12 -0400
Received: by mail-wr1-x433.google.com with SMTP id l14so12414105wrw.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5RDtPSrqXV3yB+UTF5ELAbcRLyVSznvPZpYgJ7VFvsI=;
 b=bwcm8Ie5T9GAmBTlx5LzqXBcATpRaqcV00TiloqxTWvA1y5+jFFlFO83lE4mYD2Des
 qOVaNvDdYmmwRVWXej4xkGlbSHo5RZGGFYyo755ywme+mp75MC0CZEY8F3INpdzxJvt5
 HY4XErQ0vFmKpWVsTHs8pxL8ia/SQP4NMMjfIUUQ8bNGUt7w3mLiVRKt6cCndg/ep2XF
 wrrOFMWkP12H55o5OVfD/xvoo/g32sNd01cwZH8sUU52E0qgDY0ccylTIV6hEizOWwQP
 dV2rL5dhkpzl4gH7crPXdQvagGvl4RPVZ9xDGk0/qQjqHsgRdyfvPFhzRivmA4/KA69o
 4//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5RDtPSrqXV3yB+UTF5ELAbcRLyVSznvPZpYgJ7VFvsI=;
 b=TVvkVOvFkKEbxYFc/TKDHAMVw6LrN19kTujc977V8Fx1JRCWe2IXbblwoS0w9cnpUw
 Iha2XsSy+HpBLXVxNgbJUvbtbZlk1BFWN4ey/XBdPf5bigDiQb6SpCZ0OOAq5IaV7oP6
 +KAJSGWjB1b5pE3CtS9C3aGy2QG8D5KdXeRIoW9dRubxS0dgqKcBN0qk09KVuhAWsyWG
 UwGZhw5bxPvEGLsU/Duku5Pj5nRgf0KMJeLZCIVuB/fJ9+7wwSEJEw0PkPiTRWU/u2x3
 ++oJOGW/K8qw8xsjUOPfq2AFIKPVKue55ak3nOyK5kQrXELmC3eNcrpnK9P/qb3WGAB6
 vxdw==
X-Gm-Message-State: ACrzQf2OsQepdCPulZOSeJqBdRwloIlGibw47U9nBwQEEl7mgyRUpGQs
 U7boyqdOY0aBrLWVC+LyTmNRtA==
X-Google-Smtp-Source: AMsMyM7uCZqe698uf4XnJo9eZMlQ2jixoJmGVjJZf9Cqnkp8PQxNxixwjmbrAkXApE6XRDpGy83+9A==
X-Received: by 2002:adf:d1ca:0:b0:236:737f:8dfa with SMTP id
 b10-20020adfd1ca000000b00236737f8dfamr5634107wrd.588.1666687801386; 
 Tue, 25 Oct 2022 01:50:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a1ca404000000b003c41144b3cfsm10247807wme.20.2022.10.25.01.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 01:50:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CA2F1FFB7;
 Tue, 25 Oct 2022 09:50:00 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-7-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 06/24] accel/tcg: Move assert_no_pages_locked to internal.h
Date: Tue, 25 Oct 2022 09:49:56 +0100
In-reply-to: <20221006031113.1139454-7-richard.henderson@linaro.org>
Message-ID: <878rl48eyv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> There are no users outside of accel/tcg; this function
> does not need to be defined in exec-all.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

