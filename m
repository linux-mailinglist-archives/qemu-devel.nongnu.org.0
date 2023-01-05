Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF3A65F544
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 21:37:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDWx9-0004Uj-Qp; Thu, 05 Jan 2023 15:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pDWx1-0004UJ-MT
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 15:34:59 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pDWwy-0003Ff-Sm
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 15:34:58 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305KSBv0002946
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 20:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=7ouCxlTCNHhkUGHX8894uDbCwyJ5BS0H9B2VVJ6VuXo=;
 b=lYgwa/HGgRUOxFicOPWum7SazQMlZH4eTANzJeJXn2EdomiOWLkvh94qcVKnJLDSbcUP
 f8Sov3+yN2A+SW34vM84a2WeAxFmjXwfutw5vr4hLdqDDwE23VFG3EJhdXcZrZSsa/tz
 +BrwpJnSgBv1Bd8HYB/cTmpJWIbOBYN+pGoPlDe68+xkCen/7ePsfnvnyThzX2+G2Btd
 mIW/I8U4riH29ktPflg8fJtt+6LA2A7Jr3t2IEP9JGU7SQqquvPgkyHTG33Qnjirt8hE
 m1UJJIFUcISyrnGqGBnirMlxMNWkoikNw1AUBxG6umx8dFJnW27Ce2eAobRqtWXHjStq 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx5m6g647-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 20:34:55 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305KSdcf004362
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 20:34:54 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx5m6g63x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 20:34:54 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 305JkCbT026345;
 Thu, 5 Jan 2023 20:34:54 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mtcq7fu36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 20:34:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305KYrtx26542636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 20:34:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B7237805F;
 Thu,  5 Jan 2023 22:08:42 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D29C7805C;
 Thu,  5 Jan 2023 22:08:41 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.64.53])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Jan 2023 22:08:41 +0000 (GMT)
Message-ID: <ecabd13c2b311d9f22f58d54737effe0ec966782.camel@linux.ibm.com>
Subject: Re: [PATCH v5 1/2] tpm: convert tpmdev options processing to new
 visitor format
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Thu, 05 Jan 2023 15:34:50 -0500
In-Reply-To: <92288ac5-c850-3d06-d047-0bb5ca1e3397@linux.ibm.com>
References: <20230105130020.17755-1-jejb@linux.ibm.com>
 <20230105130020.17755-2-jejb@linux.ibm.com>
 <92288ac5-c850-3d06-d047-0bb5ca1e3397@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iJL0_bYQacBNpN_r7_21obKUGZpinSrF
X-Proofpoint-ORIG-GUID: O4UkG8Ox_u4yoObBHC8_IgJOGub3Ojgh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_10,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050157
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2023-01-05 at 09:59 -0500, Stefan Berger wrote:
[...]
> > @@ -2658,7 +2646,6 @@ void qemu_init(int argc, char **argv)
> >       qemu_add_opts(&qemu_boot_opts);
> >       qemu_add_opts(&qemu_add_fd_opts);
> >       qemu_add_opts(&qemu_object_opts);
> > -    qemu_add_opts(&qemu_tpmdev_opts);
> >       qemu_add_opts(&qemu_overcommit_opts);
> >       qemu_add_opts(&qemu_msg_opts);
> >       qemu_add_opts(&qemu_name_opts);
> > @@ -2906,9 +2893,7 @@ void qemu_init(int argc, char **argv)
> >                   break;
> >   #ifdef CONFIG_TPM
> >               case QEMU_OPTION_tpmdev:
> > -                if (tpm_config_parse(qemu_find_opts("tpmdev"),
> > optarg) < 0) {
> > -                    exit(1);
> > -                }
> > +                tpm_config_parse(optarg);
> 
> The comment to v4 still applies:
> 
> $ qemu-system-x86_64 --tpmdev help
> Supported TPM types (choose only one):
>   passthrough   Passthrough TPM backend driver
>      emulator   TPM emulator backend driver
>         mssim   TPM mssim emulator backend driver
> VNC server running on ::1:5900

So I think if I parse this correctly, your complaint is the help option
no longer exit(1)'s?  It shouldn't do that because it's not a failure,
but I can code it to exit(0).

James


