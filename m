Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE84B7411
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:23:19 +0100 (CET)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1Xq-0007ba-82
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:23:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK1V4-0003bo-9h
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:20:26 -0500
Received: from [2a00:1450:4864:20::429] (port=45736
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK1V2-0002FB-5t
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:20:25 -0500
Received: by mail-wr1-x429.google.com with SMTP id p9so12768849wra.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+xW2NA4HjdNDSVneT7gb2AWfKKEzJpSpqZHLRk7Sv6U=;
 b=Q1/shm1h639n7ZHPAgESNZW1I6yGncAI3y/c2/NkQJR9bAG8zbt+YoouXiyCaG6apE
 Z6wK+kPFAmp5vxaq+GE+ClIH2d/YxVUb8SpSfsOOUIz+hTCz5g2/LL57dzIoJ9v0v9p+
 VTIje7CNc6rH+tvvy0Ex0XyEPDa7/hdrLa3BaHkdSV0KANv/geVzmzIncSW8ozqQFOkS
 wKCz/LnRdqETPmUHOp4HMhmdAr/PjraW9kNYMt8W5iUnbVOHGx1uwO2uA0uqRoAPU1Bq
 Yk63wi0UCsa1XkUZoLly4k2XRkbUKqXExAGPd1kaxlEXxhKRK7pHJL5oHR7IwDOYlw7N
 A+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+xW2NA4HjdNDSVneT7gb2AWfKKEzJpSpqZHLRk7Sv6U=;
 b=hn4oIOVDnE7+ISCG56/mQRzfSNbqMwE5ifbSEKQuvYVMVoWCg4ZvqFtGJTqf1s++EC
 wdcFdn9kdbBA1tdXrw/pqH7fTj8Io8wjXSezsc1D0puU9Ufn36N1sI/Zc+0uk3FdYdvL
 RIvu1OxFMkNscgeVTvFr/BGn2UnPEMraYlhHdIF1wn50eyKFYCqseVdFGGTvyMWo7UwX
 mhEBPDh9V8qANGIJeYd9+wnJX8VvrtHKnIsvpjAx3vKVbUFPByw8CJgMgD8lVbnqLeRQ
 v0spfcqbD8B+olqFVTkNer+0hJEFZrPP4mTEz85wTZ1LQVNAWZQ8Cvd7tyWhnlpsvMlp
 4+fw==
X-Gm-Message-State: AOAM5325qXt7ImAtGRdjP+j+eS6CkIvoSQf+/9W81d7I9aOjWlnE3xxC
 NAjOJYesJhKrs+gqkEAdVKcoJWm1XhkEOqcVVwVoNw==
X-Google-Smtp-Source: ABdhPJwpxIOETlxEU5e9+7q4Ko/sRgxni4v4wBCvJxEtvYHCrhl+4/0znJYplCHlloYxUhjut5PXioomJNG8gHWz2pg=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr4037941wrv.319.1644945622416; 
 Tue, 15 Feb 2022 09:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
 <20220203140141.310870-4-edgar.iglesias@gmail.com>
In-Reply-To: <20220203140141.310870-4-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 17:20:10 +0000
Message-ID: <CAFEAcA-mkZ5EuAhcVVN01q_6Mcr7QR2Gn4Q37nN1GZtBK8MM7g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hw/misc: Add a model of the Xilinx ZynqMP CRF
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: edgar.iglesias@xilinx.com, luc@lmichel.fr, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 14:01, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a model of the Xilinx ZynqMP CRF. At the moment this
> is mostly a stub model.

> +static const VMStateDescription vmstate_crf = {
> +    .name = TYPE_XLNX_ZYNQMP_CRF,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .minimum_version_id_old = 1,

This is still on my to-review list to look at properly, but
this setting of .minimum_version_id_old is incorrect. The
field is only used if the VMStateDescription sets a non-NULL
load_state_old function, which this one does not.

We cleaned this up in commit 17e313406126, and I'm about
to send a patch which drops the fields entirely.

thanks
-- PMM

