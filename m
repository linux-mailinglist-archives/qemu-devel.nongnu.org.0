Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E56FDECF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:42:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwk4m-00068D-RO; Wed, 10 May 2023 09:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk4W-0005py-Kz
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:41:40 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk4R-0008Jo-Cj
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:41:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-306f2b42a86so4695835f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726089; x=1686318089;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFriCZonhOuk6sv5IQYLJJX2xl2EvXiMAlMqHv/V1Yk=;
 b=Zs9fRy5E4H1hJhvDEHqNAqYezQd3mlt0bgycS2uq5tgA2yZP1WpgoBFcdOCd2LrmAP
 /X/EP29KEnUAAEsgG24DV23fcBGKUfda9veVf5KBJ47+SSz36dbfRO+bhA0Olwgv/bry
 LR1zFtfH57z03e5+Cr4jUL2TNRV31J9CTNiB2CdNd+/53Sl5gS++GdCh97n6qOmuYq+E
 Xvfq5fegI16XXyoLH+fwlJc2sGLt7dnB2ggsharFWKa/xFfhP5oy29NI4aBcztgE83WT
 1+dkXe6QEQ+1LDz5gq4fCl4M/nJtdW/aIvqElTWM1ljSeSPvFQ9j9DF5EUP+wgbKEacu
 r7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726089; x=1686318089;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hFriCZonhOuk6sv5IQYLJJX2xl2EvXiMAlMqHv/V1Yk=;
 b=Wp5W4xL+H1xZpg+Qq2pesjOHf3vyeqzxiDzipgSUmKVXxGrsxGbpjMTXO1wzYh7YtB
 T0K12HkpR0A4tg89wxXybCA/vZMvk4sLTHgtUkBILPCu8WouVCbA+JKpQexx8YULLqGz
 SajC1dBKhxxdGo9Qqd7SH1Sxg8577bJ6Ppqiwai/g6AhdZPcr5qdkm9ooa/Ljj4eSsPy
 cmvC6F7X0Uj1zC+sANCdvVlmy57/bxJESognweeCCU2eUWyQQuCih8+J8/jK1GFpvQTc
 bm7cLbLPvt9H+ZWMttW7j3RMbxKSXrZAaKFCdzIsfOnYnsuSOhoiOQn0YJkZpSG2Ez2M
 dUyA==
X-Gm-Message-State: AC+VfDwXGrBBnNyAN2zHzuM0llQEpGH7aRcKRUWJHnINQsxJ6yKnUziD
 mqwfq8JUtTD3+4978T+gIIFo8g==
X-Google-Smtp-Source: ACHHUZ654u1uwWwYgEut+MfuhNrk218kxdC7HeNLJRWX33tHdY2OwLtmacggAkm+yDCuXOTWNstSSQ==
X-Received: by 2002:a5d:5910:0:b0:307:a7af:402c with SMTP id
 v16-20020a5d5910000000b00307a7af402cmr4214459wrd.41.1683726089691; 
 Wed, 10 May 2023 06:41:29 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a5d5052000000b003078c535277sm12919119wrt.91.2023.05.10.06.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:41:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E85A41FFBB;
 Wed, 10 May 2023 14:41:28 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-20-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 19/30] tcg/s390x: Convert tcg_out_qemu_{ld,
 st}_slow_path
Date: Wed, 10 May 2023 14:41:21 +0100
In-reply-to: <20230506072235.597467-20-richard.henderson@linaro.org>
Message-ID: <87h6sk7187.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

> Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
> and tcg_out_st_helper_args.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

