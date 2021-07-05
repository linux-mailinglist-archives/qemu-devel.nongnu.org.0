Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C177F3BBE3D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:33:21 +0200 (CEST)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Pex-0003PT-S3
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1m0Pd3-0002IX-TS; Mon, 05 Jul 2021 10:31:21 -0400
Received: from [201.28.113.2] (port=35511 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1m0Pd1-0005iu-JA; Mon, 05 Jul 2021 10:31:21 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 5 Jul 2021 11:31:13 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id A79AD801354;
 Mon,  5 Jul 2021 11:31:13 -0300 (-03)
Subject: Re: [PATCH v4 2/3] target/ppc: change ppc_hash32_xlate to use mmu_idx
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
 <20210628133610.1143-3-bruno.larsen@eldorado.org.br> <YOKJco6ebWubvDwx@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <893bd8b3-d2be-309a-dd35-59aba1712be6@eldorado.org.br>
Date: Mon, 5 Jul 2021 11:31:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOKJco6ebWubvDwx@yekko>
Content-Type: multipart/alternative;
 boundary="------------879232F0284BAEAC76685C55"
Content-Language: en-US
X-OriginalArrivalTime: 05 Jul 2021 14:31:14.0038 (UTC)
 FILETIME=[68627160:01D771AA]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 16
X-Spam_score: 1.6
X-Spam_bar: +
X-Spam_report: (1.6 / 5.0 requ) BAYES_50=0.8, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------879232F0284BAEAC76685C55
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 05/07/2021 01:24, David Gibson wrote:

> > Changed hash32 address translation to use the supplied mmu_idx, instead
> > of using what was stored in the msr, for parity purposes (radix64
> > already uses that).

> Well.. parity and conceptual correctness.  The translation is supposed
> to use mmu_idx, not look at the CPU again to get the right context.
> AFAIK there isn't a situation in hash32 where they'll get out of sync,
> but nothing guarantees that.


Fair point, I can change the description  if I do end up with a new version, but

> I think the right approach is to duplicate the helper macros in
> mmu-hash32.h for now.  We can unify them later with a more thorough
> review (which would probably involve creating a new header for things
> common to all BookS family MMUs).

This doesn't work directly. I'd need to put in an ifndef PPC_MMU_BOOK3S_V3_H, which also feels a bit dubious to me. I can go with whichever one you prefer

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------879232F0284BAEAC76685C55
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
    <div class="moz-cite-prefix">On 05/07/2021 01:24, David Gibson
      wrote:<br>
    </div>
    <pre class="moz-quote-pre" wrap="">&gt; &gt; Changed hash32 address translation to use the supplied mmu_idx, instead
&gt; &gt; of using what was stored in the msr, for parity purposes (radix64
&gt; &gt; already uses that).
</pre>
    <pre class="moz-quote-pre" wrap="">&gt; Well.. parity and conceptual correctness.  The translation is supposed
&gt; to use mmu_idx, not look at the CPU again to get the right context.
&gt; AFAIK there isn't a situation in hash32 where they'll get out of sync,
&gt; but nothing guarantees that.


Fair point, I can change the description  if I do end up with a new version, but

&gt; I think the right approach is to duplicate the helper macros in
&gt; mmu-hash32.h for now.  We can unify them later with a more thorough
&gt; review (which would probably involve creating a new header for things
&gt; common to all BookS family MMUs).

This doesn't work directly. I'd need to put in an ifndef PPC_MMU_BOOK3S_V3_H, which also feels a bit dubious to me. I can go with whichever one you prefer
</pre>
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

--------------879232F0284BAEAC76685C55--

