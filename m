Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7732560F71
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 05:07:59 +0200 (CEST)
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6kX8-000897-JW
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 23:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o6kVn-0007Sr-RN
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 23:06:35 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:42700 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o6kVi-0001Zx-Ml
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 23:06:35 -0400
Received: from smtpclient.apple (unknown [111.199.64.159])
 by APP-01 (Coremail) with SMTP id qwCowADX3xctE71i+KMiCg--.46724S2;
 Thu, 30 Jun 2022 11:06:22 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: Use ioeventfd to handle doorbell updates
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YryyZUmJbo3eY/pa@apples>
Date: Thu, 30 Jun 2022 11:06:21 +0800
Cc: qemu-devel@nongnu.org,
 kbusch@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <431EE04A-C210-464A-A7A4-52E334294A88@ict.ac.cn>
References: <20220627104813.2173852-1-fanjinhao21s@ict.ac.cn>
 <YryyZUmJbo3eY/pa@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowADX3xctE71i+KMiCg--.46724S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4UGFy5XFWkZF17tw45GFg_yoW3CFWDpF
 WkWFZ5KFs7JFy7urZYqrsrJw1ku3y0qr1DCrWfJF17Cwnakr97AayUGFWUuF93Zrn7XFs8
 Cr48tF47u3y7J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l
 4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
 AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
 cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
 8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5PpnJUUUUU==
X-Originating-IP: [111.199.64.159]
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

at 4:13 AM, Klaus Jensen <its@irrelevant.dk> wrote:

> On Jun 27 18:48, Jinhao Fan wrote:
>> Add property "ioeventfd" which is enabled by default. When this is
>> enabled, updates on the doorbell registers will cause KVM to signal
>> an event to the QEMU main loop to handle the doorbell updates.
>> Therefore, instead of letting the vcpu thread run both guest VM and
>> IO emulation, we now use the main loop thread to do IO emulation and
>> thus the vcpu thread has more cycles for the guest VM.
>>=20
>> Since ioeventfd does not tell us the exact value that is written, it =
is
>> only useful when shadow doorbell buffer is enabled, where we check
>> for the value in the shadow doorbell buffer when we get the doorbell
>> update event.
>>=20
>> IOPS comparison on Linux 5.19-rc2: (Unit: KIOPS)
>>=20
>> qd           1   4  16  64
>> qemu        35 121 176 153
>> ioeventfd   41 133 258 313
>>=20
>> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
>> ---
>> hw/nvme/ctrl.c | 97 =
+++++++++++++++++++++++++++++++++++++++++++++++++-
>> hw/nvme/nvme.h |  5 +++
>> 2 files changed, 101 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index c952c34f94..787b89f7d3 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -1374,7 +1374,14 @@ static void =
nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
>>=20
>>     QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
>>     QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
>> -    timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + =
500);
>> +
>> +    if (req->sq->ioeventfd_enabled) {
>> +        /* Post CQE directly since we are in main loop thread */
>> +        nvme_post_cqes(cq);
>> +    } else {
>> +        /* Schedule the timer to post CQE later since we are in vcpu =
thread */
>> +        timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + =
500);
>> +    }
>> }
>>=20
>> static void nvme_process_aers(void *opaque)
>> @@ -4195,10 +4202,74 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, =
NvmeRequest *req)
>>     return NVME_INVALID_OPCODE | NVME_DNR;
>> }
>>=20
>> +static void nvme_cq_notifier(EventNotifier *e)
>> +{
>> +    NvmeCQueue *cq =3D container_of(e, NvmeCQueue, notifier);
>> +    NvmeCtrl *n =3D cq->ctrl;
>> +
>> +    event_notifier_test_and_clear(&cq->notifier);
>> +
>> +    nvme_update_cq_head(cq);
>> +
>> +    if (cq->tail =3D=3D cq->head) {
>> +        if (cq->irq_enabled) {
>> +            n->cq_pending--;
>> +        }
>> +
>> +        nvme_irq_deassert(n, cq);
>> +    }
>> +
>> +    nvme_post_cqes(cq);
>> +}
>> +
>> +static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
>> +{
>> +    NvmeCtrl *n =3D cq->ctrl;
>> +    uint16_t offset =3D (cq->cqid << 3) + (1 << 2);
>> +    int ret;
>> +
>> +    if ((ret =3D event_notifier_init(&cq->notifier, 0))) {
>> +        return ret;
>> +    }
>=20
> Dont assign in conditionals and rely on the implicit value. It's too
> error prone. Split into
>=20
>  ret =3D event_notifier_init(&cq->notifier, 0);
>  if (ret < 0) {
>    return ret;
>  }
>=20
>> +
>> +    event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
>> +    memory_region_add_eventfd(&n->iomem,
>> +                              0x1000 + offset, 4, false, 0, =
&cq->notifier);
>> +   =20
>> +    return 0;
>> +}
>> +
>> +static void nvme_sq_notifier(EventNotifier *e)
>> +{
>> +    NvmeSQueue *sq =3D container_of(e, NvmeSQueue, notifier);
>> +
>> +    event_notifier_test_and_clear(&sq->notifier);
>> +
>> +    nvme_process_sq(sq);
>> +}
>> +
>> +static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
>> +{
>> +    NvmeCtrl *n =3D sq->ctrl;
>> +    uint16_t offset =3D sq->sqid << 3;
>> +    int ret;
>> +
>> +    if ((ret =3D event_notifier_init(&sq->notifier, 0))) {
>> +        return ret;
>> +    }
>=20
> Same as above.
>=20
>> +
>> +    event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
>> +    memory_region_add_eventfd(&n->iomem,
>> +                              0x1000 + offset, 4, false, 0, =
&sq->notifier);
>> +
>> +    return 0;
>> +}
>> +
>> static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
>> {
>>     n->sq[sq->sqid] =3D NULL;
>>     timer_free(sq->timer);
>> +    event_notifier_cleanup(&sq->notifier);
>>     g_free(sq->io_req);
>>     if (sq->sqid) {
>>         g_free(sq);
>> @@ -4250,6 +4321,7 @@ static void nvme_init_sq(NvmeSQueue *sq, =
NvmeCtrl *n, uint64_t dma_addr,
>>                          uint16_t sqid, uint16_t cqid, uint16_t size)
>> {
>>     int i;
>> +    int ret;
>>     NvmeCQueue *cq;
>>=20
>>     sq->ctrl =3D n;
>> @@ -4271,6 +4343,11 @@ static void nvme_init_sq(NvmeSQueue *sq, =
NvmeCtrl *n, uint64_t dma_addr,
>>     if (n->dbbuf_enabled) {
>>         sq->db_addr =3D n->dbbuf_dbs + (sqid << 3);
>>         sq->ei_addr =3D n->dbbuf_eis + (sqid << 3);
>> +           =20
>> +        if (n->params.ioeventfd && sq->sqid !=3D 0) {
>> +            ret =3D nvme_init_sq_ioeventfd(sq);
>> +            sq->ioeventfd_enabled =3D ret =3D=3D 0;
>> +        }
>=20
> Not using ret for anything really, so
>=20
>  if (!nvme_init_sq_ioeventfd(sq)) {
>    sq->ioeventfd_enabled =3D true;
>  }
>=20
> should do.
>=20
>>     }
>>=20
>>     assert(n->cq[cqid]);
>> @@ -4577,6 +4654,7 @@ static void nvme_free_cq(NvmeCQueue *cq, =
NvmeCtrl *n)
>> {
>>     n->cq[cq->cqid] =3D NULL;
>>     timer_free(cq->timer);
>> +    event_notifier_cleanup(&cq->notifier);
>>     if (msix_enabled(&n->parent_obj)) {
>>         msix_vector_unuse(&n->parent_obj, cq->vector);
>>     }
>> @@ -4635,6 +4713,11 @@ static void nvme_init_cq(NvmeCQueue *cq, =
NvmeCtrl *n, uint64_t dma_addr,
>>     if (n->dbbuf_enabled) {
>>         cq->db_addr =3D n->dbbuf_dbs + (cqid << 3) + (1 << 2);
>>         cq->ei_addr =3D n->dbbuf_eis + (cqid << 3) + (1 << 2);
>> +
>> +        if (n->params.ioeventfd && cqid !=3D 0) {
>> +            ret =3D nvme_init_cq_ioeventfd(cq);
>> +            cq->ioeventfd_enabled =3D ret =3D=3D 0;
>> +        }
>>     }
>>     n->cq[cqid] =3D cq;
>>     cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, =
cq);
>> @@ -5793,6 +5876,7 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, =
const NvmeRequest *req)
>>     uint64_t dbs_addr =3D le64_to_cpu(req->cmd.dptr.prp1);
>>     uint64_t eis_addr =3D le64_to_cpu(req->cmd.dptr.prp2);
>>     int i;
>> +    int ret;
>>=20
>>     /* Address should be page aligned */
>>     if (dbs_addr & (n->page_size - 1) || eis_addr & (n->page_size - =
1)) {
>> @@ -5818,6 +5902,11 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, =
const NvmeRequest *req)
>>             sq->ei_addr =3D eis_addr + (i << 3);
>>             pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
>>                     sizeof(sq->tail));
>> +           =20
>> +            if (n->params.ioeventfd && sq->sqid !=3D 0) {
>> +                ret =3D nvme_init_sq_ioeventfd(sq);
>> +                sq->ioeventfd_enabled =3D ret =3D=3D 0;
>> +            }
>=20
> Same as above.
>=20
>>         }
>>=20
>>         if (cq) {
>> @@ -5826,6 +5915,11 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, =
const NvmeRequest *req)
>>             cq->ei_addr =3D eis_addr + (i << 3) + (1 << 2);
>>             pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
>>                     sizeof(cq->head));
>> +           =20
>> +            if (n->params.ioeventfd && cq->cqid !=3D 0) {
>> +                ret =3D nvme_init_cq_ioeventfd(cq);
>> +                cq->ioeventfd_enabled =3D ret =3D=3D 0;
>> +            }
>>         }
>>     }
>>=20
>> @@ -7040,6 +7134,7 @@ static Property nvme_props[] =3D {
>>     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
>>     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
>>                      params.auto_transition_zones, true),
>> +    DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, true),
>>     DEFINE_PROP_END_OF_LIST(),
>> };
>>=20
>> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> index 4452e4b1bf..2a9beea0c8 100644
>> --- a/hw/nvme/nvme.h
>> +++ b/hw/nvme/nvme.h
>> @@ -369,6 +369,8 @@ typedef struct NvmeSQueue {
>>     uint64_t    db_addr;
>>     uint64_t    ei_addr;
>>     QEMUTimer   *timer;
>> +    EventNotifier notifier;
>> +    bool        ioeventfd_enabled;
>>     NvmeRequest *io_req;
>>     QTAILQ_HEAD(, NvmeRequest) req_list;
>>     QTAILQ_HEAD(, NvmeRequest) out_req_list;
>> @@ -388,6 +390,8 @@ typedef struct NvmeCQueue {
>>     uint64_t    db_addr;
>>     uint64_t    ei_addr;
>>     QEMUTimer   *timer;
>> +    EventNotifier notifier;
>> +    bool        ioeventfd_enabled;
>>     QTAILQ_HEAD(, NvmeSQueue) sq_list;
>>     QTAILQ_HEAD(, NvmeRequest) req_list;
>> } NvmeCQueue;
>> @@ -410,6 +414,7 @@ typedef struct NvmeParams {
>>     uint8_t  zasl;
>>     bool     auto_transition_zones;
>>     bool     legacy_cmb;
>> +    bool     ioeventfd;
>> } NvmeParams;
>>=20
>> typedef struct NvmeCtrl {
>> --=20
>> 2.25.1
>=20
> Otherwise, looks good!

Hi Klaus,

Thanks for the comments. I will post v2 soon.=


