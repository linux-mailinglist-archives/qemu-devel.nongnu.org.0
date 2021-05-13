Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCAF37F5A6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:34:55 +0200 (CEST)
Received: from localhost ([::1]:44726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8gB-0006tP-2g
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8BZ-0002k5-5Z
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:03:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8BX-0002LG-D6
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:03:16 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1068981wmy.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=c+jhpmkLq/nMVmrGPFmqj+T6xljFiOCIPQ6O2dgJ4+s=;
 b=iaBlXf2mU6uaC7TxBMewcTqiCXXA9lxFwDjl/uUWQJ/Yn4IDC82ADIIjaHWVDZkPwj
 AFJcluwFvMtNpW53wvvVuxIWTnRQ7K9mCB/MilKLKpAfWzrcpk6XTXs/TQa8tzxGHpor
 VYgkZpwmRi1yzza9r8PQWEhC2J6KUl+X+tFAJxGucftCqpjtJQAtL0H8uKW2rT0PSXPF
 ttCDRyC+Sox1gZ2tUsLMSV1It47I7iGTetQqYRt64sZnXuMvQ86raXl7E7xVrLg9vOnB
 bOGCDrh9ZNPcVF12Cc8ix217d44qWwZWXKik42uP6L1teWImXUKWg4VOh233qJQuYEmq
 qzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=c+jhpmkLq/nMVmrGPFmqj+T6xljFiOCIPQ6O2dgJ4+s=;
 b=EOukNpLHKvCMkNZX6EMlOfU0Gkn4JCWaRgKA2C5D/UB4fBbARJJhZb87nixnvyRT9R
 IqG9OnKtljHqfNNOmwG02lFQGue+sb3nrpRr6Kg+65ooG3uhs3LFvTVhIKYAzjNpp1Vy
 Uzhj38qFj3ug1q0uJ19/iabzwegr5tejIQZC3ds8bbDiAJKfwj7wp9fLIMTMI95Ll+YT
 86Oq1mcp081+uJmlXPZ7WKKxDFjHi45bv4Yv/JhaVbIHksaKeea9jg7O4OfdEkJGVA4V
 aAwIhNZcRUJAa2qDHsKwkv4NEHSw9SuAnbEHQEUUR3qnHbw4fNPHfrnpp5PPsRwZoEUt
 zoHg==
X-Gm-Message-State: AOAM5328ALjQbfCyxfCt5XzP1Hq1p/+wLWJbFsduRC8z9lIuG8y54I6V
 1QQpnargoaP8FyFgOc8fTojTvg==
X-Google-Smtp-Source: ABdhPJwKQR6dKU0aNWoDe1BS2J+oh0slL5hfmijgcri8uC4wiAt4kJAFHR78rFEkwEkwgl+i57IFOQ==
X-Received: by 2002:a05:600c:4ecb:: with SMTP id
 g11mr3029675wmq.46.1620900193886; 
 Thu, 13 May 2021 03:03:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v12sm406832wru.73.2021.05.13.03.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 03:03:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5903C1FF7E;
 Thu, 13 May 2021 11:03:12 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-35-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 34/72] softfloat: Move addsub_floats to
 softfloat-parts.c.inc
Date: Thu, 13 May 2021 11:03:07 +0100
In-reply-to: <20210508014802.892561-35-richard.henderson@linaro.org>
Message-ID: <87o8dfdk7z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> In preparation for implementing multiple sizes.  Rename to parts_addsub,
> split out parts_add/sub_normal for future reuse with muladd.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

