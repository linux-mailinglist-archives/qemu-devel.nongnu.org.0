Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0A34D5310
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 21:28:56 +0100 (CET)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSPP4-00007s-IX
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 15:28:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nSPNg-000741-Nb
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:27:28 -0500
Received: from [2a00:1450:4864:20::636] (port=38750
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nSPNf-00089i-9k
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:27:28 -0500
Received: by mail-ej1-x636.google.com with SMTP id r13so14666049ejd.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 12:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5Jf4a9nQF2v+ZmK/69NE4I8x70TK1v/cbcmbazKZrbk=;
 b=pzK9MHkSh0/q/CKAxiIrAlMVxUrCScY1DRZca2EG3ZWvvSaRgWTrzE4aPuxcjq5/O9
 jP5dQxSZbu2+flhiP1XkpDzSsRvtrEn03cHr3DuNz9T/duIOoJvMJF0cpBX+p+CT1qFu
 VL1NulqTLrrVE4vNi2EQthOCiTBxwCemkRiWLywZlazpCGGJ/aN8zK1+ITC2c5q2gIbR
 x6QsxDHGaKBrwEdViZqr0ovHolfWCf0DFs1m68JBDGbPQrpJVfSoQ67uIq/GuKzzpRZ2
 3pt885XVPb0jiSY/rxVkpyCpctjW3GGoOq/5CJ+f2rTCqncRQfQmfMhzlaBzBiBeRtmJ
 Py6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5Jf4a9nQF2v+ZmK/69NE4I8x70TK1v/cbcmbazKZrbk=;
 b=AVaiS6LA8Q/FlD4Oht/K6CfnHU4eyQ6uk6+0xtShl2we+f++EB921chKnwRLd+CZQm
 3H2MUV60SmyaMosaTXNPiQzYeHOCvO20sjSHkpcffyDcAAnCTbAOeC0LXSc8Rr2zSpSX
 3TDJNgPjZ5i458of9YuQEGlqD9VG4xNOGKe/E38Qchu7JvoAclnTmFhGifjxOzo4mPtp
 oSwRMK0X5YYWdauRQrLnMnlrpE+I9e83l2TQSDKZXgtCtsenKp6ZIsJMd7GJEhW27qdM
 IQb0GpSui8qDtxp+e9owd2OrjV3xgyvimHtC79XD/W/L1Wv9HLhwW5JPt+3NDTTJhcv3
 QZpw==
X-Gm-Message-State: AOAM5313f1allpyHUOo6RrKms/wY6+stOKSFSAecsbvxNF+000998C5D
 xSokKPy7/h+dKUcV1BJzLJtgyg==
X-Google-Smtp-Source: ABdhPJxNQimOH/oQepOmL2r9t6aMVPozsUTIchBbbrktFURV8mQp+rC6x8QmaRq8Ng45MiN8HB/BWQ==
X-Received: by 2002:a17:906:facf:b0:6cd:ed0e:ed7 with SMTP id
 lu15-20020a170906facf00b006cded0e0ed7mr5652086ejb.376.1646944045522; 
 Thu, 10 Mar 2022 12:27:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a170907914400b006d9e0b46fabsm2132431ejs.193.2022.03.10.12.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:27:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9453C1FFB7;
 Thu, 10 Mar 2022 20:27:23 +0000 (GMT)
References: <20220308215435.21806-1-tsimpson@quicinc.com>
 <CAFEAcA99YqE01snCWLt8h+FK--4j4QiJ-NczcmpL+1AgVyghNw@mail.gmail.com>
 <SN4PR0201MB8808049705FEC26DEF39294EDE0B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PULL 00/12] Hexagon (target/hexagon) queue
Date: Thu, 10 Mar 2022 20:26:52 +0000
In-reply-to: <SN4PR0201MB8808049705FEC26DEF39294EDE0B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Message-ID: <87r1794kpg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "zongyuan.li@smartx.com" <zongyuan.li@smartx.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

> My apologies.  I'll investigate the mismatch between the toolchain I'm
> using and the one CI is using.

I don't recall seeing a new binary docker since the previous one had ABI
issues with signal handling.

--=20
Alex Benn=C3=A9e

