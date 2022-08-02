Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE7C587614
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 05:47:43 +0200 (CEST)
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIisg-0001pD-Kj
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 23:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oIira-0000EL-6Z; Mon, 01 Aug 2022 23:46:34 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:35848 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oIirX-0007D2-4R; Mon, 01 Aug 2022 23:46:33 -0400
Received: from smtpclient.apple (unknown [106.8.166.203])
 by APP-05 (Coremail) with SMTP id zQCowAAXH7MInuhibrmoFQ--.53035S2;
 Tue, 02 Aug 2022 11:46:17 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: Add helper functions for qid-db conversion
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220728080710.372027-1-fanjinhao21s@ict.ac.cn>
Date: Tue, 2 Aug 2022 11:46:16 +0800
Cc: its@irrelevant.dk, kbusch@kernel.org,
 "open list:nvme" <qemu-block@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8A76E74-3E98-4FC7-92B5-61902C45CA71@ict.ac.cn>
References: <20220728080710.372027-1-fanjinhao21s@ict.ac.cn>
To: qemu-devel <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowAAXH7MInuhibrmoFQ--.53035S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFWUuFWxKFWxCF4fXr1fJFb_yoW7Kr4xpF
 4kXF9IyF4SyF1qqFZ5Jr1DXwn5Zws7Xry8Grn3Ww12yr93ZrykAay8CFyrC3WfZrykZrWF
 vr43JF13Wa17trJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07beJ5wUUUUU=
X-Originating-IP: [106.8.166.203]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

at 4:07 PM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> With the introduction of shadow doorbell and ioeventfd, we need to do
> frequent conversion between qid and its doorbell offset. The original
> hard-coded calculation is confusing and error-prone. Add several =
helper
> functions to do this task.
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
> hw/nvme/ctrl.c | 61 ++++++++++++++++++++++++++++++++------------------
> 1 file changed, 39 insertions(+), 22 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 533ad14e7a..6116c0e660 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -487,6 +487,29 @@ static int nvme_check_cqid(NvmeCtrl *n, uint16_t =
cqid)
> {
>     return cqid < n->conf_ioqpairs + 1 && n->cq[cqid] !=3D NULL ? 0 : =
-1;
> }
> +static inline bool nvme_db_offset_is_cq(NvmeCtrl *n, hwaddr offset)
> +{
> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> +    return (offset / stride) & 1;
> +}
> +
> +static inline uint16_t nvme_db_offset_to_qid(NvmeCtrl *n, hwaddr =
offset)
> +{
> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> +    return offset / (2 * stride);
> +}
> +
> +static inline hwaddr nvme_cqid_to_db_offset(NvmeCtrl *n, uint16_t =
cqid)
> +{
> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> +    return stride * (cqid * 2 + 1);
> +}
> +
> +static inline hwaddr nvme_sqid_to_db_offset(NvmeCtrl *n, uint16_t =
sqid)
> +{
> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> +    return stride * sqid * 2;
> +}
>=20
> static void nvme_inc_cq_tail(NvmeCQueue *cq)
> {
> @@ -4256,7 +4279,7 @@ static void nvme_cq_notifier(EventNotifier *e)
> static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
> {
>     NvmeCtrl *n =3D cq->ctrl;
> -    uint16_t offset =3D (cq->cqid << 3) + (1 << 2);
> +    uint16_t offset =3D nvme_cqid_to_db_offset(n, cq->cqid);
>     int ret;
>=20
>     ret =3D event_notifier_init(&cq->notifier, 0);
> @@ -4283,7 +4306,7 @@ static void nvme_sq_notifier(EventNotifier *e)
> static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
> {
>     NvmeCtrl *n =3D sq->ctrl;
> -    uint16_t offset =3D sq->sqid << 3;
> +    uint16_t offset =3D nvme_sqid_to_db_offset(n, sq->sqid);
>     int ret;
>=20
>     ret =3D event_notifier_init(&sq->notifier, 0);
> @@ -4300,7 +4323,7 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue =
*sq)
>=20
> static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
> {
> -    uint16_t offset =3D sq->sqid << 3;
> +    uint16_t offset =3D nvme_sqid_to_db_offset(n, sq->sqid);
>=20
>     n->sq[sq->sqid] =3D NULL;
>     timer_free(sq->timer);
> @@ -4379,8 +4402,8 @@ static void nvme_init_sq(NvmeSQueue *sq, =
NvmeCtrl *n, uint64_t dma_addr,
>     sq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, =
sq);
>=20
>     if (n->dbbuf_enabled) {
> -        sq->db_addr =3D n->dbbuf_dbs + (sqid << 3);
> -        sq->ei_addr =3D n->dbbuf_eis + (sqid << 3);
> +        sq->db_addr =3D n->dbbuf_dbs + nvme_sqid_to_db_offset(n, =
sqid);
> +        sq->ei_addr =3D n->dbbuf_eis + nvme_sqid_to_db_offset(n, =
sqid);
>=20
>         if (n->params.ioeventfd && sq->sqid !=3D 0) {
>             if (!nvme_init_sq_ioeventfd(sq)) {
> @@ -4690,8 +4713,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, =
NvmeRequest *req)
>=20
> static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
> {
> -    uint16_t offset =3D (cq->cqid << 3) + (1 << 2);
> -
> +    uint16_t offset =3D nvme_cqid_to_db_offset(n, cq->cqid);
> +   =20
>     n->cq[cq->cqid] =3D NULL;
>     timer_free(cq->timer);
>     if (cq->ioeventfd_enabled) {
> @@ -4755,8 +4778,8 @@ static void nvme_init_cq(NvmeCQueue *cq, =
NvmeCtrl *n, uint64_t dma_addr,
>     QTAILQ_INIT(&cq->req_list);
>     QTAILQ_INIT(&cq->sq_list);
>     if (n->dbbuf_enabled) {
> -        cq->db_addr =3D n->dbbuf_dbs + (cqid << 3) + (1 << 2);
> -        cq->ei_addr =3D n->dbbuf_eis + (cqid << 3) + (1 << 2);
> +        cq->db_addr =3D n->dbbuf_dbs + nvme_cqid_to_db_offset(n, =
cqid);
> +        cq->ei_addr =3D n->dbbuf_eis + nvme_cqid_to_db_offset(n, =
cqid);
>=20
>         if (n->params.ioeventfd && cqid !=3D 0) {
>             if (!nvme_init_cq_ioeventfd(cq)) {
> @@ -6128,13 +6151,8 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, =
const NvmeRequest *req)
>         NvmeCQueue *cq =3D n->cq[i];
>=20
>         if (sq) {
> -            /*
> -             * CAP.DSTRD is 0, so offset of ith sq db_addr is (i<<3)
> -             * nvme_process_db() uses this hard-coded way to =
calculate
> -             * doorbell offsets. Be consistent with that here.
> -             */
> -            sq->db_addr =3D dbs_addr + (i << 3);
> -            sq->ei_addr =3D eis_addr + (i << 3);
> +            sq->db_addr =3D dbs_addr + nvme_sqid_to_db_offset(n, i);
> +            sq->ei_addr =3D eis_addr + nvme_sqid_to_db_offset(n, i);
>             pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
>                     sizeof(sq->tail));
>=20
> @@ -6146,9 +6164,8 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, =
const NvmeRequest *req)
>         }
>=20
>         if (cq) {
> -            /* CAP.DSTRD is 0, so offset of ith cq db_addr is =
(i<<3)+(1<<2) */
> -            cq->db_addr =3D dbs_addr + (i << 3) + (1 << 2);
> -            cq->ei_addr =3D eis_addr + (i << 3) + (1 << 2);
> +            cq->db_addr =3D dbs_addr + nvme_cqid_to_db_offset(n, i);
> +            cq->ei_addr =3D eis_addr + nvme_cqid_to_db_offset(n, i);
>             pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
>                     sizeof(cq->head));
>=20
> @@ -6843,14 +6860,14 @@ static void nvme_process_db(NvmeCtrl *n, =
hwaddr addr, int val)
>         return;
>     }
>=20
> -    if (((addr - 0x1000) >> 2) & 1) {
> +    if (nvme_db_offset_is_cq(n, addr - 0x1000)) {
>         /* Completion queue doorbell write */
>=20
>         uint16_t new_head =3D val & 0xffff;
>         int start_sqs;
>         NvmeCQueue *cq;
>=20
> -        qid =3D (addr - (0x1000 + (1 << 2))) >> 3;
> +        qid =3D nvme_db_offset_to_qid(n, addr - 0x1000);
>         if (unlikely(nvme_check_cqid(n, qid))) {
>             NVME_GUEST_ERR(pci_nvme_ub_db_wr_invalid_cq,
>                            "completion queue doorbell write"
> @@ -6925,7 +6942,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr =
addr, int val)
>         uint16_t new_tail =3D val & 0xffff;
>         NvmeSQueue *sq;
>=20
> -        qid =3D (addr - 0x1000) >> 3;
> +        qid =3D nvme_db_offset_to_qid(n, addr - 0x1000);
>         if (unlikely(nvme_check_sqid(n, qid))) {
>             NVME_GUEST_ERR(pci_nvme_ub_db_wr_invalid_sq,
>                            "submission queue doorbell write"
> --=20
> 2.25.1

Ping~=20=


