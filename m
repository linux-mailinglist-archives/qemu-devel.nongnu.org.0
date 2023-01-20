Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B020675508
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqtr-0005Vf-VI; Fri, 20 Jan 2023 07:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pIqtq-0005V2-0U
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:53:42 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pIqto-0004wa-9S
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:53:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5AEC53384D;
 Fri, 20 Jan 2023 12:53:37 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 20 Jan
 2023 13:53:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004f41b5af8-fb4e-4642-8d24-0277d587a250,
 B144956C13BBC382596DA5742790BEAB579A3E91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d0186ac6-b0cb-2dff-34d6-c8eee76d469c@kaod.org>
Date: Fri, 20 Jan 2023 13:53:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] tests/avocado: Factor file_truncate() helper out
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, Cleber
 Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, Subbaraya Sundeep
 <sundeep.lkml@gmail.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230120122836.81675-1-philmd@linaro.org>
 <20230120122836.81675-2-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230120122836.81675-2-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 534c7df5-6f9e-448a-afaf-71a8599412e3
X-Ovh-Tracer-Id: 10291006624340216684
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhsuhhnuggvvghprdhlkhhmlhesghhmrghilhdrtghomhdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpe
 hsmhhtphhouhht
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/20/23 13:28, Philippe Mathieu-Daudé wrote:
> Factor file_truncate() helper out of image_pow2ceil_expand()
> for reuse.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>>
> ---
>   tests/avocado/boot_linux_console.py | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 8c1d981586..49a4b22fe1 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -30,15 +30,19 @@
>   def pow2ceil(x):
>       return 1 if x == 0 else 2**(x - 1).bit_length()
>   
> +"""
> +Truncate file
> +"""
> +def file_truncate(path, size):
> +    if size != os.path.getsize(path):
> +        with open(path, 'ab+') as fd:
> +            fd.truncate(size)
> +
>   """
>   Expand file size to next power of 2
>   """
>   def image_pow2ceil_expand(path):
> -        size = os.path.getsize(path)
> -        size_aligned = pow2ceil(size)
> -        if size != size_aligned:
> -            with open(path, 'ab+') as fd:
> -                fd.truncate(size_aligned)
> +    file_truncate(path, pow2ceil(size))

size is required ^

C.


>   
>   class LinuxKernelTest(QemuSystemTest):
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '


