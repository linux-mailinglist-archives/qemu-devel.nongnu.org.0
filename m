Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CDA6DDAC4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:28:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmD6B-0005I7-NY; Tue, 11 Apr 2023 08:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pmD66-0005HK-EJ; Tue, 11 Apr 2023 08:27:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pmD62-0007pZ-Ms; Tue, 11 Apr 2023 08:27:41 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BBU6Zi018652; Tue, 11 Apr 2023 12:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2oohw4nJIGPbvzkxqJVJiGcgYRPadZdI205qESTsDAI=;
 b=lI7wpHu9vOXj8Mp3JVEzl81ZPXXt3WTmG/+lsldLRXf+gbZUpzdRzY/iK2hsOzFjw+h2
 ctmSC2qCoIeoAMDWmKpE2imOUX6B2DG4caG0QWc7ocHLIk1Qht5/jc66Zmi1U2jBbw9H
 3WJM/E3NGFSaHyEo1zQAfivuZunwj+qaKO2ajRFM6Gvsq/CSDtWjFQ61Vz+7qHnyBofF
 fVHi/BqjQbyjdEsjFniHttMkljdjeWRI60nQgV1eoXaEkHRehQTCOvj23/UhI50KDFSR
 tJmzAwptNQABccPCq/lF6fN2JYYUS67SK6M8Zsz+ufwIIMwaeMsUKpjBStbGLARi0TFh Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pw25y23ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 12:27:30 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33BARk1W001858;
 Tue, 11 Apr 2023 12:27:30 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pw25y23g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 12:27:29 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33B40Pik012778;
 Tue, 11 Apr 2023 12:27:27 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3pu0hq1esf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 12:27:27 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33BCRN9455902630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Apr 2023 12:27:23 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD1C02004B;
 Tue, 11 Apr 2023 12:27:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53DC520040;
 Tue, 11 Apr 2023 12:27:23 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.215.178])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 11 Apr 2023 12:27:23 +0000 (GMT)
Message-ID: <1bc361f6675ea9d8332131725cb5d778aa32e8bd.camel@linux.ibm.com>
Subject: Re: [PATCH v19 01/21] s390x/cpu topology: add s390 specifics to CPU
 topology
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com
Date: Tue, 11 Apr 2023 14:27:23 +0200
In-Reply-To: <a46e9349-704c-e842-58c0-515ecb7b2d60@linux.ibm.com>
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
 <20230403162905.17703-2-pmorel@linux.ibm.com>
 <4118bb4e-0505-26d3-3ffe-49245eae5364@kaod.org>
 <bd5cc488-20a7-54d1-7c3e-86136db77f84@linux.ibm.com>
 <55c4e517-dbd0-bbd2-7dde-0e2cab746101@kaod.org>
 <a46e9349-704c-e842-58c0-515ecb7b2d60@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NW5aK0fgUF4bTluv08zAdyMEzKYMspra
X-Proofpoint-ORIG-GUID: QOICNrryNgAEYlJIz3mwQIrTk-wd93E5
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_08,2023-04-11_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxlogscore=830 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304110109
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Tue, 2023-04-04 at 16:04 +0200, Pierre Morel wrote:
> On 4/4/23 14:35, C=C3=A9dric Le Goater wrote:
> > > > > @@ -0,0 +1,15 @@
> > > > > +/*
> > > > > + * CPU Topology
> > > > > + *
> > > > > + * Copyright IBM Corp. 2022
> > > >=20
> > > > Shouldn't we have some range : 2022-2023 ?
> > >=20
> > > There was a discussion on this in the first spins, I think to=20
> > > remember that Nina wanted 22 and Thomas 23,
> > >=20
> > > now we have a third opinion :) .
> > >=20
> > > I must say that all three have their reasons and I take what the=20
> > > majority wants.
> >=20
> > There is an internal IBM document describing the copyright tags. If I=20
> > recall
> > well, first date is the first year the code was officially published,=20
> > second
> > year is the last year it was modified (so last commit of the year). Or
> > something like that and it's theory, because we tend to forget.
> >=20
> > For an example, see the OPAL FW https://github.com/open-power/skiboot/,
> > and run :
> >=20
> > =C2=A0 "grep Copyright.*IBM" in the OPAL FW
>=20
>=20
> OK for me, it looks logical, and all three of you are right then.
>=20
> So I will use
>=20
> Copyright IBM Corp. 2022-2023

You should use a comma instead of a hyphen as per IBM policy.
I.e. 2022, 2023

>=20
> in the next spin if nobody is against.
>=20
> Thanks,
>=20
> Pierre
>=20
>=20
> > =C2=A0[ ...]
> >=20
> > > > > @@ -30,8 +30,19 @@ static char=20
> > > > > *cpu_hierarchy_to_string(MachineState *ms)
> > > > > =C2=A0 {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MachineClass *mc =3D MACHINE_GET_C=
LASS(ms);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GString *s =3D g_string_new(NULL);
> > > > > +=C2=A0=C2=A0=C2=A0 const char *multiply =3D " * ", *prefix =3D "=
";
> > > > > =C2=A0 -=C2=A0=C2=A0=C2=A0 g_string_append_printf(s, "sockets (%u=
)", ms->smp.sockets);
> > > > > +=C2=A0=C2=A0=C2=A0 if (mc->smp_props.drawers_supported) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_string_append_print=
f(s, "drawers (%u)", ms->smp.drawers);
> > > > > +=C2=A0=C2=A0=C2=A0 prefix =3D multiply;
> > > >=20
> > > > indent issue.
> > >=20
> > > right, seems I forgot to update the patch set after the checkpatch.
> >=20
> > nope, you didn't. checkpatch doesn't report it. It's not perfect :/
> >=20
> > C.


