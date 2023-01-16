Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B096366BC63
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 12:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHNHv-0008VI-Pq; Mon, 16 Jan 2023 06:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pHNHs-0008V4-VY
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 06:04:24 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pHNHq-0003uh-Cu
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 06:04:24 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NwTbX5Y7lz6H6mV;
 Mon, 16 Jan 2023 19:01:12 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 11:04:02 +0000
Date: Mon, 16 Jan 2023 11:04:02 +0000
To: Mike Maslenkin <mike.maslenkin@gmail.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>,
 "Dave Jiang" <dave.jiang@intel.com>, <alison.schofield@intel.com>,
 <ira.weiny@intel.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH 7/7] hw/mem/cxl_type3: Add CXL RAS Error Injection Support.
Message-ID: <20230116110402.00003294@Huawei.com>
In-Reply-To: <CAL77WPBFT5Ty56bOQR4aQqxi=GZYbwZELiZhkWzB4F-Wn0pZGg@mail.gmail.com>
References: <20230113161711.7885-1-Jonathan.Cameron@huawei.com>
 <20230113161711.7885-8-Jonathan.Cameron@huawei.com>
 <CAL77WPBFT5Ty56bOQR4aQqxi=GZYbwZELiZhkWzB4F-Wn0pZGg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Mike,

> > +static int ct3d_qmp_uncor_err_to_cxl(CxlUncorErrorType qmp_err)
> > +{
> > +    switch (qmp_err) {
> > +    case CXL_UNCOR_ERROR_TYPE_CACHE_DATA_PARITY:
> > +        return CXL_RAS_UNC_ERR_CACHE_DATA_PARITY;
> > +    case CXL_UNCOR_ERROR_TYPE_CACHE_ADDRESS_PARITY:
> > +        return CXL_RAS_UNC_ERR_CACHE_ADDRESS_PARITY;
> > +    case CXL_UNCOR_ERROR_TYPE_CACHE_BE_PARITY:
> > +        return CXL_RAS_UNC_ERR_CACHE_BE_PARITY;
> > +    case CXL_UNCOR_ERROR_TYPE_CACHE_DATA_ECC:
> > +        return CXL_RAS_UNC_ERR_CACHE_DATA_ECC;
> > +    case CXL_UNCOR_ERROR_TYPE_MEM_DATA_PARITY:
> > +        return CXL_RAS_UNC_ERR_MEM_DATA_PARITY;
> > +    case CXL_UNCOR_ERROR_TYPE_MEM_ADDRESS_PARITY:
> > +        return CXL_RAS_UNC_ERR_MEM_ADDRESS_PARITY;
> > +    case CXL_UNCOR_ERROR_TYPE_MEM_BE_PARITY:
> > +        return CXL_RAS_UNC_ERR_MEM_BE_PARITY;
> > +    case CXL_UNCOR_ERROR_TYPE_MEM_DATA_ECC:
> > +        return CXL_RAS_UNC_ERR_MEM_DATA_ECC;
> > +    case CXL_UNCOR_ERROR_TYPE_REINIT_THRESHOLD:
> > +        return CXL_RAS_UNC_ERR_REINIT_THRESHOLD;
> > +    case CXL_UNCOR_ERROR_TYPE_RSVD_ENCODING:
> > +        return CXL_RAS_UNC_ERR_RSVD_ENCODING;
> > +    case CXL_UNCOR_ERROR_TYPE_POISON_RECEIVED:
> > +        return CXL_RAS_UNC_ERR_POISON_RECEIVED;
> > +    case CXL_UNCOR_ERROR_TYPE_RECEIVER_OVERFLOW:
> > +        return CXL_RAS_UNC_ERR_RECEIVER_OVERFLOW;
> > +    case CXL_UNCOR_ERROR_TYPE_INTERNAL:
> > +        return CXL_RAS_UNC_ERR_INTERNAL;
> > +    case CXL_UNCOR_ERROR_TYPE_CXL_IDE_TX:
> > +        return CXL_RAS_UNC_ERR_CXL_IDE_TX;
> > +    case CXL_UNCOR_ERROR_TYPE_CXL_IDE_RX:
> > +        return CXL_RAS_UNC_ERR_CXL_IDE_RX;
> > +    default:
> > +        return -EINVAL;
> > +    }
> > +}
> > +
> > +static int ct3d_qmp_cor_err_to_cxl(CxlUncorErrorType qmp_err)  
> 
> CxlCorErrorType type  is required.
> 
> Compiler warns here:
> ../hw/mem/cxl_type3.c:1263:44: error: implicit conversion from
> enumeration type 'CxlCorErrorType' (aka 'enum CxlCorErrorType') to
> different enumeration type 'CxlUncorErrorType' (aka 'enum
> CxlUncorErrorType') [-Werror,-Wenum-conversion]
> 
>     cxl_err_type = ct3d_qmp_cor_err_to_cxl(type);
> 
>                    ~~~~~~~~~~~~~~~~~~~~~~~ ^~~~
> 1 error generated.

Yikes. Not sure how I missed that!



> 
> > +{
> > +    switch (qmp_err) {
> > +    case CXL_COR_ERROR_TYPE_CACHE_DATA_ECC:
> > +        return CXL_RAS_COR_ERR_CACHE_DATA_ECC;
> > +    case CXL_COR_ERROR_TYPE_MEM_DATA_ECC:
> > +        return CXL_RAS_COR_ERR_MEM_DATA_ECC;
> > +    case CXL_COR_ERROR_TYPE_CRC_THRESHOLD:
> > +        return CXL_RAS_COR_ERR_CRC_THRESHOLD;
> > +    case CXL_COR_ERROR_TYPE_RETRY_THRESHOLD:
> > +        return CXL_RAS_COR_ERR_RETRY_THRESHOLD;
> > +    case CXL_COR_ERROR_TYPE_CACHE_POISON_RECEIVED:
> > +        return CXL_RAS_COR_ERR_CACHE_POISON_RECEIVED;
> > +    case CXL_COR_ERROR_TYPE_MEM_POISON_RECEIVED:
> > +        return CXL_RAS_COR_ERR_MEM_POISON_RECEIVED;
> > +    case CXL_COR_ERROR_TYPE_PHYSICAL:
> > +        return CXL_RAS_COR_ERR_PHYSICAL;
> > +    default:
> > +        return -EINVAL;
> > +    }
> > +}
> > +
> >  static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
> >                             unsigned size)
> >  {
> > @@ -341,6 +402,84 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
> >          should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
> >          which_hdm = 0;
> >          break;
> > +    case A_CXL_RAS_UNC_ERR_STATUS:
> > +    {
> > +        uint32_t capctrl = ldl_le_p(cache_mem + R_CXL_RAS_ERR_CAP_CTRL);
> > +        uint32_t fe = FIELD_EX32(capctrl, CXL_RAS_ERR_CAP_CTRL, FIRST_ERROR_POINTER);
> > +        CXLError *cxl_err;
> > +        uint32_t unc_err;
> > +
> > +        /*
> > +         * If single bit written that corresponds to the first error
> > +         * pointer being cleared, update the status and header log.
> > +         */
> > +        if (!QTAILQ_EMPTY(&ct3d->error_list)) {
> > +            CXLError *cxl_err = QTAILQ_FIRST(&ct3d->error_list);  
> 
> Is it ok that "CXLError *cxl_err"  definition clobbers previous one above?

It isn't a bug as the external one is only used much later in a QTAILQ_FOREACH()
to build the resulting error status register, but it's certainly inelegant
and there is no need for the internal definition so I'll drop it.
I also moved the assignment to the else leg which is the only place that
specific assignment is used.

Thanks for quick review!  I'll hold off sending a v2 out for a day or two
to let any other early comments come in.

Jonathan


