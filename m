Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B415F4749
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 18:15:24 +0200 (CEST)
Received: from localhost ([::1]:37472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofkZm-0007Zr-Ny
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 12:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofk0w-0007W5-ER
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:39:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofk0u-0008K3-Mt
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:39:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bq9so21951871wrb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 08:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=hKSsljcEh/enogYmEY7rOwjF4eFhGNqTCu2ssPEtmvs=;
 b=oAOoTZgka0UFIoHfrVv/Nce2mj1WmjiXOrVaoUKKlCk//UkMLLxjaEcX0ooJk32uMl
 awHRGBBrdlW/jp1b+uTDdCgP1kqUuqwBzxmrjJdU8jkXVx43VQtKNPJqfDih5ThLL7wd
 1LHzgtqk1Ms04Vr2o4UwPsGK6NGVNaVnvm6Ad2BTNOTfqXlGLPPNDXMmLW6O7x4lfaFQ
 pWeZhm3nXxlBVurfpdonhpTlrN5sUAI77dJbi98/z/YvKhHNWeclO8ds6NSfMUsdV2mq
 hKgo8eWsJUpgo5+485XH8aiPiToE9VVPd2TOUVmoW5/ym33mmVoK6GPzm/G3Nj13VxFP
 +kTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=hKSsljcEh/enogYmEY7rOwjF4eFhGNqTCu2ssPEtmvs=;
 b=zIVuWi//IjyG2M4g83oACYZ98cbnd+iaIc+Bs5zsfL/6eixoY6vVAql/ZCSt1ZvZnk
 6zfTaOmN9Bdgxl6Azcg4m+6ShJA+/xX6RpN2iSno4SgZiW3TJ/arZp4sfYYxs89zUFdH
 HYhOzraYPr+bfknimvJC4K0efzVpWMdmE7oTniJZzROaJDsd4cabWAH8y+3ZEhzmEW4S
 1ollgP4psv3pHkQ2pCyOm+nWFALW0pJ8sPONBVISp52ROUBVev2IHIh0zYLAxA27QJiX
 iD6YaJeAInXisGNPrJgVrhNetXCa8/tF1kuJLa/zCe+O/16OVynfceamQStOFmwO61Et
 UEoQ==
X-Gm-Message-State: ACrzQf3/dA/myL09vp4FyOXl+uX1+AeU/CpUtNVvyB8NNTIPnTJ83OiC
 IcEFavXddAGGTawbWtefG06WgA==
X-Google-Smtp-Source: AMsMyM7Pcjoaefm/zCkaocCUNsrxP7NIfNm7Hw3pB03ompo5EwWAcbMk3QTbLaqMkKVeWCU74vgL9Q==
X-Received: by 2002:a5d:58c8:0:b0:22e:41b1:fb00 with SMTP id
 o8-20020a5d58c8000000b0022e41b1fb00mr5453401wrf.542.1664897959006; 
 Tue, 04 Oct 2022 08:39:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d4bcd000000b00226dba960b4sm12743053wrt.3.2022.10.04.08.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 08:39:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 78B351FFB7;
 Tue,  4 Oct 2022 16:39:17 +0100 (BST)
References: <20221004141051.110653-1-richard.henderson@linaro.org>
 <20221004141051.110653-18-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v7 17/18] accel/tcg: Introduce tb_pc and log_pc
Date: Tue, 04 Oct 2022 16:39:11 +0100
In-reply-to: <20221004141051.110653-18-richard.henderson@linaro.org>
Message-ID: <871qrnlhsq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The availability of tb->pc will shortly be conditional.
> Introduce accessor functions to minimize ifdefs.
>
> Pass around a known pc to places like tcg_gen_code,
> where the caller must already have the value.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

