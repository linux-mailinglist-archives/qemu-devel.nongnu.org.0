Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB1765CA3F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 00:13:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCqSs-0000Pn-Pm; Tue, 03 Jan 2023 18:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCqSq-0000PZ-KQ
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 18:13:00 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCqSo-0006as-Ez
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 18:13:00 -0500
Received: by mail-wr1-x432.google.com with SMTP id bn26so11865529wrb.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 15:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+qafBATEoa+2wTKgOzGNp070b+aJSvCBksgwfL9zmI=;
 b=FfjpMyyhXfBZThxZeYGQQO7vyOLV9v0CEBG6dVn0ZgBxugLJMWJFd+HsU69RlII0C5
 /NLql6fmLqkER/sYBYysomuni9ejwEf7pxSGpAaLjsF7eIsaeBgxI1z74MJkrgXL2kup
 nCuuYp4mXX+BAmgm7SJnSWiNnYy1w7RUz530xYxJMgmpoH8y3sHa1My98uOYcLgv7QnL
 xlHE4D85uwdfL1i7el8H9LOGgF+r9iZrSVpxLUQpOXnc36chinVi9laOaZdgnkTVpro0
 ck9PK0oPV359foRYgxXgeM46zviSi6e0Qi7JAOcLHC6FAfFdoQHJMEmicC2WMdlMwzGD
 k7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+qafBATEoa+2wTKgOzGNp070b+aJSvCBksgwfL9zmI=;
 b=ZBMyi0ZAQKRe/9QSp5klfBvjUnNngKJSD1EYkQth+yyoFFYoSCGZKeKfg5So0LmmM1
 HYFpUGozmm1aKwEgSdMayisA4KBJiP+Ka+InH75gIFLzAf3qESgBKik8+OIHiEbNgJxZ
 n0TpSPVbAp4GNOTYrX/1r6BlXCAovgliSUDy+02b1L1/A0scWMxGs9YpX7fh1dDzvDZw
 XcQpfOqybjvR2LAl+PbY9TN+P1rEonZU3uirBb1XR/AZ1OVZACIlA6Sh0LI03u5R5uVY
 nFdHgD862wNNYHSMsJ24QlbA+7x2OeF1830Ln+65ajrJJ+r/wUsa78aTdxBZfiMmLIC/
 pyyQ==
X-Gm-Message-State: AFqh2kqd3sZpi3QIjnjFYi7SHQ01+3GErqyIGr0EIwTodign/KQ7LtA/
 d/EizUlN4gvhyMeWJb1AW5Q=
X-Google-Smtp-Source: AMrXdXv5WbayTDQhnHzoCHddCGvxv2hlBPr+kTrTQpT4lKo5mnbVdopIJ2APRWebmxbsRfsVjBUHYg==
X-Received: by 2002:a5d:42cc:0:b0:28a:326d:1d11 with SMTP id
 t12-20020a5d42cc000000b0028a326d1d11mr14209407wrr.53.1672787576887; 
 Tue, 03 Jan 2023 15:12:56 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20094284aaccacb64e1.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9428:4aac:cacb:64e1])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a5d4d52000000b0028df2d57204sm16840020wru.81.2023.01.03.15.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 15:12:56 -0800 (PST)
Date: Tue, 03 Jan 2023 23:12:48 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, 
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <6360e4a1-dc2b-685e-5e19-62b92eec695b@aol.com>
References: <20230102213504.14646-1-shentey@gmail.com>
 <bd4daee7-09df-4bfa-3b96-713690be9f4e@aol.com>
 <0de699a7-98b8-e320-da4d-678d0f594213@linaro.org>
 <CAG4p6K7hcJ-47GvsEvmuBmdwP2LsEC4WLkw_t6ZfwhqakYUEyQ@mail.gmail.com>
 <6360e4a1-dc2b-685e-5e19-62b92eec695b@aol.com>
Message-ID: <DD07C54B-F562-42B6-A6CD-824670514248@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 3=2E Januar 2023 17:25:35 UTC schrieb Chuck Zmudzinski <brchuckz@aol=2E=
com>:
>On 1/3/2023 8:38 AM, Bernhard Beschow wrote:
>>
>>
>> On Tue, Jan 3, 2023 at 2:17 PM Philippe Mathieu-Daud=C3=A9 <philmd@lina=
ro=2Eorg> wrote:
>>
>>     Hi Chuck,
>>
>>     On 3/1/23 04:15, Chuck Zmudzinski wrote:
>>     > On 1/2/23 4:34=E2=80=AFPM, Bernhard Beschow wrote:
>>     >> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and fi=
nally removes
>>     >> it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to m=
ake Xen in the PC
>>     >> machine agnostic to the precise southbridge being used=2E 2/ wil=
l become
>>     >> particularily interesting once PIIX4 becomes usable in the PC ma=
chine, avoiding
>>     >> the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>>     >>
>>     >> Testing done:
>>     >> None, because I don't know how to conduct this properly :(
>>     >>
>>     >> Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "[PATCH v4 00/30] Conso=
lidate PIIX south bridges"
>>
>>     This series is based on a previous series:
>>     https://lore=2Ekernel=2Eorg/qemu-devel/20221221170003=2E2929-1-shen=
tey@gmail=2Ecom/
>>     (which itself also is)=2E
>>
>>     >> Bernhard Beschow (6):
>>     >>=C2=A0 =C2=A0 include/hw/xen/xen: Make xen_piix3_set_irq() generi=
c and rename it
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Reuse piix3_realize() in piix3_xen_rea=
lize()
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Wire up Xen PCI IRQ handling outside o=
f PIIX3
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Avoid Xen-specific variant of piix_wri=
te_config()
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Resolve redundant k->config_write assi=
gnments
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVIC=
E
>>     >>
>>     >>=C2=A0 =C2=A0hw/i386/pc_piix=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 34 ++++++++++++++++--
>>     >>=C2=A0 =C2=A0hw/i386/xen/xen-hvm=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 9 +++--
>>     >>=C2=A0 =C2=A0hw/isa/piix=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 66 +----------------------------------
>>     >
>>     > This file does not exist on the Qemu master branch=2E
>>     > But hw/isa/piix3=2Ec and hw/isa/piix4=2Ec do exist=2E
>>     >
>>     > I tried renaming it from piix=2Ec to piix3=2Ec in the patch, but
>>     > the patch set still does not apply cleanly on my tree=2E
>>     >
>>     > Is this patch set re-based against something other than
>>     > the current master Qemu branch?
>>     >
>>     > I have a system that is suitable for testing this patch set, but
>>     > I need guidance on how to apply it to the Qemu source tree=2E
>>
>>     You can ask Bernhard to publish a branch with the full work,
>>
>>
>> Hi Chuck,
>>
>> =2E=2E=2E or just visit https://patchew=2Eorg/QEMU/20230102213504=2E146=
46-1-shentey@gmail=2Ecom/ =2E There you'll find a git tag with a complete h=
istory and all instructions!
>>
>> Thanks for giving my series a test ride!
>>
>> Best regards,
>> Bernhard
>>
>>     or apply each series locally=2E I use the b4 tool for that:
>>     https://b4=2Edocs=2Ekernel=2Eorg/en/latest/installing=2Ehtml
>>
>>     i=2Ee=2E:
>>
>>     $ git checkout -b shentey_work
>>     $ b4 am 20221120150550=2E63059-1-shentey@gmail=2Ecom
>>     $ git am
>>     =2E/v2_20221120_shentey_decouple_intx_to_lnkx_routing_from_south_br=
idges=2Embx
>>     $ b4 am 20221221170003=2E2929-1-shentey@gmail=2Ecom
>>     $ git am
>>     =2E/v4_20221221_shentey_this_series_consolidates_the_implementation=
s_of_the_piix3_and_piix4_south=2Embx
>>     $ b4 am 20230102213504=2E14646-1-shentey@gmail=2Ecom
>>     $ git am =2E/20230102_shentey_resolve_type_piix3_xen_device=2Embx
>>
>>     Now the branch 'shentey_work' contains all the patches and you can =
test=2E
>>
>>     Regards,
>>
>>     Phil=2E
>>
>
>OK, I didn't see the "Consolidate PIIX south bridges" series is a
>prerequisite=2E
>
>I will try it - it may take a couple of days because I need to test both
>patch series in my environment and I can only work on this in my spare
>time=2E
>
>I will provide Tested-by tags to both series if successful=2E Otherwise,
>I will reply with an explanation of any problems=2E

Sounds good! You don't need to test the prerequisite though since it is al=
ready reviewed=2E It would be completely sufficient if you could test this =
series to fill in the gap for my limited Xen knowledge -- thanks!

Best regards,
Bernhard

>
>Chuck

