Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A532850A6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 18:07:40 +0200 (CEST)
Received: from localhost ([::1]:43264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvOTT-0007r0-8i
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 12:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOSo-00074N-2Z
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOSl-0004bi-Qs
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:06:57 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40560)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOSk-0004Xk-B8
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:06:54 -0400
Received: by mail-pl1-x629.google.com with SMTP id a93so41430105pla.7
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qq/q21S2LfN6NAbxzP2jsTBKJ3m4kjYanegGNmLakzQ=;
 b=BO7jbmlKDGnmlVwJmKWpYGu5SzuK5OHVlaXrkA/URamXOvPNdz5i9VL4nijoJaodKb
 dBmxAjVjIPrBV0v+f4UtFAEDLm7vG2ee5xgC/nx9forbO/73E5hOFrL+fyteD/tSRWpm
 SxH+rHiWUkXv62yj5kZEehx89ae8+sV1R3zIuH0S0taDYZTUCEDve3u5X5GjTiWkhALQ
 ROoRVqEuegZBEEVzcJJ0kiI/jd6ubTgbGSFTlP1WhZ+6nybVROugiGBMQU2+UmSju6az
 iRxMbr8fgGyzmZFnG/t/73sXpNiEYgwBiCUlMp46lnVkKEOmlpGgp519W68+Hlbq1xsU
 Bhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qq/q21S2LfN6NAbxzP2jsTBKJ3m4kjYanegGNmLakzQ=;
 b=iV67+MPTHV3roTE9539YIj1AOAUVTtE7L2OcecsXmdIUPp6RLsm6giy9sw0T5DYYMI
 vDxAEFnr6NzBhUHYJMUrw/U6Mz2t5N1uNzhZ60hfV0MgCI0pxD0ny1LWmufSnPGkYNh/
 q9lsW7x2l/B49gwWvvczzQSCjJmuQGN1Vl9FsRXpWy681jooLMZlscolitUvDuZNmW7j
 g6wNNW5mqTWewdNMdS3Q/dexMN019R8CcHmmX5SpYnpb9RuYZv5N4xrFVOtF9ejxpOEN
 WuZpYj0j+OCa5ScRBVkzA1LhRwNxEjLZTFkTdY8JQEohIBzO9AdVnoGnqEbRvrx1US7s
 h3rA==
X-Gm-Message-State: APjAAAUxJrhcvEcGSWFdp59RLNpkb6y5nt4Ff7d2IGeARcvZu9cL6AEr
 KdGUjp07t8zNvKIjH/NRRTBKGA==
X-Google-Smtp-Source: APXvYqzKuDCIJn1srmeieaPi42oYx/ffxFAs1Ng06KJDLBUrxHZmY3i9IH2yaR+JOggoBNqXpR5eDQ==
X-Received: by 2002:a63:1455:: with SMTP id 21mr8320380pgu.116.1565194012775; 
 Wed, 07 Aug 2019 09:06:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s43sm387653pjb.10.2019.08.07.09.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 09:06:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166687895.25037@bt.com>
 <83a4f4ab-03ca-c81d-b7fc-d69a6c2f37fb@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <82ad9758-4afb-251d-383b-802c59b48d6a@linaro.org>
Date: Wed, 7 Aug 2019 09:06:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <83a4f4ab-03ca-c81d-b7fc-d69a6c2f37fb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::629
Subject: Re: [Qemu-devel] [PATCH v6 16/26] exec: Map device_endian onto MemOp
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, imammedo@redhat.com, sagark@eecs.berkeley.edu,
 david@redhat.com, jasowang@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, keith.busch@intel.com,
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, pbonzini@redhat.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 pburton@wavecomp.com, marex@denx.de, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mreitz@redhat.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 rth@twiddle.net, philmd@redhat.com, green@moxielogic.com, atar4qemu@gmail.com,
 antonynpavlov@gmail.com, jiri@resnulli.us, ehabkost@redhat.com,
 minyard@acm.org, sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, yuval.shaia@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, shorne@gmail.com,
 sundeep.lkml@gmail.com, jsnow@redhat.com, david@gibson.dropbear.id.au,
 kwolf@redhat.com, crwulff@gmail.com, qemu-riscv@nongnu.org,
 xiaoguangrong.eric@gmail.com, i.mitsyanko@gmail.com, lersek@redhat.com,
 cohuck@redhat.com, alex.williamson@redhat.com, Andrew.Baumann@microsoft.com,
 jcd@tribudubois.net, andrew@aj.id.au, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de, jan.kiszka@web.de,
 stefanb@linux.ibm.com, andrew.smirnov@gmail.com, aurelien@aurel32.net,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/19 8:59 AM, Richard Henderson wrote:
> On 8/7/19 1:31 AM, tony.nguyen@bt.com wrote:
>> +                          &serial_mm_ops[end == DEVICE_LITTLE_ENDIAN ? 0 : 1],
> 
> This is of course "end != DEVICE_LITTLE_ENDIAN".

And by that I mean drop the ?: operator.


r~


