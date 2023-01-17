Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D266DADD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:24:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHj7k-0001Al-51; Tue, 17 Jan 2023 05:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pHj7h-0001AY-6N
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:23:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pHj7f-00040S-Bi
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:23:20 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30H9WKFp032381
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZAF9igsIQug3tRMl3PoDkkBpm4aRwnJ0Gsv4P5ZYFkU=;
 b=eujp3SGmeWri696xi4VQbKO97wq7z3qsJrMq5C6Q+BJou3FIosGbnZmCBZmdZAijKN6g
 cFKCghOycFH6crfvTzeu+Eahaq0pBrTyvgxalgxVD/Ga+ZiFoxnn9OVImNftx6R+fpaX
 x2eKD/4ymHf+DHxP3TlpMZ6RKHGG9k5IEQN79zJlHaZNKU1bEGWWzhbOQp+0bgCrxKMu
 8hZwjYBxlaXWj9k/DYdZ1xwpan2FN1W8oCjyaCyADrT0hPA2I4hy/5vurfAoQQ3FWrR8
 xZJHQZiHDyUtuiJx+KPd5UFPQtFH61n6lK2PYj0KRfo7XIESwDPsBE2s5857ry2PniS1 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5nb8p9u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:23:16 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30H9F0dq004001
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:23:16 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5nb8p9tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 10:23:16 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30H7kIKE006229;
 Tue, 17 Jan 2023 10:23:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfkp0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 10:23:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30HANAQN52166966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jan 2023 10:23:10 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68F2E20063;
 Tue, 17 Jan 2023 10:23:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23A5E2004F;
 Tue, 17 Jan 2023 10:23:10 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.56])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 17 Jan 2023 10:23:10 +0000 (GMT)
Date: Tue, 17 Jan 2023 11:23:08 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, david@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, seiden@linux.ibm.com
Subject: Re: [PATCH v2 2/2] s390x/pv: Add support for asynchronous teardown
 for reboot
Message-ID: <20230117112308.2daa9b4f@p-imbrenda>
In-Reply-To: <1ef3d781-e823-feb9-ce7d-f2f0c1456d9d@redhat.com>
References: <20230105155019.72200-1-imbrenda@linux.ibm.com>
 <20230105155019.72200-3-imbrenda@linux.ibm.com>
 <1ef3d781-e823-feb9-ce7d-f2f0c1456d9d@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pd1AMaSN2U2vWHhyDzConNyxTKCxnuwc
X-Proofpoint-ORIG-GUID: 2yyuZLmF9RFXMuWv0A9v7KxIbHNlMl1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_04,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=661 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170080
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 17 Jan 2023 09:53:46 +0100
Thomas Huth <thuth@redhat.com> wrote:

[...]

> > +static void *s390_pv_do_unprot_async_fn(void *p)
> > +{
> > +     s390_pv_cmd_exit(KVM_PV_ASYNC_CLEANUP_PERFORM, NULL);
> > +     return NULL;
> > +}
> > +
> > +bool s390_pv_vm_try_disable_async(void)
> > +{
> > +    QemuThread *t;
> > +
> > +    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
> > +        return false;
> > +    }
> > +    if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {
> > +        return false;
> > +    }
> > +
> > +    t = g_malloc0(sizeof(QemuThread));  
> 
> Sorry for not noticing it in v1 already ... but isn't this leaking memory? 
> Who's supposed to free "t" again?

I assumed that QEMU_THREAD_DETACHED took care of that; it seems like I
was mistaken (oops).

I'll find a way to fix this

> 
>   Thomas
> 
> 
> > +    qemu_thread_create(t, "async_cleanup", s390_pv_do_unprot_async_fn, NULL,
> > +                       QEMU_THREAD_DETACHED);
> > +
> > +    return true;
> > +}  
> 


