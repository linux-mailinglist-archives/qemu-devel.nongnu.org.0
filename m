Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395563936ED
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 22:16:05 +0200 (CEST)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmMQF-0001bS-RT
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 16:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lmMP0-0000fT-DL
 for qemu-devel@nongnu.org; Thu, 27 May 2021 16:14:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lmMOw-0000TR-4t
 for qemu-devel@nongnu.org; Thu, 27 May 2021 16:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622146481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TfFqkpdXU5ITKsnrSSvLfw+t+UaWVXd7zL80A+f02R4=;
 b=RRWdx1ntwzGe1lw4WCYmwVV01DJPfPAVgJoMYU6FaR2jHCUHz6RwWulZ2bYKyNYTcWCknB
 wkpNCqoabVMEZ+vOdRG5P61v2eQjJJdHVOYKbn4JbzXDNWg71zkwDoe4114kvWbuSoIWBG
 PifpZo/Uo5Co3OdVdcbHB+UNokfSkfk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-GP9zraCiPQ6LIIUE1EI74w-1; Thu, 27 May 2021 16:14:38 -0400
X-MC-Unique: GP9zraCiPQ6LIIUE1EI74w-1
Received: by mail-ej1-f72.google.com with SMTP id
 f7-20020a1709067f87b02903e18c4e1e85so475948ejr.20
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 13:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TfFqkpdXU5ITKsnrSSvLfw+t+UaWVXd7zL80A+f02R4=;
 b=XaL24it7pfTacfQJd0bNQfSgLIK3QFEssVz8qa0eQbVHWAHjKdnN6D89wgU1ewNK3U
 y5rkPeydcue2vFri/iXgv66h1jIPTroLKuzO4XY2YAvEU1RmUfDFUP4rDz6SDiJZXm4J
 ZLMr71LJO5PxCBzpQab3k6q962t4+vZMXPFjpWysCCX3RRRalji1a8vaOIQ0/THf9tRT
 VM+XyBoczRcpeUsDNBxfGFiNV6G7T22cmOhCrPcCJaMsab4j1Sp0jkxzU4Tr+GHnTCmX
 zLDizOVgHTyZrrfdoTFdp8idchqJgS1wYm3nAeT5vM8hXR6l8iUkMEqRPt/1ozMkq7i/
 edlw==
X-Gm-Message-State: AOAM5305bX6WPuj1yUU8jsZ3WWlYxLr4AOlgMrFFBuTce4JGP4GMEMqs
 vYVSQLoCIbiw9FMI4I6HzZmB1t4y7HombOEdmjwxtNvAu000aXeLOrodMyW7jHUoFe6+46izfnG
 PQiHpzEqVJrqqeKE=
X-Received: by 2002:a50:ff15:: with SMTP id a21mr6191981edu.103.1622146477156; 
 Thu, 27 May 2021 13:14:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybaHCzqc8csDxAgOBEnPpqmtkwNK4+HnqSNfmlOJASJe2LR43pkZQUASRF1c9DbbmAKcSBRA==
X-Received: by 2002:a50:ff15:: with SMTP id a21mr6191968edu.103.1622146476933; 
 Thu, 27 May 2021 13:14:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bm23sm1458737ejb.92.2021.05.27.13.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 13:14:36 -0700 (PDT)
To: Kevin Wolf <kwolf@redhat.com>
References: <20210524163645.382940-1-pbonzini@redhat.com>
 <20210524163645.382940-3-pbonzini@redhat.com>
 <YK/ABCylKztcARUz@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/6] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Message-ID: <5e4476a5-bfc6-b32b-3d80-bf075ba4d4b4@redhat.com>
Date: Thu, 27 May 2021 22:14:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YK/ABCylKztcARUz@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: nsoffer@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/05/21 17:51, Kevin Wolf wrote:
> Am 24.05.2021 um 18:36 hat Paolo Bonzini geschrieben:
>> bs->sg is only true for character devices, but block devices can also
>> be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
>> returns bytes in an int for /dev/sgN devices, and sectors in a short
>> for block devices, so account for that in the code.
>>
>> The maximum transfer also need not be a power of 2 (for example I have
>> seen disks with 1280 KiB maximum transfer) so there's no need to pass
>> the result through pow2floor.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Looks like this is more or less a revert of Maxim's commit 867eccfe. If
> this is what we want, should this old commit be mentioned in one way or
> another in the commit message?

It is (but it is not intentional).

> Apparently the motivation for Maxim's patch was, if I'm reading the
> description correctly, that it affected non-sg cases by imposing
> unnecessary restrictions. I see that patch 1 changed the max_iov part so
> that it won't affect non-sg cases any more, but max_transfer could still
> be more restricted than necessary, no?

Indeed the kernel puts no limit at all, but especially with O_DIRECT we 
probably benefit from avoiding the moral equivalent of "bufferbloat".

> For convenience, the bug report fixed with that patch is here:
> https://bugzilla.redhat.com/show_bug.cgi?id=1647104
> 
> Are we really trying to describe different things (limits for SG_IO and
> for normal I/O) in one value with max_transfer, even though it could be
> two different numbers for the same block device?

>> -static int sg_get_max_transfer_length(int fd)
>> +static int sg_get_max_transfer_length(int fd, struct stat *st)
> 
> This is now a misnomer. Should we revert to the pre-867eccfe name
> hdev_get_max_transfer_length()?

Yes.

>>   static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>>   {
>>       BDRVRawState *s = bs->opaque;
>> +    struct stat st;
>> +
>> +    if (fstat(s->fd, &st)) {
>> +        return;
> 
> Don't we want to set errp? Or do you intentionally ignore the error?

Yes, since we ignore errors from the ioctl I figured it's the same for 
fstat (just do not do the ioctls).

However, skipping raw_probe_alignment is wrong.

Thanks for the review!  Should I wait for you to go through the other 
patches?

Paolo


