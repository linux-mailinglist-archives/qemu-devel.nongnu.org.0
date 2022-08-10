Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B4A58ED7D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:40:53 +0200 (CEST)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlx6-0006iH-B1
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlYt-0002N3-D2
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:15:51 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlYq-0003jq-U8
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:15:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gk3so27623642ejb.8
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=YHDvTU9Tj0gRaQayNLVP7FG8kFhYf3bsCXCnPwkvUPY=;
 b=Paa5RSWSnZmIYZVZNTdhsq5rjMOHXfK0mganH5tJP/tPco3nYQ9qDve2yddU5RSoY5
 gMGjapax88d1RvZDL1FNRNtxIVkwvs9X/NlBQvhaQ9rjvweVbA3gZ/ge/opTMq3DiUwc
 WGMERfrofG6tgBE43LQPgzymDB/EZIFDP1q8ernp7+ixhILa4rOxYggR+XJ5Oj/Sd+bO
 gwp29mnCC0XTj5+lhMaHHW0C0qX2BZBTWPO/xPXzhRqyKDqjn16HDROt6w1OBZcts/wF
 h0GYYZMy7n650H0WP3S7aSbeUz6PO7B9Ec7f/WQKKjPpxc/M+ep2VyHk02tZVtMZ8jWG
 Hbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=YHDvTU9Tj0gRaQayNLVP7FG8kFhYf3bsCXCnPwkvUPY=;
 b=vp1HWHLoCVD32rAJt8NwZWDqRna6k75x3oC6QQeQOKhkN6lrmGM8WvwFW+aXtHZ2cl
 BzwbDh9d+esER7EQDjXBFzTYg6zd/yqhnPLPuaZigVkg3EhtaEechuD7QSdAnrjIIV0k
 Daxxo3tixbo8fSFsr3P1naOoGNsjTffyddrcNO4xKwp4pz6GtcX9mh3svNgcdNu9kr+S
 GqinGzib30bSKZhQIsEDjx6P9xa6UA2/nAZLVBCfWVIJhkxI+i1zoQ4qc/Iy/724KYJP
 0RRd4g2w6Da8ZbiXSn1D6v0qhMPJNek7biOihvUYzjbqIFEAJ/nQr062cFLDA844f1c7
 uDqQ==
X-Gm-Message-State: ACgBeo1rx7HzMKsE7jD49u5inM2vSBbBklYU0N7hflfYr1nACWI/wJTQ
 RCtcS9BCOxFpXTCiSnyU4+HPoQ==
X-Google-Smtp-Source: AA6agR7mmxjP6lCQlp5fDt9idhZPpqZhTMMzjfjmbmsU/fXqOnxGia+Jg+M8qS1B3OkReEm/9Ezd4Q==
X-Received: by 2002:a17:906:730e:b0:731:48fe:3f10 with SMTP id
 di14-20020a170906730e00b0073148fe3f10mr12462595ejc.185.1660137347527; 
 Wed, 10 Aug 2022 06:15:47 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a17090676cc00b007309d640484sm2281993ejn.91.2022.08.10.06.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:15:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B87B51FFB7;
 Wed, 10 Aug 2022 14:15:46 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-21-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 20/62] target/arm: Add is_secure parameter to
 get_phys_addr_v5
Date: Wed, 10 Aug 2022 14:15:42 +0100
In-reply-to: <20220703082419.770989-21-richard.henderson@linaro.org>
Message-ID: <87o7wskznh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the use of regime_is_secure from get_phys_addr_v5.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

