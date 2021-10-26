Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F098C43B58A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:27:52 +0200 (CEST)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOMi-00020E-2c
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfOCu-00038V-4A
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:17:47 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfOCs-0006YT-ND
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:17:43 -0400
Received: by mail-lf1-x134.google.com with SMTP id l13so21798402lfg.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3LG9kKcD/kLqPVd2i+83CWqnwx4IGrGi6di7FGTgIyw=;
 b=QEW1oWCKH62Tau11zP73yrYBmTFvR9QbvXBusyWbp7RFgMX6b7PSzV+M4gZaSqcdBk
 e2/ckWQyZU8TrYSLL7v+4jjY5OUnBkt9FxFSatGiMB/2u8szsVG/l+oEsgrxZOxBbneh
 G4jJZKW8p4FkoILuEieCobw02wVWtzPkG+Qr1dTvciiKe8DOu8vOkmUwBZuXXpb85Vx8
 HXoekUcVPPcOR+pTxLPfX9O2k4t+EQ9a+DZSKSQFa958ZpxsQP0/3CiN5W0zS7/PzPCd
 dKRBfMpWqo4FCzohmTWhsK8Qs9TMl+FUhzevgZgkgg1kbLaULF+w0D4iZJAfdFsHOnjn
 m3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3LG9kKcD/kLqPVd2i+83CWqnwx4IGrGi6di7FGTgIyw=;
 b=ncfTibzQVqYAyOdvPk4Srbh8A53ewj6J9wJcrnGUzrZGJy9cyYxNdl5D1Y0lMZ3CAk
 Pzrvec0eNVA5PuDFR+DM0yI6jMus7W5C6ZG6hgtF+RRYT+b2z1fL2kXrYhJttzeNNgTL
 VZ+iiC3u30HCRL90hKNruexXn5rThMMF4/1Ijjt4xITXOlLMzzfc68uXTEPU1rPD+mho
 g2pJ6Rlk5T40M+frY0CVzTMkL92Akbwm/h8ffytW8xOkeahGVG5oG64LmrS85NYLq2cs
 opxqlJAt3jETEc0RVc9thZNwBoHEcK21OxS9UR7u97fn3ynagi8EOTB8xkjg9eDmk8tg
 xQiw==
X-Gm-Message-State: AOAM530fO6bt7pW1dey9f+ziLufxZ39b/M8Idp7NcV3CFjskGUlA2OWy
 8qP0cupJFCpCnqUeam7b6e9KRZF7W294Lw==
X-Google-Smtp-Source: ABdhPJw32gGwdqkILLo12YtLIuSeAh0N2h54q4Cm/N9QSussazLj6aFm4iITkk+JCFHqLf8DOqIzow==
X-Received: by 2002:ac2:4352:: with SMTP id o18mr23431754lfl.48.1635261457776; 
 Tue, 26 Oct 2021 08:17:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm2069534ljo.14.2021.10.26.08.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 08:17:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94C0E1FF96;
 Tue, 26 Oct 2021 16:17:20 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-14-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 13/48] tcg/optimize: Use a boolean to avoid a mass of
 continues
Date: Tue, 26 Oct 2021 16:17:15 +0100
In-reply-to: <20211021210539.825582-14-richard.henderson@linaro.org>
Message-ID: <87ee8724u7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x134.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

