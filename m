Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8B6FF773
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:35:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9F8-00063d-MK; Thu, 11 May 2023 12:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9F3-00063C-F9
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:34:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9Ex-0005sj-Dd
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:34:07 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f42d937d2eso21648735e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683822841; x=1686414841;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdThCdvEuJr2kKM9MmYFroJ/tNF27DJ0dKv6UZ7NCCQ=;
 b=xSZFvvAZzc08q+rWbga4AeWGB956b8T9udUKIdDkFkJ6mP72FV4QBIr8rjvey9f+e7
 uodOF+oS3lkQ3hymvVdNUiBU5Gyhsw/JDRqmeS18cutRRh3Hq1uIAqohczvoVlziyGJh
 31/poAC19JGemM7LbBbZTkRKaC7kWEhkIbdGyO7YxwmNIcwjbmSj9DiFlELZ0R+s80nT
 B2+zjVsMQWc1yQf6HjiUGiFfDOG9to5Qkjws2hm5Nh5kwaMMZvFqmfSv1v4ny/hm1uht
 tuARYhiZNkeIwJoXUg0kqgfQnebqRLy/N2r4cyV9a1PS1SoZS7AaduIP+MHYCVaL2RU/
 2iEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683822841; x=1686414841;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AdThCdvEuJr2kKM9MmYFroJ/tNF27DJ0dKv6UZ7NCCQ=;
 b=Tv4HZCTI6e2MGzGhHWJyJIQzOzWS84RlhAYOFsM+Rj7/OJUUqi84sIJK/o7Zsy3Pz5
 nmy9u80NotxjSS/J4epLnYej3pIgQZVScpboAAvmxMGrFISG3ODIRd2hGV5ynC9N0T21
 KcaUfeJRLRCVGN3d1lBQ7npxhtQCWRoXGBI/pydLnIV2Mp14KGrL5HPxAFMFhe2aGbXE
 ekH0JL5K+SjfJ5OhrqVXxgBKEj/IFtkF9YfO5IHHC46YqeyYjN5ugmSDejGbxNCdPw5E
 iAB/IMGk1GNUPmTfC3+BCImbCJz8w4Trniwyd/LeruknXogjjx3rU1PgaEdOvqpCnx5a
 FBOA==
X-Gm-Message-State: AC+VfDyYxFqTub8DsNq8ET6P3FMCnpd1T94OSllYkBoA8vfPNHpvE4Zs
 7aOC2a+uOB2DPngJ+8R1xje4Lg==
X-Google-Smtp-Source: ACHHUZ71MxV7ogswuE8bF3hwScgMUZwvcqzEPSF42EMULxOZUhIFGHGx19LGrFylaqHm8UH/gZwAUQ==
X-Received: by 2002:adf:f091:0:b0:2d7:4c98:78fe with SMTP id
 n17-20020adff091000000b002d74c9878femr15137412wro.34.1683822841261; 
 Thu, 11 May 2023 09:34:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003f33f8f0a05sm26200379wmi.9.2023.05.11.09.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:34:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C1E41FFBB;
 Thu, 11 May 2023 17:34:00 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-16-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 15/84] tcg/tci: Elimnate TARGET_LONG_BITS, target_ulong
Date: Thu, 11 May 2023 17:33:55 +0100
In-reply-to: <20230503072331.1747057-16-richard.henderson@linaro.org>
Message-ID: <875y8y25fr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> We now have the address size as part of the opcode, so
> we no longer need to test TARGET_LONG_BITS.  We can use
> uint64_t for target_ulong, as passed into load/store helpers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

