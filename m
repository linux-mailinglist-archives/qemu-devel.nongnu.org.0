Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7648047D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 21:08:51 +0100 (CET)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1wIc-0006X4-FE
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 15:08:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n1wGB-0005TQ-9G; Mon, 27 Dec 2021 15:06:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n1wG5-0001Mt-Ji; Mon, 27 Dec 2021 15:06:18 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRJ7b4u017517; 
 Mon, 27 Dec 2021 20:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=KerdjtruOrF1ytiwJ468zrO00fZQ+Ut1Rw57OhfPwOw=;
 b=GM38g0l+uGkCr2Fb8QZ9dXEyt0bmQsFTaLljk/EknBNZpFx4iCgmH5UQIv4BNs7MyczK
 t476xAADvwyAHbkB75U88CpVwhufvAV3zTbK9jxu3G3z9JU/FU0z2hagNw70iCU7rczy
 LEpDaIatbrzyW8NOTWRLngacGW+mVhWGrlpB2cC7UXjIDQt5fd2O3gK/3OKxeVdX0JUX
 PY2R/TfE/TBCff6hnJpYSovq6Jalp2tI33t3wviQLxsPj439MHYiBhrD3ML+K8KXqSAV
 XdnuDLSfYARyTPdr46YhNspG7SZ01agzt4T89BEhf/+MBm9W96BpebBKriUF4D7kYNjL kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7dqdy839-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 20:05:52 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRK39HX027763;
 Mon, 27 Dec 2021 20:05:52 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7dqdy82p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 20:05:52 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRJxAOM023971;
 Mon, 27 Dec 2021 20:05:50 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3d5tx9xr43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 20:05:50 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRK5nVm32964904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 20:05:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4D0A7805C;
 Mon, 27 Dec 2021 20:05:49 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2950D78064;
 Mon, 27 Dec 2021 20:05:49 +0000 (GMT)
Received: from localhost (unknown [9.211.154.52])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Dec 2021 20:05:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "mario@locati.it" <mario@locati.it>, clg@kaod.org
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
In-Reply-To: <R4SG07$EE0184281B6DB251884FD0A5E86E2438@locati.it>
References: <20211213133542.2608540-1-farosas@linux.ibm.com>
 <724f7563-f36c-2c37-3b94-951c3d922861@eik.bme.hu>
 <R4OPHT$7F12C66D1107397991E0E4C978FE6AF1@locati.it>
 <a17ceb16-bce5-2090-8473-78b316bf5fb5@eik.bme.hu>
 <ec0cf758-f05f-9fcf-eb97-14cb7a1fd9a2@kaod.org>
 <R4SG07$EE0184281B6DB251884FD0A5E86E2438@locati.it>
Date: Mon, 27 Dec 2021 17:05:46 -0300
Message-ID: <87tuetrexx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JinF8aQ8m8F13R-uobq5HLrHR1fIfrkn
X-Proofpoint-ORIG-GUID: Lq6dxIYMDqgCcuawZqhm-i0FL7VKaEyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_10,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112270097
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"mario@locati.it" <mario@locati.it> writes:

> I have updated=C2=A0 the guest VM but I get exactly the same result excep=
t that now I have libc-2.33.so installed.
>
> [...]
> VFS: Mounted root (ext4 filesystem) on device 254:0.
> devtmpfs: mounted
> Freeing unused kernel image (initmem) memory: 468K
> This architecture does not have kernel memory protection.
> Run /sbin/init as init process
> random: fast init done
> systemd[1]: illegal instruction (4) at 3fff8b7e615c nip 3fff8b7e615c lr 3=
fff8b7e613c code 1 in libc-2.33.so[3fff8b799000+1fe000]
> systemd[1]: code: 60000000 38600006 9122b7d0 4801bf19 60000000 60000000 8=
122b7d0 2c090004=C2=A0
> systemd[1]: code: 40820014 39200005 60000000 9122b7d0 <00000000> 60000000=
 8122b7d0 2c090005=C2=A0
> Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00000004
> Rebooting in 180 seconds..

Can you make the hdd_debian_ppc64_new.img available? We won't be able to
reproduce the exact same scenario because we can't run KVM, but if it
boots with TCG we can at least look around the code that is failing to
see if it gives us any clues.

