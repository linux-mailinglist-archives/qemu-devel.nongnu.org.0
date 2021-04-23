Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C336934F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:30:36 +0200 (CEST)
Received: from localhost ([::1]:42808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvtD-0002jt-5e
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lZvrC-00023Z-Qz; Fri, 23 Apr 2021 09:28:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lZvrA-0007ve-RU; Fri, 23 Apr 2021 09:28:30 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13ND4GdJ143887; Fri, 23 Apr 2021 09:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+UXk1VIdV40QGMqN0etYaqmRNhTdtS9Wr9iUcLoX8Eg=;
 b=NfZ89wEbSCXxn1pUn1RwUfmMOEo1saLbL6IKJreHtCsTpnG1wLdaADcNwEeliO1sEqz0
 fLG3OOOWVCpwjRcxGIYZbk1JofmJG5SYTg2e9/DsLfvsiyiHJcmeU/GOWaxan/A0o7QH
 iFDvOmgBhaqMwIXZud8I1c6XRuosbncMnORx8CVLBrIjPZsSSRwbguNfKF8027bMrk2+
 DDPSrkfbqK1K91G5e6TyZ6yURpHuHzRUCvL+5PyUvFa0SosMhPBpf+WPmRisFoiD6jk5
 DtIuT4MR5JsHd3uSmrIh8IZ41EKhMfF3eUzS8Ap5liH8h0pHpXOfBUj910BpxlDVJR8n ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3838hmar0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 09:28:20 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13ND4VUD145154;
 Fri, 23 Apr 2021 09:28:19 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3838hmaqyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 09:28:19 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13NDQgr7021098;
 Fri, 23 Apr 2021 13:28:18 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3813tb9k43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 13:28:18 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13NDSHe228836166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 13:28:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2841FC6059;
 Fri, 23 Apr 2021 13:28:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C1D3C605B;
 Fri, 23 Apr 2021 13:28:16 +0000 (GMT)
Received: from localhost (unknown [9.163.1.180])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 23 Apr 2021 13:28:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
In-Reply-To: <YIIP5RVQvS+Xd+WF@yekko.fritz.box>
References: <CP2PR80MB44990338BCF641993404B901C7469@CP2PR80MB4499.lamprd80.prod.outlook.com>
 <87mttq15a1.fsf@linux.ibm.com> <YIIP5RVQvS+Xd+WF@yekko.fritz.box>
Date: Fri, 23 Apr 2021 10:28:14 -0300
Message-ID: <874kfxf7v5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kgcvdEJ0vbkUXHQS5etY_WUaCh9u6dHK
X-Proofpoint-GUID: Rl3ti9e-7lK1zcrlqrTH1msXor6vtDXs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-23_04:2021-04-23,
 2021-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104230084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Thu, Apr 22, 2021 at 04:35:34PM -0300, Fabiano Rosas wrote:
>> Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:
>> 
>> >> > You are correct! I've just tweaked the code that defines spr_register and
>> >> > it should be working now. I'm still working in splitting the SPR functions
>> >> > from translate_init, since I think it would make it easier to prepare the
>> >> > !TCG case and for adding new architectures in the future, and I found a
>> >> > few more problems:
>> >>
>> >> Actually looking at the stuff below, I suspect that separating our
>> >> "spr" logic specifically might be a bad idea.  At least some of the
>> >> SPRs control pretty fundamental things about how the processor
>> >> operates, and I suspect separating it from the main translation logic
>> >> may be more trouble than it's worth.
>> 
>> I disagree with the code proximity argument. Having TCG code clearly
>> separate from common code seems more important to me than having the SPR
>> callbacks close to the init_proc functions.
>
> Hmm.. I may be misinterpreting what you're intending here.  I
> certainly agree that separating TCG only code from common code is a
> good idea.  My point, though, is that the vast majority of the SPR
> code *is* TCG specific - there are just a relatively few cases where
> SPRs have a common path.  That basically only happens when a) the SPR
> can be affected by means other than the guest executing instructions
> specifically to do that (i.e. usually by hypercalls) and b) accessing
> the SPR has some side effects that need to be handled in both TCG and
> KVM cases

The SPR code in translate_init.c.inc currently comprises of:

1) the gen_spr* functions that are called during init_proc for each
processor type;

2) the spr_register macros and _spr_register function that adds the SPRs
to env->spr, called from (1);

3) the TCG-specific SPR read|write callbacks, registered by (2);

4) the KVM specific attribute one_reg_id, registered by (2).

The intention is to have one .c file (cpu_init.c) that deals with
processor initialization, which is mostly setting PowerPCCPUClass
attributes and registering the appropriate SPRs for each processor
family (1,2). We're considering that to be shared between KVM and TCG
for now.

What is going into a separate file are the read and write SPR callbacks,
which are TCG specific (3). They are still referenced from the other
file when registering the SPRs, but are ignored when building for
KVM-only. These are kept in a TCG-only compilation unit. There's still a
decision to be made whether we should have a separate spr_tcg file for
them, or move them into translate.c along with the rest of TCG code.

The one_reg_id is just one attribute so that does not change.

> From the descriptions it sounded like you were trying to separate
> *all* SPR code, not just these specific cases from the translation
> core, and that's what I'm saying is a bad idea.

So, if anything, the SPR callbacks are moving _closer_ to the
translation core.

>> But maybe we should take a look at this RFC before we start discussing
>> personal preference too much.
>> 
>> > Well, all the errors that I got were related to to read/write functions, which
>> > I was already separating into a spr_tcg file. The solutions I can see are to
>> > include this file in translate.c, and either have the read/write functions not be
>> > static, or include the spr_common.c in translate as well, but only for TCG
>> > builds. Both solutions sound pretty bad imo, but the first sounds less bad,
>> > because it's a bit less complexity in the build process.
>> 
>> It would be helpful if we could apply these patches and do some
>> experimentation before recommending a solution. So I would pick the less
>> bad for now. Mention it in the cover letter and then we can discuss
>> looking at something more concrete.
>> 

