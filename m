Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12076F7173
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:47:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucwR-0001Gu-MJ; Thu, 04 May 2023 13:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nnmlinux@linux.vnet.ibm.com>)
 id 1puReW-0008Vh-Ib; Thu, 04 May 2023 01:37:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nnmlinux@linux.vnet.ibm.com>)
 id 1puReT-0000lB-PD; Thu, 04 May 2023 01:37:16 -0400
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3445YpsB023143; Thu, 4 May 2023 05:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=8zsBe5ioRh0rrF5WAjq2ujeI5SydbXmfnOlNY1S5eYw=;
 b=ZQiiaS49CwZjghiQA5aJThjucw04Dcf/vYCHvk0TTaLsmJ3pQ1cN7hIJC1Ju4monpa91
 DUQiwektJKaoMNuH/77z83wENEfrkwTfteicOEnCnsGbwrsJVMbjg9dKE5Mj2l+GGhem
 NK9xz5CrxwmY+kc7wN5k+rHX8WLWbpu/isXci8JPauKkKv9n9rQjg/xohK80vrmjUghg
 mg/3WjdldmYv+WG7mxoUD92vL92Ez6MbRnUbORMq7OulBlPlJs+03Yz/OWQXWyNupA4F
 rP0qvYGBmWLIbtbnUatDgHd+KAhM8Ls5A+A51gSRMHOVxnoQtXZhZ8Dh3rvRHUfar/LS 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc6bgrn1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:37:01 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3445ZaPD029629;
 Thu, 4 May 2023 05:36:32 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc6bgrk0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:36:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3441cafh010613;
 Thu, 4 May 2023 05:35:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q8tv6tmy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:35:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3445Znr923921182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 May 2023 05:35:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8D9B20043;
 Thu,  4 May 2023 05:35:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4481820040;
 Thu,  4 May 2023 05:35:47 +0000 (GMT)
Received: from [9.109.208.57] (unknown [9.109.208.57])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  4 May 2023 05:35:47 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------qKbk3dW384bCLZw004lQQKut"
Message-ID: <ed0fc438-de4c-9204-2321-cf9f1bac677c@linux.vnet.ibm.com>
Date: Thu, 4 May 2023 11:05:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target: ppc: Correctly initialize HILE in HID-0 for
 book3s processors
To: Fabiano Rosas <farosas@suse.de>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Narayana Murty N <nnmlinux@linux.ibm.com>, danielhb413@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, npiggin@linux.ibm.com,
 vajain21@linux.ibm.com, harshpb@linux.ibm.com, sbhat@linux.ibm.com
References: <20230420145055.10196-1-nnmlinux@linux.ibm.com>
 <87v8hq8lgz.fsf@suse.de> <87y1mcfvzo.fsf@vajain21.in.ibm.com>
 <87sfckrsd9.fsf@suse.de>
Content-Language: en-US
From: Narayana Murty N <nnmlinux@linux.vnet.ibm.com>
In-Reply-To: <87sfckrsd9.fsf@suse.de>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Vj1jOCG2ezBCJu0aHQir-0XfZvFPhjVQ
X-Proofpoint-GUID: 81g4SJL5yJMcsZ-Vmj4v9wm9FlX9M-0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_02,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040046
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=nnmlinux@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001, NICE_REPLY_A=-4.28,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 May 2023 13:40:21 -0400
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

This is a multi-part message in MIME format.
--------------qKbk3dW384bCLZw004lQQKut
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/23 20:00, Fabiano Rosas wrote:
> Vaibhav Jain<vaibhav@linux.ibm.com>  writes:
>
>> Hi Fabiano,
>>
>> Thanks for looking into this patch and apologies for the delayed reponse.
>> Fabiano Rosas<farosas@suse.de>  writes:
>>
>>> Narayana Murty N<nnmlinux@linux.ibm.com>  writes:
>>>
>>>> On PPC64 the HILE(Hypervisor Interrupt Little Endian) bit in HID-0
>>>> register needs to be initialized as per isa 3.0b[1] section
>>>> 2.10. This bit gets copied to the MSR_LE when handling interrupts that
>>>> are handled in HV mode to establish the Endianess mode of the interrupt
>>>> handler.
>>>>
>>>> Qemu's ppc_interrupts_little_endian() depends on HILE to determine Host
>>>> endianness which is then used to determine the endianess of the guest dump.
>>>>
>>> Not quite. We use the interrupt endianness as a proxy to guest
>>> endianness to avoid reading MSR_LE at an inopportune moment when the
>>> guest is switching endianness.
>> Agreed

Agreed

>>
>>> This is not dependent on host
>>> endianness. The HILE check is used when taking a memory dump of a
>>> HV-capable machine such as the emulated powernv.
>> I think one concern which the patch tries to address is the guest memorydump file
>> generated of a BigEndian(BE) guest on a LittleEndian(LE) host is not readable on
>> the same LE host since 'crash' doesnt support cross endianess
>> dumps. Also even for a LE guest on LE host the memory dumps are marked as BE
>> making it not possible to analyze any guest memory dumps on the host.
>>
>  From QEMU's perspective there's no "host" in this equation. We'll
> generate a BE dump for a BE guest and a LE dump for a LE guest. Anything
> different is a bug in QEMU (as the one this patch addresses).
>
>> However setting the HILE based on host endianess of qemu might not be
>> the right way to fix this problem. Based on an off mailing list discussion
>> with Narayana, he is working on another patch which doesnt set HILE
>> based on host endianess. However the problem seems to be stemming from
>> fact that qemu on KVM is using the HILE to set up the endianess of
>> memory-dump elf and since its not setup correctly the memory dumps are
>> in wrong endianess.
>>
>>> I think the actual issue might be that we're calling
>>> ppc_interrupts_little_endian with hv=true for the dump.
>>>
>> Yes, that is currently the case with cpu_get_dump_info(). Excerpt from
>> that function below that sets the endianess of the dump:
>>
>>      if (ppc_interrupts_little_endian(cpu, cpu->env.has_hv_mode)) {
> This should probably be looking at cpu->vhyp or MSR_HVB since
> has_hv_mode will not change after we init the cpu.

yes, I agree. New version patch is under testing once done,
will post the patch.

>>          info->d_endian = ELFDATA2LSB;
>>      } else {
>>          info->d_endian = ELFDATA2MSB;
>>      }
>>
>> for pseries kvm guest cpu->env.has_hv_mode is already set hence
>> ppc_interrupts_little_endian() assumes its running in 'hv' mode. The new
>> patch from Narayana will be addressing this.
>>
>>>> Currently the HILE bit is never set in the HID0 register even if the
>>>> qemu is running in Little-Endian mode. This causes the guest dumps to be
>>>> always taken in Big-Endian byte ordering. A guest memory dump of a
>>>> Little-Endian guest running on Little-Endian qemu guest fails with the
>>>> crash tool as illustrated below:
>>>>
>>> Could you describe in more detail what is your setup? Specifically
>>> whether both guests are running TCG or KVM (info kvm) and the state of
>>> the nested-hv capability in QEMU command line.
>> Currently the issue is seen with any pseries KVM guest running on a PowerNV host.
--------------qKbk3dW384bCLZw004lQQKut
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">On 4/28/23 20:00, Fabiano Rosas wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87sfckrsd9.fsf@suse.de">
      <pre class="moz-quote-pre" wrap="">Vaibhav Jain <a class="moz-txt-link-rfc2396E" href="mailto:vaibhav@linux.ibm.com">&lt;vaibhav@linux.ibm.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Fabiano,

Thanks for looking into this patch and apologies for the delayed reponse.
Fabiano Rosas <a class="moz-txt-link-rfc2396E" href="mailto:farosas@suse.de">&lt;farosas@suse.de&gt;</a> writes:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Narayana Murty N <a class="moz-txt-link-rfc2396E" href="mailto:nnmlinux@linux.ibm.com">&lt;nnmlinux@linux.ibm.com&gt;</a> writes:

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On PPC64 the HILE(Hypervisor Interrupt Little Endian) bit in HID-0
register needs to be initialized as per isa 3.0b[1] section
2.10. This bit gets copied to the MSR_LE when handling interrupts that
are handled in HV mode to establish the Endianess mode of the interrupt
handler.

Qemu's ppc_interrupts_little_endian() depends on HILE to determine Host
endianness which is then used to determine the endianess of the guest dump.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Not quite. We use the interrupt endianness as a proxy to guest
endianness to avoid reading MSR_LE at an inopportune moment when the
guest is switching endianness.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Agreed</pre>
      </blockquote>
    </blockquote>
    <pre>Agreed
</pre>
    <blockquote type="cite" cite="mid:87sfckrsd9.fsf@suse.de">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This is not dependent on host
endianness. The HILE check is used when taking a memory dump of a
HV-capable machine such as the emulated powernv.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I think one concern which the patch tries to address is the guest memorydump file
generated of a BigEndian(BE) guest on a LittleEndian(LE) host is not readable on
the same LE host since 'crash' doesnt support cross endianess
dumps. Also even for a LE guest on LE host the memory dumps are marked as BE
making it not possible to analyze any guest memory dumps on the host.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
From QEMU's perspective there's no "host" in this equation. We'll
generate a BE dump for a BE guest and a LE dump for a LE guest. Anything
different is a bug in QEMU (as the one this patch addresses).

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">However setting the HILE based on host endianess of qemu might not be
the right way to fix this problem. Based on an off mailing list discussion
with Narayana, he is working on another patch which doesnt set HILE
based on host endianess. However the problem seems to be stemming from
fact that qemu on KVM is using the HILE to set up the endianess of
memory-dump elf and since its not setup correctly the memory dumps are
in wrong endianess.

</pre>
      </blockquote>
    </blockquote>
    <blockquote type="cite" cite="mid:87sfckrsd9.fsf@suse.de">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I think the actual issue might be that we're calling
ppc_interrupts_little_endian with hv=true for the dump.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yes, that is currently the case with cpu_get_dump_info(). Excerpt from
that function below that sets the endianess of the dump:

    if (ppc_interrupts_little_endian(cpu, cpu-&gt;env.has_hv_mode)) {
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This should probably be looking at cpu-&gt;vhyp or MSR_HVB since
has_hv_mode will not change after we init the cpu.
</pre>
    </blockquote>
    <pre>yes, I agree. New version patch is under testing once done,
will post the patch.
</pre>
    <blockquote type="cite" cite="mid:87sfckrsd9.fsf@suse.de">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">        info-&gt;d_endian = ELFDATA2LSB;
    } else {
        info-&gt;d_endian = ELFDATA2MSB;
    }

for pseries kvm guest cpu-&gt;env.has_hv_mode is already set hence
ppc_interrupts_little_endian() assumes its running in 'hv' mode. The new
patch from Narayana will be addressing this.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Currently the HILE bit is never set in the HID0 register even if the
qemu is running in Little-Endian mode. This causes the guest dumps to be
always taken in Big-Endian byte ordering. A guest memory dump of a
Little-Endian guest running on Little-Endian qemu guest fails with the
crash tool as illustrated below:

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Could you describe in more detail what is your setup? Specifically
whether both guests are running TCG or KVM (info kvm) and the state of
the nested-hv capability in QEMU command line.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Currently the issue is seen with any pseries KVM guest running on a PowerNV host.
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------qKbk3dW384bCLZw004lQQKut--


