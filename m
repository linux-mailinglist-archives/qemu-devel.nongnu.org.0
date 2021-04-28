Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AD336DFF8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:55:40 +0200 (CEST)
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqHb-00029p-6V
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lbq7f-0000jh-7m; Wed, 28 Apr 2021 15:45:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lbq7Z-0001gZ-4B; Wed, 28 Apr 2021 15:45:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SJY0pZ077529; Wed, 28 Apr 2021 15:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=MvMKWAi1O9u9PCuFLrUXDpwoOVJBh8LVh60DMZy1RuM=;
 b=huYLcwkAcfCpmm2uEPjPvnAtJToGSBOPzGf5GDfR3hGxLaIkCVS+R87nsfhXASiQV0tx
 6eNZh/w9Vop62Q6fb6qFMb7Dgl9HAPWImZmNXHfFDzWYzc1pt4VO1bzsxUl2C5mThbDU
 hWUP1rCWuvFPH5u2gOKR91a9ibz0xj/DwEzF5doGpdITsR4ur2oxMihvdUvZ0H9Oqwqp
 XvO2GSBdlbVjroEX5zljOfJsIs5I/mDNhiVrrF34sbW9J0w64OX3kuEWveoF5yP1NWx3
 Q8JYLmKz3glzdyia7HNo2VUF0dQUfLW0WFbWWuWaLxbEvmr8kl04GnHnpkf9i4DZ6eiV jQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387cyn1tg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 15:45:08 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SJg2aP011402;
 Wed, 28 Apr 2021 19:45:07 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 384ay9f5gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 19:45:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SJj6cv20185514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 19:45:07 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2A31BE062;
 Wed, 28 Apr 2021 19:45:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AE79BE056;
 Wed, 28 Apr 2021 19:45:06 +0000 (GMT)
Received: from localhost (unknown [9.211.86.243])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 28 Apr 2021 19:45:05 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: RE: [RFC PATCH 3/4] target/ppc: Move SPR generation to separate file
In-Reply-To: <CP2PR80MB449987FB35CC5BC79CACDAFBC7409@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <CP2PR80MB449987FB35CC5BC79CACDAFBC7409@CP2PR80MB4499.lamprd80.prod.outlook.com>
Date: Wed, 28 Apr 2021 16:45:04 -0300
Message-ID: <87h7jq2ny7.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RYz--24mPpG5_BZfUdhpfZx4DrigFL_j
X-Proofpoint-ORIG-GUID: RYz--24mPpG5_BZfUdhpfZx4DrigFL_j
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_13:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280125
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:

>> > > +/******************************************************************=
***********/
>> > > +/* SPR definitions and registration */
>> > > +
>> > > +#ifdef CONFIG_TCG
>> > > +#ifdef CONFIG_USER_ONLY
>> > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,      =
            \
>> > > +                         oea_read, oea_write, one_reg_id, initial_v=
alue)       \
>> > > +    _spr_register(env, num, name, uea_read, uea_write, initial_valu=
e)
>> > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,   =
            \
>> > > +                            oea_read, oea_write, hea_read, hea_writ=
e,          \
>> > > +                            one_reg_id, initial_value)             =
            \
>> > > +    _spr_register(env, num, name, uea_read, uea_write, initial_valu=
e)
>> > > +#else /* CONFIG_USER_ONLY */
>> > > +#if !defined(CONFIG_KVM)
>> > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,      =
            \
>> > > +                         oea_read, oea_write, one_reg_id, initial_v=
alue)       \
>> > > +    _spr_register(env, num, name, uea_read, uea_write,             =
            \
>> > > +                  oea_read, oea_write, oea_read, oea_write, initial=
_value)
>> > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,   =
            \
>> > > +                            oea_read, oea_write, hea_read, hea_writ=
e,          \
>> > > +                            one_reg_id, initial_value)             =
            \
>> > > +    _spr_register(env, num, name, uea_read, uea_write,             =
            \
>> > > +                  oea_read, oea_write, hea_read, hea_write, initial=
_value)
>> > > +#else /* !CONFIG_KVM */
>> > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,      =
            \
>> > > +                         oea_read, oea_write, one_reg_id, initial_v=
alue)       \
>> > > +    _spr_register(env, num, name, uea_read, uea_write,             =
            \
>> > > +                  oea_read, oea_write, oea_read, oea_write,        =
            \
>> > > +                  one_reg_id, initial_value)
>> > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,   =
            \
>> > > +                            oea_read, oea_write, hea_read, hea_writ=
e,          \
>> > > +                            one_reg_id, initial_value)             =
            \
>> > > +    _spr_register(env, num, name, uea_read, uea_write,             =
            \
>> > > +                  oea_read, oea_write, hea_read, hea_write,        =
            \
>> > > +                  one_reg_id, initial_value)
>> > > +#endif /* !CONFIG_KVM */
>> > > +#endif /* CONFIG_USER_ONLY */
>> > > +#else /* CONFIG_TCG */
>> > > +#ifdef CONFIG_KVM /* sanity check */
>> > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,      =
            \
>> > > +                         oea_read, oea_write, one_reg_id, initial_v=
alue)       \
>> > > +    _spr_register(env, num, name, one_reg_id, initial_value)
>> > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,   =
            \
>> > > +                            oea_read, oea_write, hea_read, hea_writ=
e,          \
>> > > +                            one_reg_id, initial_value)             =
            \
>> > > +    _spr_register(env, num, name, one_reg_id, initial_value)
>> > > +#else /* CONFIG_KVM */
>> > > +#error "Either TCG or KVM should be configured"
>> > > +#endif /* CONFIG_KVM */
>> > > +#endif /*CONFIG_TCG */
>> > > +
>> > > +#define spr_register(env, num, name, uea_read, uea_write,          =
            \
>> > > +                     oea_read, oea_write, initial_value)           =
            \
>> > > +    spr_register_kvm(env, num, name, uea_read, uea_write,          =
            \
>> > > +                     oea_read, oea_write, 0, initial_value)
>> > > +
>> > > +#define spr_register_hv(env, num, name, uea_read, uea_write,       =
            \
>> > > +                        oea_read, oea_write, hea_read, hea_write,  =
            \
>> > > +                        initial_value)                             =
            \
>> > > +    spr_register_kvm_hv(env, num, name, uea_read, uea_write,       =
            \
>> > > +                        oea_read, oea_write, hea_read, hea_write,  =
            \
>> > > +                        0, initial_value)
>> >
>> > This change is crucial for this to work, we don't want it buried along
>> > with all of the code movement. It should be clearly described and in
>> > it's own patch at the top of the series.
>> >
>> > If you add this change, plus some #ifdef TCG around the spr callbacks,
>> > it should already be possible to compile this with disable-tcg. It wou=
ld
>> > also make the series as a whole easier to understand.
>
> if we added this and removed TCG only files from meson.build it might
> compile already (not sure, I think there were a couple of things that
> used mmu functions),=20

I'm just pointing out that the set of changes needed to compile
translate_init.c.inc with disable-tcg is actually pretty small. Sure, we
want to move some stuff around and have new files and whatnot to make
the code easier to read/more maintainable, etc. But none of that is
strictly required.

> but wouldn't there be way too many ifdefs in that case?
> The R/W callbacks are spread all around the file, and we'd have to ifdef =
around
> some .h files that are included in common files.

Right, but it is easier to review only the macro change plus some
ifdefs. Once we are sure the change is correct and the ifdefs select the
right code, any follow-up patch that only moves things to another file
will be trivial. And if the first patch gets too silly we can always
squash them before merging, no worries.

>
> Bruno Piazera Larsen
>
> Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/c=
lick?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuK=
XZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1u=
UipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI=
1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5i=
XWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IW=
DcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDY=
IvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>
>
> Departamento Computa=C3=A7=C3=A3o Embarcada
>
> Analista de Software Trainee
>
> Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

