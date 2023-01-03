Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6BF65BF53
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 12:49:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCfml-0002o5-NB; Tue, 03 Jan 2023 06:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pCfmO-0002mk-FU
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:48:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pCfmM-0003Av-Bx
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:48:28 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303Ail7X025243
 for <qemu-devel@nongnu.org>; Tue, 3 Jan 2023 11:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=JU+zeQMvUHBowCCbdQHP66KGB6o/ZA5Opefp3BUA5ck=;
 b=YIKHpgfFnAa/VruC+1D1BMfhwx7kiXl6MLIQo5VESClR7wxkauJdvuTKdF9d7hxMZtGB
 NeJ/8aqk9AagRetSb/P+5S26Qu5N0v7Tzdrqn2QVzNjJsQtdBKEk9Or+UAzr/qL8dcpX
 gviKWyqJQc6dJMsxZJx7misJ0vrhdq/MXVwH5tc0DU7vVaZmhiCbr9t7RL7gIEK/Lvhh
 579MGwgRy4x/gjSib28vzHfO2aSubOTuleppns3Xk6iEPEzPsSrOOqGssTCr8Y7RoB8s
 Ie9NFqTyOWqPW2Hkyb/WzAlUHZ2+rr4lt7Huj5QbDpQBtQnADEoB42Fve1GoUyaoOW8g JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvjves934-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 11:48:23 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 303BjZWd005244
 for <qemu-devel@nongnu.org>; Tue, 3 Jan 2023 11:48:22 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvjves92s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 11:48:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3038LjHx000962;
 Tue, 3 Jan 2023 11:48:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mtcbfbrhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 11:48:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 303BmHQh47186418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Jan 2023 11:48:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77F8220040;
 Tue,  3 Jan 2023 11:48:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E012B20043;
 Tue,  3 Jan 2023 11:48:16 +0000 (GMT)
Received: from p-imbrenda (unknown [9.171.92.26])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
 Tue,  3 Jan 2023 11:48:16 +0000 (GMT)
Date: Tue, 3 Jan 2023 12:48:14 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, david@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, seiden@linux.ibm.com
Subject: Re: [PATCH v1 2/2] s390x/pv: Add support for asynchronous teardown
 for reboot
Message-ID: <20230103124814.377cd0b2@p-imbrenda>
In-Reply-To: <e28ce124-6ae8-2ae3-5d66-f7cf1a02a1cd@redhat.com>
References: <20221222150421.35839-1-imbrenda@linux.ibm.com>
 <20221222150421.35839-3-imbrenda@linux.ibm.com>
 <e28ce124-6ae8-2ae3-5d66-f7cf1a02a1cd@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I-2gwqGWoFkHm7Ui-XSafs4TiAKuVYf0
X-Proofpoint-GUID: E9dYcvP9jmoyVROFIdswMJeVD-tiyH2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_02,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=892
 adultscore=0 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030100
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

On Tue, 3 Jan 2023 12:27:32 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 22/12/2022 16.04, Claudio Imbrenda wrote:
> > This patch adds support for the asynchronous teardown for reboot for
> > protected VMs.  
> [...]
> > +bool s390_pv_vm_try_disable_async(void)
> > +{
> > +    char tname[VCPU_THREAD_NAME_SIZE];
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
> > +    snprintf(tname, VCPU_THREAD_NAME_SIZE, "async_unpr/KVM");
> > +
> > +    qemu_thread_create(t, tname, s390_pv_do_unprot_async_fn, NULL,
> > +                       QEMU_THREAD_DETACHED);  
> 
> I think you could get along without the tname[] array here by simply passing 
> the string directly to qemu_thread_create() ?

ahh, you're right

maybe I should also pick a better name? in retrospect it looks quite
cryptic

> 
> Apart from that, patch looks fine to me.
> 
>   Thomas
> 


