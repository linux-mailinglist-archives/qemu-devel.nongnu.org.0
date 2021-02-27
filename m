Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76965326EB0
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 19:54:21 +0100 (CET)
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG4jM-0004VC-GM
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 13:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lG4hs-0003PF-5J; Sat, 27 Feb 2021 13:52:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:47374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lG4hm-0008T1-3g; Sat, 27 Feb 2021 13:52:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54D85AC24;
 Sat, 27 Feb 2021 18:52:39 +0000 (UTC)
Subject: Re: [PATCH 07/16] cpu: Introduce CPUSystemOperations structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210226163227.4097950-1-f4bug@amsat.org>
 <20210226163227.4097950-8-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ea91a25d-25f9-e81e-d199-f754ec26679e@suse.de>
Date: Sat, 27 Feb 2021 19:52:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210226163227.4097950-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 5:32 PM, Philippe Mathieu-Daudé wrote:
> Introduce a structure to hold handler specific to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/core/cpu.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index b12028c3c03..ab89235cb45 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -80,6 +80,12 @@ struct TCGCPUOps;
>  /* see accel-cpu.h */
>  struct AccelCPUClass;
>  
> +/*
> + * struct CPUSystemOperations: System operations specific to a CPU class
> + */
> +typedef struct CPUSystemOperations {
> +} CPUSystemOperations;
> +
>  /**
>   * CPUClass:
>   * @class_by_name: Callback to map -cpu command line model name to an
> @@ -190,6 +196,9 @@ struct CPUClass {
>      bool gdb_stop_before_watchpoint;
>      struct AccelCPUClass *accel_cpu;
>  
> +    /* when system emulation is not available, this pointer is NULL */
> +    struct CPUSystemOperations system_ops;

and here again for future code base consistency I would say "sysemu_ops".

So we will focus in the future on the "sysemu" keyword for system emulation (in directories, comments, macros etc).

Ciao,

Claudio

> +
>      /* when TCG is not available, this pointer is NULL */
>      struct TCGCPUOps *tcg_ops;
>  };
> 


