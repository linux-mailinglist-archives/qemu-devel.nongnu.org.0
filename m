Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A637611B7E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 22:23:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVsA-0007fW-Jy; Fri, 28 Oct 2022 16:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ooVs9-0007eJ-0D; Fri, 28 Oct 2022 16:22:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ooVs6-0004oT-DE; Fri, 28 Oct 2022 16:22:32 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SKJl5Y028026;
 Fri, 28 Oct 2022 20:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=GZ/4057sIPnDyqvjsj6rNUtVRxh6Klou6xLb4RKcP1Y=;
 b=WxsvUMGOKL3kDmIVWwOPJFKbZY63l8nm5wOQCH/fXFj0TZyj/POKdBuKcamKIwliGr0s
 CUKb8fMD87gM8F44PnM+lYcNPxSd9+0gQISpavP40z+OfNsWygleyvf048CxOnHaNWKK
 3xfNbLfCa01Si53WuXB+hUWNFYbu6RXRZGRjtxBjIde2lS4b6k/hJA3cVAwHIoGHSqLS
 wLnf2oT4F3ElUYSo2A0eKcHn9eMgBI5h9lSzkZlTxFmxOqQCKmXVfKujPsvU967R1/9Z
 0uY3mz1Y1G7mfCH/3o51O3KeDY9vuC/YvjKsrKEZp7CGxpGK69bFQV2pJOIxoW84FOVn DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgp1681aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 20:22:25 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SKJkZL028013;
 Fri, 28 Oct 2022 20:22:25 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgp1681a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 20:22:25 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SKKROY014216;
 Fri, 28 Oct 2022 20:22:24 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3kfumaanka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 20:22:24 +0000
Received: from smtpav01.wdc07v.mail.ibm.com ([9.208.128.113])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29SKMMuw3343082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 20:22:22 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26DA558068;
 Fri, 28 Oct 2022 20:22:22 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54DBA58065;
 Fri, 28 Oct 2022 20:22:20 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.65.225.56]) by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 20:22:20 +0000 (GMT)
Message-ID: <3a265985495a653b0cb5b4a1cf2cfad29f734dc0.camel@linux.ibm.com>
Subject: Re: [PATCH v2] s390x/css: revert SCSW ctrl/flag bits on error
From: Eric Farman <farman@linux.ibm.com>
To: Peter Jin <pjin@linux.ibm.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, cohuck@redhat.com, thuth@redhat.com,
 mjrosato@linux.ibm.com
Cc: peter@peterjin.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 28 Oct 2022 16:22:19 -0400
In-Reply-To: <20221027212341.2904795-1-pjin@linux.ibm.com>
References: <20221027212341.2904795-1-pjin@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lPjauGGKvjp1ANfd-eJwa78JJuy_brcS
X-Proofpoint-ORIG-GUID: umsgSdgQLNfKKO1X3FsgvjtUnD9fdIWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280126
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2022-10-27 at 23:23 +0200, Peter Jin wrote:
> Revert the control and flag bits in the subchannel status word in
> case
> the SSCH operation fails with non-zero CC (ditto for CSCH and HSCH).
> According to POPS, the control and flag bits are only changed if
> SSCH,
> CSCH, and HSCH return CC 0, and no other action should be taken
> otherwise.
> In order to simulate that after the fact, the bits need to be
> reverted on
> non-zero CC.
>=20

I'm okay to this point...

> This change is necessary due to the fact that the pwrite() in vfio-
> ccw
> which triggers the SSCH can fail at any time. Previously, there was
> only virtio-ccw, whose do_subchannel_work function was only able to
> return CC0. However, once vfio-ccw went into the mix, it has become
> necessary to handle errors in code paths that were previously assumed
> to always return success.
>=20
> In our case, we found that in case of pwrite() failure (which was
> discovered by strace injection), the subchannel could be stuck in
> start
> pending state, which could be problematic if the pwrite() call
> returns
> CC2. Experimentation shows that the guest tries to retry the SSCH
> call as
> normal for CC2, but it actually continously fails due to the fact
> that
> the subchannel is stuck in start pending state even though no start
> function is actually taking place.

...but the two paragraphs above are a bit cumbersome to digest. Maybe
it's just too late in the week for me. What about something like this?

"""
While the do_subchannel_work logic for virtual (virtio) devices will
return condition code 0, passthrough (vfio) devices may encounter
errors from either the host kernel or real hardware that need to be
accounted for after this point. This includes restoring the state of
the Subchannel Status Word to reflect the subchannel, as these bits
would not be set in the event of a non-zero condition code from the
affected instructions.

Experimentation has shown that a failure on a START SUBCHANNEL (SSCH)
to a passthrough device would leave the subchannel with the START
PENDING activity control bit set, thus blocking subsequent SSCH
operations in css_do_ssch() until some form of error recovery was
undertaken since no interrupt would be expected.
"""

>=20
> Signed-off-by: Peter Jin <pjin@linux.ibm.com>

We've talked previously about clearing this within the
do_subchannel_work_passthrough routine in order to keep the _virtual
paths untouched, but this seems like a reasonable approach to me.

The commit message is probably fine either way, but as far as the code
goes:

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
> =C2=A0hw/s390x/css.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++=
-
> --
> =C2=A01 file changed, 48 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index 7d9523f811..95d1b3a3ce 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -1522,21 +1522,37 @@ IOInstEnding css_do_xsch(SubchDev *sch)
> =C2=A0IOInstEnding css_do_csch(SubchDev *sch)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 SCHIB *schib =3D &sch->curr_status;
> +=C2=A0=C2=A0=C2=A0 uint16_t old_scsw_ctrl;
> +=C2=A0=C2=A0=C2=A0 IOInstEnding ccode;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV =
|
> PMCW_FLAGS_MASK_ENA)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return IOINST_CC_NOT_OPE=
RATIONAL;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Save the current scsw.ctrl in case CSCH fails=
 and we need
> +=C2=A0=C2=A0=C2=A0=C2=A0 * to revert the scsw to the status quo ante.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 old_scsw_ctrl =3D schib->scsw.ctrl;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Trigger the clear function. */
> =C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.ctrl &=3D ~(SCSW_CTRL_MASK_FCTL |
> SCSW_CTRL_MASK_ACTL);
> =C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.ctrl |=3D SCSW_FCTL_CLEAR_FUNC | SCS=
W_ACTL_CLEAR_PEND;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 return do_subchannel_work(sch);
> +=C2=A0=C2=A0=C2=A0 ccode =3D do_subchannel_work(sch);
> +
> +=C2=A0=C2=A0=C2=A0 if (ccode !=3D IOINST_CC_EXPECTED) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.ctrl =3D old_scsw=
_ctrl;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return ccode;
> =C2=A0}
> =C2=A0
> =C2=A0IOInstEnding css_do_hsch(SubchDev *sch)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 SCHIB *schib =3D &sch->curr_status;
> +=C2=A0=C2=A0=C2=A0 uint16_t old_scsw_ctrl;
> +=C2=A0=C2=A0=C2=A0 IOInstEnding ccode;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV =
|
> PMCW_FLAGS_MASK_ENA)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return IOINST_CC_NOT_OPE=
RATIONAL;
> @@ -1553,6 +1569,12 @@ IOInstEnding css_do_hsch(SubchDev *sch)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return IOINST_CC_BUSY;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Save the current scsw.ctrl in case HSCH fails=
 and we need
> +=C2=A0=C2=A0=C2=A0=C2=A0 * to revert the scsw to the status quo ante.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 old_scsw_ctrl =3D schib->scsw.ctrl;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Trigger the halt function. */
> =C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.ctrl |=3D SCSW_FCTL_HALT_FUNC;
> =C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.ctrl &=3D ~SCSW_FCTL_START_FUNC;
> @@ -1564,7 +1586,13 @@ IOInstEnding css_do_hsch(SubchDev *sch)
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.ctrl |=3D SCSW_ACTL_HALT_PEND;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 return do_subchannel_work(sch);
> +=C2=A0=C2=A0=C2=A0 ccode =3D do_subchannel_work(sch);
> +
> +=C2=A0=C2=A0=C2=A0 if (ccode !=3D IOINST_CC_EXPECTED) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.ctrl =3D old_scsw=
_ctrl;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return ccode;
> =C2=A0}
> =C2=A0
> =C2=A0static void css_update_chnmon(SubchDev *sch)
> @@ -1605,6 +1633,8 @@ static void css_update_chnmon(SubchDev *sch)
> =C2=A0IOInstEnding css_do_ssch(SubchDev *sch, ORB *orb)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 SCHIB *schib =3D &sch->curr_status;
> +=C2=A0=C2=A0=C2=A0 uint16_t old_scsw_ctrl, old_scsw_flags;
> +=C2=A0=C2=A0=C2=A0 IOInstEnding ccode;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV =
|
> PMCW_FLAGS_MASK_ENA)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return IOINST_CC_NOT_OPE=
RATIONAL;
> @@ -1626,11 +1656,26 @@ IOInstEnding css_do_ssch(SubchDev *sch, ORB
> *orb)
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 sch->orb =3D *orb;
> =C2=A0=C2=A0=C2=A0=C2=A0 sch->channel_prog =3D orb->cpa;
> +
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Save the current scsw.ctrl and scsw.flags in =
case SSCH fails
> and we need
> +=C2=A0=C2=A0=C2=A0=C2=A0 * to revert the scsw to the status quo ante.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 old_scsw_ctrl =3D schib->scsw.ctrl;
> +=C2=A0=C2=A0=C2=A0 old_scsw_flags =3D schib->scsw.flags;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Trigger the start function. */
> =C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.ctrl |=3D (SCSW_FCTL_START_FUNC |
> SCSW_ACTL_START_PEND);
> =C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.flags &=3D ~SCSW_FLAGS_MASK_PNO;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 return do_subchannel_work(sch);
> +=C2=A0=C2=A0=C2=A0 ccode =3D do_subchannel_work(sch);
> +
> +=C2=A0=C2=A0=C2=A0 if (ccode !=3D IOINST_CC_EXPECTED) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.ctrl =3D old_scsw=
_ctrl;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schib->scsw.flags =3D old_scs=
w_flags;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return ccode;
> =C2=A0}
> =C2=A0
> =C2=A0static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW
> *pmcw,


