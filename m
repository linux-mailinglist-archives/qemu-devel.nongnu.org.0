Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DBD6DF682
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:09:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmaDT-0006kw-0B; Wed, 12 Apr 2023 09:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pmaDO-0006kU-Mk
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:08:47 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pmaDM-0006lA-Qp
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:08:46 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PxNJB2SG5z6H7r0;
 Wed, 12 Apr 2023 21:06:18 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Apr
 2023 14:08:40 +0100
Date: Wed, 12 Apr 2023 14:08:39 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>,
 "Huai-Cheng Kuo" <hchkuo@avery-design.com.tw>, Chris Browy
 <cbrowy@avery-design.com>, Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [PULL v4 23/83] hw/cxl/cdat: CXL CDAT Data Object Exchange
 implementation
Message-ID: <20230412140839.000062eb@Huawei.com>
In-Reply-To: <CAFEAcA-g0w4K6KfEP0MmHGRhL_8LmfxPBYiLSMG4KMakKHe=UA@mail.gmail.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-24-mst@redhat.com>
 <CAFEAcA-g0w4K6KfEP0MmHGRhL_8LmfxPBYiLSMG4KMakKHe=UA@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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

On Tue, 11 Apr 2023 16:52:58 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 7 Nov 2022 at 22:49, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Huai-Cheng Kuo <hchkuo@avery-design.com.tw>
> >
> > The Data Object Exchange implementation of CXL Coherent Device Attribute
> > Table (CDAT). This implementation is referring to "Coherent Device
> > Attribute Table Specification, Rev. 1.03, July. 2022" and "Compute
> > Express Link Specification, Rev. 3.0, July. 2022"
> >
> > This patch adds core support that will be shared by both
> > end-points and switch port emulation.  
> 
> > +static void ct3_load_cdat(CDATObject *cdat, Error **errp)
> > +{
> > +    g_autofree CDATEntry *cdat_st = NULL;
> > +    uint8_t sum = 0;
> > +    int num_ent;
> > +    int i = 0, ent = 1, file_size = 0;
> > +    CDATSubHeader *hdr;
> > +    FILE *fp = NULL;
> > +
> > +    /* Read CDAT file and create its cache */
> > +    fp = fopen(cdat->filename, "r");
> > +    if (!fp) {
> > +        error_setg(errp, "CDAT: Unable to open file");
> > +        return;
> > +    }
> > +
> > +    fseek(fp, 0, SEEK_END);
> > +    file_size = ftell(fp);  
> 
> Coverity points out that ftell() can fail and return -1...
> 
> > +    fseek(fp, 0, SEEK_SET);
> > +    cdat->buf = g_malloc0(file_size);  
> 
> ...which would cause an attempt to allocate a very large
> amount of memory, since you aren't checking for errors.
> CID 1508185.
> 
> Below, some other issues I saw in a quick scan through the code.
> 
> > +
> > +    if (fread(cdat->buf, file_size, 1, fp) == 0) {
> > +        error_setg(errp, "CDAT: File read failed");
> > +        return;
> > +    }  
> 
> (The issues in this bit of code I've mentioned in a
> different thread.)
> 
> > +
> > +    fclose(fp);
> > +
> > +    if (file_size < sizeof(CDATTableHeader)) {
> > +        error_setg(errp, "CDAT: File too short");
> > +        return;
> > +    }  
> 
> > +    i = sizeof(CDATTableHeader);
> > +    num_ent = 1;
> > +    while (i < file_size) {
> > +        hdr = (CDATSubHeader *)(cdat->buf + i);  
> 
> If the file is not a complete number of records in
> size, then this can index off the end of the buffer.
> You should check for that.
> 
> > +        cdat_len_check(hdr, errp);
> > +        i += hdr->length;
> > +        num_ent++;
> > +    }
> > +    if (i != file_size) {
> > +        error_setg(errp, "CDAT: File length missmatch");  
> 
> Typo: "mismatch"
> 
> > +        return;
> > +    }
> > +
> > +    cdat_st = g_malloc0(sizeof(*cdat_st) * num_ent);  
> 
> To allocate an array of N lots of a structure, use
> g_new0(), which will take care to avoid possible
> overflow in the multiply.
> 
> > +    if (!cdat_st) {
> > +        error_setg(errp, "CDAT: Failed to allocate entry array");  
> 
> g_malloc0() and g_new0() can never fail, so you don't need
> to check for a NULL pointer return.
> 
> > +        return;
> > +    }
> > +
> > +    /* Set CDAT header, Entry = 0 */
> > +    cdat_st[0].base = cdat->buf;
> > +    cdat_st[0].length = sizeof(CDATTableHeader);
> > +    i = 0;
> > +
> > +    while (i < cdat_st[0].length) {
> > +        sum += cdat->buf[i++];
> > +    }
> > +
> > +    /* Read CDAT structures */
> > +    while (i < file_size) {
> > +        hdr = (CDATSubHeader *)(cdat->buf + i);
> > +        cdat_len_check(hdr, errp);  
> 
> We already did this check the first time through the data...
> 
> > +
> > +        cdat_st[ent].base = hdr;
> > +        cdat_st[ent].length = hdr->length;
> > +
> > +        while (cdat->buf + i <
> > +               (uint8_t *)cdat_st[ent].base + cdat_st[ent].length) {
> > +            assert(i < file_size);
> > +            sum += cdat->buf[i++];
> > +        }
> > +
> > +        ent++;
> > +    }
> > +
> > +    if (sum != 0) {
> > +        warn_report("CDAT: Found checksum mismatch in %s", cdat->filename);
> > +    }
> > +    cdat->entry_len = num_ent;
> > +    cdat->entry = g_steal_pointer(&cdat_st);
> > +}
> > +
> > +void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp)
> > +{
> > +    CDATObject *cdat = &cxl_cstate->cdat;
> > +
> > +    if (cdat->filename) {
> > +        ct3_load_cdat(cdat, errp);
> > +    } else {
> > +        ct3_build_cdat(cdat, errp);
> > +    }
> > +}  
> 
> None of the callsites to this function check for it
> failing. In particular they do not assume "if I call
> this and it fails then I need to call cxl_doe_cdata_release()
> to have it clean up". It would probably be less confusing
> if the init function cleans up after itself, i.e. does not
> leave allocated memory pointed to by cdat->buf and so on.

Thanks Peter,

I'll wait for the other thread to resolve the follow up with
a patch set cleaning up remaining issues you've pointed out.

Jonathan

> 
> thanks
> -- PMM


