Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC204213C2F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 16:57:17 +0200 (CEST)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrN7s-00048R-Dp
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 10:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1jrN6P-0003D4-4F
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 10:55:45 -0400
Received: from mr85p00im-hyfv06011401.me.com ([17.58.23.191]:33139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1jrN6L-0006bR-Kg
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 10:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1593788140;
 bh=urHYDGHThbj3WBoCiNBzMY7OIi9QgJgTUB0LK3ShixE=;
 h=Content-Type:From:Subject:Date:Message-Id:To;
 b=oGj8g4Dd7kN0zGk9TIBBmzeHz7lUnyhwrodL+5RzUB1eQTNdieDzeofGr+vCH+mEE
 66Fhlaxvc+g9ZkapqxPZ9XZdERq2I+C6HAVzQn3qjCNu+zOybnIOik5lhl9b0LjAua
 XyGZ/A8rrf/1gDrLIXJDuzJRcWT+iQblm4tKE49HI/qMIWOrIxtKZjsxSFZBatzVZu
 3CjZ+ST/17keaFVbJtfyOdzMxCU2z8CWlIP+xYlxDfzUGgKzpQQq6ufkOr2p1O81Xz
 yRDxc0rd975bU3Njy8uO6MZskYK8HFxa4OY47zNdQi+NrarolebFmOBeyu4gFyLCwA
 nI3/6y+jKuRhA==
Received: from [192.168.50.83] (unknown [223.166.236.161])
 by mr85p00im-hyfv06011401.me.com (Postfix) with ESMTPSA id 8979CD20546;
 Fri,  3 Jul 2020 14:55:37 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Mime-Version: 1.0 (1.0)
Subject: Re: How the cpu_R in DisasContext is associated with register of
 CPUArchState
Date: Fri, 3 Jul 2020 22:55:31 +0800
Message-Id: <5AFF3CAE-1C46-4E32-BF42-537F5F5D1F67@icloud.com>
References: <CAFEAcA-9xQGEh_bAS4vtcsxmaXqskutCo3VOJWjGYmsktVLTkw@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
In-Reply-To: <CAFEAcA-9xQGEh_bAS4vtcsxmaXqskutCo3VOJWjGYmsktVLTkw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: iPhone Mail (17E262)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_10:2020-07-02,
 2020-07-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=903 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2004280000 definitions=main-2007030103
Received-SPF: pass client-ip=17.58.23.191;
 envelope-from=shen.mengjiao3@icloud.com; helo=mr85p00im-hyfv06011401.me.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 10:08:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, MIME_QP_LONG_LINE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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


Thanks for the detail! And I=E2=80=99m exactly looking at arm, thanks!

Another question, how does gen_helper_* generate code? And how it make sure t=
he sequence, for example tcg_gen_mov_* generate some code, and then need gen=
_helper_* to do some extra work? Thanks in advance!

> =E5=9C=A8 2020=E5=B9=B47=E6=9C=883=E6=97=A5=EF=BC=8C=E4=B8=8B=E5=8D=8810:4=
0=EF=BC=8CPeter Maydell <peter.maydell@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A=

>=20
> =EF=BB=BFOn Fri, 3 Jul 2020 at 15:15, =E6=B2=88=E6=A2=A6=E5=A7=A3 <shen.me=
ngjiao3@icloud.com> wrote:
>>=20
>> Because in translate stage when write cpu register by guest code, it oper=
ates totally on cpu_R of DisasContext, how to reflect it to register of CPUA=
rchState?
>=20
> You don't say which target you're looking at, but in general
> these mappings are set up when the translator is initialized.
> For instance for Arm, arm_translate_init() does this:
>    for (i =3D 0; i < 16; i++) {
>        cpu_R[i] =3D tcg_global_mem_new_i32(cpu_env,
>                                          offsetof(CPUARMState, regs[i]),
>                                          regnames[i]);
>    }
>=20
> which creates the cpu_R[] TCGvs as TCG global variables which
> live in the regs[] field of the CPUARMState structure. Whenever
> TCG code is generated that accesses that global it will read
> and write from the memory location corresponding to the
> regs[] array entry in the CPU struct.
>=20
> thanks
> -- PMM
>=20

