Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC362B4302
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:38:38 +0100 (CET)
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecqD-0003km-75
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1kecoe-0002iH-N3; Mon, 16 Nov 2020 06:37:00 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1kecod-00037W-1t; Mon, 16 Nov 2020 06:37:00 -0500
Received: by mail-pf1-x443.google.com with SMTP id g7so13861077pfc.2;
 Mon, 16 Nov 2020 03:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UFH0+ELaVXot65Bga4ikUSfjxiAfE4dM8vvDQqab7tc=;
 b=DuGQ7+di8x0M5ZFHeT4I6yAUZA79QEzUg8Ovrf4/UmzKMACKOYB06sAB8fdehz/wZ6
 xEO5KMXn3MUM6RYVaD127DIG6NSyubjGebdo/VT8U3qPYj/v+kMamFuZ5UKWGwwmVs5K
 feho5rDvi/E6/WTvgWg5XxtixZBK2htcYDMokmHmEcSxCErUw1T+WQJPzIZsq9CwSuRh
 wy7V2mCwhytLgExErvCx+c2ZEqL6BozFDOrFDLApfmCSUPnpMW5LungNuTkjbw+CltTE
 7Te4Wdt1XPe8EVaBJanG32eCmIZRMn0mcCyD4WCpBDv1c5Hopi00Os0dqWoBR+qBCpUL
 3ZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UFH0+ELaVXot65Bga4ikUSfjxiAfE4dM8vvDQqab7tc=;
 b=IvFgFk20mpclumOFG1UxYNi+wgNxnKt6jIloR+UOl9F63uRoxWvn6JdvoucmCBuHhG
 Jgmjfu7d4DdsAqI1/A/q/7r12lx7LG3pDMawtTLNaWxQG67mMl7X8UPUOik1adJ1gtXk
 cCPyGDiB+LzFQra47p001TzqTNBGeR4+TAJtY42np65V+/EC5oRd4FpYHAs0T+R8W3TY
 VGHhqsZ8IGwy5tvhKB6ZTQAIqnP0cXMSPJ3FxMSGpSx8YGoSn5P7NABvhKYVPZRfQ9Nm
 F5hRmUTx+mKBa6F76pQ4AuQGKMSEORuGp5ozl/5UNnRnN2UFkg30IRxssqszOP4CSDj/
 xDHw==
X-Gm-Message-State: AOAM533fSUHFIzuGQTC/r+YZem0Opks/DcAZTe+ihZF/XoENEiimMuEQ
 q9xvxZCtGDeP3K3R9orBR74=
X-Google-Smtp-Source: ABdhPJyK1NiAHMcuXHLWPS5FV+dy1AmJB87S1tGsaE97vIrctafoVoRGeP5ZzVIIgo9raxd9dL1npw==
X-Received: by 2002:a17:90a:cb05:: with SMTP id
 z5mr15857414pjt.216.1605526617247; 
 Mon, 16 Nov 2020 03:36:57 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id w6sm15131558pgr.71.2020.11.16.03.36.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Nov 2020 03:36:56 -0800 (PST)
Date: Mon, 16 Nov 2020 20:36:54 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v8 2/5] hw/block/nvme: pull aio error handling
Message-ID: <20201116113654.GB7308@localhost.localdomain>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201112195945.819915-3-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12 20:59, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add a new function, nvme_aio_err, to handle errors resulting from AIOs
> and use this from the callbacks.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 61 +++++++++++++++++++++++++++++--------------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 51f35e8cf18b..a96a996ddc0d 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -878,6 +878,41 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
>      return NVME_SUCCESS;
>  }
>  
> +static void nvme_aio_err(NvmeRequest *req, int ret)
> +{
> +    uint16_t status = NVME_SUCCESS;
> +    Error *local_err = NULL;
> +
> +    switch (req->cmd.opcode) {
> +    case NVME_CMD_READ:
> +        status = NVME_UNRECOVERED_READ;
> +        break;
> +    case NVME_CMD_FLUSH:
> +    case NVME_CMD_WRITE:
> +    case NVME_CMD_WRITE_ZEROES:
> +        status = NVME_WRITE_FAULT;
> +        break;
> +    default:
> +        status = NVME_INTERNAL_DEV_ERROR;
> +        break;
> +    }
> +
> +    trace_pci_nvme_err_aio(nvme_cid(req), strerror(ret), status);
> +
> +    error_setg_errno(&local_err, -ret, "aio failed");
> +    error_report_err(local_err);
> +
> +    /*
> +     * Set the command status code to the first encountered error but allow a
> +     * subsequent Internal Device Error to trump it.
> +     */
> +    if (req->status && status != NVME_INTERNAL_DEV_ERROR) {
> +        return;
> +    }

Are we okay with the trace print up there in case that this if is taken?
I guess if this if is taken, the trace print may not that matter.

