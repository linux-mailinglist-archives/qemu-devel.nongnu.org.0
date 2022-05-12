Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C152561D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:55:55 +0200 (CEST)
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npEug-0007ST-BQ
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1npEoU-00057s-2b; Thu, 12 May 2022 15:49:30 -0400
Received: from [187.72.171.209] (port=61421 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1npEoR-0004PP-RO; Thu, 12 May 2022 15:49:29 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 12 May 2022 16:49:23 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id EB0E1800177;
 Thu, 12 May 2022 16:49:22 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------VFD6BkMLGyd0YnlR84zgrsJo"
Message-ID: <0e9cfd8a-b7fa-1913-3d1a-7a138fdb7349@eldorado.org.br>
Date: Thu, 12 May 2022 16:49:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 0/9] VDIV/VMOD Implementation
Content-Language: en-US
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, clg@kaod.org, danielhb413@gmail.com
References: <20220420194037.263661-1-lucas.araujo@eldorado.org.br>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <20220420194037.263661-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 12 May 2022 19:49:23.0181 (UTC)
 FILETIME=[60DEC1D0:01D86639]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------VFD6BkMLGyd0YnlR84zgrsJo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

ping

On 20/04/2022 16:40, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
>
> This patch series is an implementation of the vector divide, vector
> divide extended and vector modulo instructions from PowerISA 3.1
>
> The first patch are Matheus' patch, used here since the divs256 and
> divu256 functions use int128_urshift.
>
> Patches without review: 2, 4, 5 and 8
>
> v3 changes:
>      - Divided DO_VDIV_VMOD macro in 4 different new macros
>      - Turned TRANS_VDIV_VMOD into a function and the instructions are
>        now implemented with the TRANS macro and do_vdiv_vmod function
>      - Moved clz128 to int128.h
>
> v2 changes:
>      - Dropped int128_lshift patch
>      - Added missing int_min/-1 check
>      - Changed invalid division to a division by 1
>      - Created new macro responsible for invalid division check
>        (replacing DIV_VEC, REM_VEC and the check in dives_i32/diveu_i32)
>      - Turned GVecGen3 array into single element
>
> Lucas Mateus Castro (alqotel) (8):
>    target/ppc: Implemented vector divide instructions
>    target/ppc: Implemented vector divide quadword
>    target/ppc: Implemented vector divide extended word
>    host-utils: Implemented unsigned 256-by-128 division
>    host-utils: Implemented signed 256-by-128 division
>    target/ppc: Implemented remaining vector divide extended
>    target/ppc: Implemented vector module word/doubleword
>    target/ppc: Implemented vector module quadword
>
> Matheus Ferst (1):
>    qemu/int128: add int128_urshift
>
>   include/qemu/host-utils.h           |   3 +
>   include/qemu/int128.h               |  57 +++++++++
>   target/ppc/helper.h                 |   8 ++
>   target/ppc/insn32.decode            |  23 ++++
>   target/ppc/int_helper.c             | 106 ++++++++++++++++
>   target/ppc/translate/vmx-impl.c.inc | 155 ++++++++++++++++++++++++
>   tests/unit/test-int128.c            |  32 +++++
>   util/host-utils.c                   | 180 ++++++++++++++++++++++++++++
>   8 files changed, 564 insertions(+)
>
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------VFD6BkMLGyd0YnlR84zgrsJo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 20/04/2022 16:40, Lucas Mateus
      Castro(alqotel) wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220420194037.263661-1-lucas.araujo@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">From: "Lucas Mateus Castro (alqotel)" <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>

This patch series is an implementation of the vector divide, vector
divide extended and vector modulo instructions from PowerISA 3.1

The first patch are Matheus' patch, used here since the divs256 and
divu256 functions use int128_urshift.

Patches without review: 2, 4, 5 and 8

v3 changes:
    - Divided DO_VDIV_VMOD macro in 4 different new macros
    - Turned TRANS_VDIV_VMOD into a function and the instructions are
      now implemented with the TRANS macro and do_vdiv_vmod function
    - Moved clz128 to int128.h

v2 changes:
    - Dropped int128_lshift patch
    - Added missing int_min/-1 check
    - Changed invalid division to a division by 1
    - Created new macro responsible for invalid division check
      (replacing DIV_VEC, REM_VEC and the check in dives_i32/diveu_i32)
    - Turned GVecGen3 array into single element

Lucas Mateus Castro (alqotel) (8):
  target/ppc: Implemented vector divide instructions
  target/ppc: Implemented vector divide quadword
  target/ppc: Implemented vector divide extended word
  host-utils: Implemented unsigned 256-by-128 division
  host-utils: Implemented signed 256-by-128 division
  target/ppc: Implemented remaining vector divide extended
  target/ppc: Implemented vector module word/doubleword
  target/ppc: Implemented vector module quadword

Matheus Ferst (1):
  qemu/int128: add int128_urshift

 include/qemu/host-utils.h           |   3 +
 include/qemu/int128.h               |  57 +++++++++
 target/ppc/helper.h                 |   8 ++
 target/ppc/insn32.decode            |  23 ++++
 target/ppc/int_helper.c             | 106 ++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc | 155 ++++++++++++++++++++++++
 tests/unit/test-int128.c            |  32 +++++
 util/host-utils.c                   | 180 ++++++++++++++++++++++++++++
 8 files changed, 564 insertions(+)

</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------VFD6BkMLGyd0YnlR84zgrsJo--

