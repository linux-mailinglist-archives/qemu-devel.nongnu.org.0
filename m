Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85442EEF5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:38:33 +0200 (CEST)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKbg-0006m0-JZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkadiy.ivanov@ispras.ru>)
 id 1mbKaD-0005Zm-Un
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:37:01 -0400
Received: from mail.ispras.ru ([83.149.199.84]:51158)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkadiy.ivanov@ispras.ru>)
 id 1mbKaA-00047b-RE
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:37:01 -0400
Received: from mail.ispras.ru (unknown [83.149.199.84])
 by mail.ispras.ru (Postfix) with ESMTPSA id AC1F340A2BC5;
 Fri, 15 Oct 2021 10:36:50 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 15 Oct 2021 13:36:50 +0300
From: arkadiy.ivanov@ispras.ru
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] contrib/plugins: add a drcov plugin
In-Reply-To: <87pmsawlph.fsf@linaro.org>
References: <20211011111130.170178-1-arkaisp2021@gmail.com>
 <87pmsawlph.fsf@linaro.org>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <a25c7f50daccd761189de8dfe08a641d@ispras.ru>
X-Sender: arkadiy.ivanov@ispras.ru
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=arkadiy.ivanov@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DOS_RCVD_IP_TWICE_B=0.001,
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
Cc: Arkadiy <arkaisp2021@gmail.com>, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Bennée писал 2021-10-12 13:36:
> Arkadiy <arkaisp2021@gmail.com> writes:
> 
>> From: NDNF <arkaisp2021@gmail.com>
>> 
>> This patch adds the ability to generate files in drcov format.
>> Primary goal this script is to have coverage
>> logfiles thatwork in Lighthouse.
>> Problems:
>>     - The path to the executable file is not specified.
> 
> I don't see a problem in introducing a plugin helper function to expose
> the path to the binary/kernel to the plugin.
> 
>>     - base, end, entry take incorrect values.
>>       (Lighthouse + IDA Pro anyway work).
> 
> What are they meant to be? Again we could add a helper.
> 
>> 
>> Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
>> ---
>>  contrib/plugins/Makefile |   1 +
>>  contrib/plugins/drcov.c  | 112 
>> +++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 113 insertions(+)
>>  create mode 100644 contrib/plugins/drcov.c
>> 
>> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
>> index 7801b08b0d..0a681efeec 100644
>> --- a/contrib/plugins/Makefile
>> +++ b/contrib/plugins/Makefile
>> @@ -17,6 +17,7 @@ NAMES += hotblocks
>>  NAMES += hotpages
>>  NAMES += howvec
>>  NAMES += lockstep
>> +NAMES += drcov
>> 
>>  SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
>> 
>> diff --git a/contrib/plugins/drcov.c b/contrib/plugins/drcov.c
>> new file mode 100644
>> index 0000000000..d6a7d131c0
>> --- /dev/null
>> +++ b/contrib/plugins/drcov.c
>> @@ -0,0 +1,112 @@
>> +/*
>> + * Copyright (C) 2021, Ivanov Arkady <arkadiy.ivanov@ispras.ru>
>> + *
>> + * Drcov - a DynamoRIO-based tool that collects coverage information
>> + * from a binary. Primary goal this script is to have coverage log
>> + * files that work in Lighthouse.
>> + *
>> + * License: GNU GPL, version 2 or later.
>> + *   See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <inttypes.h>
>> +#include <assert.h>
>> +#include <stdlib.h>
>> +#include <inttypes.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +#include <stdio.h>
>> +#include <glib.h>
>> +
>> +#include <qemu-plugin.h>
>> +
>> +QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
>> +
>> +static char header[] = "DRCOV VERSION: 2\n"
>> +                "DRCOV FLAVOR: drcov-64\n"
>> +                "Module Table: version 2, count 1\n"
>> +                "Columns: id, base, end, entry, path\n";
>> +
>> +static FILE *fp;
>> +
>> +typedef struct {
>> +    uint32_t start;
>> +    uint16_t size;
>> +    uint16_t mod_id;
>> +} bb_entry_t;
>> +
>> +static GSList *bbs;
>> +
>> +static void printfHeader()
> 
> missing void in args.
> 
>> +{
>> +    g_autoptr(GString) head = g_string_new("");
>> +    g_string_append(head, header);
> 
> You could just initialise with your header:
> 
>   g_autoptr(GString) head = g_string_new(header);
> 
>> +    g_string_append_printf(head, "0, 0x%x, 0x%x, 0x%x, %s\n",
>> +                           0, 0xffffffff, 0, "path");
> 
> Why pass consts intro the printf instead of just appending the data as 
> a string?
> 
>> +    g_string_append_printf(head, "BB Table: %d bbs\n", 
>> g_slist_length(bbs));
>> +    fwrite(head->str, sizeof(char), head->len, fp);
>> +}
>> +
>> +static void printfCharArray32(uint32_t data)
>> +{
>> +    const uint8_t *bytes = (const uint8_t *)(&data);
>> +    fwrite(bytes, sizeof(char), sizeof(data), fp);
>> +}
>> +
>> +static void printfCharArray16(uint16_t data)
>> +{
>> +    const uint8_t *bytes = (const uint8_t *)(&data);
>> +    fwrite(bytes, sizeof(char), sizeof(data), fp);
>> +}
> 
> Can the above function names follow the QEMU house style please?
> 
>> +
>> +
>> +static void printf_el(gpointer data, gpointer user_data)
>> +{
>> +    bb_entry_t *bb = (bb_entry_t *)data;
>> +    printfCharArray32(bb->start);
>> +    printfCharArray16(bb->size);
>> +    printfCharArray16(bb->mod_id);
>> +}
>> +
>> +static void plugin_exit(qemu_plugin_id_t id, void *p)
>> +{
>> +    /* Print function */
>> +    printfHeader();
>> +    g_slist_foreach(bbs, printf_el, NULL);
>> +
>> +    /* Clear */
>> +    g_slist_free_full(bbs, &g_free);
>> +    fclose(fp);
>> +}
>> +
>> +static void plugin_init(void)
>> +{
>> +    fp = fopen("file.drcov.trace", "wb");
> 
> Could we make this configurable and just have "file.drcov.trace" as the
> default if not set?
> 
>> +}
>> +
>> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb 
>> *tb)
>> +{
>> +    bb_entry_t *bb = g_new0(bb_entry_t, 1);
>> +    uint64_t pc = qemu_plugin_tb_vaddr(tb);
>> +
>> +    size_t n = qemu_plugin_tb_n_insns(tb);
>> +    for (int i = 0; i < n; i++) {
>> +        bb->size += qemu_plugin_insn_size(qemu_plugin_tb_get_insn(tb, 
>> i));
>> +    }
>> +
>> +    bb->start = pc;
>> +    bb->mod_id = 0;
>> +    bbs = g_slist_append(bbs, bb);
>> +
>> +}
> 
> I'm guessing this works in the simple case but beware that not all
> translations get executed. It might be better to as a install an actual
> tracer when the TB gets executed.
> 
> Although most TBs run to completion there are cases where execution
> stops in them middle of TB. Generally this will be when a synchronous
> fault has occurred and we exit the block early, potentially 
> regenerating
> a block at the PC the fault was at.
> 
> The g_list_append should be protected by a mutex as translation can be
> multi-threaded (at least for system emulation).
> 
>> +
>> +QEMU_PLUGIN_EXPORT
>> +int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
>> +                        int argc, char **argv)
>> +{
>> +    plugin_init();
>> +
>> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
>> +    return 0;
>> +}
> 
> I'll happily take a v2 of this patch with the fixes outlined above.
> 
> However I note the dynamorio pages talk about drcov2lcov which can
> convert to lcov data. Given the basics of code coverage will be the 
> same
> it would be nice to see a re-factoring that would allow for multiple
> output formats so the user could select their preferred output as an
> option.

I couldn't find a detailed description of the lcov format. Also, my 
tests with drcov2lcov were unsuccessful. At the moment, I don't think 
this is a priority.

