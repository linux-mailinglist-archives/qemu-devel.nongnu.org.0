Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34E56A94CE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2Gn-0004vB-At; Fri, 03 Mar 2023 05:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pY2Gk-0004r0-40
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:04:06 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pY2Gi-0005mc-Eb
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:04:05 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PSk5R3NGDz6JB1R;
 Fri,  3 Mar 2023 18:01:31 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 3 Mar
 2023 10:03:58 +0000
Date: Fri, 3 Mar 2023 10:03:58 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>, Michael Roth
 <michael.roth@amd.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Dave Jiang <dave.jiang@intel.com>, Markus Armbruster
 <armbru@redhat.com>
Subject: Re: [PATCH v3 4/6] hw/cxl: QMP based poison injection support
Message-ID: <20230303100358.00007f66@Huawei.com>
In-Reply-To: <6401446d8d8dc_46c602942@iweiny-mobl.notmuch>
References: <20230302101710.1652-1-Jonathan.Cameron@huawei.com>
 <20230302101710.1652-5-Jonathan.Cameron@huawei.com>
 <6401446d8d8dc_46c602942@iweiny-mobl.notmuch>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
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


> > +    memset(out, 0, out_pl_len);
> > +    QLIST_FOREACH(ent, poison_list, node) {
> > +        uint64_t start, stop;
> > +
> > +        /* Check for no overlap */
> > +        if (ent->start >= query_start + query_length ||
> > +            ent->start + ent->length <= query_start) {
> > +            continue;
> > +        }
> > +
> > +        /* Deal with overlap */
> > +        start = MAX(ent->start & 0xffffffffffffffc0, query_start);
> > +        stop = MIN((ent->start & 0xffffffffffffffc0) + ent->length,
> > +                   query_start + query_length);
> > +        stq_le_p(&out->records[i].addr, start | (ent->type & 0x3));  
> 
> Shouldn't the mask here be 0x7?  I see we have not define Vendor Specific
> which I think is good but maybe better to allow it here?  I'm just not
> sure what is going to happen if someone comes along later and wants to
> use that value.

As things stand there is no way to inject a vendor defined poison entry
so expanding the mask has no affect.  However, it'll be one less change needed
if we ever add that support to the qmp interface so I'll make the change
as I'm respinning for your other feedback.

Given we've not supported anything vendor defined yet, I'm not that bothered
about adding the qmp support any time soon ;)

+ where else can poison come from?  It's either in the device or it's not
or it doesn't exist and was injected.  I'll be interested to see the arguement
for another source unless vendor defined really means 'I don't know'.

Thanks for the review and eagle eyed register checking :)

Jonathan




