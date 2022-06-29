Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE9455FB54
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:07:41 +0200 (CEST)
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Tfa-0007ii-P1
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o6Tcs-0006th-PB
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:04:46 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:44846 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o6Tcl-00086h-EM
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:04:45 -0400
Received: from smtpclient.apple (unknown [114.245.36.56])
 by APP-01 (Coremail) with SMTP id qwCowAA3PgaZFbxiyLXMCQ--.55975S2;
 Wed, 29 Jun 2022 17:04:27 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: Use ioeventfd to handle doorbell updates
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220627104813.2173852-1-fanjinhao21s@ict.ac.cn>
Date: Wed, 29 Jun 2022 17:04:25 +0800
Cc: its@irrelevant.dk,
 kbusch@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8F470FDC-3213-4284-8A85-487ACE690FB7@ict.ac.cn>
References: <20220627104813.2173852-1-fanjinhao21s@ict.ac.cn>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowAA3PgaZFbxiyLXMCQ--.55975S2
X-Coremail-Antispam: 1UD129KBjvdXoWrXr18uw4kuF48GryrWrWrGrg_yoWxGFc_u3
 sYvFs7CF47JFs3Xw4FkF45t3W3Xrn8XF40g3yFyF4kXayfZayjgF409FyUX3saqa15urZx
 XFZrGr18Ww1v9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbw8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC2
 0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
 0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
 14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
 vaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jY6wZUUUUU=
X-Originating-IP: [114.245.36.56]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping~

> @@ -4271,6 +4343,11 @@ static void nvme_init_sq(NvmeSQueue *sq, =
NvmeCtrl *n, uint64_t dma_addr,
>     if (n->dbbuf_enabled) {
>         sq->db_addr =3D n->dbbuf_dbs + (sqid << 3);
>         sq->ei_addr =3D n->dbbuf_eis + (sqid << 3);
> +           =20
> +        if (n->params.ioeventfd && sq->sqid !=3D 0) {
> +            ret =3D nvme_init_sq_ioeventfd(sq);
> +            sq->ioeventfd_enabled =3D ret =3D=3D 0;
> +        }
>     }
>=20
>     assert(n->cq[cqid]);

Is this =E2=80=9Cret =3D=3D 0=E2=80=9D a correct way for error handling?

I=E2=80=99ve also been wondering whether using irqfd for sending =
interrupts can
bring some benefits. I=E2=80=99m not familiar with how QEMU emulates =
interrupts.
What do you think of irqfd=E2=80=99s?=


