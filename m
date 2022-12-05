Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF376430B5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 19:44:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2GPn-0006tM-7i; Mon, 05 Dec 2022 13:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1p2Dsu-0005hH-Ls; Mon, 05 Dec 2022 11:00:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1p2Dss-0007At-KV; Mon, 05 Dec 2022 11:00:00 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B5EUfjx028408; Mon, 5 Dec 2022 15:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Z1/XlmsWXJh/vHAYKAukT/fRmLW0quZdES3KDOeDNi0=;
 b=oCDqE9uU1UeH9JzaQoMzY+j+hEdYdaUwkiVs/+5ZPnZJ64nH7Vtpn3sgCeD9mPm1c0On
 75rJsqd8kn3lZA7VHJaKU63PYTf54TWVpifpE5b87tGPeZ1rHUalVxYYRyvg1AEhJmtc
 UuUNJBc6ALUHp5GDLXyCRACty5zVNQFv757EBpc6P1NW06iJkR2SVbU3hF+hirSTizzQ
 Yp001mfALiMH5MIZdji9I66+QqFAdi/F1sAPcXIW5fsi8h+ROOqeReziIPzb+GkgNL3b
 WwN6NVdhRrxTdJpB7jHuWDLi/loeiNKHEW09Wj7YMcWGp149H/84AT2aukNWGsNJbBer pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m8g1rrmgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 15:59:52 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B5EEcOb020224;
 Mon, 5 Dec 2022 15:59:52 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m8g1rrmft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 15:59:51 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B5FdD3w004565;
 Mon, 5 Dec 2022 15:59:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma01fra.de.ibm.com with ESMTP id 3m7x38t8yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 15:59:50 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com ([9.149.105.160])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B5FxlAp40042966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Dec 2022 15:59:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E39BA405B;
 Mon,  5 Dec 2022 15:59:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FC38A4054;
 Mon,  5 Dec 2022 15:59:47 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.87.36])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Dec 2022 15:59:47 +0000 (GMT)
Message-ID: <ed02c91839064052f8c52cc7a66279380eb91e71.camel@linux.ibm.com>
Subject: Re: [PATCH for-8.0] target/s390x/tcg/mem_helper: Test the right
 bits in psw_key_valid()
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Date: Mon, 05 Dec 2022 16:59:46 +0100
In-Reply-To: <20221205142043.95185-1-thuth@redhat.com>
References: <20221205142043.95185-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J-JI57YDgSfs_bX07sMH82TRJlCD1y0R
X-Proofpoint-ORIG-GUID: oKwQlzilQZp_coyuoakn9Lb6PYyM8mx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=959 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212050128
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nsg@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Dec 2022 13:42:01 -0500
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

On Mon, 2022-12-05 at 15:20 +0100, Thomas Huth wrote:
> The PSW key mask is a 16 bit field, and the psw_key variable is
> in the range from 0 to 15, so it does not make sense to use
> "0x80 >> psw_key" for testing the bits here. We should use 0x8000
> instead.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>

> ---
>  Found by code inspection (Linux likely does not use these PSW key masks
>  yet, otherwise we might have noticed earlier)
>=20
>  target/s390x/tcg/mem_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.=
c
> index 9542fad59b..cb82cd1c1d 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -51,7 +51,7 @@ static inline bool psw_key_valid(CPUS390XState *env, ui=
nt8_t psw_key)
> =20
>      if (env->psw.mask & PSW_MASK_PSTATE) {
>          /* PSW key has range 0..15, it is valid if the bit is 1 in the P=
KM */
> -        return pkm & (0x80 >> psw_key);
> +        return pkm & (0x8000 >> psw_key);
>      }
>      return true;
>  }


