Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBE33DD5A7
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:28:54 +0200 (CEST)
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAX3t-00027S-DE
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWmw-0000zm-Db
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:11:22 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWmu-0007RF-TY
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:11:22 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gs8so30449171ejc.13
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qy+bHSLelRt1MrpbxyOU1oCZ58pF6821JxWTRkqqLeM=;
 b=xDkvXQYvtKbXQGhxOjaBbf21xvlVRSX3YsmGsSeS+vtwzdPDvT7yKJ523PwEfttFqt
 V4EZk6+OS0rdAB8T/t/nDjkCjVEjaiX/dPzTbQ9T+bwHC7HSaBAqzpvpQX5a8Q3hFgcn
 rU0HfEqrI9Q+sEgQ5RSbkNBGIJ3i3Fax6nWq4FAe5cvsP+Zg4mUDjhWmPuI1fqg5hK9n
 4RdJbqMsKuOXAeFB7d48bmUXFoQGab7+lDwq3+na4bw9KLhNmUw36Z4z9vLhqyN+QgnR
 YlGiSMMS5SeTlAVkuD3B4/q7q4NQFgrroaj8EXdgQdPN2hGrAkxwgQi0RsukUcod0Fvm
 A/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qy+bHSLelRt1MrpbxyOU1oCZ58pF6821JxWTRkqqLeM=;
 b=pR8xHY/WOUTtSqTHkFCGcdc48VyRiGRvy3Kiq55QoUzwLcASPnocowpMAIu90Npnm4
 UDSNtifAc5VhAS9ABzN/080685ufbFm40zmQVcBs2n9sKxAwBYxAmBFu2qUgNMW1LpDR
 2LREQY8viy3H/TkyZePMH8xx5yaZE2kCkvu8pL2ZJLHvS4HeQYE0HXi5Gm/hW3o2EMvg
 4l37Lapkgc1oZNT7cg9nVW1v+bHx+/xBTJO3O0yvJGQYKG+iH3WD4kCOT3kf+3VdCCot
 90vJ5quQsXYnlhh3VNRkpmemiTZWIpCh0lFPX8fPx84z3DtVvRAo6KOrjicm6tAujtst
 FP5w==
X-Gm-Message-State: AOAM533VjY5x0nPRQTVxjEDY2T0CF+4zSBqvRmXT5K1hknCvbw2o9eH1
 3yikVK7s9kQL5xUmXqNByjTVHpOKNu40vLZOcgIQ7Q==
X-Google-Smtp-Source: ABdhPJwGASgU8efvwCfNp8DkkZu2Dpk4kul4lF5WWoZ2F+vDKrvzBWDLZm5Z0jN/6zpache1B7Agx/2AVfFCs7tqnWY=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr14968836ejy.407.1627906279125; 
 Mon, 02 Aug 2021 05:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210728181728.2012952-1-f4bug@amsat.org>
In-Reply-To: <20210728181728.2012952-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:10:36 +0100
Message-ID: <CAFEAcA-_tvVnDgATXaQeM2eZew+_Vr2K1YBVsLh=JpG1Fvbriw@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 0/3] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Jul 2021 at 19:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Fix an assertion reported by OSS-Fuzz, add corresponding qtest.
>
> The change simple enough for the next rc.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT
>   hw/sd/sdcard: Fix assertion accessing out-of-range addresses with
>     CMD30
>   hw/sd/sdcard: Rename Write Protect Group variables

I've left review comments on individual patches, but my suspicion
is that the fix for this assertion failure is just "the
assert should be after the test for 'addr < sd->size', not before",
something like:

@@ -821,8 +821,12 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
     wpnum =3D sd_addr_to_wpnum(addr);

     for (i =3D 0; i < 32; i++, wpnum++, addr +=3D WPGROUP_SIZE) {
+        if (addr >=3D sd->size) {
+            /* Out of range groups report as zero */
+            continue;
+        }
         assert(wpnum < sd->wpgrps_size);
-        if (addr < sd->size && test_bit(wpnum, sd->wp_groups)) {
+        if (test_bit(wpnum, sd->wp_groups)) {
             ret |=3D (1 << i);
         }
     }

-- PMM

