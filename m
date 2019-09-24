Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EDCBCA37
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 16:28:52 +0200 (CEST)
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCloB-0005Jc-At
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 10:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iClEz-0006Ub-6o
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:52:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iClEx-0004BK-M1
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:52:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50367
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iClEx-0004Ax-Ey
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569333146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=NEuh3iaBUiq7M44SE5g0grK6/hoFiYzUD0sgpbCq+Go=;
 b=IkS4ekU0nhqUv5UI6BAjke/oP9FfxCYQ5eAL7c2CdCuMEgBt3HnKsO0Dn3B5rVqh3VKxtM
 RyvoeufdzMa/uJPIlNv0CJXGkfsl7Uv0fJP1/SR+hzZGDdSkkwW6+mbJVw5NCPMu2bpQVG
 dA1CnYKJxmSsHCyrqfb1NIiaI5d6jy4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-mU93WWGEOieD6aC_hdrD8Q-1; Tue, 24 Sep 2019 09:51:28 -0400
Received: by mail-wr1-f71.google.com with SMTP id t11so595402wrq.19
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 06:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q/JW17CaNDDeTmdCvzXXHtWCujwTTqtSMGdVa+5MUHI=;
 b=k1Wi8XSpxbuRmy7wkOh26EDU5JPOJ1XHxRrg08UIrF4cKo8bxN5uq1K0JXlVojbNKm
 3Kavslk24JCqErohLvmCoCAq4QQtKHo3/fd/kYustK7bUuxb3Gzc6ylyX4R7QJ2NDFZE
 2zjQjUro2kWaofHVm/UJPywTZmY/Iy2D8vzJXM1BKlLyVbfN0mGh+YxPsGKYAcEKMrR4
 h5+zZP2AjJr+wcR+61bEJI5Y7naWNnb1F2xBveLiEQ7HTE07Z/nTlWN0TvkQ7lBkAwGy
 tuvlU1WoEFPIYtY76PXc5DykCEnrFPtiSEVO6lzCQYQEtjZZmLsHtHAvt1U7u5dHKMfU
 7U9w==
X-Gm-Message-State: APjAAAXpe4kjfDszYtU5ZUgYO2Wttvy1fWHEhR/Vw5Cx4mWVLxkgyDEa
 pmU0I8Sd8EdW9RL9T+ltRCEKdMvUiyN223pcfo+b6UK7XKJkPfEDHr9KmVxitqdbZSO+xSZATLT
 JiFYsLDm0P9HF4co=
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr111527wmc.172.1569333087569;
 Tue, 24 Sep 2019 06:51:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwiPUBEN0IW/s0WttB3mWKHgnAAmJN/TfslQ6fLl6kE9BjU4iRQO87HU1+SFcRmFVO9THZXQ==
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr111505wmc.172.1569333087352;
 Tue, 24 Sep 2019 06:51:27 -0700 (PDT)
Received: from [192.168.1.115] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b3sm1234968wrw.4.2019.09.24.06.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2019 06:51:26 -0700 (PDT)
Subject: Re: [PATCH 06/11] target/mips: Clean up translate.c
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1569331602-2586-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1569331602-2586-7-git-send-email-aleksandar.markovic@rt-rk.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c0289668-c1cf-e5b3-567d-46b57e67a65d@redhat.com>
Date: Tue, 24 Sep 2019 15:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1569331602-2586-7-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Language: en-US
X-MC-Unique: mU93WWGEOieD6aC_hdrD8Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: arikalo@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/19 3:26 PM, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>=20
> Mostly fix errors and warnings reported by 'checkpatch.pl -f'.
>=20
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  target/mips/translate.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
>=20
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index f211995..cc5af2a 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -7118,7 +7118,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, i=
nt reg, int sel)
>              tcg_gen_andi_tl(arg, arg, ~0xffff);
>              register_name =3D "BadInstrX";
>              break;
> -       default:
> +        default:
>              goto cp0_unimplemented;
>          }
>          break;
> @@ -7545,7 +7545,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, i=
nt reg, int sel)
>          case CP0_REG31__KSCRATCH6:
>              CP0_CHECK(ctx->kscrexist & (1 << sel));
>              tcg_gen_ld_tl(arg, cpu_env,
> -                          offsetof(CPUMIPSState, CP0_KScratch[sel-2]));
> +                          offsetof(CPUMIPSState, CP0_KScratch[sel - 2]))=
;
>              tcg_gen_ext32s_tl(arg, arg);
>              register_name =3D "KScratch";
>              break;
> @@ -8295,7 +8295,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, i=
nt reg, int sel)
>          case CP0_REG31__KSCRATCH6:
>              CP0_CHECK(ctx->kscrexist & (1 << sel));
>              tcg_gen_st_tl(arg, cpu_env,
> -                          offsetof(CPUMIPSState, CP0_KScratch[sel-2]));
> +                          offsetof(CPUMIPSState, CP0_KScratch[sel - 2]))=
;
>              register_name =3D "KScratch";
>              break;
>          default:
> @@ -8387,17 +8387,20 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg=
, int reg, int sel)
>              break;
>          case CP0_REG01__YQMASK:
>              CP0_CHECK(ctx->insn_flags & ASE_MT);
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_YQMas=
k));
> +            tcg_gen_ld_tl(arg, cpu_env,
> +                          offsetof(CPUMIPSState, CP0_YQMask));
>              register_name =3D "YQMask";
>              break;
>          case CP0_REG01__VPESCHEDULE:
>              CP0_CHECK(ctx->insn_flags & ASE_MT);
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPESc=
hedule));
> +            tcg_gen_ld_tl(arg, cpu_env,
> +                          offsetof(CPUMIPSState, CP0_VPESchedule));
>              register_name =3D "VPESchedule";
>              break;
>          case CP0_REG01__VPESCHEFBACK:
>              CP0_CHECK(ctx->insn_flags & ASE_MT);
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPESc=
heFBack));
> +            tcg_gen_ld_tl(arg, cpu_env,
> +                          offsetof(CPUMIPSState, CP0_VPEScheFBack));
>              register_name =3D "VPEScheFBack";
>              break;
>          case CP0_REG01__VPEOPT:
> @@ -8412,7 +8415,8 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, =
int reg, int sel)
>      case CP0_REGISTER_02:
>          switch (sel) {
>          case CP0_REG02__ENTRYLO0:
> -            tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_Entry=
Lo0));
> +            tcg_gen_ld_tl(arg, cpu_env,
> +                          offsetof(CPUMIPSState, CP0_EntryLo0));
>              register_name =3D "EntryLo0";
>              break;
>          case CP0_REG02__TCSTATUS:
> @@ -8756,7 +8760,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, =
int reg, int sel)
>              gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config5));
>              register_name =3D "Config5";
>              break;
> -       /* 6,7 are implementation dependent */
> +        /* 6,7 are implementation dependent */
>          case CP0_REG16__CONFIG6:
>              gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_Config6));
>              register_name =3D "Config6";
> @@ -8837,7 +8841,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, =
int reg, int sel)
>          }
>          break;
>      case CP0_REGISTER_21:
> -       /* Officially reserved, but sel 0 is used for R1x000 framemask */
> +        /* Officially reserved, but sel 0 is used for R1x000 framemask *=
/
>          CP0_CHECK(!(ctx->insn_flags & ISA_MIPS32R6));
>          switch (sel) {
>          case 0:
> @@ -9022,7 +9026,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, =
int reg, int sel)
>          case CP0_REG31__KSCRATCH6:
>              CP0_CHECK(ctx->kscrexist & (1 << sel));
>              tcg_gen_ld_tl(arg, cpu_env,
> -                          offsetof(CPUMIPSState, CP0_KScratch[sel-2]));
> +                          offsetof(CPUMIPSState, CP0_KScratch[sel - 2]))=
;
>              register_name =3D "KScratch";
>              break;
>          default:
> @@ -9112,12 +9116,14 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg=
, int reg, int sel)
>              break;
>          case CP0_REG01__VPESCHEDULE:
>              CP0_CHECK(ctx->insn_flags & ASE_MT);
> -            tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPESc=
hedule));
> +            tcg_gen_st_tl(arg, cpu_env,
> +                          offsetof(CPUMIPSState, CP0_VPESchedule));
>              register_name =3D "VPESchedule";
>              break;
>          case CP0_REG01__VPESCHEFBACK:
>              CP0_CHECK(ctx->insn_flags & ASE_MT);
> -            tcg_gen_st_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_VPESc=
heFBack));
> +            tcg_gen_st_tl(arg, cpu_env,
> +                          offsetof(CPUMIPSState, CP0_VPEScheFBack));
>              register_name =3D "VPEScheFBack";
>              break;
>          case CP0_REG01__VPEOPT:
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


