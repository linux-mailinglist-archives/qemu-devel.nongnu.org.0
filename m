Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B763CFA6F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:21:15 +0200 (CEST)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pgQ-0002wz-DK
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5pb9-0002zy-My
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:15:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5pb4-0004Wg-AC
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:15:43 -0400
Received: by mail-wr1-x433.google.com with SMTP id d2so26027524wrn.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZuaUUz9ZgqXt03PFJYDUwA0eQa7q8wLFGdppWrAR/Eg=;
 b=DH75MMjAerz1RyKT7WqhcYjdmIu/tXByZlemZeC0kJwpfFhEbcguj9haDR8FPhmefD
 qKUUVfMjsU9nadzTlXo8/z2Ri47mynJdD1ZZS3eN+BjtekV2HnLcnW6PdpvihsDwvwGm
 PaLc14kvJ/gg8+Uope92chNFSQun8jhbOCSeyQXWGFTkE3KXFXZOffg22+Fzz2h03lur
 L6s8lIurs6RwM2YhIUcpL3eLPh7mGKJzFWXzQPYqEIn6Rj7jHh1Psca1NSnZdlxBNgHu
 ZQgrbzhwr/wKaar8drk8uGz+WiWoL8ftLWVrPVEapFInSIRRh25Ap//MVo7tLvnTftCp
 JJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZuaUUz9ZgqXt03PFJYDUwA0eQa7q8wLFGdppWrAR/Eg=;
 b=r4NOfyRCUrffP0rgEq7Op5B910sWZqBXL7GkWUukoK7xNCX1aaWBIGR8xe0CVUHJK+
 sPe2yfK9i/3XvSz6K1UE12te3RaieDJxUs9qgw9zxKULI62/K0QT3xY0Etc/h535pMWE
 WchlFl5nug+4WmCpuNxx3GLVYWMoU7NYRhfozyTiXA0c4mPI7lULJ/dMhD1FhpQRtpH+
 Y5DOBmawGo7JAny+nxSsearMUh++YwtTIs8OdrPmeQDX9O8Zes+jOXrsQ17e2x1JH4JD
 NaHDFDW70tLaihp920R6wbxfLG4n+vLOinMH9NygSgTLoStXCENSattZrLqtTVFzPhky
 ghrw==
X-Gm-Message-State: AOAM530P9eZgojkCzJw/A52sIoBqaqIW6vZO2WXaCtVPudiLsJWbH+HY
 vhV0d5rxwO//9fzjIoSmxSz61g==
X-Google-Smtp-Source: ABdhPJxbKkeLNxEv43vihpRdoSev9nyXYsc0I4OHMizMBtV47a3vVDdqqETOR/fGySEE4o5+nqLY3g==
X-Received: by 2002:a5d:610b:: with SMTP id v11mr36229595wrt.58.1626786940498; 
 Tue, 20 Jul 2021 06:15:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d67sm2834190wmd.9.2021.07.20.06.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:15:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC19A1FF7E;
 Tue, 20 Jul 2021 14:15:38 +0100 (BST)
References: <20210720011800.483966-1-richard.henderson@linaro.org>
 <20210720011800.483966-12-richard.henderson@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.1 v5 11/15] accel/tcg: Merge tb_find into its only
 caller
Date: Tue, 20 Jul 2021 14:15:34 +0100
In-reply-to: <20210720011800.483966-12-richard.henderson@linaro.org>
Message-ID: <87czrdm8hx.fsf@linaro.org>
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We are going to want two things:
> (1) check for breakpoints will want to break out of the loop here,
> (2) cflags can only be calculated with pc in hand.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

