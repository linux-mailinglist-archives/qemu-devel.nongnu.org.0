Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB93260CD57
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:23:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJsd-0006pu-DZ; Tue, 25 Oct 2022 09:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onJsV-0005xy-Sy
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:22:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onJsR-0001Ti-VM
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:21:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id bp11so20380640wrb.9
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wOIesmmFPOqpM9jFPHJnLb6cbHgWsvu0Nga+TFV8Ni4=;
 b=QGJ/RAms7PODfNbGxcfHOoO4FDB4M+XRUCn5tWk/QfoyhN8WTUAeFDnFoCM5d3GnZd
 bIkg75SXF6yK7kpJEgJNNke1J9gVhuhQilloFsf3PbJ5fLZscGxzOwhv+mCBOUDZAoOE
 ZpIioFNvktmqSQrJyZTza47FGqomt9dpDyE2ByLCCJR2n+oqhWcHDIvq0Ki2icivLb/V
 HwAuH7V+J7ZWAiCWFK2PtS9YHeuo4rUMDWRDnY3RpE5eucFwQKWA60DRSTWFc25ycHlc
 +gzcWfBMMF4z49j6xjcViJLn5uxZIQNYWM7qY5UjZTalkCbNffMZ6Qdo2f1T3Iee2rpl
 Tz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wOIesmmFPOqpM9jFPHJnLb6cbHgWsvu0Nga+TFV8Ni4=;
 b=QLeNNnRsClrEkWT+s88hPSjP7ohE0yqjActSMTQo8CKhMnOrbW7gb2obQvvzQuBu9r
 jdSu9IJx8QBwSrrVKPnyhcGvdR9i1DF7CzgC2bXK+uH6gpWLswHurI9zdKPSIp53qRD5
 EMwJxRg4tJn//j9Ki5gYjKJZv8p8SZS1zwpQMllbqXBubHzGFAI4bJgU0LHWZcGyTem9
 Txv/43d+SsyONeStlr++GA8FkcfoDLQAXtLspPNviM+ivD19mRNwP3jrikTIeyHlZ/oi
 5qT2dafdT+hCQa92/Mn6ZcAxkXakLAttjdvGkQRtDw4pjwI5WUCpbIt9K/9t7T8zobUi
 sIRQ==
X-Gm-Message-State: ACrzQf0PMw7NKhuKd1Y9pumlEBqmAioY102Q7QxNXv3VTPXUkb1Bshnp
 CzbmDGR6c+Gpd4f/7p5tIX4o4w==
X-Google-Smtp-Source: AMsMyM4pORho3YVd0/vAfDvI41Xff6o3Rs1UoivIqsK1lU8r5k4bEPrzGOHzys2+16R3bl8oMh4Ftw==
X-Received: by 2002:a05:600c:3c8a:b0:3b4:eff4:a94f with SMTP id
 bg10-20020a05600c3c8a00b003b4eff4a94fmr45904715wmb.105.1666704114026; 
 Tue, 25 Oct 2022 06:21:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adfaa05000000b002366f9bd717sm3137689wrd.45.2022.10.25.06.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 06:21:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 029691FFB7;
 Tue, 25 Oct 2022 14:21:53 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-12-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 11/24] accel/tcg: Rename tb_invalidate_phys_page_range
 and drop end parameter
Date: Tue, 25 Oct 2022 14:21:48 +0100
In-reply-to: <20221006031113.1139454-12-richard.henderson@linaro.org>
Message-ID: <87ilk86ntb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> This function is is never called with a real range,
> only for a single page.  Drop the second parameter
> and rename to tb_invalidate_phys_page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

