Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A02B6C1E04
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 18:32:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peJLu-00030w-He; Mon, 20 Mar 2023 13:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peJLp-0002yp-Lv
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:31:17 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peJLo-00088M-1f
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:31:17 -0400
Received: by mail-wm1-x336.google.com with SMTP id o32so1677486wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679333474;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oha47q0tdTM50gSmDk9+4+Vh+qfJO54F5z3MUa/AmCY=;
 b=D3D9j3vlEK/F5rBwGPDRRDz+TUDKY/zdpBe4nLrfxH9xu9k++G/c5vuFJk2RogFEZX
 t0gpqe6+aAXdbhfF109rMrLIRnfaEZhc9HkdIWRGKWVyF2XrF/WkE/FxYtSARjNCOSwa
 Mump6hGHEBlfucgQP0eYiBsD8dXn0tcz+7Yd4B9Cp45vko3nIXq39/3+DFSjcLkqyNkZ
 w7J/DM42MYsW7ru2xJ/J13CbT6fRm/PGOJvoL7/A3BPVu/T8aO0diKecVe9yvtcZyDKw
 nOQbZW5gcRGIpLOCtYeoqLG8TIXMfZpO4wInkXZADKsavCqcM8DFsC5TPElkoDKfcY5C
 6VJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679333474;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oha47q0tdTM50gSmDk9+4+Vh+qfJO54F5z3MUa/AmCY=;
 b=kJ+urJP6VmmMgLujBncY1dH+79pHcIcrAFncTR/BCItLTgDVT+LTvjnj7iP0lAh2AQ
 tZz8GU77pTgQwTjqyT3lwt+lGbOJg8oJpKpV+9jbFn942csNzmDxceQoDLOw80XpBUgq
 hqRvYseWWdSd41rlajhoPklAhH+9qNm8+r8S5XbAMvgNtLKd4VOH7Xd2dbEv4EA9uFnD
 XkcaF5ZMDn8r0dyibvUUO78Bzw8JMDl7nLEONn9iCr9qqfQNGqZkoC4lNw+h2Kb32DQk
 mafIGGjX3D/j73pNLUKH43rSXBU6/qMMf6E+ZktPIab28Dz0Q+SpY5a+HIsuLeUzxMPR
 frqg==
X-Gm-Message-State: AO0yUKWfX6lOmOXl88HseiDCN2mAvMJaIiO7wzkjmPSMPNdz/rs2qCiz
 c5FtcEx5h4y8XjiORenv2uToKA==
X-Google-Smtp-Source: AK7set9n3Hh0PKcswn/XiJqMCxP4rjpEnE9y+JHGpCPfJPsk5QRc9IH2CfNDBruCYEp1bWII6IZ0Ew==
X-Received: by 2002:a7b:c7c6:0:b0:3ed:ce50:435a with SMTP id
 z6-20020a7bc7c6000000b003edce50435amr275247wmk.10.1679333473850; 
 Mon, 20 Mar 2023 10:31:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c211a00b003ee097c58e3sm2268554wml.39.2023.03.20.10.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 10:31:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DE5C1FFB7;
 Mon, 20 Mar 2023 17:31:13 +0000 (GMT)
References: <20230310195252.210956-1-richard.henderson@linaro.org>
 <ZBcW9PeFAlQQlPeR@cota-l14>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emilio Cota <cota@braap.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/7] plugin: fix clearing of plugin_mem_cbs on TB exit
Date: Mon, 20 Mar 2023 17:31:03 +0000
In-reply-to: <ZBcW9PeFAlQQlPeR@cota-l14>
Message-ID: <87a60772ji.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Emilio Cota <cota@braap.org> writes:

> On Fri, Mar 10, 2023 at 11:52:45 -0800, Richard Henderson wrote:
>> Changes for v2:
> (snip)
>> Richard Henderson (7):
>>   tcg: Clear plugin_mem_cbs on TB exit
>>   tcg: Drop plugin_gen_disable_mem_helpers from tcg_gen_exit_tb
>>   include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT
>>   *: Add missing includes of qemu/error-report.h
>>   *: Add missing includes of qemu/plugin.h
>>   include/qemu: Split out plugin-event.h
>>   include/qemu/plugin: Inline qemu_plugin_disable_mem_helpers
>
> Reviewed-by: Emilio Cota <cota@braap.org>
>
> Thanks, Richard!
>
> Alex: is it too late to add my R-b tags to the series?

I have to re-roll so I'll do that now.

>
> 		Emilio


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

