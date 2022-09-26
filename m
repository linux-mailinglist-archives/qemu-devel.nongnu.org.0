Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9BA5EAB44
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:40:26 +0200 (CEST)
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqDZ-0005uI-VI
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocpyZ-0006Ug-Nv
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:24:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocpyX-0004h4-R8
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:24:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z6so10811118wrq.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=Jv3IbA9BFptYnH51KxlMsvw0DbC86bjd6R26jwNRs/0=;
 b=pOkIpf49lEuuqtpXTNAwCOiI4F60vF7894LcB5K7EN6Rk7h52eNvaTwi28zGaTSn40
 RuU/EsrZexnOgi4BoBz0dMepuhxCrSOoB18S2U+Ex3pSSjaHM/gbcgHPioJLYBjUwVMY
 gcxXtfRUMMzt3watzcpVSZxx2Zl4jXDw16cRfA4jUpCfyWA+Em2g+1IAZylmTCLuaOsK
 S3RhOkggSzX6k0cIEqvOo1lrHla32Rrwz4sYx0PF0sm4jALiiTi+a9ajERcl9AR5VYUp
 ei7+1mCF0e1ckQThG6SQxWdCLEFcN1WFIPGXe4FB7R6Cp0lczEanseWQgitHl54oP8kd
 7b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=Jv3IbA9BFptYnH51KxlMsvw0DbC86bjd6R26jwNRs/0=;
 b=SZi3S5kmdfqUOgJp1izc8PfqzkzbWFEH4gLbKjRghITQ90BixiflHKwit2S9uxAu0t
 jqhwAENjnxGfbs1fIy2x8f8uEpcCvJmJhFhC2k2h4dvgI5xg5aN5JHjVrYpyTXZk6sgZ
 SMACleivWmAanTsICGCrvsze2/5uzFLtxQvCzxfYyY1wceqkctLPQLqG7Ow1d6mLSK3r
 xLjGZ1RNcgc/wrIfRgf6HjJxtkFQRxLWQwVB8RzlN1LSRgvNf5KYgS9mNDfrm9FSh0J0
 mzxnwml6m8LUcFaIbVjoU2sAJFM6Q2TgnT74wAJOzJvzCWSs4ULekSnDhVd0UkDryuuz
 fpPA==
X-Gm-Message-State: ACrzQf0aKB56khsdLFh7PZaZ+Ya/CV/n5MR9fEnGZ1Gg9uWUUQtyl0r2
 mly3wrF/Xe0G2t7qrsORrJlE9w==
X-Google-Smtp-Source: AMsMyM4KVkt0F1it25HspZTR4HUgzaga5BZdXSC1TU0dY/fA8NTU2F1TYLmngkA13GOsB0Zk90CIpg==
X-Received: by 2002:a5d:588c:0:b0:22b:1b41:6b83 with SMTP id
 n12-20020a5d588c000000b0022b1b416b83mr13276795wrf.283.1664205892090; 
 Mon, 26 Sep 2022 08:24:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5d52cb000000b0022a293ab1e9sm15289166wrv.11.2022.09.26.08.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:24:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 738FC1FFB7;
 Mon, 26 Sep 2022 16:24:50 +0100 (BST)
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-2-alex.bennee@linaro.org>
 <CAFEAcA_QS8ODmQqHY=rFEMom_PoGL3eTdaLUyki4_0D5jFKaQw@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v2 01/11] hw: encode accessing CPU index in MemTxAttrs
Date: Mon, 26 Sep 2022 16:09:56 +0100
In-reply-to: <CAFEAcA_QS8ODmQqHY=rFEMom_PoGL3eTdaLUyki4_0D5jFKaQw@mail.gmail.com>
Message-ID: <87h70u40ql.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 26 Sept 2022 at 15:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> We currently have hacks across the hw/ to reference current_cpu to
>> work out what the current accessing CPU is. This breaks in some cases
>> including using gdbstub to access HW state. As we have MemTxAttrs to
>> describe details about the access lets extend it to mention if this is
>> a CPU access and which one it is.
>>
>> There are a number of places we need to fix up including:
>>
>>   CPU helpers directly calling address_space_*() fns
>>   models in hw/ fishing the data out of current_cpu
>>   hypervisors offloading device emulation to QEMU
>>
>> I'll start addressing some of these in following patches.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - use separate field cpu_index
>>   - bool for requester_is_cpu
>> v3
>>   - switch to enum MemTxRequesterType
>>   - move helper #define to patch
>>   - revert to overloading requester_id
>>   - mention hypervisors in commit message
>>   - drop cputlb tweaks, they will move to target specific code
>
> I still don't see anything in this patchset that updates
> the code which currently assumes requester_id to be a PCI
> index to check that it hasn't been handed a MemTxAttrs
> that uses requester_id as a CPU number.

OK I'll update so all the existing cases setting requester_id also set
the type to MEMTXATTRS_MSI.

I also noticed the GIC ITS code checks requester ID. Should we assert
(or hw_error?) if it's not the case?

> I also still need to go and look up how hardware does this,
> so please don't queue this patchset yet. In particular, we
> should think about whether we want this to be:
>  * a CPU number, but only set opt-in by some target archs

Given a whole bunch of arches currently use MEMTXATTRS_UNSPECIFIED I
think for now it's worth confining to just ARM where we know we have
devices that care about the cpu_index and have tagged the various paths
with the correct data.

>  * a CPU number, valid for all target archs
>  * a unique-within-the-machine identifier of the transaction
>    master (i.e. which can be set by DMA controllers, etc,
>    not just CPUs)

That would require something to keep a map of requester_id's to
source/index right?

> I would also like some input from Edgar since I know Xilinx
> have some more extensive out-of-tree uses of requester_id.
> We aren't obligated to not break out-of-tree code, but that
> seems like a bunch of experience and knowledge about how
> real hardware works that would be useful for informing
> how we design this.

His comment against the last iteration was:

"CPU's can also have a Master-IDs (Requester IDs) which are unrelated to
the Clusters CPU index. This is used for example in the Xilinx ZynqMP
and Xilinx Versal and the XMPU (Memory Protection Units).

Anyway, I think this approach is an improvement from the current state
but would rather see a new separate field from requester_id. Overloading
requester_id will break some of our use-cases (in the Xilinx tree)...

IIRC a real GIC differentiates between the connected CPU's through
different ports, not by looking at master-ids but I'm not 100% sure..."

at the same time Richard's not keen about adding extra fields
(especially as some arches have INT32_MAX bounds for cpu_index). However
one approach would be to expand the requester_id field and you could
then expand MemTxRequesterType to and have a multiplexed type although I
admit it's hard to imagine HW that cares about both the CPU and bus id
at the same time.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

