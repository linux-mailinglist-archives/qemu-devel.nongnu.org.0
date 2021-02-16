Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD7931CC32
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:41:00 +0100 (CET)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1X9-0006xj-FI
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1lC1Vj-0006Ga-Ha
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:39:31 -0500
Received: from pv50p00im-ztdg10011301.me.com ([17.58.6.40]:60633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1lC1Vh-0003Om-Ro
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1613486366;
 bh=0o/OQjvVhLYjAb8pmVqFdB2ywsJrrqRSBMFqliSX3QE=;
 h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To;
 b=vF5CalUJbR+qwi33J+jpbAOKPCiPn1dV91o3bftASghnSZR21eJxZzrwIlYeEyVTT
 vU2CnIR80jzbwWyrxfabaV5o7VDVwd3Gv0nje+6ZB93xXjAeMBg4bqDcmLFI4lTfiv
 /4EIHnSaSmKebGtDk1aC2tTi9Us8R861HlqqySu+xR9pdXMGds/SrvcCJytgCJLav8
 L37w2GEKOLJn0cRrtjwpje7ge/HZM6ixHD04VQeb46+cLl5rcBhadE7QBlxqb2S0WO
 6cBvdq4zNFQngNT3hVOr0j0ZYILe5j6KHgOgCUdiBX/+AB6U2B+dzQIKmxDsw3yg7g
 wQ2Tr1Mm0O1CA==
Received: from [192.168.50.237] (unknown [139.227.197.244])
 by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id 4F1167604BB;
 Tue, 16 Feb 2021 14:39:26 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Fill tlb for data and io address 
Date: Tue, 16 Feb 2021 22:39:08 +0800
Message-Id: <2D7F6EA4-5525-4F48-ACA7-B157E8A02A2A@icloud.com>
References: <CAFEAcA-OE+NGfbgjEuydjCfpiR_kuFVsSxYwE-PfvQSX-rzHLQ@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
In-Reply-To: <CAFEAcA-OE+NGfbgjEuydjCfpiR_kuFVsSxYwE-PfvQSX-rzHLQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: iPhone Mail (18D52)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_04:2021-02-16,
 2021-02-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2102160135
Received-SPF: pass client-ip=17.58.6.40;
 envelope-from=shen.mengjiao3@icloud.com; helo=pv50p00im-ztdg10011301.me.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, MIME_QP_LONG_LINE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> =E5=9C=A8 2021=E5=B9=B42=E6=9C=8816=E6=97=A5=EF=BC=8C=E4=B8=8B=E5=8D=887:4=
8=EF=BC=8CPeter Maydell <peter.maydell@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A=

>=20
> =EF=BB=BFOn Tue, 16 Feb 2021 at 11:28, =E6=B2=88=E6=A2=A6=E5=A7=A3 <shen.m=
engjiao3@icloud.com> wrote:
>> Look at the store/load helper, it will use the tlb entry to do the addres=
s translation(from guest virtual address to host virtual address) but where t=
he tlb is filled for the data ram and io address, I know where the code ram i=
s filled(tb_find->tb_lookup__cpu_state...)
>=20
> The common QEMU code calls the target
Thanks Peter. But what=E2=80=99s the common code? I mean in which case the t=
lb_fill will be triggered, the generated code will trigger or something else=
? Thanks in advance.
> CPU tlb_fill function, which tries
> to translate the guest virtual address to a physical address (usually by
> walking the guest page tables). If it succeeds then will update the QEMU
> TLB by calling either tlb_set_page() or tlb_set_page_with_attrs().

> If it
> fails then it arranges to deliver a suitable exception to the guest.
This should be page fault, guest code will update page table, am I right? Th=
anks=20
>=20
> thanks
> -- PMM

