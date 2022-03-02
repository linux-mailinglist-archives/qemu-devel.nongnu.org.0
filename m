Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411524CB319
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 00:57:10 +0100 (CET)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPYqC-0006ku-U9
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 18:57:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nPYp6-00061j-Ca; Wed, 02 Mar 2022 18:56:00 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nPYp4-0000i8-HZ; Wed, 02 Mar 2022 18:56:00 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222Lm1Y4014038; 
 Wed, 2 Mar 2022 23:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=UATZjmdRf8CbQHoChtEngEe92HTPwbPSa/93Ue1n6AI=;
 b=BTJvgVmP6oIWfFCbWWvyMBW/BbhgychDYyEyRcQHYnS6IDOF/DpvJmFKn0zWZfTgBCAp
 8CzJclo6u6al9AhDq9lYsDNj8nqUgaXe93dQ9mRXacFbZgcX2xJYDOWi1M1w07mLgK3G
 rWEX+i9gg8j9+BwuzPqZ0JCAKxS3pRMdHmRU3jI82FB7wy8pcsUlPpCaJanohdXLpBcH
 GpGET90V8Z+PSgjcc5xtI3S2QcS30tDC2c9gs681nSCcZccTCF/wrl6BfA82z3BVzQjz
 rvyErs0MOXZ7qwi+oV2DQs/k8qUsucRbeVFk7+E4ScKI3faHgg93BqEwo75C3BbEl8CK TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ejgtg1vxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 23:55:42 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222NF8KA021976;
 Wed, 2 Mar 2022 23:55:41 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ejgtg1vx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 23:55:41 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222NrPkQ018320;
 Wed, 2 Mar 2022 23:55:40 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3eftrrtaar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 23:55:40 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222NtdfX40436138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 23:55:39 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75035AC065;
 Wed,  2 Mar 2022 23:55:39 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AFF6AC05F;
 Wed,  2 Mar 2022 23:55:38 +0000 (GMT)
Received: from localhost (unknown [9.211.52.19])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  2 Mar 2022 23:55:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: Issue with qemu-system-ppc running OSX guests
In-Reply-To: <CABLmASH5tFs86Dq+1e+ByMF43jZL5UZ7MempVVhtKCwjdpa7aw@mail.gmail.com>
References: <CABLmASFbowE4Cu8gHk9eD+_h8ZrdupE8MHKAfpW+T8Oe=-3=Wg@mail.gmail.com>
 <e2dd457d-29b3-32be-72e2-315e686dff69@eik.bme.hu>
 <CABLmASH5tFs86Dq+1e+ByMF43jZL5UZ7MempVVhtKCwjdpa7aw@mail.gmail.com>
Date: Wed, 02 Mar 2022 20:55:35 -0300
Message-ID: <87pmn352q0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YF24vj2rLdu9YOO5UKG_HICUBLbaTVWh
X-Proofpoint-ORIG-GUID: 1OK2KpqiXromStiMi6WE0JN8jAZSW8Ni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020098
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: lucas.castro@eldorado.org.br, qemu-ppc <qemu-ppc@nongnu.org>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Howard Spoelstra <hsp.cat7@gmail.com> writes:

> On Wed, Mar 2, 2022 at 9:11 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
>> On Wed, 2 Mar 2022, Howard Spoelstra wrote:
>> > Hi all,
>> >
>> > I noticed qemu-system-ppc running OSX guests does not get to the desktop
>> or
>> > does not display the menu bars.
>>
>> Cc-ing the relevant people and the PPC list might help, I've added them.
>> Also telling which OSX guest version can reproduce the problem could help
>> debugging. Is it any OSX version?
>>
>> Regards,
>> BALATON Zoltan
>>
>
> Oops, Qemu running on Fedora 35 host,
> Reproducer:
>
> ./qemu-system-ppc \
> -M mac99 \
> -m 512 \
> -L pc-bios \
> -display sdl -serial stdio \
> -boot c \
> -drive file=10.1.img,format=raw,media=disk
>
> The issue affects all supported Mac OSX guests: 10.0 to 10.5

Hi Howard,

Thanks for bisecting this. It seems we inadvertently marked some of the
Vector Multiply instructions to be ISA v2.07 only.

I can boot Mac OSX 10.4 until the desktop with this fix:

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index f91bee839d..c5d02d13fe 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3141,14 +3141,14 @@ static bool trans_VMULLD(DisasContext *ctx, arg_VX *a)
     return true;
 }
 
-TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper, gen_helper_VMULESB)
-TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
-TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
-TRANS_FLAGS2(ALTIVEC_207, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
-TRANS_FLAGS2(ALTIVEC_207, VMULESH, do_vx_helper, gen_helper_VMULESH)
-TRANS_FLAGS2(ALTIVEC_207, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
-TRANS_FLAGS2(ALTIVEC_207, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
-TRANS_FLAGS2(ALTIVEC_207, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
+TRANS_FLAGS(ALTIVEC, VMULESB, do_vx_helper, gen_helper_VMULESB)
+TRANS_FLAGS(ALTIVEC, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
+TRANS_FLAGS(ALTIVEC, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
+TRANS_FLAGS(ALTIVEC, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
+TRANS_FLAGS(ALTIVEC, VMULESH, do_vx_helper, gen_helper_VMULESH)
+TRANS_FLAGS(ALTIVEC, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
+TRANS_FLAGS(ALTIVEC, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
+TRANS_FLAGS(ALTIVEC, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
 TRANS_FLAGS2(ALTIVEC_207, VMULESW, do_vx_helper, gen_helper_VMULESW)
 TRANS_FLAGS2(ALTIVEC_207, VMULOSW, do_vx_helper, gen_helper_VMULOSW)
 TRANS_FLAGS2(ALTIVEC_207, VMULEUW, do_vx_helper, gen_helper_VMULEUW)
---

I'll let Lucas comment on it and we can send a proper patch in the
morning.

