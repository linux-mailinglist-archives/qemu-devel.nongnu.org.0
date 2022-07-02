Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43C2563ED6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:33:23 +0200 (CEST)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Wh0-0000xX-Py
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o7WcO-0007FN-CC
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o7WcM-0005XP-Dt
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656743312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Bu8PA6TjFQDYZSB+vGBTRLUGKAmYz6o0lJVjggtQ34=;
 b=QexpU+sjd4ZhD/PLkKtWO0hpfuoZ/PL5WFl2SDHgd0rj1idcT6b5snVyDuGm0ohCE190xz
 SWLy+GTPj3G5aU3mjK79e6kXQJ4ZuLuX4goDFzjz27G2xd1e8T7SuEHomjPrjOJLc9nwTO
 QvM5dwhPYL8xvrS//oXa17P+fRG/fmE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-FKWc941qNXqkEqcdwLeT8A-1; Sat, 02 Jul 2022 02:28:31 -0400
X-MC-Unique: FKWc941qNXqkEqcdwLeT8A-1
Received: by mail-ed1-f70.google.com with SMTP id
 q18-20020a056402519200b004358ce90d97so3133541edd.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 23:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0Bu8PA6TjFQDYZSB+vGBTRLUGKAmYz6o0lJVjggtQ34=;
 b=c/qkkt3jQTBhOPuYr0bt95mdjCMzKgny6tF5NXDg98dOAA/j13gbNQXBZv7R/f5Udy
 CO9SyBbnGShdQjltl7Ym2Cj6s05cs/O8QM9wyYlORUOxYVYSDiIOMnh2dwdnz9hLcoby
 IdlUe9CCJ/u6/uBdXWKRh6/u9Rmo1FB+qIyOL9d400ufaRWahMFn2pK1yHfZNTCepwci
 VkSfk3I3BdtGCPt23sNwrMUPHFmBSZAXikvcfmKTfy4TAr3Xx8tfuOhKHbfy2SZnfuFD
 z6prFSO4AU7OvI8egegMD1ohAQvdZCoOsr8NBzeTVqUtf8BKqoNPrbxE589w55gAlaU2
 91vg==
X-Gm-Message-State: AJIora/0fwjVL2vE/uboOGXT2mFMnEfO52GK41AhKoMRPfpA2SxplUI3
 IBN+WLmKqaL8fMguRbF0mx7W0Mk+iQC4HU0wrCQF7B0gzV7+IfJcgu5YSNnsFSVmlaUhHApE8MT
 xNi9RFwk45//8roE=
X-Received: by 2002:a17:907:9812:b0:726:3e5b:d299 with SMTP id
 ji18-20020a170907981200b007263e5bd299mr18367517ejc.26.1656743309498; 
 Fri, 01 Jul 2022 23:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sAmhQq7MBYKLhTnK5snnrxKtTtKroqLodBqz71wtuk3+A9HMjHGtyGAwDcW/S9KFvYIEQ5RQ==
X-Received: by 2002:a17:907:9812:b0:726:3e5b:d299 with SMTP id
 ji18-20020a170907981200b007263e5bd299mr18367504ejc.26.1656743309305; 
 Fri, 01 Jul 2022 23:28:29 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 f7-20020a170906048700b00722e5e54fc2sm11476142eja.12.2022.07.01.23.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 23:28:29 -0700 (PDT)
Message-ID: <97fefcd3-831a-2f3a-69a1-dabe7fcd58df@redhat.com>
Date: Sat, 2 Jul 2022 08:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 03/12] pc-bios/s390-ccw/bootmap: Improve the guessing
 logic in zipl_load_vblk()
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-4-thuth@redhat.com>
 <7d12be9bea18be40e16fe5411c768c051dd4078d.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <7d12be9bea18be40e16fe5411c768c051dd4078d.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 01/07/2022 17.36, Eric Farman wrote:
> On Tue, 2022-06-28 at 15:10 +0200, Thomas Huth wrote:
>> The logic of trying an final ISO or ECKD boot on virtio-block devices
>> is
>> very weird: Since the geometry hardly ever matches in
>> virtio_disk_is_scsi(),
>> virtio_blk_setup_device() always sets a "guessed" disk geometry via
>> virtio_assume_scsi() (which is certainly also wrong in a lot of
>> cases).
>>
>> zipl_load_vblk() then sees that there's been a
>> "virtio_guessed_disk_nature"
>> and tries to fix up the geometry again via virtio_assume_iso9660()
>> before
>> always trying to do ipl_iso_el_torito(). That's a very brain-twisting
>> way of attempting to boot from ISO images, which won't work anymore
>> after
>> the following patches that will clean up the virtio_assume_scsi()
>> mess
>> (and thus get rid of the "virtio_guessed_disk_nature" here).
>>
>> Let's try a better approach instead: ISO files always have a magic
>> string "CD001" at offset 0x8001 (see e.g. the ECMA-119 specification)
>> which we can use to decide whether we should try to boot in ISO 9660
>> mode (which we should also try if we see a sector size of 2048).
>>
>> And if we were not able to boot in ISO mode here, the final boot
>> attempt
>> before panicking is to boot in ECKD mode. Since this is our last boot
>> attempt anyway, simply always assume the ECKD geometry here (if the
>> sector
>> size was not 4096 yet), so that we also do not depend on the guessed
>> disk
>> geometry from virtio_blk_setup_device() here anymore.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   pc-bios/s390-ccw/bootmap.c | 25 +++++++++++++++++++++----
>>   1 file changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
>> index 56411ab3b6..3181b05382 100644
>> --- a/pc-bios/s390-ccw/bootmap.c
>> +++ b/pc-bios/s390-ccw/bootmap.c
>> @@ -780,18 +780,35 @@ static void ipl_iso_el_torito(void)
>>       }
>>   }
>>   
>> +/**
>> + * Detect whether we're trying to boot from an .ISO image.
>> + * These always have a signature string "CD001" at offset 0x8001.
>> + */
>> +static bool has_iso_signature(void)
>> +{
>> +    if (virtio_read(0x8000 / virtio_get_block_size(), sec)) {
> 
> Certainly unlikely, but virtio_get_block_size is able to return zero.

Right ... I guess I'd better add a check for this here.

  Thanks,
   Thomas


