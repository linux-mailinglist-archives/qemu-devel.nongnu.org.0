Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4246F1124
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 06:55:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psG7V-0005Kk-TE; Fri, 28 Apr 2023 00:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1psG7S-0005KD-Oj; Fri, 28 Apr 2023 00:54:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1psG7Q-0001ct-Aa; Fri, 28 Apr 2023 00:54:06 -0400
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33S4kJ0o001459; Fri, 28 Apr 2023 04:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Gp4o9hNudj0Hpd5/962ixtwY6k/9yaoLW+D4I356C/U=;
 b=VcBsO5YCpFJTpED0jlmklagr/QyH7zAUs/fBMfwrbPo8Yf75cdolVF9WZis+XbtYcVO/
 /96dl1OU4hcTHpKflKUMlxJQm6Lqm/qa/Iw8BaBs4+TYemHv0MzJwsZdKq+CEy1xsk9d
 NSq8f1heOqoa6MW9vv5kNEGUVSctLUjNTardhcGdZsOJPkqBpHZx/JLEPJ+W7GUsRoUk
 UFWHa0LrdYQhT+mJgirsHLE9a/RT7JjAjlqCCe6LWY7m/eXBzk5/+GjIQIs6CmnkxTGt
 KpY0g6IP3iwxXMsDTnkoXSk4nqppixx8X9X0F2p93e0i1gehW902GYIB3gh4QbUcvfHt zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q870u8mek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 04:53:47 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33S4bQxH002239;
 Fri, 28 Apr 2023 04:53:46 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q870u8mdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 04:53:46 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33S3tpV7031904;
 Fri, 28 Apr 2023 04:53:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3q4776tqpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 04:53:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33S4ret045416958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Apr 2023 04:53:40 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6ED9520043;
 Fri, 28 Apr 2023 04:53:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25ECD20040;
 Fri, 28 Apr 2023 04:53:34 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.211.132.94])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
 Fri, 28 Apr 2023 04:53:33 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Fri, 28 Apr 2023 10:23:31 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Fabiano Rosas <farosas@suse.de>, Narayana Murty N
 <nnmlinux@linux.ibm.com>, danielhb413@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, npiggin@linux.ibm.com,
 vajain21@linux.ibm.com, harshpb@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH] target: ppc: Correctly initialize HILE in HID-0 for
 book3s processors
In-Reply-To: <87v8hq8lgz.fsf@suse.de>
References: <20230420145055.10196-1-nnmlinux@linux.ibm.com>
 <87v8hq8lgz.fsf@suse.de>
Date: Fri, 28 Apr 2023 10:23:31 +0530
Message-ID: <87y1mcfvzo.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iLwm8TZOX5kpqjTXGRXknIdQ2TMRapsU
X-Proofpoint-ORIG-GUID: S_jwxleVeJK-dJMjpDgOC2-iOgvQ7nzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_02,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 mlxlogscore=958 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280035
Received-SPF: pass client-ip=148.163.156.1; envelope-from=vaibhav@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Hi Fabiano,

Thanks for looking into this patch and apologies for the delayed reponse.
Fabiano Rosas <farosas@suse.de> writes:

> Narayana Murty N <nnmlinux@linux.ibm.com> writes:
>
>> On PPC64 the HILE(Hypervisor Interrupt Little Endian) bit in HID-0
>> register needs to be initialized as per isa 3.0b[1] section
>> 2.10. This bit gets copied to the MSR_LE when handling interrupts that
>> are handled in HV mode to establish the Endianess mode of the interrupt
>> handler.
>>
>> Qemu's ppc_interrupts_little_endian() depends on HILE to determine Host
>> endianness which is then used to determine the endianess of the guest dump.
>>
>
> Not quite. We use the interrupt endianness as a proxy to guest
> endianness to avoid reading MSR_LE at an inopportune moment when the
> guest is switching endianness.
Agreed

> This is not dependent on host
> endianness. The HILE check is used when taking a memory dump of a
> HV-capable machine such as the emulated powernv.

I think one concern which the patch tries to address is the guest memorydump file
generated of a BigEndian(BE) guest on a LittleEndian(LE) host is not readable on
the same LE host since 'crash' doesnt support cross endianess
dumps. Also even for a LE guest on LE host the memory dumps are marked as BE
making it not possible to analyze any guest memory dumps on the host.

However setting the HILE based on host endianess of qemu might not be
the right way to fix this problem. Based on an off mailing list discussion
with Narayana, he is working on another patch which doesnt set HILE
based on host endianess. However the problem seems to be stemming from
fact that qemu on KVM is using the HILE to set up the endianess of
memory-dump elf and since its not setup correctly the memory dumps are
in wrong endianess.

> I think the actual issue might be that we're calling
> ppc_interrupts_little_endian with hv=true for the dump.
>
Yes, that is currently the case with cpu_get_dump_info(). Excerpt from
that function below that sets the endianess of the dump:

    if (ppc_interrupts_little_endian(cpu, cpu->env.has_hv_mode)) {
        info->d_endian = ELFDATA2LSB;
    } else {
        info->d_endian = ELFDATA2MSB;
    }

for pseries kvm guest cpu->env.has_hv_mode is already set hence
ppc_interrupts_little_endian() assumes its running in 'hv' mode. The new
patch from Narayana will be addressing this.

>> Currently the HILE bit is never set in the HID0 register even if the
>> qemu is running in Little-Endian mode. This causes the guest dumps to be
>> always taken in Big-Endian byte ordering. A guest memory dump of a
>> Little-Endian guest running on Little-Endian qemu guest fails with the
>> crash tool as illustrated below:
>>
>
> Could you describe in more detail what is your setup? Specifically
> whether both guests are running TCG or KVM (info kvm) and the state of
> the nested-hv capability in QEMU command line.
Currently the issue is seen with any pseries KVM guest running on a PowerNV host.

-- 
Cheers
~ Vaibhav

