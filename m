Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD244314C0E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:50:15 +0100 (CET)
Received: from localhost ([::1]:54290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Pew-0001iC-Ts
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9PdJ-00006N-Qn
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:48:33 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9PdH-0002xr-MO
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:48:33 -0500
Received: by mail-ej1-x635.google.com with SMTP id w2so30181445ejk.13
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 01:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UV3Ald51C/URpeClH96E0RwyCJdqlNWKHu5uQ9juGKQ=;
 b=Jqd1sojaBOKY3589jwy4psmOeemVevOETApFA5qDwej322SGZaDn+4e8Se96fOL43j
 YRF0H9rJo4RGHaj9ONeMs55lbYJ7KShBlpZcxAsAN8WXGIP0T4mJ8WMbJ7vvvNKuMT0m
 /B4O3e3inANV4SrAsj2mMfRJ2j36YHiiKnfHrVrMmh3setxT9A9eM3dkGrRz8WL8IakI
 5hs8ePUFDh39cmVDhNx0x5INQeonfnykF1MyM42exCcBI8h7+xtxqTjjrEZ7For+uEGL
 jKuya90Cb9np6IThMbcvdiL+LfryCHYnNyCzn82q+X4bXYysR28T8YG0cfLgtMat1YzN
 gJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UV3Ald51C/URpeClH96E0RwyCJdqlNWKHu5uQ9juGKQ=;
 b=dewtLB2urEkTENmUsCGhXTuZgIISCTTU3yvESbWhb6An3NHzur+ampuqROnk4wmmHB
 c2/EfrQqzXOeFhjq7b01f599rdQN33cksTF4jmslZyVkVH28JX1zv9u4yFoJIJ+rv6TU
 OrSktY9JcbyoD9v5gAAR04tbocA47vaTXveJSph0I1cTk4b0F821exNkpWdpVk1Zn58q
 mexTNXe05F7bP9Bn8ATd4s8i6XDugHPw1iiCgslR5NEOTZVq6MA0iF/790xRAYIwAZ1i
 kkQYxk1M5YRQXvcTS3oz60cOyOkPmZljItscoj8i/HBNJ4YzH8XFqGqtWudkQnjIHFAg
 mTtQ==
X-Gm-Message-State: AOAM5333ZK01lK3gq62CWqv34v22ls04x1DfS0Bp77y82MzTfEb1I4K/
 WQtZgNYBUIjQ68Fm6OY4+2/tkaBnuMLnb2SWY01y2g==
X-Google-Smtp-Source: ABdhPJyUBtlPY6eIhshRbeUpDBQiQgSTDcJ8VS98GeZXhuKe/xxriH+hUurs6ncjVYusVRkjvjClJ3QUWS7FO4dpHq4=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr21547469eji.407.1612864109852; 
 Tue, 09 Feb 2021 01:48:29 -0800 (PST)
MIME-Version: 1.0
References: <1612833761-43234-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1612833761-43234-1-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 09:48:18 +0000
Message-ID: <CAFEAcA-yPsHpq+q7osCKTGGJ7LiHdMWFxuxJN9Gyey5dJvjWcw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 at 01:22, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Per MPC8548ERM [1] chapter 14.5.3.4.1:
>
> When RCTRL.RSF is 1, frames less than 64 bytes are accepted upon
> a DA match. But currently QEMU does the opposite.
>
> When RCTRL.RSF is 0, short frames are silently dropped, however
> we cannot drop such frames in QEMU as of today, due to both slirp
> and tap networking do not pad short frames (e.g.: an ARP packet)
> to the minimum frame size of 60 bytes.
>
> If eTSEC is programmed to reject short frames, ARP requests will be
> dropped, preventing the guest from becoming visible on the network.
>
> The same issue was reported on e1000 and vmxenet3 before, see:
>
> commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
> commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
>
> Ideally this should be fixed on the slirp/tap networking side to
> pad short frames to the minimum frame length, but I am not sure
> whether that's doable.
>
> This commit reverses the RCTRL.RSF testing logic to match the spec.
> The log message is updated to mention the reject short frames
> functionality is unimplemented.
>
> [1] https://www.nxp.com/docs/en/reference-manual/MPC8548ERM.pdf
>
> Fixes: eb1e7c3e5146 ("Add Enhanced Three-Speed Ethernet Controller (eTSEC)")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>


> -    if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> +    /*
> +     * Both slirp and tap networking do not pad short frames
> +     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> +     *
> +     * If eTSEC is programmed to reject short frames, ARP requests
> +     * will be dropped, preventing the guest from becoming visible
> +     * on the network.
> +     */
> +    if (!(etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
>          /* CRC is not in the packet yet, so short frame is below 60 bytes */
> -        RING_DEBUG("%s: Drop short frame\n", __func__);
> -        return -1;
> +        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
>      }

This change is doing two things at once.

One of them is an entirely uncontroversial bug fix: we
got the sense of the RCTRL_RSF test the wrong way round.

The other is different: it is working around a bug elsewhere in QEMU.

If there's a problem with packets that should not be short
frames being presented to ethernet devices as short frames,
please fix that bug at the source. I don't think we should
take any more device-model workarounds for it. We have lots
and lots of ethernet device models: it will be much more
effort to try to fix them all one by one as people encounter
this bug than it would be to just fix the code that's creating
bogus short frames.

David, could you drop this from your queue, please ?

thanks
-- PMM

