Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CB268EDE6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 12:27:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPibt-0001uy-1P; Wed, 08 Feb 2023 06:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPibq-0001up-SY
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:27:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pPibb-0003tp-A7
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:27:30 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318BIKXY000476; Wed, 8 Feb 2023 11:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1zyNot6RXukqpPLle/+Pp/Cy/N6jmipCN3kCBHu2GQ4=;
 b=IRS2DpOT2jEfNySyJUIoW/kd9XSpi3dOejo/t9umfwaweMTqWdlkGJEwcCNnLYW6ahmL
 DvU9ZEDiY65DMzWZ2AckZWV2lJ51BaazmZKLk76zP20zQnnKIVmL8LzW/bSqyNpBAOmp
 wf+9gEVY0zGftIPmJJtMVpSMJKejIuaUcAFiutP6CB1l5GxOD3/9SDOD4L6tGBSbA8nd
 bKYxlwPWF6aGvCkiPdo7Iuk/CjhGe1pGe5Bfk2ZkRd8rql+7mPU2ScfQ6/llG8JAI7ig
 0eaUFFsL3vyiuUGiuLisdTa10i3ou3enDV46cyiNGnn1IPpDOS0pfR1JEtZKIlyumsH6 FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmar4851s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 11:27:09 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318BL1ko007015;
 Wed, 8 Feb 2023 11:27:08 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmar4851d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 11:27:08 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3188lqji001965;
 Wed, 8 Feb 2023 11:27:07 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3nhf07j9t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 11:27:07 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 318BR5rr66978194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Feb 2023 11:27:05 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BCB558056;
 Wed,  8 Feb 2023 11:27:05 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72CFB5804E;
 Wed,  8 Feb 2023 11:27:02 +0000 (GMT)
Received: from [9.160.93.69] (unknown [9.160.93.69])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  8 Feb 2023 11:27:02 +0000 (GMT)
Message-ID: <c0df9239-19f5-3a5f-4c97-aebd42675beb@linux.ibm.com>
Date: Wed, 8 Feb 2023 13:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Tom Lendacky <thomas.lendacky@amd.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, James Bottomley
 <jejb@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <Y+NrxeHZ8UoHsQa0@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <Y+NrxeHZ8UoHsQa0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KJQ3XlRC8zdVnfA8CjeLz-fWsOSubGaS
X-Proofpoint-ORIG-GUID: nC9YuhgYMPty8DCl5LJbF442bwPWJjkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_03,2023-02-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=755
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080100
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Daniel,

On 08/02/2023 11:30, Daniel P. Berrangé wrote:
> On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
>> Recent feature to supply RNG seed to the guest kernel modifies the
>> kernel command-line by adding extra data at its end; this breaks
>> measured boot with SEV and OVMF, and possibly signed boot.
> 
> I presume you mean whether it impacts SecureBoot when using
> -kernel with OVMF, but without SEV ?
> 
> IIRC, today OVMF ignores SecureBoot failures when using -kernel,
> but we shouldn't make an assumption of that being the case on
> the QEMU side.
> 

hmm, I'm not sure.  James mentioned something about Fedora attempting to
ship a unified signed kernel+cmdline+initrd package (and this RNG seed
addition to the cmdline will interfere), but maybe I'm confusing other
matters.

-Dov

