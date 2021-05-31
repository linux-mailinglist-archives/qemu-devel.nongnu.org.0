Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA87F3967C6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 20:21:58 +0200 (CEST)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnmY1-0007r5-FA
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 14:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnmU8-0006uj-Ls; Mon, 31 May 2021 14:17:57 -0400
Received: from [201.28.113.2] (port=24440 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnmU6-0005NR-IH; Mon, 31 May 2021 14:17:56 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 31 May 2021 15:17:47 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 85A6D801481;
 Mon, 31 May 2021 15:17:47 -0300 (-03)
Subject: Re: [PATCH 02/11] target/ppc: moved ppc_store_sdr1 to cpu.c
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-3-bruno.larsen@eldorado.org.br>
 <YJyiDaBAK48lVaDF@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <52622a11-522b-cc04-6382-7c4f5328710c@eldorado.org.br>
Date: Mon, 31 May 2021 15:17:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJyiDaBAK48lVaDF@yekko>
Content-Type: multipart/alternative;
 boundary="------------F301DFB8068945953E57F894"
Content-Language: en-US
X-OriginalArrivalTime: 31 May 2021 18:17:47.0912 (UTC)
 FILETIME=[4281C080:01D75649]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.591, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
--------------F301DFB8068945953E57F894
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 13/05/2021 00:50, David Gibson wrote:
> On Wed, May 12, 2021 at 11:08:04AM -0300, Bruno Larsen (billionai) wrote:
>> Moved this function that is required in !TCG cases into a
>> common code file
> The reasons it's needed by !TCG are kind of bogus, related to
> weirdness in the way KVM PR works.  But it's fair not to care about
> that right now, so, applied to ppc-for-6.1.
Now that the future is here, I was looking into why might the reasons be 
bogus. From what I can see, what should be happening is just storing 
what was retrieved by the kvm ioctl, right? Am I missing something?
--
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------F301DFB8068945953E57F894
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
    <div class="moz-cite-prefix">On 13/05/2021 00:50, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YJyiDaBAK48lVaDF@yekko">
      <pre class="moz-quote-pre" wrap="">On Wed, May 12, 2021 at 11:08:04AM -0300, Bruno Larsen (billionai) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Moved this function that is required in !TCG cases into a
common code file
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The reasons it's needed by !TCG are kind of bogus, related to
weirdness in the way KVM PR works.  But it's fair not to care about
that right now, so, applied to ppc-for-6.1.
</pre>
    </blockquote>
    <div class="moz-signature">Now that the future is here, I was
      looking into why might the reasons be bogus. From what I can see,
      what should be happening is just storing what was retrieved by the
      kvm ioctl, right? Am I missing something? <br>
    </div>
    <div class="moz-signature">--<br>
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

--------------F301DFB8068945953E57F894--

