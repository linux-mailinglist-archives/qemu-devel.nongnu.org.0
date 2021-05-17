Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660EE38253B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:21:27 +0200 (CEST)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXZ8-00034x-G5
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1liXX1-0000uC-Ay; Mon, 17 May 2021 03:19:15 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1liXWz-0005Wk-Ha; Mon, 17 May 2021 03:19:15 -0400
Received: by mail-pl1-x62f.google.com with SMTP id h20so2624056plr.4;
 Mon, 17 May 2021 00:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ZPoTbt6qZKLDa1NFyLd8W5pKXS+sVhFbdfFJ0jlMObQ=;
 b=r2KA5cFqNutCw4kBalvAAb7bBXZoyL8KixFkfPjQOthsnjaoQzwOdMxMhjzgOuLYd9
 ZmgBtoZzXPXCvLUodOGduWvBso1MAB3YvJAP82Pwg8LpEADuiWubwHgPCQcrk0nmz/Tu
 iX5DLqoOxUeWN2Qb1zgPxP3EfbbZoPwNNcY9nE3MatMMn5izFMcAk0nJCNNZTjo53dto
 V+6eO3KaOEN9Pj6w/AIRrxMpUMdGL7uyXjWELyoRW31Pk20+soMUn7PsHGfKHhFOtXef
 xSkj6ha3jk/pwUm9a1RdDRSDdKFRy0nalo3lwxdUc1GewxrOD8sxJtDRTNRaCu5IH8HL
 MrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ZPoTbt6qZKLDa1NFyLd8W5pKXS+sVhFbdfFJ0jlMObQ=;
 b=FffoCmdHvTZqWTeZmnQcPBQy6ENfJA7Zm3/jtJs6Cm8pOJcrL5KU+tZ3X9/EJs7zWG
 qPodWc60gCv7dOdKRDU9EQPzTN+EkMAO/HK+hXjraFdbPuAjkKjUKOkydQwjOoWl1hvL
 TdC6cR3GPu5DDd870ZqsM1baPiv9QZP84MjaGURIEs6bBPBxt8bWvGIaUoqSegO9H1Jw
 VS7RxCs6fbYBDLGRswPuAHqhJriqzmedPUjiMdk2tNUh2H8dCvQAVRR1Boh03icdjE0O
 R7f1AtTBatr4jfqjrvQl7UIUSN11eIKwk799HA+PS61jC0fNBTwomUF0gqBhMX1iABek
 fS6g==
X-Gm-Message-State: AOAM531BysDLl4htw1j+kcSL9kygFj5H2pcJ8Xpvt5YcFydkttg4r0oJ
 9R9pQcPDswtcl0t7gphEcuM=
X-Google-Smtp-Source: ABdhPJx0C4uK3Zh2r4jqIkLTYIxoByD3ePrWfcZEHVbkOUn8HmlgeUjOu425tuYgsoZG2Zu3FS6U2g==
X-Received: by 2002:a17:90a:ba07:: with SMTP id
 s7mr24154482pjr.129.1621235951510; 
 Mon, 17 May 2021 00:19:11 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id q9sm4636370pjm.23.2021.05.17.00.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 00:19:11 -0700 (PDT)
Date: Mon, 17 May 2021 17:19:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc: Implement ISA v3.1 wait variants
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210517024651.2200837-1-npiggin@gmail.com>
 <YKIBlzRg3oicnKIO@yekko>
In-Reply-To: <YKIBlzRg3oicnKIO@yekko>
MIME-Version: 1.0
Message-Id: <1621234864.zkbj7ifbxd.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62f.google.com
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from David Gibson's message of May 17, 2021 3:39 pm:
> On Mon, May 17, 2021 at 12:46:51PM +1000, Nicholas Piggin wrote:
>> ISA v3.1 adds new variations of wait, specified by the WC field. These
>> are not compatible with the wait 0 implementation, because they add
>> additional conditions that cause the processor to resume, which can
>> cause software to hang or run very slowly.
>>=20
>> Add the new wait variants with a trivial no-op implementation, which is
>> allowed, as explained in comments: software must not depend on any
>> particular architected WC condition having caused resumption of
>> execution, therefore a no-op implementation is architecturally correct.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Logic looks fine.  There is no test on the CPU's features or model
> here, though, so this will change behaviour for pre-3.1 CPUs as well.

Huh. 2.06-2.07 has very similar WC bits as 3.1, but 3.0 removed them
and made them reserved. I should have looked back but I'd assumed
they weren't there either.

Existing code treats WC !=3D 0 as invalid on pre-3.0 processors AFAIKS,
so that's not quite right for 2.06-7 (they should look more like 3.1).

But before that it looks like it was just wait with no WC field.

> What would invoking these wait variants (presumably reserved) on
> earlier CPUs do?

Prior to 2.06, it looks like there is no WC field, and so they should=20
generate a program check. So that just leaves the incorrect program
checks for 2.06-7, something like this should do it:

-GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039FF801, PPC_NONE, PPC2_ISA300),
+GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039FF801, PPC_NONE, PPC2_ISA206),

2.06-3.1 should all be fine with this patch, AFAIKS they all have words=20
to the effect that WC !=3D 0 is subject to implementation defined=20
behaviour and may be treated as a no-op or not implemented.

Thanks,
Nick


