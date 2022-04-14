Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E7750145F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:27:08 +0200 (CEST)
Received: from localhost ([::1]:58606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1ND-0001UB-7r
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1M9-0000pi-Il
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:26:01 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1M7-0004OH-PY
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:26:01 -0400
Received: by mail-ed1-x52a.google.com with SMTP id c64so6791099edf.11
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vdFRB00Bs4/noikomiFA+0oSYfZP89wTopOJl54hijc=;
 b=WnjbIY+J9MhlpcS5m3llvL3SjW0W/v5gFt/GbylrfdS4HYoPwD1dReo7Z2rwKGvH86
 JygTGMzWrCHGWzZZnQU11K+o/Q7LRkvz4LKAqpTH8bpAvH0wmW9X5c50szu/jRcPW0zv
 35u4rmwQ5HwFutduWJF1V6ojtigWvgmglMY+ukCjrPSsvZ0Uzxx58AyvmkyfFkqlMXYU
 K/LnoCHrIZIHH82CHZjLlMqxZEsKTtR24yWGogN8RnWhsqyj8vwoUg+rGMnLbeN+CtEk
 RtUNclxA27QnHWOVnRDKwqNSrBINuWBuP72VdTtYmfhSqy3y97YB1a+UUJQIEyNMhS9k
 YvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vdFRB00Bs4/noikomiFA+0oSYfZP89wTopOJl54hijc=;
 b=OZVLG3p9vc281kVdO4mi2Uwj+3PH1MVvPRhBSaeW/VuFSjrco8bz5F/AJRM+KF084N
 3EB0THA47FlZedQCZrDtyM7EMqLmtNqqCeYiAPadn/eaXOefUZG46z2GkGqHwFv64uee
 Mahjxv24yT0+X7sN+e75RA+Q8Cb/5V5inG/7tlIJwrnewLH1MSxUTg+MfcmV5hwzz3cT
 cg0hUwl+T5lo/1NiLJ4ReC9XlVHau4osJsixbS/7D2+Fpbn0spn0C11Jr6f5dkd8PURA
 uMu2gCL7FEBMpZK/niY/C8opxiLFRzhh5DjEnANvulw+JZLKtFJBZYpYL7yNJ3v9SMqA
 46gw==
X-Gm-Message-State: AOAM532Ky9kw95V+wX+Hys7/4tAoXzDjhjfJvCSOGh+IfMu02VgE9lSY
 LePDblMDLZcF1aCTlLprswQ3aA==
X-Google-Smtp-Source: ABdhPJxofrZ6FE/ouNwsv+P5Sygg/nN4+1Fw7/DWsuWxaFvY2doD7m6BB2+Y9F7blVFdGnLEc/bL2A==
X-Received: by 2002:a05:6402:35d1:b0:419:7f2e:cdb7 with SMTP id
 z17-20020a05640235d100b004197f2ecdb7mr3677439edc.152.1649949958155; 
 Thu, 14 Apr 2022 08:25:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a50ff16000000b00410d029ea5csm1090786edu.96.2022.04.14.08.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:25:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C56B1FFB7;
 Thu, 14 Apr 2022 16:25:56 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-44-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 35/39] util/log: Hoist the eval of is_daemonized in
 qemu_set_log_internal
Date: Thu, 14 Apr 2022 16:25:51 +0100
In-reply-to: <20220326132534.543738-44-richard.henderson@linaro.org>
Message-ID: <87fsmfu1ob.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Only call is_daemonized once.
> We require the result on all paths after this point.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

