Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E168818A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:18:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNbLV-0005D7-SX; Thu, 02 Feb 2023 10:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNbLI-0005Be-FW
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:17:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNbLF-0001N8-Ha
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:17:39 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 312EJkRj004311; Thu, 2 Feb 2023 15:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=b2CamWjrg9ZKkWekCgk5/JkGEUF5eVfgKfUZYE9gJQU=;
 b=YpEWoPm7KUAO9W+jd7k/b2ZSu9p0xMsKmioUJTza8psW007OAB54Q3jI/6cKhltv+tH/
 BA3/EjA3oZtbjH3FCeIyGKudT6KvF+nBYkpsTLSCz2/T+B86gV5CXcE/BV1Dakr8Y10R
 xy7DF7L4htLMKVI2II/5GhYVR9p0m4JL+AfGSqNzSyIH50L+6gFPdswQWqw/cBIv8tsD
 PAGbCzjGhM2chsew3j/cfWmtyZmsGDcbs1sg/AGI7wRI+b7GG5XQUQ03Hffaw4Z+9uc8
 zxFbsCs5RKB9D9uAvRkplv3PgmnqVnf0j0ycn7QsWUBciypOmG8NknStpKAIHWafDb6z /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngeuf9p7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 15:17:35 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 312EntnV008098;
 Thu, 2 Feb 2023 15:17:35 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngeuf9p71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 15:17:35 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312C7JxD026752;
 Thu, 2 Feb 2023 15:17:34 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3ncvtnc32p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 15:17:34 +0000
Received: from b03ledav001.gho.boulder.ibm.com ([9.17.130.232])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 312FHXJm12059242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Feb 2023 15:17:33 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 199AA6E054;
 Thu,  2 Feb 2023 15:19:44 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35A586E04E;
 Thu,  2 Feb 2023 15:19:43 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.110.248])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Feb 2023 15:19:42 +0000 (GMT)
Message-ID: <352eb28a1d913db62421064fe50ec9c8f8afd050.camel@linux.ibm.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
From: James Bottomley <jejb@linux.ibm.com>
To: "H. Peter Anvin" <hpa@zytor.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, DOV MURIK <Dov.Murik1@il.ibm.com>
Date: Thu, 02 Feb 2023 10:17:01 -0500
In-Reply-To: <4396778A-6520-4FB5-9227-1E8850753036@zytor.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
 <CAHmME9ps8w8TbC_6Bk8OQbJytR-_CJrcUWT_uXDV+xjL293NHQ@mail.gmail.com>
 <a2d5634ab624497d7d98569041e76661062f7eaf.camel@linux.ibm.com>
 <CAHmME9qy3_TPXoZ4j10JUvGGAbNikb5MdgQRw5DgTmj7nqLujA@mail.gmail.com>
 <d2e01e48fa215684447d17d21d48fa681ab7f7d3.camel@linux.ibm.com>
 <4396778A-6520-4FB5-9227-1E8850753036@zytor.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JvF4L7Xr7lsBhoar0DCYL6__g6ehrDgB
X-Proofpoint-ORIG-GUID: q894JkUQl4oUQqCxZtGNuti1hf4V43Y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302020135
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Thu, 2023-02-02 at 07:03 -0800, H. Peter Anvin wrote:
[...]
> NAK. We need to fix the actual problem of the kernel stomping on
> memory it shouldn't, not paper around it.

This is a first boot situation, not kexec (I just updated kexec because
it should use any new mechanism we propose).  Unlike kexec, for first
boot we're very constrained by the amount of extra space QEMU has to do
this.  The boot_params are the first page of the kernel load, but the
kernel proper begins directly after it, so we can't expand it.  The two
schemes tried: loading after the kernel and loading after the command
line both tamper with integrity protected files, so we shouldn't use
this mechanism.  This is the essence of the problem: If we add this
area at boot, it has to go in an existing memory location; we can't
steal random guest areas.  All current config parameters are passed
through as fw_config files, so we can only use that mechanism *if* we
know where the area ends up in the loaded kernel *and* the file isn't
integrity protected (this latter is expanding over time).

If we could wind back time, I'd have added the 32 byte random seed to
boot_params properly not coded it as a setup_data addition, but now
we're stuck with coping with existing behaviour, which is why I thought
the retro fit to boot_params would be the better path forward, but if
you have any alternatives, I'm sure we could look at them.

James


