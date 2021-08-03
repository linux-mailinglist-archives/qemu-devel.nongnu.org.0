Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21EB3DF1B7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:42:30 +0200 (CEST)
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwYo-0001Oc-1r
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAwY2-0000ib-TH
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:41:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAwY1-0004Rw-Eb
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:41:42 -0400
Received: by mail-wr1-x431.google.com with SMTP id l18so25776880wrv.5
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=a5pMU7nu5CSds1/uOcvOteRmtjiDJZ4qVTfiftaonpQ=;
 b=DRLNNl7dBhWhDs6fwndQr7ymvzFs6sDpKhGaEyEkINUEC1V4bFt9A69ftP4SnRxcA9
 YB7DCUNrdF734dOHnwf4OGuiMi0KpKBJ4OkLGJsXrPmYrZ/NBVBBycQTk0RMzAq02hIM
 H+X2qo17isJYoU8355pyKWyZr4zRVIU459IKMoRNrKl9C0tIjWUKJofWYUi6Dnqx2i42
 dVpM+c5QwK9knaf/HrC8LlUXkBa3VVTPeyEYBNB18j0m2Gl9yIwBTFCMGxthn3OfEbRu
 2YHYe4Hbis+Yd3zSeOKYlXQxryIjz27m9yAy66Ct+/7/uynCS3nkDuhXMsS+wiC+GtMN
 WQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=a5pMU7nu5CSds1/uOcvOteRmtjiDJZ4qVTfiftaonpQ=;
 b=Uq/hVt8Vkbg4iTuUZDXl5NXJ7GV+jsmHW80S6h6SqRJAjn3n5BxmGX16QdL/GHn5UJ
 Z+dJPOc7x7dFKQ+DaT7rephFZFiL18E4MhwrqOAc5kVz0OpbDwU31G7UtenM6RGUeJkh
 7RgaC8x4yNWQFYa45v0/+n1jVHuQb5B9DJdYEwbphZ/+bUdSJhN5jsm/Wq577Xs2vq/E
 tYJPoHxOYWKt6at13yKPyXTMD0LYw5eG0yRfI8OHreQAY/XfzgoPaCEEULuyiXd5Wa4m
 Jr+1uepVg7YaywaQQ+w+E0Nmy/QpEqyPvXt2ifeJC9j2KbUH2vOrJItJ6LbfShOYEQRL
 sj6g==
X-Gm-Message-State: AOAM532/VGiwB31/3Pka6HhTt3HbQr5L2ULrdNap+0MWOIWx5AnBaorC
 Fs0+7sLvfBWJeQTs9CUbHe7D2Q==
X-Google-Smtp-Source: ABdhPJyrFeX7HW2msbv1p45jhnUyWK6R9jiTo+wJnUXDGBIXS2f7ylvHtHrtpX+vwmF/88TZxHFYvQ==
X-Received: by 2002:a5d:49c8:: with SMTP id t8mr23401578wrs.365.1628005299856; 
 Tue, 03 Aug 2021 08:41:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c15sm14555893wrw.93.2021.08.03.08.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:41:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11E8E1FF96;
 Tue,  3 Aug 2021 16:41:38 +0100 (BST)
References: <20210803151428.125323-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH] plugins/execlog: removed unintended "s" at the end of
 log lines.
Date: Tue, 03 Aug 2021 16:41:31 +0100
In-reply-to: <20210803151428.125323-1-ma.mandourr@gmail.com>
Message-ID: <87tuk6fsct.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Queued to for-6.1/misc-fixes-for-rc2, thanks.

--=20
Alex Benn=C3=A9e

