Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A9389103
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:33:50 +0200 (CEST)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNGf-0003tO-2B
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljNCO-00008y-0L; Wed, 19 May 2021 10:29:24 -0400
Received: from [201.28.113.2] (port=49677 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljNCJ-00088S-Vp; Wed, 19 May 2021 10:29:21 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 19 May 2021 11:29:16 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id C515880139F;
 Wed, 19 May 2021 11:29:15 -0300 (-03)
Subject: Re: [PATCH v2 7/7] target/ppc: wrapped some TCG only logic with ifdefs
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
 <20210518150515.57983-8-bruno.larsen@eldorado.org.br>
 <YKRxu6mcVAfQJUwo@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <92c78813-ffb3-413f-e794-c287a72d4a1d@eldorado.org.br>
Date: Wed, 19 May 2021 11:29:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKRxu6mcVAfQJUwo@yekko>
Content-Type: multipart/alternative;
 boundary="------------BFF8937A1EF248A8306F7E6F"
Content-Language: en-US
X-OriginalArrivalTime: 19 May 2021 14:29:16.0128 (UTC)
 FILETIME=[58B08E00:01D74CBB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------BFF8937A1EF248A8306F7E6F
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 18/05/2021 23:02, David Gibson wrote:
> On Tue, May 18, 2021 at 12:05:15PM -0300, Bruno Larsen (billionai) wrote:
>> Wrapped some function calls in cpu_init.c, gdbstub.c, mmu-hash64.c and
>> excp_helper.c that were TCG only with ifdef CONFIG_TCG, to support
>> building without TCG.
>>
>> for excp_helper we also moved the function do_rfi higher in the file to
>> reduce the ifdef count.
> The description's no longer really accurate since some of the fixups
> are no longer ifdef based.
Sure, will do
> <snip>
>>                            0x00000000);
>>           }
>>       }
>> @@ -8605,11 +8603,13 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
>>           }
>>       }
>>   
>> +#ifdef CONFIG_TCG
>>       create_ppc_opcodes(cpu, &local_err);
>>       if (local_err != NULL) {
>>           error_propagate(errp, local_err);
>>           goto unrealize;
>>       }
>> +#endif
> In this instance, I think it would be cleaner to create a no-op stub
> for create_ppc_opcodes() and destroy_ppc_opcodes() rather than using
> ifdefs.
Ok. will add the stubs in tcg-stubs.c
>
>>       init_ppc_proc(cpu);
>>   
>>       ppc_gdb_init(cs, pcc);
>> @@ -8798,7 +8798,9 @@ static void ppc_cpu_unrealize(DeviceState *dev)
>>   
>>       cpu_remove_sync(CPU(cpu));
>>   
>> +#ifdef CONFIG_TCG
>>       destroy_ppc_opcodes(cpu);
>> +#endif
>>   }
>>   
>>   static gint ppc_cpu_compare_class_pvr(gconstpointer a, gconstpointer b)
>> @@ -9296,7 +9298,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>>       cc->class_by_name = ppc_cpu_class_by_name;
>>       cc->has_work = ppc_cpu_has_work;
>>       cc->dump_state = ppc_cpu_dump_state;
>> +#ifdef CONFIG_TCG
>>       cc->dump_statistics = ppc_cpu_dump_statistics;
>> +#endif
>>       cc->set_pc = ppc_cpu_set_pc;
>>       cc->gdb_read_register = ppc_cpu_gdb_read_register;
>>       cc->gdb_write_register = ppc_cpu_gdb_write_register;
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 80bb6e70e9..a14b529722 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -19,9 +19,13 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/main-loop.h"
>>   #include "cpu.h"
>> +#ifdef CONFIG_TCG
>>   #include "exec/helper-proto.h"
>> +#endif
> I don't like the look of ifdefs amongst the includes.  Generally the
> headers themselves should be made safe (if unnecessary) to include for
> !TCG builds.

The problems that happen with exec/helper-proto.h and exec/cpu_ldst.h is 
that they include headers themselves, trace/generated-helpers.h and 
tcg-target.h respectively, which are in folders that are not included as 
-iquote in the gcc CLI call.

So the problem is that it is trying to include headers that gcc doesn't 
see as part of the project anymore. The best option (I think) would be 
to fix the gcc command generation so headers are safe to include, but 
since I was very confused with all the scripts related to generating 
everything, I ended up going with not including the files. Should I 
change the configure script, so that we can include headers from 
tcg/ppc? I can also just separate headers that can be ifdef'd away from 
the rest with a blank line, so it's more visible later

>
>>   #include "exec/exec-all.h"
>> +#ifdef CONFIG_TCG
>>   #include "exec/cpu_ldst.h"
>> +#endif
>>   #include "internal.h"
>>   #include "helper_regs.h"
> The remaining ifdef changes look fine.  Some it would be nice to clean
> up better in future, but there's no rush.
>
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------BFF8937A1EF248A8306F7E6F
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18/05/2021 23:02, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YKRxu6mcVAfQJUwo@yekko">
      <pre class="moz-quote-pre" wrap="">On Tue, May 18, 2021 at 12:05:15PM -0300, Bruno Larsen (billionai) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Wrapped some function calls in cpu_init.c, gdbstub.c, mmu-hash64.c and
excp_helper.c that were TCG only with ifdef CONFIG_TCG, to support
building without TCG.

for excp_helper we also moved the function do_rfi higher in the file to
reduce the ifdef count.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The description's no longer really accurate since some of the fixups
are no longer ifdef based.</pre>
    </blockquote>
    Sure, will do<br>
    <blockquote type="cite" cite="mid:YKRxu6mcVAfQJUwo@yekko">
      <pre class="moz-quote-pre" wrap="">
&lt;snip&gt;</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">                          0x00000000);
         }
     }
@@ -8605,11 +8603,13 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+#ifdef CONFIG_TCG
     create_ppc_opcodes(cpu, &amp;local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         goto unrealize;
     }
+#endif
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
In this instance, I think it would be cleaner to create a no-op stub
for create_ppc_opcodes() and destroy_ppc_opcodes() rather than using
ifdefs.</pre>
    </blockquote>
    Ok. will add the stubs in tcg-stubs.c<br>
    <blockquote type="cite" cite="mid:YKRxu6mcVAfQJUwo@yekko">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">     init_ppc_proc(cpu);
 
     ppc_gdb_init(cs, pcc);
@@ -8798,7 +8798,9 @@ static void ppc_cpu_unrealize(DeviceState *dev)
 
     cpu_remove_sync(CPU(cpu));
 
+#ifdef CONFIG_TCG
     destroy_ppc_opcodes(cpu);
+#endif
 }
 
 static gint ppc_cpu_compare_class_pvr(gconstpointer a, gconstpointer b)
@@ -9296,7 +9298,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc-&gt;class_by_name = ppc_cpu_class_by_name;
     cc-&gt;has_work = ppc_cpu_has_work;
     cc-&gt;dump_state = ppc_cpu_dump_state;
+#ifdef CONFIG_TCG
     cc-&gt;dump_statistics = ppc_cpu_dump_statistics;
+#endif
     cc-&gt;set_pc = ppc_cpu_set_pc;
     cc-&gt;gdb_read_register = ppc_cpu_gdb_read_register;
     cc-&gt;gdb_write_register = ppc_cpu_gdb_write_register;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 80bb6e70e9..a14b529722 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -19,9 +19,13 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#ifdef CONFIG_TCG
 #include "exec/helper-proto.h"
+#endif
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't like the look of ifdefs amongst the includes.  Generally the
headers themselves should be made safe (if unnecessary) to include for
!TCG builds.</pre>
    </blockquote>
    <p>The problems that happen with exec/helper-proto.h and
      exec/cpu_ldst.h is that they include headers themselves,
      trace/generated-helpers.h and tcg-target.h respectively, which are
      in folders that are not included as -iquote in the gcc CLI call. <br>
    </p>
    <p>So the problem is that it is trying to include headers that gcc
      doesn't see as part of the project anymore. The best option (I
      think) would be to fix the gcc command generation so headers are
      safe to include, but since I was very confused with all the
      scripts related to generating everything, I ended up going with
      not including the files. Should I change the configure script, so
      that we can include headers from tcg/ppc? I can also just separate
      headers that can be ifdef'd away from the rest with a blank line,
      so it's more visible later<br>
    </p>
    <blockquote type="cite" cite="mid:YKRxu6mcVAfQJUwo@yekko">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> #include "exec/exec-all.h"
+#ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
+#endif
 #include "internal.h"
 #include "helper_regs.h"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The remaining ifdef changes look fine.  Some it would be nice to clean
up better in future, but there's no rush.

</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------BFF8937A1EF248A8306F7E6F--

