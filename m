Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F0C686459
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:35:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAID-000674-43; Wed, 01 Feb 2023 05:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAIA-00066W-VQ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:24:38 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAI8-0001rb-Ev
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:24:38 -0500
Received: by mail-wr1-x436.google.com with SMTP id t7so8452815wrp.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUSIKDVdI3AtBicPaYvSXoCED6+fujyX3WoBd48K0cs=;
 b=NsC4Edo9sK4a92/XG9NV/7L+y6QvTDGXJRRc+dZ6JQJSJvOzD/Rdcicxa3XBVSwuE/
 r62sEjMy0hx00mmmBpUGEZ/eVvJwOucrWdMoJ5oTcuhGBrlaZI7nkK7gIrxH6RyhVbcj
 S3Fz6TPMpfflXKe1I6f1+Rm0pnK6ZYnwFN1CO2UDdXnooru24GTclyAQRM9cRZLBNh9g
 iRG3Ctp2CCWecAIZBrZ0GtknaolzCX5lhdRXMJ4WBjAMswPogqBDUDQ0suwqvF9IRRRh
 01XuEznp4E7gl/dOyD2gCfiVVXvUWJEeQjASMhoSDh4dfZbu5bX2YWulbdtuHZHHPsEA
 jhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aUSIKDVdI3AtBicPaYvSXoCED6+fujyX3WoBd48K0cs=;
 b=m5Fb2Bv/tXaZYP8+DM5DsNhbSzzCZl5g27a7QFhl79/UMBOdaQpU03CCEMejOTyvQM
 f7XnnBzJtBswmyMn1Zhj7oV2oBuhVddRIPIZaAyXOPad/sDip/SwnI43nRHtzNgws2AW
 pIwadF/VE4A0E3Q/KsT0TpXk4vWPGiV4zcKgwZaRQvne87wT+GL7z0iEuRofK2xtczGd
 LZtEKdNkyMVjHAwPokq60jqOV1he8Y7OVtxkBK4CTOpIY0g6gmZ2+QJjtcflMHbOy2Xa
 HSCIfNzpjbFe8Q2tRn1PzwI+OnvdMczl77jlA0vQyM9WijcCs+phrYrkmYMqytQCpmt+
 MGsA==
X-Gm-Message-State: AO0yUKXxEQmC/1eTG+6s4JwfgmgxnD90Th38tV0c92RplDQXV30x70bS
 gHAFbmY0hXsPg2aJa/eM/AINgg==
X-Google-Smtp-Source: AK7set8+lMqvxTLrvCIEKgs7i2xS/NELV5YHrUPaXF7g+U3XGDPT/6GLS71LaeFwlk4Bnu+5HY+5dA==
X-Received: by 2002:adf:e5c9:0:b0:2bf:ae1e:1080 with SMTP id
 a9-20020adfe5c9000000b002bfae1e1080mr2046654wrn.21.1675247075052; 
 Wed, 01 Feb 2023 02:24:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056000024f00b002bfae16ee2fsm17605355wrz.111.2023.02.01.02.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:24:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4AEEA1FFB7;
 Wed,  1 Feb 2023 10:24:34 +0000 (GMT)
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
 <eeb9c64164a72bcdf77c76d1923ff9d9feeff206.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [PATCH 4/9] Updated the FSF address in file include/qemu/uri.h
Date: Wed, 01 Feb 2023 10:24:29 +0000
In-reply-to: <eeb9c64164a72bcdf77c76d1923ff9d9feeff206.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
Message-ID: <87edr9smxp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk> writes:

> Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

