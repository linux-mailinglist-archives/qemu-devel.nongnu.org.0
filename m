Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC31069D0AD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:32:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU89K-0003Qu-7p; Mon, 20 Feb 2023 10:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU89I-0003Ob-9S
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:32:16 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU89G-00069R-Qc
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:32:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id p8so1758614wrt.12
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UOdn3iCEP/AucTZvcMzpdCzOxEbgd0rNuq5SN8ncSM=;
 b=aEOndfzYPNw9IJizhkbPsQsaRhbrDSC2nswvQUbea1Q4Jjz479zAn6KCYdgnwnXE7l
 12Qbt/6n6771UTnrDwYcrLcIGg1UPPpCBTLYD7fBjbs4gKPS9H50Zr7ULh5Ib6cpnQvi
 eKZGQ//NG0HlMSdcVBcpUJnMMjEscSvt8ykLv1dFOiw6zOZLmd8Ns7vDpHoqy1NxIZo5
 FAMZpWuiRM4qoRMXgRtZcSpQmytRpRL5uGIStrpSB2qAAJopeKBLlMuBNyAnWGsgCP8q
 Ir6uFJfnL2Ag79okHJuuJgj2lGVerbEgCnpBxqRRqtI9/Ljz4HGP+1pXX+GqPDChy2sr
 kYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6UOdn3iCEP/AucTZvcMzpdCzOxEbgd0rNuq5SN8ncSM=;
 b=20drdDtjsuSyWvW4cxoDFmvZDvS1N4Q1UpZAHo3+Iq38mGj4UYuRDuVJ2fFl+WXH9E
 Kg0GWBPH1LSaWnA3ftnkh5/Rv3Nu1INNRa2K7l6AcV6TqFAgz/gm3XOg7sQQYQuo/Vbs
 MdWySR2ch/JL07BXsHHZGeKCX1NCLIHcHGrs+RCgZdfKL2jJjVAHG2+quVib3wgot+SL
 YeMM7+iAoEgvLU+ODEUh9jIcupJ+32ERDJpyIye4ziWRf3vyF7KTC1DpQzBL2snYe/C3
 YQYnQLHzROEO8pVFUNWrpkrxPQ9JLoh24BTYwp934xwbg8b+UnrnYqBglg4StRrY1yH+
 3CkA==
X-Gm-Message-State: AO0yUKWJq6ayxYLmcj6iNkD7C/zXlbHNewmYshMzpYlwnPcJ16tE9yjo
 oLYv7SQV09Yk6e/l+bfFRYOY8g==
X-Google-Smtp-Source: AK7set+MPtPcIl2V9HTVsw7k5HqDb2+dCO1yWeN1FvXYjeX2IDyp4apNgxDIVrLaFxO4KSbIVMZPzQ==
X-Received: by 2002:a05:6000:1181:b0:2c5:4e88:95cd with SMTP id
 g1-20020a056000118100b002c54e8895cdmr2039666wrx.5.1676907133117; 
 Mon, 20 Feb 2023 07:32:13 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a17-20020adffad1000000b002c54e26bca5sm5919204wrs.49.2023.02.20.07.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 07:32:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 750A01FFB7;
 Mon, 20 Feb 2023 15:32:12 +0000 (GMT)
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-5-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 4/8] hw/char/xilinx_uartlite: Expose XILINX_UARTLITE QOM
 type
Date: Mon, 20 Feb 2023 15:32:08 +0000
In-reply-to: <20230220115114.25237-5-philmd@linaro.org>
Message-ID: <87lekss683.fsf@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

