Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0C7361960
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 07:40:21 +0200 (CEST)
Received: from localhost ([::1]:44450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXHDI-0001YX-SA
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 01:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXHBf-0000tc-8L; Fri, 16 Apr 2021 01:38:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXHBd-0007ET-Ap; Fri, 16 Apr 2021 01:38:38 -0400
Received: by mail-wm1-x331.google.com with SMTP id y204so12226219wmg.2;
 Thu, 15 Apr 2021 22:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GOW5fv4e4kgsUv67oMscXkOP0d467eiHQKO3nuY1GLE=;
 b=FcmbAWnXX+OypJ+vG3hYsmrXL8kbhTICI1fFVS4whTKxLbFGfg22HTaLX/ev/H57eq
 E9nIlFQguUWd2+NfUa3ID7XV9gRhfkJgC3XNpbJM0tS2KaMy2GocFqhn9agdrxnUdvXD
 re5raXFn/+qMvFaFkpCc6fuNRDZ9vqRtd762Qhngaq58cwjH+7GS83qWeuKyBlYhMiPQ
 pKroW8pHl+hrBIzfIGsROAe6rWcybCIeF1VanuTrwViRUkPOGq8lx49aoh/p43m5ZRxN
 ifzG/WOwPsPBPXRdBEli8dMqaxQwbr7dFAUFOTCaXY50U1WtLEm11I1Gir7xJcBkBmr2
 +K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GOW5fv4e4kgsUv67oMscXkOP0d467eiHQKO3nuY1GLE=;
 b=bhqG/icIEOn0ut+pufgOpYkuAkI+vgDV+pBPxqUtRYXjehljueOXgpfqepDdpiLWcQ
 qk+y2qDE+VcO/3zh/KenbwoIrSW39JydqS3NvCt+OswmIMwhZDZgIVjsRjDduL/6busi
 YNrbnA2/+Z3x7asCc373+HUOsjziCBFKgGTBvX7BDOA+3Wy5vMP0Ia+jnLvakt0KN+7y
 svRZUB235HuezA5puVNpg6VfVPGja8KL1XduNC4prk2kUmAH6arP6l7sZyBEdeZlXk3e
 4+5aec9M9RgT3XcoojdzcxzvTLhpQrTBnAkT5i6jOhkDv2HwxZGQtiuEwqx+Tv5epZ1u
 NsEA==
X-Gm-Message-State: AOAM533KDutpdcdAnoeh/lOnkIbCuZszXZ/3fu7lUuLTA4DuF0aGTYPc
 kcequyQwusio6ky+D5r4vWE=
X-Google-Smtp-Source: ABdhPJw71k2WkrPfS/qBkdsCGqkI4zXZ/ITfZVDHFTMYeXqvvuFarBsalWtXV2BZG20bP4KDneRxcQ==
X-Received: by 2002:a05:600c:35d2:: with SMTP id
 r18mr5723154wmq.29.1618551515250; 
 Thu, 15 Apr 2021 22:38:35 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l9sm6491114wmq.2.2021.04.15.22.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 22:38:34 -0700 (PDT)
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Do not sysbus-map mmio flash region
 directly, use alias
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-3-f4bug@amsat.org>
 <4a812dc9-b448-0b8f-6a66-95cb96acdc17@amsat.org>
 <da1043ee-5945-86a3-450b-d73eee1b1685@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e5cc461f-349a-b0e8-7140-f5dcd86505de@amsat.org>
Date: Fri, 16 Apr 2021 07:38:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <da1043ee-5945-86a3-450b-d73eee1b1685@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 7:46 PM, Cédric Le Goater wrote:
> On 3/13/21 1:05 PM, Philippe Mathieu-Daudé wrote:
>> Incorrect subject prefix, should be "hw/ssi/aspeed_smc"
> 
> Is this just good practice or something that was agreed upon ? 

Not sure, maybe "good practice"? Anyway here I only meant to
correct my own patch without respining the series just for this.

> We should update checkpatch if so.

Certainly a waste of time =)

> 
> Thanks,
> 
> C. 

