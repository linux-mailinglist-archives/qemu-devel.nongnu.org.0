Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D3E5AD651
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 17:25:46 +0200 (CEST)
Received: from localhost ([::1]:49912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVDyr-0006aw-CJ
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 11:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oVDxL-00055I-Pv; Mon, 05 Sep 2022 11:24:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24874
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oVDxJ-0000LF-K4; Mon, 05 Sep 2022 11:24:11 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285Exp2m029973;
 Mon, 5 Sep 2022 15:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=qnUZUR73v+obgyUvQfmr1eCGUuwdF9t7k3JSgjVgUJA=;
 b=TtsjWnnfh66tOBjSPfkQy0k7U0Z9V3DeRsk4iydPReF5VEvKfgZpy0aeFeILE+tVpnMu
 /9m/UQgmMaI6zK795yiplxTTM+bcwZDx4NL+GC+VQv1tD0I+5ha1KaBDMBl8fMqLp39V
 U3+YBsxldjsQ7/A8tqpu3NYT6t0OnRm1sgFBCvTGEn0mbJvGefJxM5MW2diq3qtsam8H
 kBAk2pG4bbjkbuS1MzeKth7mtkOLUpCWZFuRAMbyVyGkmM6u7FeOdzY6Y3fFKVLIOxYq
 kDS+XO6XUbundPEVierBx1F3D+gF/xHew2FzwlPkR9ZMZLsCoXgoV0x09DRTq7tAQ1B4 kA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdkc8gnn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:24:06 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 285FNNTT004767;
 Mon, 5 Sep 2022 15:24:06 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdkc8gnm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:24:06 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 285FNOKj016658;
 Mon, 5 Sep 2022 15:24:04 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3jbx6hsxb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:24:04 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 285FO1CH26673496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Sep 2022 15:24:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E77484C046;
 Mon,  5 Sep 2022 15:24:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36BC64C044;
 Mon,  5 Sep 2022 15:24:00 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.44.172])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Sep 2022 15:24:00 +0000 (GMT)
Message-ID: <6d779ae286bd24a76e6cc4b2cc4dcaafdf9acf75.camel@linux.ibm.com>
Subject: Re: [PATCH v9 01/10] s390x/cpus: Make absence of multithreading clear
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, Nico Boehr <nrb@linux.ibm.com>,
 qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 frankja@linux.ibm.com
Date: Mon, 05 Sep 2022 17:23:59 +0200
In-Reply-To: <c394823e-edd5-a722-486f-438e5fba2c9d@linux.ibm.com>
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-2-pmorel@linux.ibm.com>
 <166237756810.5995.16085197397341513582@t14-nrb>
 <c394823e-edd5-a722-486f-438e5fba2c9d@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vBHXs-Ej_Hu-q9cxIVDhS7C_LBT_4-Vf
X-Proofpoint-GUID: FPx6Jz7d1Nu1H68ucsV7qRojRCo2v4X0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_09,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2022-09-05 at 17:10 +0200, Pierre Morel wrote:
> 
> On 9/5/22 13:32, Nico Boehr wrote:
> > Quoting Pierre Morel (2022-09-02 09:55:22)
> > > S390x do not support multithreading in the guest.
> > > Do not let admin falsely specify multithreading on QEMU
> > > smp commandline.
> > > 
> > > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > > ---
> > >   hw/s390x/s390-virtio-ccw.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> > > index 70229b102b..b5ca154e2f 100644
> > > --- a/hw/s390x/s390-virtio-ccw.c
> > > +++ b/hw/s390x/s390-virtio-ccw.c
> > > @@ -86,6 +86,9 @@ static void s390_init_cpus(MachineState *machine)
> > >       MachineClass *mc = MACHINE_GET_CLASS(machine);
> > >       int i;
> > >   
> > > +    /* Explicitely do not support threads */
> >            ^
> >            Explicitly
> > 
> > > +    assert(machine->smp.threads == 1);
> > 
> > It might be nicer to give a better error message to the user.
> > What do you think about something like (broken whitespace ahead):
> > 
> >      if (machine->smp.threads != 1) {if (machine->smp.threads != 1) {
> >          error_setg(&error_fatal, "More than one thread specified, but multithreading unsupported");
> >          return;
> >      }
> > 
> 
> 
> OK, I think I wanted to do this and I changed my mind, obviously, I do 
> not recall why.
> I will do almost the same but after a look at error.h I will use 
> error_report()/exit() instead of error_setg()/return as in:
> 
> 
> +    /* Explicitly do not support threads */
> +    if (machine->smp.threads != 1) {
> +        error_report("More than one thread specified, but 
> multithreading unsupported");
> +        exit(1);
> +    }

I agree that an assert is not a good solution, and I'm not sure
aborting is a good idea either.
I'm assuming that currently if you specify threads > 0 qemu will run
with the number of CPUs multiplied by threads (compared to threads=1).
If that is true, then a new qemu version will break existing
invocations.

An alternative would be to print a warning and do:
cores *= threads
threads = 1

The questions would be what the best place to do that is.
I guess we'd need a new compat variable if that's done in machine-smp.c
> 
> 
> Thanks,
> 
> Regards,
> Pierre
> 


