Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A74329695
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:07:57 +0100 (CET)
Received: from localhost ([::1]:45096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGz8O-0000bW-Rm
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGz5U-0007wJ-Q6
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:04:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGz5R-00025w-GU
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614668692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2+pGBmjBmynjX4fIEzeFpHq+AI2WMuimDZ8nZ0FDp4=;
 b=QTCNYNM+GNosOAMTH15io9C4VGq/4lXm+0/QL8a7svHixkyAEqa9uma5i4E1QJqAgM8+Xr
 7XENdTkTdBOGiY7EpUOe2m9WwWu76Tqnbt3hwN9IJVLyhQ1QolKTHWVGdQOMaDB/rGDAgG
 psjpT3hDoaqfpE9KmCoCGpyUoHI8BfY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-tvFqdKsnMLioBhBBtfn01A-1; Tue, 02 Mar 2021 02:04:49 -0500
X-MC-Unique: tvFqdKsnMLioBhBBtfn01A-1
Received: by mail-ej1-f71.google.com with SMTP id h8so7427308ejx.12
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 23:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p2+pGBmjBmynjX4fIEzeFpHq+AI2WMuimDZ8nZ0FDp4=;
 b=Bu6cYP+LPwLKdh4I7QqsydbeYFXM8lJfZERm3Hy1apMZjYIiVilLAH01wwJLtskK7K
 H9Ki1pBl2Xyxz07xReBUKYLF6a6V/eXo5ywY8K9JIQovDDvOusseEj/CKbeoKKEidCsV
 dgi2F5yRaqLrblPXRp2GNPqjxQbofojew9cdypkyiebboVbsfOFn6v8Ft420/Lq/Nzh2
 OCRVMNhOvPvj3I2MVDbEJ0OyT2rkUZOdkQP4nY5wb+rKdQ4+9Wfa9g6sGYgve6OH+S02
 eWt85xT7KE/wuNsVK0C995g65U93S10vrEMCFelqEohBzvABkeC180X2Ib3XWKTPxFX3
 yCxw==
X-Gm-Message-State: AOAM533WUcbOmzVyB4a00/bp+9FysrB2SZlp9mZxV+YBlBJ91Jef/d9d
 gmY8g661gWQAAF4xGHIgUTwCJkUkjpKuQdGqZSYdVQ6G8nTHsYhseNIf6g8Nicw7Z/mMiWemlVT
 qMUPYLJokmt/oyiA=
X-Received: by 2002:a17:906:6817:: with SMTP id
 k23mr18928988ejr.6.1614668688510; 
 Mon, 01 Mar 2021 23:04:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNWMmqwh7aYSXAHFhRcE68MxZHWYc/I+Pd8ViuRswICxej7+nynhY+VKByKOhZNcMHosTZsg==
X-Received: by 2002:a17:906:6817:: with SMTP id
 k23mr18928964ejr.6.1614668688337; 
 Mon, 01 Mar 2021 23:04:48 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r10sm15745592edd.49.2021.03.01.23.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 23:04:47 -0800 (PST)
Subject: Re: [RFC PATCH v2 3/3] hw/block/pflash: use
 memory_region_init_rom_device_from_file()
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210301115329.411762-1-philmd@redhat.com>
 <20210301115329.411762-4-philmd@redhat.com>
 <YD0uvW+vzfQjBecY@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bc4b3dee-4af4-7ce2-aeaa-70c0cfde679f@redhat.com>
Date: Tue, 2 Mar 2021 08:04:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YD0uvW+vzfQjBecY@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, David Edmondson <david.edmondson@oracle.com>,
 haibinzhang <haibinzhang@tencent.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 7:13 PM, Stefan Hajnoczi wrote:
> On Mon, Mar 01, 2021 at 12:53:29PM +0100, Philippe Mathieu-Daudé wrote:
>> If the block drive is read-only we will model a "protected" flash
>> device. We can thus use memory_region_init_rom_device_from_file()
>> which mmap the backing file when creating the MemoryRegion.
>> If the same backing file is used by multiple QEMU instances, this
>> reduces the memory footprint (this is often the case with the
>> CODE flash image from OVMF and AAVMF).
>>
>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/block/pflash_cfi01.c | 39 +++++++++++++++++++++++++++++++--------
>>  1 file changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
>> index a5fa8d8b74a..ec290636298 100644
>> --- a/hw/block/pflash_cfi01.c
>> +++ b/hw/block/pflash_cfi01.c
>> @@ -702,6 +702,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>>      int ret;
>>      uint64_t blocks_per_device, sector_len_per_device, device_len;
>>      int num_devices;
>> +    bool romd_mr_shared_mapped;
>>  
>>      if (pfl->sector_len == 0) {
>>          error_setg(errp, "attribute \"sector-length\" not specified or zero.");
>> @@ -743,19 +744,41 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>>          pfl->ro = 0;
>>      }
>>  
>> -    memory_region_init_rom_device(
>> -        &pfl->mem, OBJECT(dev),
>> -        &pflash_cfi01_ops,
>> -        pfl,
>> -        pfl->name, total_len, errp);
>> -    if (*errp) {
>> -        return;
>> +    if (pfl->ro && pfl->blk) {
>> +        BlockDriverState *bs = blk_bs(pfl->blk);
>> +
>> +        /* If "raw" driver used, try to mmap the backing file as RAM_SHARED */
>> +        if (bs->drv == &bdrv_raw) { /* FIXME check offset=0 ? */
> 
> Bypassing the block layer is tricky because there are a lot of features
> that conflict (you already pointed out the offset= option). Checking
> bdrv_raw is not enough because the underlying protocol driver could be
> GlusterFS, iSCSI, etc.

OK.

> I think the goal here is to avoid changing the command-line/QMP so that
> users don't need to modify their guests. Therefore changing the pflash
> qdev properties is not desirable (we could have added a separate code
> path that bypasses the block layer cleanly).

Yes, this is the limitation.

> This seems like a
> worthwhile optimization that the block layer should support. I suggest
> adding a new API like:
> 
>   /* Returns a filename string if @blk supports read-only mmap */
>   char *blk_get_read_only_mmap_filename(BlockBackend *blk, Error **errp);
> 
> Then block/raw-format.c would forward the call to bs->file and
> block/raw-posix.c would implement it by returning a new filename string
> when bs->read_only is true.

Thanks :) Kevin suggested something similar too.

> 
> FWIW this API isn't perfect because the file could be reopened with QMP
> and the existing mmap would remain in place.

Can you show me a QMP example or point me at the command?
This shouldn't happen with the pflash.

Thanks for reviewing,

Phil.


