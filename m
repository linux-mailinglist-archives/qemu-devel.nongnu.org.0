Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1702C7D07
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 03:55:34 +0100 (CET)
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZLh-0002ys-Oy
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 21:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZ7J-00082o-Gr; Sun, 29 Nov 2020 21:40:41 -0500
Received: from mail.csgraf.de ([188.138.100.120]:33918
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZ7H-0006JJ-Cp; Sun, 29 Nov 2020 21:40:41 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 2E83839001C1;
 Mon, 30 Nov 2020 03:40:33 +0100 (CET)
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
 <CAFEAcA_Xo4ptyVhJGXvO3B4FJh86W-Oj81f_nxMbaZt-DPfLrg@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <c3b7d74a-3a4c-d102-ba0f-0da436eec4d3@csgraf.de>
Date: Mon, 30 Nov 2020 03:40:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Xo4ptyVhJGXvO3B4FJh86W-Oj81f_nxMbaZt-DPfLrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 27.11.20 17:47, Peter Maydell wrote:
> On Fri, 27 Nov 2020 at 16:38, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Having looked a bit more closely at some of the relevant target/arm
>> code, I think the best approach is going to be that in virt.c
>> we just check the PARange ID register field (probably via
>> a convenience function that does the conversion of that to
>> a nice number-of-bits return value; we might even have one
>> already).
> Ha, in fact we're already doing something quite close to this,
> though instead of saying "decide whether to use highmem based
> on the CPU's PA range" we go for "report error to user if PA
> range is insufficient" and let the user pick some command line
> options that disable highmem if they want:
>
>          if (aarch64 && vms->highmem) {
>              int requested_pa_size = 64 - clz64(vms->highest_gpa);
>              int pamax = arm_pamax(ARM_CPU(first_cpu));
>
>              if (pamax < requested_pa_size) {
>                  error_report("VCPU supports less PA bits (%d) than "
>                               "requested by the memory map (%d)",
>                               pamax, requested_pa_size);
>                  exit(1);
>              }
>          }


Turns out I can sync aa64mfr0 just fine as well. So I'll just do that 
and remove this patch.


Alex



