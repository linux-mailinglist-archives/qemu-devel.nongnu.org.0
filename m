Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB14372C5D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:47:19 +0200 (CEST)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwKU-0004c5-0n
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldwHC-0003ml-Md; Tue, 04 May 2021 10:43:54 -0400
Received: from [201.28.113.2] (port=50705 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldwH9-0001im-VB; Tue, 04 May 2021 10:43:54 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 4 May 2021 11:43:47 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id A839F8012B4;
 Tue,  4 May 2021 11:43:47 -0300 (-03)
Subject: Re: [RFC PATCH v2 0/2] hw/ppc: code motion to compile without TCG
To: Fabiano Rosas <farosas@linux.ibm.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
 <87sg331mso.fsf@linux.ibm.com>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <42879cce-dde6-144c-59b5-43a022f24100@eldorado.org.br>
Date: Tue, 4 May 2021 11:43:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87sg331mso.fsf@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------579B96839BA69B0A76DCBB53"
Content-Language: en-US
X-OriginalArrivalTime: 04 May 2021 14:43:47.0953 (UTC)
 FILETIME=[E4243E10:01D740F3]
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------579B96839BA69B0A76DCBB53
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 03/05/2021 19:21, Fabiano Rosas wrote:
> "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br> writes:
>
>> After the feedback from v1 I reworked the patch with suggested ideas and
>> this version has less duplicated code and is overall simpler.
>>
>> This patch series is still a WIP, there are still 2 main problems I am
>> trying to solve, I'll mention them in their respective patches.
>>
>> The aim of these patches is to progress toward enabling disable-tcg on
>> PPC by solving errors in hw/ppc with that option.
>>
>> As a WIP comments are welcome.
>>
>> Lucas Mateus Castro (alqotel) (2):
>>    target/ppc: Moved functions out of mmu-hash64
>>    hw/ppc: Moved TCG code to spapr_hcall_tcg
>>
>>   hw/ppc/meson.build       |   3 +
>>   hw/ppc/spapr.c           |   1 +
>>   hw/ppc/spapr_caps.c      |   1 +
>>   hw/ppc/spapr_cpu_core.c  |   1 +
>>   hw/ppc/spapr_hcall.c     | 301 ++--------------------------------
>>   hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++++++++
>>   hw/ppc/spapr_rtas.c      |   1 +
>>   target/ppc/meson.build   |   1 +
>>   target/ppc/mmu-hash64.c  |  81 +--------
>>   target/ppc/mmu-hash64.h  |   6 -
>>   target/ppc/mmu-misc.c    |  86 ++++++++++
>>   target/ppc/mmu-misc.h    |  22 +++
>>   12 files changed, 478 insertions(+), 369 deletions(-)
>>   create mode 100644 hw/ppc/spapr_hcall_tcg.c
>>   create mode 100644 target/ppc/mmu-misc.c
>>   create mode 100644 target/ppc/mmu-misc.h
> This is the list of hypercalls registered with spapr_register_hypercall
> and whether they are implemented by KVM HV, KVM PR or none. I also list
> whether the KVM hcall uses the QEMU implementation as a fallback. Maybe
> it will be helpful to this discussion.
>
> (This is from just looking at the code, so take it with a grain of salt)
>
> H_ADD_LOGICAL_LAN_BUFFER  - not impl. by KVM
> H_CHANGE_LOGICAL_LAN_MAC  - not impl. by KVM
> H_ENABLE_CRQ              - not impl. by KVM
> H_FREE_CRQ                - not impl. by KVM
> H_FREE_LOGICAL_LAN        - not impl. by KVM
> H_GET_CPU_CHARACTERISTICS - not impl. by KVM
> H_GET_TERM_CHAR           - not impl. by KVM
> H_HOME_NODE_ASSOCIATIVITY - not impl. by KVM
> H_INT_ESB                 - not impl. by KVM
> H_INT_GET_QUEUE_INFO      - not impl. by KVM
> H_INT_GET_SOURCE_CONFIG   - not impl. by KVM
> H_INT_GET_SOURCE_INFO     - not impl. by KVM
> H_INT_RESET               - not impl. by KVM
> H_INT_SET_QUEUE_CONFIG    - not impl. by KVM
> H_INT_SET_SOURCE_CONFIG   - not impl. by KVM
> H_INT_SYNC                - not impl. by KVM
> H_JOIN                    - not impl. by KVM
> H_LOGICAL_CACHE_LOAD      - not impl. by KVM
> H_LOGICAL_CACHE_STORE     - not impl. by KVM
> H_LOGICAL_DCBF            - not impl. by KVM
> H_LOGICAL_ICBI            - not impl. by KVM
> H_MULTICAST_CTRL          - not impl. by KVM
> H_PUT_TERM_CHAR           - not impl. by KVM
> H_REGISTER_LOGICAL_LAN    - not impl. by KVM
> H_REGISTER_PROC_TBL       - not impl. by KVM
> H_REG_CRQ                 - not impl. by KVM
> H_RESIZE_HPT_COMMIT       - not impl. by KVM
> H_RESIZE_HPT_PREPARE      - not impl. by KVM
> H_SCM_BIND_MEM            - not impl. by KVM
> H_SCM_READ_METADATA       - not impl. by KVM
> H_SCM_UNBIND_ALL          - not impl. by KVM
> H_SCM_WRITE_METADATA      - not impl. by KVM
> H_SEND_CRQ                - not impl. by KVM
> H_SEND_LOGICAL_LAN        - not impl. by KVM
> H_SET_SPRG0               - not impl. by KVM
> H_SIGNAL_SYS_RESET        - not impl. by KVM
> H_VIO_SIGNAL              - not impl. by KVM
>
> H_CAS                     - not impl. by KVM | called by SLOF only
> H_LOGICAL_MEMOP           - not impl. by KVM | called by SLOF only
> H_TPM_COMM                - not impl. by KVM | called by UV only
> H_UPDATE_DT               - not impl. by KVM | called by SLOF only
>
> H_INT_GET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF/UV
> H_INT_GET_QUEUE_CONFIG      - not impl. by KVM | not called by linux/SLOF/UV
> H_INT_SET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF/UV
> H_SCM_UNBIND_MEM            - not impl. by KVM | not called by linux/SLOF/UV
>
> H_GET_TCE      - HV | not impl. by PR | QEMU fallback
> H_SET_MODE     - HV | not impl. by PR | QEMU fallback
> H_CONFER       - HV | not impl. by PR
> H_PAGE_INIT    - HV | not impl. by PR
> H_PROD         - HV | not impl. by PR
> H_RANDOM       - HV | not impl. by PR
> H_READ         - HV | not impl. by PR
> H_REGISTER_VPA - HV | not impl. by PR
> H_SET_DABR     - HV | not impl. by PR
> H_SET_XDABR    - HV | not impl. by PR
>
> H_CPPR             - HV | PR | QEMU fallback
> H_EOI              - HV | PR | QEMU fallback
> H_IPI              - HV | PR | QEMU fallback
> H_IPOLL            - HV | PR | QEMU fallback
> H_LOGICAL_CI_LOAD  - HV | PR | QEMU fallback
> H_LOGICAL_CI_STORE - HV | PR | QEMU fallback
> H_PUT_TCE          - HV | PR | QEMU fallback
> H_PUT_TCE_INDIRECT - HV | PR | QEMU fallback
> H_RTAS             - HV | PR | QEMU fallback
> H_STUFF_TCE        - HV | PR | QEMU fallback
> H_XIRR             - HV | PR | QEMU fallback
> H_XIRR_X           - HV | PR | QEMU fallback
>
> H_BULK_REMOVE      - HV | PR
> H_CEDE             - HV | PR
> H_ENTER            - HV | PR
> H_PROTECT          - HV | PR
> H_REMOVE           - HV | PR
>
> H_CLEAN_SLB      - never called/implemented, added along with H_REGISTER_PROC_TBL
> H_INVALIDATE_PID - never called/implemented, added along with H_REGISTER_PROC_TBL
>
> PS: we could perhaps use this information to annotate
> qemu/include/spapr.h. I can send a patch if people find it useful.
That would be very good, I think. I'm always in favor of more documentation
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------579B96839BA69B0A76DCBB53
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03/05/2021 19:21, Fabiano Rosas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87sg331mso.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">"Lucas Mateus Castro (alqotel)" <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">After the feedback from v1 I reworked the patch with suggested ideas and
this version has less duplicated code and is overall simpler.

This patch series is still a WIP, there are still 2 main problems I am
trying to solve, I'll mention them in their respective patches.

The aim of these patches is to progress toward enabling disable-tcg on
PPC by solving errors in hw/ppc with that option.

As a WIP comments are welcome.

Lucas Mateus Castro (alqotel) (2):
  target/ppc: Moved functions out of mmu-hash64
  hw/ppc: Moved TCG code to spapr_hcall_tcg

 hw/ppc/meson.build       |   3 +
 hw/ppc/spapr.c           |   1 +
 hw/ppc/spapr_caps.c      |   1 +
 hw/ppc/spapr_cpu_core.c  |   1 +
 hw/ppc/spapr_hcall.c     | 301 ++--------------------------------
 hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_rtas.c      |   1 +
 target/ppc/meson.build   |   1 +
 target/ppc/mmu-hash64.c  |  81 +--------
 target/ppc/mmu-hash64.h  |   6 -
 target/ppc/mmu-misc.c    |  86 ++++++++++
 target/ppc/mmu-misc.h    |  22 +++
 12 files changed, 478 insertions(+), 369 deletions(-)
 create mode 100644 hw/ppc/spapr_hcall_tcg.c
 create mode 100644 target/ppc/mmu-misc.c
 create mode 100644 target/ppc/mmu-misc.h
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is the list of hypercalls registered with spapr_register_hypercall
and whether they are implemented by KVM HV, KVM PR or none. I also list
whether the KVM hcall uses the QEMU implementation as a fallback. Maybe
it will be helpful to this discussion.

(This is from just looking at the code, so take it with a grain of salt)

H_ADD_LOGICAL_LAN_BUFFER  - not impl. by KVM
H_CHANGE_LOGICAL_LAN_MAC  - not impl. by KVM
H_ENABLE_CRQ              - not impl. by KVM
H_FREE_CRQ                - not impl. by KVM
H_FREE_LOGICAL_LAN        - not impl. by KVM
H_GET_CPU_CHARACTERISTICS - not impl. by KVM
H_GET_TERM_CHAR           - not impl. by KVM
H_HOME_NODE_ASSOCIATIVITY - not impl. by KVM
H_INT_ESB                 - not impl. by KVM
H_INT_GET_QUEUE_INFO      - not impl. by KVM
H_INT_GET_SOURCE_CONFIG   - not impl. by KVM
H_INT_GET_SOURCE_INFO     - not impl. by KVM
H_INT_RESET               - not impl. by KVM
H_INT_SET_QUEUE_CONFIG    - not impl. by KVM
H_INT_SET_SOURCE_CONFIG   - not impl. by KVM
H_INT_SYNC                - not impl. by KVM
H_JOIN                    - not impl. by KVM
H_LOGICAL_CACHE_LOAD      - not impl. by KVM
H_LOGICAL_CACHE_STORE     - not impl. by KVM
H_LOGICAL_DCBF            - not impl. by KVM
H_LOGICAL_ICBI            - not impl. by KVM
H_MULTICAST_CTRL          - not impl. by KVM
H_PUT_TERM_CHAR           - not impl. by KVM
H_REGISTER_LOGICAL_LAN    - not impl. by KVM
H_REGISTER_PROC_TBL       - not impl. by KVM
H_REG_CRQ                 - not impl. by KVM
H_RESIZE_HPT_COMMIT       - not impl. by KVM
H_RESIZE_HPT_PREPARE      - not impl. by KVM
H_SCM_BIND_MEM            - not impl. by KVM
H_SCM_READ_METADATA       - not impl. by KVM
H_SCM_UNBIND_ALL          - not impl. by KVM
H_SCM_WRITE_METADATA      - not impl. by KVM
H_SEND_CRQ                - not impl. by KVM
H_SEND_LOGICAL_LAN        - not impl. by KVM
H_SET_SPRG0               - not impl. by KVM
H_SIGNAL_SYS_RESET        - not impl. by KVM
H_VIO_SIGNAL              - not impl. by KVM

H_CAS                     - not impl. by KVM | called by SLOF only
H_LOGICAL_MEMOP           - not impl. by KVM | called by SLOF only
H_TPM_COMM                - not impl. by KVM | called by UV only
H_UPDATE_DT               - not impl. by KVM | called by SLOF only

H_INT_GET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF/UV
H_INT_GET_QUEUE_CONFIG      - not impl. by KVM | not called by linux/SLOF/UV
H_INT_SET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF/UV
H_SCM_UNBIND_MEM            - not impl. by KVM | not called by linux/SLOF/UV

H_GET_TCE      - HV | not impl. by PR | QEMU fallback
H_SET_MODE     - HV | not impl. by PR | QEMU fallback
H_CONFER       - HV | not impl. by PR
H_PAGE_INIT    - HV | not impl. by PR
H_PROD         - HV | not impl. by PR
H_RANDOM       - HV | not impl. by PR
H_READ         - HV | not impl. by PR
H_REGISTER_VPA - HV | not impl. by PR
H_SET_DABR     - HV | not impl. by PR
H_SET_XDABR    - HV | not impl. by PR

H_CPPR             - HV | PR | QEMU fallback
H_EOI              - HV | PR | QEMU fallback
H_IPI              - HV | PR | QEMU fallback
H_IPOLL            - HV | PR | QEMU fallback
H_LOGICAL_CI_LOAD  - HV | PR | QEMU fallback
H_LOGICAL_CI_STORE - HV | PR | QEMU fallback
H_PUT_TCE          - HV | PR | QEMU fallback
H_PUT_TCE_INDIRECT - HV | PR | QEMU fallback
H_RTAS             - HV | PR | QEMU fallback
H_STUFF_TCE        - HV | PR | QEMU fallback
H_XIRR             - HV | PR | QEMU fallback
H_XIRR_X           - HV | PR | QEMU fallback

H_BULK_REMOVE      - HV | PR
H_CEDE             - HV | PR
H_ENTER            - HV | PR
H_PROTECT          - HV | PR
H_REMOVE           - HV | PR

H_CLEAN_SLB      - never called/implemented, added along with H_REGISTER_PROC_TBL
H_INVALIDATE_PID - never called/implemented, added along with H_REGISTER_PROC_TBL

PS: we could perhaps use this information to annotate
qemu/include/spapr.h. I can send a patch if people find it useful.
</pre>
    </blockquote>
    <div class="moz-signature">That would be very good, I think. I'm
      always in favor of more documentation<br>
    </div>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen</div>
    <div class="moz-signature">
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
    </div>
    <div class="moz-signature">
      Departamento Computação Embarcada<br>
    </div>
    <div class="moz-signature">
      Analista de Software Trainee</div>
    <div class="moz-signature">
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------579B96839BA69B0A76DCBB53--

