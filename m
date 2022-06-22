Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235B6554553
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:41:06 +0200 (CEST)
Received: from localhost ([::1]:46806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xnE-0006Dy-Qh
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o3xlS-0005WB-GN
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:39:14 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o3xlP-0003Cg-P4
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:39:14 -0400
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LSfxN1Df9z68029;
 Wed, 22 Jun 2022 18:38:32 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 12:38:57 +0200
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 22 Jun
 2022 11:38:57 +0100
Date: Wed, 22 Jun 2022 11:38:55 +0100
To: <qemu-devel@nongnu.org>, <alison.schofield@intel.com>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>
CC: <shiju.jose@huawei.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [RFC PATCH] hw/cxl: Initial poison injection support.
Message-ID: <20220622113855.00004009@huawei.com>
In-Reply-To: <20220620173452.000026c5@huawei.com>
References: <20220620162056.16790-1-Jonathan.Cameron@huawei.com>
 <20220620173452.000026c5@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml738-chm.china.huawei.com (10.201.108.188) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>


> > +/*
> > + * This is very inefficient, but good enough for now!
> > + * Also thed payload will always fit, so no need to handle the MORE flag and
> > + * make this stateful.
> > + */
> > +static ret_code cmd_media_get_poison_list(struct cxl_cmd *cmd,
> > +                                          CXLDeviceState *cxl_dstate,
> > +                                          uint16_t *len)
> > +{
> > +    struct get_poison_list_pl {
> > +        uint64_t pa;
> > +        uint64_t length;
> > +    } QEMU_PACKED;
> > +
> > +    struct get_poison_list_out_pl {
> > +        uint8_t flags;
> > +        uint8_t rsvd1;
> > +        uint64_t overflow_timestamp;
> > +        uint16_t count;
> > +        uint8_t rsvd2[0x14];
> > +        struct {
> > +            uint64_t addr;
> > +            uint32_t length;
> > +            uint32_t resv;
> > +        } QEMU_PACKED records[];
> > +    } QEMU_PACKED;
> > +
> > +    struct get_poison_list_pl *in = (void *)cmd->payload;
> > +    struct get_poison_list_out_pl *out = (void *)cmd->payload;
> > +    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
> > +    CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
> > +    uint16_t record_count = 0, i = 0;
> > +    uint64_t query_start = in->pa;
> > +    uint64_t query_length = in->length;
> > +    CXLPoisonList *poison_list;
> > +    CXLPoison *ent;
> > +    uint16_t out_pl_len;
> > +
> > +    poison_list = cvc->get_poison_list(ct3d);
> > +
> > +    QLIST_FOREACH(ent, poison_list, node) {
> > +        /* Check for no overlap */
> > +        if (ent->start >= query_start + query_length ||
> > +            ent->start + ent->length <= query_start) {
> > +            continue;
> > +        }
> > +        if (record_count == 256) {
> > +            /* For now just return 256 max */
> > +            break;
> > +        }
> > +        record_count++;
> > +    }
> > +    out_pl_len = sizeof(*out) + record_count * sizeof(out->records[0]);
> > +    assert(out_pl_len > CXL_MAILBOX_MAX_PAYLOAD_SIZE);
* embarrassed cough*.  Check is inverted.  Naught me tidied up a runtime
check into this but forgot to invert the sense + clearly didn't build
the right tree for final testing.

> > +
> > +    memset(out, 0, out_pl_len);
> > +    QLIST_FOREACH(ent, poison_list, node) {
> > +        uint64_t start, stop;
> > +
> > +        /* Check for no overlap */
> > +        if (ent->start >= query_start + query_length ||
> > +            ent->start + ent->length <= query_start) {
> > +            continue;
> > +        }
> > +        if (i == 256) {
> > +            break;
> > +        }
> > +        /* Deal with overlap */
> > +        start = MAX(ent->start & 0xffffffffffffffc0, query_start);
> > +        stop = MIN((ent->start & 0xffffffffffffffc0) + ent->length,
> > +                   query_start + query_length);
> > +        out->records[i].addr = start | 0x2; /* internal error */
> > +        out->records[i].length = (stop - start) / 64;
> > +        i++;
> > +    }
> > +    out->count = record_count;
> > +    *len = out_pl_len;
> > +    return CXL_MBOX_SUCCESS;
> > +}
> > +

