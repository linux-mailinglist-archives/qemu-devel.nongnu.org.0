Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D038F2B9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:05:28 +0200 (CEST)
Received: from localhost ([::1]:47830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llExB-0001dA-Pa
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llEtf-0007fO-Pf; Mon, 24 May 2021 14:01:47 -0400
Received: from [201.28.113.2] (port=29367 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llEtd-0001VF-U8; Mon, 24 May 2021 14:01:47 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 24 May 2021 15:01:41 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 1FF0F801360;
 Mon, 24 May 2021 15:01:41 -0300 (-03)
Subject: Re: [RFC PATCH 08/11] target/ppc: wrapped some TCG only logic with
 ifdefs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
 <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <240414de-a246-9878-397e-402a86f70698@eldorado.org.br>
Date: Mon, 24 May 2021 15:01:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------FB52165EE23342B03160F80A"
Content-Language: en-US
X-OriginalArrivalTime: 24 May 2021 18:01:41.0431 (UTC)
 FILETIME=[D98C3470:01D750C6]
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------FB52165EE23342B03160F80A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


>> @@ -8799,7 +8803,9 @@ static void ppc_cpu_unrealize(DeviceState *dev)
>>         cpu_remove_sync(CPU(cpu));
>>   +#ifdef CONFIG_TCG
>>       destroy_ppc_opcodes(cpu);
>> +#endif
>>   }
>>     static gint ppc_cpu_compare_class_pvr(gconstpointer a, 
>> gconstpointer b)
>> @@ -9297,7 +9303,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, 
>> void *data)
>>       cc->class_by_name = ppc_cpu_class_by_name;
>>       cc->has_work = ppc_cpu_has_work;
>>       cc->dump_state = ppc_cpu_dump_state;
>> +#ifdef CONFIG_TCG
>>       cc->dump_statistics = ppc_cpu_dump_statistics;
>> +#endif
>
> We should just drop this entirely.  It's supposedly a generic thing, 
> but only used by ppc.  But even then only with source modification to 
> enable DO_PPC_STATISTICS.  And even then as we convert to decodetree, 
> said statistics will not be collected.
>
> We should delete everything from cpu_dump_statistics on down.

So, now that we have a version of disable-tcg that is functional, I'm 
inclined to look at this cleanup. Just to make sure I got it right: 
everything related to ppc_cpu_dump_statistics and the stuff related to 
ifdef DO_PPC_STATISTICS can be removed, yeah?

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------FB52165EE23342B03160F80A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <blockquote type="cite"
      cite="mid:40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org">
      <blockquote type="cite">@@ -8799,7 +8803,9 @@ static void
        ppc_cpu_unrealize(DeviceState *dev)
        <br>
                cpu_remove_sync(CPU(cpu));
        <br>
          +#ifdef CONFIG_TCG
        <br>
              destroy_ppc_opcodes(cpu);
        <br>
        +#endif
        <br>
          }
        <br>
            static gint ppc_cpu_compare_class_pvr(gconstpointer a,
        gconstpointer b)
        <br>
        @@ -9297,7 +9303,9 @@ static void ppc_cpu_class_init(ObjectClass
        *oc, void *data)
        <br>
              cc-&gt;class_by_name = ppc_cpu_class_by_name;
        <br>
              cc-&gt;has_work = ppc_cpu_has_work;
        <br>
              cc-&gt;dump_state = ppc_cpu_dump_state;
        <br>
        +#ifdef CONFIG_TCG
        <br>
              cc-&gt;dump_statistics = ppc_cpu_dump_statistics;
        <br>
        +#endif
        <br>
      </blockquote>
      <br>
      We should just drop this entirely.  It's supposedly a generic
      thing, but only used by ppc.  But even then only with source
      modification to enable DO_PPC_STATISTICS.  And even then as we
      convert to decodetree, said statistics will not be collected.
      <br>
      <br>
      We should delete everything from cpu_dump_statistics on down.
      <br>
    </blockquote>
    <p>So, now that we have a version of disable-tcg that is functional,
      I'm inclined to look at this cleanup. Just to make sure I got it
      right: everything related to ppc_cpu_dump_statistics and the stuff
      related to ifdef DO_PPC_STATISTICS can be removed, yeah? <br>
    </p>
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

--------------FB52165EE23342B03160F80A--

