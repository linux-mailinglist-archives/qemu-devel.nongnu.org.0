Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276F53ADC54
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 04:24:37 +0200 (CEST)
Received: from localhost ([::1]:38794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lun8V-0006m6-Oy
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 22:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lun71-0005VM-Hh; Sat, 19 Jun 2021 22:23:03 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lun6z-0005YS-Ll; Sat, 19 Jun 2021 22:23:03 -0400
Received: by mail-pf1-x434.google.com with SMTP id p13so10946127pfw.0;
 Sat, 19 Jun 2021 19:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=E4lmVohovYdUjR0gDbdPAJ6f+p3xBdIAFiZYSeuMOkA=;
 b=FwDPw4hKUMN9bNJEDwqWPUUCoxeaasjvTABh6gTvoF7ORzIWeycb7RHbmr48oH9NfY
 FwMxApDpcfl79olVHFqTM2cT9du7PNbB6Y6rtiZWQ0sTo2EXMdfXG6xLeIYQwFlJrn+V
 Xv0FQ0AShCjuag5zGjw+NdlHBn24CEDsqKBN+GsYg5HtQeHQJVGpCc9Lrkue8OAAFnv7
 j3WQ7SAJR/zsJ3awqlWYuQ+9TSJSiiG7ylbPJD4OslAMuUb5ZErYAS1oiLUu68mkE7Zu
 Qjp3NiWU50rM3ubY8Jugb6saGfJjCMTzdloR5hOqL6O2z9En6jsOqHTpoOFVfllyCYEv
 L/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=E4lmVohovYdUjR0gDbdPAJ6f+p3xBdIAFiZYSeuMOkA=;
 b=PU2m/gijET00bMXjZPHD6Kc6ac3apchvFAsbWYqwxrPBi/q+14aiMdPUJvmlrk+iG5
 smYCBIBw6pn0Zju+nzEvkdfwbZyJ+/RSZKgAHKHQonGmLQ25eS7r5NYc/sujbJ8LKsK2
 hDClC8oTF+QlppIs1a+rIEVn4s3csepWdI3gbh8zo8q19mzRF60uXEr1XWpuM98KFSeB
 5DgkE6xMbBKXHQm4TDbI+SC3lq3dR2NVKyqMDX+HD+5v68IVPiycFs+Dh1h/xbE1ozC9
 VIofT6Q3qHgziVmy2eClHXeGe6aNfV4U6npHPYVzycS+IDJ/0If5X+5Se0+8lM715idz
 +kAA==
X-Gm-Message-State: AOAM531Wwo2iii6w8DK+z3eJtQoh9fGhkS5MWsGE7NryRVRquJLrvRKf
 xXmn9oorTXN/TjqoOArJJxPq649Bw/M=
X-Google-Smtp-Source: ABdhPJxUgTp9XILeciAzkY0GZ6K0ivuyLQqQv68CMcebFmHIfafZzSoINns3CSKGwe+mT61RbdBDeA==
X-Received: by 2002:a63:5fcf:: with SMTP id t198mr2618194pgb.439.1624155779287; 
 Sat, 19 Jun 2021 19:22:59 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id c62sm11877885pfa.12.2021.06.19.19.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 19:22:58 -0700 (PDT)
Date: Sun, 20 Jun 2021 12:22:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS L1D
 cache flush bits
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210615044107.1481608-1-npiggin@gmail.com>
 <YM24TwDm3SlCDiVu@yekko>
In-Reply-To: <YM24TwDm3SlCDiVu@yekko>
MIME-Version: 1.0
Message-Id: <1624155035.72mw8haex4.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x434.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from David Gibson's message of June 19, 2021 7:26 pm:
> On Tue, Jun 15, 2021 at 02:41:07PM +1000, Nicholas Piggin wrote:
>> There are several new L1D cache flush bits added to the hcall which refl=
ect
>> hardware security features for speculative cache access issues.
>>=20
>> These behaviours are now being specified as negative in order to simplif=
y
>> patched kernel compatibility with older firmware (a new problem found in
>> existing systems would automatically be vulnerable).
>=20
> I don't really understand all the consequences of that.  What I need
> to know here, is if it's safe to unconditionally enable these bits,
> even for older machine types.

Unconditionally on the condition that the cap is set to fixed? It
should be fine AFAIKS. If the older machine types are running on
older hardware that acutally does require the flush, then the fixed
cap would cause the existing flush bit to be clear and the kernel to=20
skip the exit flush, so that would be broken already. Does that sound
right?

One thing I'm not entirely clear on is:

All these (entry/exit/uaccess) flush requirements stem from basically=20
the same underlying mechanism, so that gets resolved in hardware and
software can stop doing all of them. That's fine, but it was decided to
add different bits to the hcall basically to have flexibility let's say
in case a new issue is discovered one day that requires just the uaccess=20
flush, for example.

In that case we can just set the right combination of bits in firmware,
and kernels in the field will just do the right thing, and we don't
need to do all the other flushes that would be worse for performance.

How would that work with qemu? I assume we don't have a cap per bit in=20
the hcall, but rather a cap per vulnerability class, so you would set=20
that new class as vulnerable, and this code will have to translate those
and work out the correct combination of bits to set in these fields.

If I'm way off base or there's a better way to do it, that could mean
this patch needs to be done a different way.

Thanks,
Nick

>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  hw/ppc/spapr_hcall.c   | 2 ++
>>  include/hw/ppc/spapr.h | 3 +++
>>  2 files changed, 5 insertions(+)
>>=20
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index f25014afda..dfd9df469d 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1299,6 +1299,8 @@ static target_ulong h_get_cpu_characteristics(Powe=
rPCCPU *cpu,
>>          behaviour |=3D H_CPU_BEHAV_L1D_FLUSH_PR;
>>          break;
>>      case SPAPR_CAP_FIXED:
>> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY;
>> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS;
>>          break;
>>      default: /* broken */
>>          assert(safe_cache =3D=3D SPAPR_CAP_BROKEN);
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index f05219f75e..0f25d081a8 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -398,10 +398,13 @@ struct SpaprMachineState {
>>  #define H_CPU_CHAR_THR_RECONF_TRIG              PPC_BIT(6)
>>  #define H_CPU_CHAR_CACHE_COUNT_DIS              PPC_BIT(7)
>>  #define H_CPU_CHAR_BCCTR_FLUSH_ASSIST           PPC_BIT(9)
>> +
>>  #define H_CPU_BEHAV_FAVOUR_SECURITY             PPC_BIT(0)
>>  #define H_CPU_BEHAV_L1D_FLUSH_PR                PPC_BIT(1)
>>  #define H_CPU_BEHAV_BNDS_CHK_SPEC_BAR           PPC_BIT(2)
>>  #define H_CPU_BEHAV_FLUSH_COUNT_CACHE           PPC_BIT(5)
>> +#define H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY          PPC_BIT(7)
>> +#define H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS        PPC_BIT(8)
>> =20
>>  /* Each control block has to be on a 4K boundary */
>>  #define H_CB_ALIGNMENT     4096
>=20
> --=20
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other=
_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
>=20

