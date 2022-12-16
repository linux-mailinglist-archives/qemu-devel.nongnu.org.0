Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D5F64EAEC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69GD-0001op-QR; Fri, 16 Dec 2022 06:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69G9-0001oT-V2
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:52:13 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69G7-0005qm-NS
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:52:12 -0500
Received: by mail-wm1-x32d.google.com with SMTP id ja17so1678373wmb.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aP0tDFooOOyoi4Kk+5+T1lRdwDrj2Z0ff70Ga2Im3Pk=;
 b=U/sbxWqKxXqesgucaaS9Ztz/1wUXwyYX+lTgpcEyymeAKTKBHRtN5MjSpf4/4bWyeq
 TZVtL9OygC7vb931ZsRdKMmHFI8PQEAU23c11n1pW846BI/1ll/HWs6R7CUgsG9y5/bW
 80hickqcayMWuJAunRaZTivZEjxluYFLKTts6Sc8ujE1bk1qMnECs0bN9uWGP1ZJjlox
 vN5TIfrwn8JQTaKKmKgBx2pvbhVHjpXqYv9FXwTrxsrQPkSSeU6dJrsxaPq0fXXElWD/
 yw+b+QjMt3Ybew3PjqoW8eH4eL1XeD2QelMloP0FEwoXQX9MHpcq0x+91UCMs4bzOt3o
 5XUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aP0tDFooOOyoi4Kk+5+T1lRdwDrj2Z0ff70Ga2Im3Pk=;
 b=xMbe1lEptYe1TmH1Cc5bgFa/1LLh1cHlGE/8N9A+aSvtmKgFANCVdClHsu66wFd73Z
 aGTsZZyJrSouWhHaezXPhe5x/puOfObGhbbIzTp6sv625NP4RfByl/xXFWpaRNnuaE/T
 W3EXbs/31k1ssNZl2suZVlhtFiwK/6hFwKKdY1C8O4uKaw+jOZm5kxV1D5QBHTSaYpvs
 INmdhp/G7H5kSAXvWdKlRMuNYAXFwYj9/K/tUGM5DyB0tcFUbs/HUMSs82M6Lhzf/PLS
 G8CK/owlK5dMNrY74PYm2t3wdop8IL9pSJIgGjeI06Rhlj/esmzjqQDO0hVxxpnK4/mu
 5/lA==
X-Gm-Message-State: ANoB5pn+6omk27QZE85LmvhlZ1IZTmzv2eLzKHOe/EL7orpallDYvhm4
 4jBbBjUcEivlMdhxYlPRECx3QQ==
X-Google-Smtp-Source: AA0mqf73HkpMCRdeiXp6L0lER5V02Gk8V3vG0JjYyaK5/HYuhiMhiNMtl1G2/oAl7uhA4yxy8HGCiA==
X-Received: by 2002:a05:600c:991:b0:3cf:ab99:6b46 with SMTP id
 w17-20020a05600c099100b003cfab996b46mr24180882wmp.35.1671191529783; 
 Fri, 16 Dec 2022 03:52:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg2-20020a05600c3c8200b003b47e75b401sm11848433wmb.37.2022.12.16.03.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:52:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9F78F1FFB7;
 Fri, 16 Dec 2022 11:52:08 +0000 (GMT)
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Subject: Re: [PATCH v3 2/8] accel/tcg: Rename page_flush_tb
Date: Fri, 16 Dec 2022 11:52:03 +0000
In-reply-to: <20221209051914.398215-3-richard.henderson@linaro.org>
Message-ID: <87edszin13.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to tb_remove_all, to remove the PageDesc "page" from the name,
> and to avoid suggesting a "flush" in the icache sense.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

