Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919E33A953
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 02:30:51 +0100 (CET)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLc4H-0003Wd-PF
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 21:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLc2M-00034E-M3
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 21:28:50 -0400
Received: from relay64.bu.edu ([128.197.228.104]:33526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLc2K-0006Ba-Ba
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 21:28:49 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 12F1RmUk021446
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 14 Mar 2021 21:27:51 -0400
Date: Sun, 14 Mar 2021 21:27:48 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 4/8] qtest/fuzz: Restrict CPU I/O instructions
Message-ID: <20210315012744.enstndj6lvkpt5cu@mozz.bu.edu>
References: <20210314232913.2607360-1-f4bug@amsat.org>
 <20210314232913.2607360-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210314232913.2607360-5-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bandan Das <bsd@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210315 0029, Philippe Mathieu-Daudé wrote:
> Restrict CPU I/O instructions to architectures providing
> I/O bus.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/qtest/fuzz/generic_fuzz.c   | 16 ++++++++++------
>  tests/qtest/fuzz/qtest_wrappers.c |  4 ++++
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index ee8c17a04c4..3e0089f4a63 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -304,6 +304,13 @@ static bool get_io_address(address_range *result, AddressSpace *as,
>      return cb_info.found;
>  }
>  
> +static bool get_mmio_address(address_range *result,
> +                             uint8_t index, uint32_t offset)
> +{
> +    return get_io_address(result, &address_space_memory, index, offset);
> +}
> +
> +#ifdef TARGET_HAS_IOPORT
>  static bool get_pio_address(address_range *result,
>                              uint8_t index, uint16_t offset)
>  {
> @@ -318,12 +325,6 @@ static bool get_pio_address(address_range *result,
>      return result->addr <= 0xFFFF ? found : false;
>  }
>  
> -static bool get_mmio_address(address_range *result,
> -                             uint8_t index, uint32_t offset)
> -{
> -    return get_io_address(result, &address_space_memory, index, offset);
> -}
> -
>  static void op_in(QTestState *s, const unsigned char * data, size_t len)
>  {
>      enum Sizes {Byte, Word, Long, end_sizes};
> @@ -395,6 +396,7 @@ static void op_out(QTestState *s, const unsigned char * data, size_t len)
>          break;
>      }
>  }
> +#endif /* TARGET_HAS_IOPORT */
>  
>  static void op_read(QTestState *s, const unsigned char * data, size_t len)
>  {
> @@ -626,8 +628,10 @@ static void handle_timeout(int sig)
>  static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
>  {
>      void (*ops[]) (QTestState *s, const unsigned char* , size_t) = {
> +#ifdef TARGET_HAS_IOPORT
>          [OP_IN]                 = op_in,
>          [OP_OUT]                = op_out,

I think op_pci_read and op_pci_write would need to be disabled as well
(at least the way they are implemented now).

> +#endif /* TARGET_HAS_IOPORT */
>          [OP_READ]               = op_read,
>          [OP_WRITE]              = op_write,
>          [OP_PCI_READ]           = op_pci_read,
> diff --git a/tests/qtest/fuzz/qtest_wrappers.c b/tests/qtest/fuzz/qtest_wrappers.c
> index 921d1e5ed3a..d56dda9e9b8 100644
> --- a/tests/qtest/fuzz/qtest_wrappers.c
> +++ b/tests/qtest/fuzz/qtest_wrappers.c
> @@ -24,12 +24,14 @@ static bool serialize = true;
>      RET_TYPE __wrap_##NAME_AND_ARGS;\
>      RET_TYPE __real_##NAME_AND_ARGS;
>  
> +#ifdef TARGET_HAS_IOPORT
>  WRAP(uint8_t  , qtest_inb(QTestState *s, uint16_t addr))
>  WRAP(uint16_t , qtest_inw(QTestState *s, uint16_t addr))
>  WRAP(uint32_t , qtest_inl(QTestState *s, uint16_t addr))
>  WRAP(void     , qtest_outb(QTestState *s, uint16_t addr, uint8_t value))
>  WRAP(void     , qtest_outw(QTestState *s, uint16_t addr, uint16_t value))
>  WRAP(void     , qtest_outl(QTestState *s, uint16_t addr, uint32_t value))
> +#endif /* TARGET_HAS_IOPORT */
>  WRAP(uint8_t  , qtest_readb(QTestState *s, uint64_t addr))
>  WRAP(uint16_t , qtest_readw(QTestState *s, uint64_t addr))
>  WRAP(uint32_t , qtest_readl(QTestState *s, uint64_t addr))
> @@ -50,6 +52,7 @@ WRAP(void,      qtest_memset(QTestState *s, uint64_t addr,
>                               uint8_t patt, size_t size))
>  
>  
> +#ifdef TARGET_HAS_IOPORT
>  uint8_t __wrap_qtest_inb(QTestState *s, uint16_t addr)
>  {
>      if (!serialize) {
> @@ -103,6 +106,7 @@ void __wrap_qtest_outl(QTestState *s, uint16_t addr, uint32_t value)
>          __real_qtest_outl(s, addr, value);
>      }
>  }
> +#endif /* TARGET_HAS_IOPORT */
>  
>  uint8_t __wrap_qtest_readb(QTestState *s, uint64_t addr)
>  {
> -- 
> 2.26.2
> 

