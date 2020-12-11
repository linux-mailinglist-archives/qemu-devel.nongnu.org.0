Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFA02D79D7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:50:16 +0100 (CET)
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkgR-0002jb-8t
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1knkJQ-0006Os-B0; Fri, 11 Dec 2020 10:26:28 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1knkJB-0006d1-SZ; Fri, 11 Dec 2020 10:26:27 -0500
Received: from [172.17.10.10] (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPSA id DDEDD21C35;
 Fri, 11 Dec 2020 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1607700367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGflhQBSiFs/eM4mgy3gVdQvdSYWMbAJHsHwRD/lO44=;
 b=3upY+hNb9DLikMAWt7rk1Xlg7dyfX5lj7DSlxwix4mUAttUPaLzoLXzfiE8nsLxUgdz+2G
 kDOUasxeUbMTeLVWL6OpG6hS/3ETK5Lahua7wP08v2aiOYvz2ozLO0NBSrOzf8TI5vud2u
 jstdsnlkxUTKf3SrN+SmXIQtU3EgrdI=
Subject: Re: [RFC PATCH] hw/misc/zynq_slcr: Avoid #DIV/0! error
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair23@gmail.com>
References: <20201210141610.884600-1-f4bug@amsat.org>
 <CAKmqyKN7OMipCzi-B+qNJb_J--ontKzpwX5J=rQ8zye3tmYePQ@mail.gmail.com>
 <20201210201309.GQ22548@toto>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <9b1a67e2-c7d1-a220-0a5a-5bcb188e5c64@greensocs.com>
Date: Fri, 11 Dec 2020 16:26:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201210201309.GQ22548@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Gaoning Pan <gaoning.pgn@antgroup.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/10/20 9:13 PM, Edgar E. Iglesias wrote:
> On Thu, Dec 10, 2020 at 08:39:32AM -0800, Alistair Francis wrote:
>> On Thu, Dec 10, 2020 at 6:27 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> Malicious user can set the feedback divisor for the PLLs
>>> to zero, triggering a floating-point exception (SIGFPE).
>>>
>>> As the datasheet [*] is not clear how hardware behaves
>>> when these bits are zeroes, use the maximum divisor
>>> possible (128) to avoid the software FPE.
>>>
>>> [*] Zynq-7000 TRM, UG585 (v1.12.2)
>>>     B.28 System Level Control Registers (slcr)
>>>     -> "Register (slcr) ARM_PLL_CTRL"
>>>     25.10.4 PLLs
>>>     -> "Software-Controlled PLL Update"
>>>
>>> Fixes: 38867cb7ec9 ("hw/misc/zynq_slcr: add clock generation for uarts")
>>> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> Cc: Damien Hedde <damien.hedde@greensocs.com>
>>> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>> Cc: Alistair Francis <alistair.francis@wdc.com>
>>> Cc: Gaoning Pan <gaoning.pgn@antgroup.com>
>>> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
>>>
>>> Alternative is to threat that as PLL disabled and return 0...
>>
>> I'm not sure which is better, but this patch now is better then before:
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> I agree with Alistair:
> 
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> 

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

