Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDABB6FB7B9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 21:50:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw6rT-00033W-9b; Mon, 08 May 2023 15:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pw6rN-000336-HA; Mon, 08 May 2023 15:49:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pw6rL-00045F-Qf; Mon, 08 May 2023 15:49:25 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348Ja39D030678; Mon, 8 May 2023 19:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=xpAmPqrHF5oYwlnywRYn7jZcYE6eK61sVouVCB+sObc=;
 b=qkQv7VpLC2rJcDUXGzp8F0ggL1dv9+PvoYjr026igOKatry8+WAGNgvJLxfTN6R1Kh4u
 lLsX7nGPHE+a52/wZYFzf7Zt5tfWaKJG1E1+M+Es2ytRd9CnVinJTm6TmVIbrch9QQDb
 FjrQrO4qnWV6wvlK1h4s2CPyN084J+DyO9RGreCd1Co+GINX0/0oNeqiC0HSSp54gXc3
 KQQDtBJXJzu+VKoCQ1tqx4geRL8qE/eqv69H/0H7w3TAIc8VXgHXv6/rwb9Oo9hnE2m7
 9FinpubzgAMOAtHduz+2UhjeY9UxspfXUCnzgY5c80Wygpq1rao9YfpKU2Cqy9aCmPiM mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qf7cg8fsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 May 2023 19:49:11 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 348Jc0JC003485;
 Mon, 8 May 2023 19:49:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qf7cg8fq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 May 2023 19:49:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 348I5FmR020367;
 Mon, 8 May 2023 19:49:07 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qde5fhan4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 May 2023 19:49:07 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 348Jn1b411076120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 May 2023 19:49:02 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2EC72004B;
 Mon,  8 May 2023 19:49:01 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C526620043;
 Mon,  8 May 2023 19:49:00 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.71.193]) by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  8 May 2023 19:49:00 +0000 (GMT)
Message-ID: <12bcbb44bfd2b6708bc74509ec5b6053af8614bc.camel@linux.ibm.com>
Subject: Re: [PATCH v20 10/21] machine: adding s390 topology to info
 hotpluggable-cpus
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Mon, 08 May 2023 21:49:00 +0200
In-Reply-To: <20230425161456.21031-11-pmorel@linux.ibm.com>
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
 <20230425161456.21031-11-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y3izFwDjGx0qYW0PvJbej3x3vv2m-IMV
X-Proofpoint-GUID: v_bgneZkB7DR0MKNwQE1AccnsSS9ve71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_15,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305080130
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
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

On Tue, 2023-04-25 at 18:14 +0200, Pierre Morel wrote:
> S390 topology adds books and drawers topology containers.
> Let's add these to the HMP information for hotpluggable cpus.
>=20
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>

Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>

if you fix the nits below.
> ---
>  hw/core/machine-hmp-cmds.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> index c3e55ef9e9..971212242d 100644
> --- a/hw/core/machine-hmp-cmds.c
> +++ b/hw/core/machine-hmp-cmds.c
> @@ -71,6 +71,12 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *=
qdict)
>          if (c->has_node_id) {
>              monitor_printf(mon, "    node-id: \"%" PRIu64 "\"\n", c->nod=
e_id);
>          }
> +        if (c->has_drawer_id) {
> +            monitor_printf(mon, "    drawer_id: \"%" PRIu64 "\"\n", c->d=
rawer_id);

                           use - instead here ^ unless there is some reason=
 to be inconsistent.
> +        }
> +        if (c->has_book_id) {
> +            monitor_printf(mon, "      book_id: \"%" PRIu64 "\"\n", c->b=
ook_id);

Same here.

> +        }
>          if (c->has_socket_id) {
>              monitor_printf(mon, "    socket-id: \"%" PRIu64 "\"\n", c->s=
ocket_id);
>          }


