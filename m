Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5431A665D49
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 15:07:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFbjX-00014s-BA; Wed, 11 Jan 2023 09:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pFbjJ-000131-AA
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:05:28 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pFbjG-00019X-5F
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:05:25 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NsTs841vCz67txK;
 Wed, 11 Jan 2023 22:02:36 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 14:05:11 +0000
Date: Wed, 11 Jan 2023 14:05:10 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 8/8] hw/cxl/events: Add in inject general media event
Message-ID: <20230111140510.00007963@Huawei.com>
In-Reply-To: <20230110153853.00000945@huawei.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
 <20221221-ira-cxl-events-2022-11-17-v2-8-2ce2ecc06219@intel.com>
 <20230103180719.00006437@huawei.com>
 <Y7xn0NNupucMou4b@iweiny-desk3>
 <20230110153853.00000945@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
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


> > > From an interface cleanliness point of view I'd rather see
> > > all the optional fields as optional.  That's done by marking them
> > > with a * so
> > > '*channel': 'int16'
> > > 
> > > Then the signature of the related qmp_cxl_inject_gen_media_event
> > > gains a boolean has_channel parameter (before channel)
> > > 
> > > Those booleans can be used to set the flags etc.    
> > 
> > Ah!  Ok cool.  Yes this would make a lot more sense.  I did not realize QMP did
> > this optional thing.  That makes scripting this easier as well!
> > 
> > Did you put all this on a branch or not?  I did not see anything new at:
> > 
> > https://gitlab.com/jic23/qemu.git
> > 
> > I can definitely respin but it sounds like you were going to make some changes.  
> 
> I got side tracked and reworked a few more things. Hopefully in have a branch
> up in a day or two.

Now pushed out as https://gitlab.com/jic23/qemu/-/tree/cxl-2023-01-11

My plan is to send the first 8 patches to Michael targetting upstream which includes
your uuid related patches from the start of this series.  The changes to RAS error
injection since previous tree are substantial to support multiple header logging.

I've made a few tweaks to your other patches on that branch including the optional
parameters stuff and some reworks I mentioned in this thread.

Note there is a dirty hack on top of that tree to deal with a build issue on my arch-linux
test box that I foolishly upgraded this morning.  Might break things on other distros
(version issue with curl).

Jonathan

> 
> Jonathan
> 
> > 
> > Ira
> >   
> > > 
> > > Very lightly tested: 
> > > 
> > > diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> > > index 4660a44ef8..cb9bb0b166 100644
> > > --- a/hw/mem/cxl_type3.c
> > > +++ b/hw/mem/cxl_type3.c
> > > @@ -1203,8 +1203,9 @@ void qmp_cxl_inject_gen_media_event(const char *path, uint8_t log,
> > >                                      uint8_t flags, uint64_t physaddr,
> > >                                      uint8_t descriptor, uint8_t type,
> > >                                      uint8_t transaction_type,
> > > -                                    int16_t channel, int16_t rank,
> > > -                                    int32_t device,
> > > +                                    bool has_channel, uint8_t channel,
> > > +                                    bool has_rank, uint8_t rank,
> > > +                                    bool has_device, uint32_t device,
> > >                                      const char *component_id,
> > >                                      Error **errp)
> > >  {
> > > @@ -1238,22 +1239,22 @@ void qmp_cxl_inject_gen_media_event(const char *path, uint8_t log,
> > >      gem.type = type;
> > >      gem.transaction_type = transaction_type;
> > > 
> > > -    if (0 <= channel && channel <= 0xFF) {
> > > +    if (has_channel) {
> > >          gem.channel = channel;
> > >          valid_flags |= CXL_GMER_VALID_CHANNEL;
> > >      }
> > > 
> > > -    if (0 <= rank && rank <= 0xFF) {
> > > +    if (has_rank) {
> > >          gem.rank = rank;
> > >          valid_flags |= CXL_GMER_VALID_RANK;
> > >      }
> > > 
> > > -    if (0 <= device && device <= 0xFFFFFF) {
> > > +    if (has_device) {
> > >          st24_le_p(gem.device, device);
> > >          valid_flags |= CXL_GMER_VALID_DEVICE;
> > >      }
> > > 
> > > -    if (component_id && strcmp(component_id, "")) {
> > > +    if (component_id) {
> > >         strncpy((char *)gem.component_id, component_id,
> > >                  sizeof(gem.component_id) - 1);
> > >          valid_flags |= CXL_GMER_VALID_COMPONENT;
> > > diff --git a/qapi/cxl.json b/qapi/cxl.json
> > > index 56e85a28d7..085f82e7da 100644
> > > --- a/qapi/cxl.json
> > > +++ b/qapi/cxl.json
> > > @@ -26,8 +26,8 @@
> > >    'data': { 'path': 'str', 'log': 'uint8', 'flags': 'uint8',
> > >              'physaddr': 'uint64', 'descriptor': 'uint8',
> > >              'type': 'uint8', 'transactiontype': 'uint8',
> > > -            'channel': 'int16', 'rank': 'int16',
> > > -            'device': 'int32', 'componentid': 'str'
> > > +            '*channel': 'uint8', '*rank': 'uint8',
> > > +            '*device': 'uint32', '*componentid': 'str'
> > >              }}
> > > 
> > >  ##
> > >     
> > > > +
> > > >  ##
> > > >  # @cxl-inject-poison:
> > > >  #
> > > >     
> > >     
> 
> 


