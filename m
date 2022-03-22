Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D27D4E3DDC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:54:22 +0100 (CET)
Received: from localhost ([::1]:57126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWd5h-00016H-BZ
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:54:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nWd4c-0008Oz-0o; Tue, 22 Mar 2022 07:53:14 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:54403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nWd4a-0005u1-AL; Tue, 22 Mar 2022 07:53:13 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MfYDO-1nz3zf3J1c-00fw62; Tue, 22 Mar 2022 12:52:59 +0100
Message-ID: <0c9a2024-cea5-777d-1de7-5c0737d4ba1e@vivier.eu>
Date: Tue, 22 Mar 2022 12:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] linux-user/arm: Implement __kernel_cmpxchg64 with
 host atomics
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-4-richard.henderson@linaro.org>
 <CAFEAcA_8vJOJBatwFiX255n3HgTBBhCtiquGfJ8U5ryuL+-v0g@mail.gmail.com>
 <75a17177-557c-6a47-9724-2a8bb5aa6dbb@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <75a17177-557c-6a47-9724-2a8bb5aa6dbb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zNG3yuH/2ksXFhzW71qdYwuuhY4+zAKe6i7J9S9RcjpxIhVtQFT
 8t0ATwKjFlhCR863F+aAMvw5Jny4f8mH46quuPSgKzR8eBWNXsYeSFYSOOolLjlI8j9pDEM
 +cnMgw2twmrx/Gylbl9Ei5/oztKhXkXCmmk9L7hehtimsl4HvUrXzHapUeYMPGMPjoGkYo9
 D1l4j+tCRQ4ROGNMrtySA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Pa/S2xyRML4=:BYTfLb1FwDFFjs2MCmfb1L
 zBWxQNAS0sDzn0vGCtkmhe5WeoYf02bBP2uSr3FxsghFHnDmEagjKja70mb6rOF/cCTYTQWbP
 UaPqbOEKqd9P1pEwZ8dbEyDUoT4Y4Z6SDy1Xkz2SpKP8VUof/SDvdssIIuReoIpV4HOwTvFD3
 67LYn6YXSTVMN7ewYG21nx9253WF6956VPL2Rapc759I52WYmVmTJGDKbH6VtZfWkk1jM0Q4C
 ZzW8THAvAH7Bn0GA4ZQfy3OWuQcLOldsXuFbXWJY29u/ygVSaWPZU8zZUju12kLhdOa0/SoCt
 AiKS6A5pJ49hINp5kw0ds9NWuDcAP5GcxogdpQJyTbUM43ORxN5i8J+lAPhjNyD9yB3Veg8HR
 RvOiMWmT7ANehC+gjPztbuAuAdAUF0I+92RDN7SGP/B1BBHgJhID3BG5ZpwmUN6T+WitunFxl
 Q+R2LSZGu2gVpwxWz/xwbPqRrlAE39siUJPzVjJJm+AvnprHDSfM5OaW1cPdlziWCf4ALHLbH
 TmYjbizj3nvfJRclUXlOslh5rT9gh3IFjW+B6NT4uCsmmKtHxhXVATGl7BvB9VzEgP7ix/oqV
 4VHR/3vqw2A1Y0fLhVT3OElNnoy/oFg6g2KtxO6hme+xVkeB44LGbV5XP8L8VwoW/b0u8PCn3
 wVml8UnDN78+HAUek4sVarny4ojqvJ6oLpy3nDdKWgjBnpCaYkQoRj4SyLjytNEgx83U=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/03/2022 à 19:31, Richard Henderson a écrit :
> On 3/15/22 11:18, Peter Maydell wrote:
>>> -segv:
>>> -    end_exclusive();
>>> -    /* We get the PC of the entry address - which is as good as anything,
>>> -       on a real kernel what you get depends on which mode it uses. */
>>
>> This comment about the PC the guest signal handler is going
>> to see when we take the SEGV is still valid, I think ?
> 
> Yes.  I guess I could move it to the block comment in front of atomic_mmu_lookup, because it would 
> apply to both the SEGV and the BUS raised there.


Applied to my linux-user-for-7.0 branch with the following change:

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index d9651f199f97..0172a7aae7e8 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -78,6 +78,8 @@
  /*
   * Similar to code in accel/tcg/user-exec.c, but outside the execution loop.
   * Must be called with mmap_lock.
+ * We get the PC of the entry address - which is as good as anything,
+ * on a real kernel what you get depends on which mode it uses.
   */
  static void *atomic_mmu_lookup(CPUArchState *env, uint32_t addr, int size)
  {

Let me know if you prefer something else.

Thanks,
Laurent

