Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A476999BE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:19:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgyG-0007BM-AP; Thu, 16 Feb 2023 11:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pSgyE-00077W-I1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:18:54 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pSgyC-0004z9-Ku
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:18:54 -0500
Received: by mail-pl1-x634.google.com with SMTP id d8so2513019plr.10
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=DJnlOTR/lJehB1UEgBOrKkErLKLElzx7TA62fwXJQNI=;
 b=Yzan822Qqh251PJFwIQgYpxO23fJye1Wmt1Y6A8bFzosVJYn8YtqzzUWqZW//z6wkU
 jF0kjFjMf/KffFmxj3nFQ/HSSppSFddtUIs2fNCQT3KgpkWitXT4zLoPyQZFyxIR1F94
 15+r1wChoDN3cV+acv/hKFfrCruaNsS7C2F3LOA5QhJRG3gEL20riQjSyiRAx3eB19iv
 zkGbCa88/ROU9iqMuD0ff1QFtxuqAsr/JZf01ZqyoMWBS/HIA/rFpknRS9XBJdLOD7Bn
 ENdspxO6KzlC5POYhwIzJNVJbAzWrxpEeFRJAE3l0voQt3WZSGU7YrUpq3Puv0cuDq9Q
 At5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJnlOTR/lJehB1UEgBOrKkErLKLElzx7TA62fwXJQNI=;
 b=I+Rk1k4zE7dvIchjF7U/fbBYPvYY5qC5R9Ab82xyL8e2PcSgGmqwpkAzY8FwArY1xN
 lTXhS8CvrtmP/GIS7uV4E/cXpoVX/1rnB9OHgCqjtQo97i46WkB1gvLGcpfiBizkTWYZ
 G9Kwv3nbHtYRhab1CsTHrFoDiChjSJlvYMR1Ww6TYBcAd15CEkpPVl0OhJT2aNUD2Wju
 CF8FD1FAi8WF+DJh8DHcveTvjlTOL1/vfJpszN5N9ZdVSDrHQeSgsdfvgT9hsPVkMj2l
 ZrUNd9dbDQQlPFbC5FWYePMCLRZTFeNXcOImGWqIskGBlxGNnqsmHgi6RKD/psah0wWH
 rgXQ==
X-Gm-Message-State: AO0yUKXabZgnwkW+O1SVbMD5pwmY62Ds+86TJOnv625xYg/B0J8xcMX5
 2dcA7fHzEW/qEp/THiUf2jAGL57fpBtWVfPM
X-Google-Smtp-Source: AK7set+PzeqSAJxNjAJ5HoUChwXrfsacbU9j+TPaONdgd4d3T6v23l1WxrsyyVH3LdIPsHcm/hkbcQ==
X-Received: by 2002:a17:90b:224c:b0:233:bc78:b47f with SMTP id
 hk12-20020a17090b224c00b00233bc78b47fmr7132972pjb.49.1676564330620; 
 Thu, 16 Feb 2023 08:18:50 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 fh4-20020a17090b034400b0023440af7aafsm1407938pjb.9.2023.02.16.08.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:18:50 -0800 (PST)
Date: Thu, 16 Feb 2023 08:18:50 -0800 (PST)
X-Google-Original-Date: Thu, 16 Feb 2023 08:18:08 PST (-0800)
Subject: Re: [PATCH] target/riscv: Fix vslide1up.vf and vslide1down.vf
In-Reply-To: <20230213094550.29621-1-zhiwei_liu@linux.alibaba.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 frank.chang@sifive.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhiwei_liu@linux.alibaba.com
Message-ID: <mhng-d30cbba1-08af-4b5a-b63b-d05237f2dd05@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 13 Feb 2023 01:45:50 PST (-0800), zhiwei_liu@linux.alibaba.com wrote:
> vslide1up_##BITWIDTH is used by the vslide1up.vx and vslide1up.vf. So its
> scalar input should be uint64_t to hold the 64 bits float register.And the
> same for vslide1down_##BITWIDTH.
>
> This bug is caught when run these instructions on qemu-riscv32.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  target/riscv/vector_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 00de879787..3073c54871 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -5038,7 +5038,7 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
>  GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
>
>  #define GEN_VEXT_VSLIE1UP(BITWIDTH, H)                                      \
> -static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
> +static void vslide1up_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
>                       void *vs2, CPURISCVState *env, uint32_t desc)          \
>  {                                                                           \
>      typedef uint##BITWIDTH##_t ETYPE;                                       \
> @@ -5086,7 +5086,7 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
>  GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
>
>  #define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)                                     \
> -static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
> +static void vslide1down_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
>                         void *vs2, CPURISCVState *env, uint32_t desc)          \
>  {                                                                             \
>      typedef uint##BITWIDTH##_t ETYPE;                                         \

Thanks, applied to riscv-to-apply.next.


