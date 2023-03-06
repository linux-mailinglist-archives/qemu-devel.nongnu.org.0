Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114C6ABD9C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:02:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8ai-0001vi-MI; Mon, 06 Mar 2023 06:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pZ8aK-0001g6-Jf; Mon, 06 Mar 2023 06:01:00 -0500
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pZ8aH-0002m0-Fp; Mon, 06 Mar 2023 06:00:51 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VdFNMm6_1678100432; 
Received: from 30.221.97.6(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdFNMm6_1678100432) by smtp.aliyun-inc.com;
 Mon, 06 Mar 2023 19:00:33 +0800
Message-ID: <6dd0199c-c3e0-a466-67b3-dab92df587d2@linux.alibaba.com>
Date: Mon, 6 Mar 2023 19:00:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/1] hw/riscv: Add signature dump function for spike to
 run ACT tests
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230306090314.74626-1-liweiwei@iscas.ac.cn>
 <20230306090314.74626-2-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230306090314.74626-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/3/6 17:03, Weiwei Li wrote:
> Add signature and signature-granularity properties in spike to specify the target
> signatrue file and the line size for signature data.
>
> Recgonize the signature section between begin_signature and end_signature symbols
> when loading elf of ACT tests. Then dump signature data in signature section just
> before the ACT tests exit.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   hw/char/riscv_htif.c | 39 ++++++++++++++++++++++++++++++++++++++-
>   hw/riscv/spike.c     | 16 ++++++++++++++++
>   2 files changed, 54 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 098de50e35..2a82ed8500 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -29,6 +29,8 @@
>   #include "chardev/char-fe.h"
>   #include "qemu/timer.h"
>   #include "qemu/error-report.h"
> +#include "exec/address-spaces.h"
> +#include "sysemu/dma.h"
>   
>   #define RISCV_DEBUG_HTIF 0
>   #define HTIF_DEBUG(fmt, ...)                                                   \
> @@ -51,7 +53,10 @@
>   /* PK system call number */
>   #define PK_SYS_WRITE            64
>   
> -static uint64_t fromhost_addr, tohost_addr;
> +extern const char *sig_file;
> +extern uint8_t line_size;
> +
Why not declare them in riscv_htif.h and include them in hw/riscv/spike.c?
> +static uint64_t fromhost_addr, tohost_addr, sig_addr, sig_len;
>   
>   void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>                             uint64_t st_size)
> @@ -68,6 +73,10 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>               error_report("HTIF tohost must be 8 bytes");
>               exit(1);
>           }
> +    } else if (strcmp("begin_signature", st_name) == 0) {
> +        sig_addr = st_value;
> +    } else if (strcmp("end_signature", st_name) == 0) {
> +        sig_len = st_value - sig_addr;
>       }
>   }
>   
> @@ -161,6 +170,34 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>           /* frontend syscall handler, shutdown and exit code support */
>           if (cmd == HTIF_SYSTEM_CMD_SYSCALL) {
>               if (payload & 0x1) {
> +                /* Dump signature data to sig_file if specified */
> +                if (sig_file) {
> +                    char *sig_data = g_malloc(sig_len);
> +                    dma_memory_read(&address_space_memory, sig_addr, sig_data,
> +                                    sig_len, MEMTXATTRS_UNSPECIFIED);
> +                    FILE *signature = fopen(sig_file, "w");
> +                    if (signature == NULL) {
> +                        error_report("open %s: %s", sig_file,
> +                                     strerror(errno));
> +                        exit(1);
> +                    }
> +
> +                    for (int i = 0; i < sig_len; i += line_size) {
> +                        for (int j = line_size; j > 0; j--) {
> +                            if (i + j <= sig_len) {
> +                                fprintf(signature, "%02x",
> +                                        sig_data[i + j - 1] & 0xff);

Not sure about the order. Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> +                            } else {
> +                                fprintf(signature, "%02x", 0);
> +                            }
> +                        }
> +                        fprintf(signature, "\n");
> +                    }
> +
> +                    fclose(signature);
> +                    g_free(sig_data);
> +                }
> +
>                   /* exit code */
>                   int exit_code = payload >> 1;
>                   exit(exit_code);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index a584d5b3a2..eaa7f54fd6 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -41,6 +41,9 @@
>   
>   #include <libfdt.h>
>   
> +const char *sig_file;
> +uint8_t line_size = 16;
> +
>   static const MemMapEntry spike_memmap[] = {
>       [SPIKE_MROM] =     {     0x1000,     0xf000 },
>       [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
> @@ -332,6 +335,11 @@ static void spike_board_init(MachineState *machine)
>                    htif_custom_base);
>   }
>   
> +static void spike_set_signature(Object *obj, const char *val, Error **errp)
> +{
> +    sig_file = g_strdup(val);
> +}
> +
>   static void spike_machine_instance_init(Object *obj)
>   {
>   }
> @@ -350,6 +358,14 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
>       mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>       mc->numa_mem_supported = true;
>       mc->default_ram_id = "riscv.spike.ram";
> +    object_class_property_add_str(oc, "signature", NULL, spike_set_signature);
> +    object_class_property_set_description(oc, "signature",
> +                                          "File to write ACT test signature");
> +    object_class_property_add_uint8_ptr(oc, "signature-granularity",
> +                                        &line_size, OBJ_PROP_FLAG_WRITE);
> +    object_class_property_set_description(oc, "signature-granularity",
> +                                          "Size of each line in ACT signature "
> +                                          "file");
>   }
>   
>   static const TypeInfo spike_machine_typeinfo = {

