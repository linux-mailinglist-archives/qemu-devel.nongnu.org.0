Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D004EEEB5
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:59:57 +0200 (CEST)
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHoi-0001Rl-5H
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:59:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHkw-0004A6-Su
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHku-0003xp-6d
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648821359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPmq0/vgnkCzqx0S8E/9K+sJpzTIWGy6GVGKfMoBZMw=;
 b=AbV+paQiOMKalEpSbmVLNcfU489IjghhAFOYTtemypAEoj1l6yjMUNwoDG4mHfxFqYgOlz
 nckihe2gri9wtFpQQ+o0Fl1N8efqI66Og2dnTMT4sx2O+9BGjQbWmQvjbJ8lGqfFnL/ite
 MGPzp5RWzpuOntX4GcjUneJLQcZnFGA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-zjO5zM6gODuDhU4qi5z4aw-1; Fri, 01 Apr 2022 09:55:58 -0400
X-MC-Unique: zjO5zM6gODuDhU4qi5z4aw-1
Received: by mail-ed1-f72.google.com with SMTP id
 c31-20020a509fa2000000b004190d43d28fso1570257edf.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hPmq0/vgnkCzqx0S8E/9K+sJpzTIWGy6GVGKfMoBZMw=;
 b=TLH9JllZTyiIFBSsJ51Lp/m7uNSHTyCAbQ7GdxE0Cjba/F2mgCVuNURkiO3nblbFzQ
 AJ9LgWFUxzqktiIhjG8gGDD+sTXTUngAvZ5mE+7h9rJmcm/VOeyMH4CpNvyD3BS8mxo+
 KONW8Z366RwFO9KAhuxlomZLfovkgdGlXC8szBZUg33g1jv8iycgpPowh+ALnRVwHcWr
 WhTvP2v3nAlu3QY1dWrwEJUlTFM+B4PhLfOxmSRYv0mf5OESb37Y8Ijz5isvX31JvydA
 UNU98WWlrH0SD2D9fHEWObXo1hKCGKD+lFmOvS7BO/wZye8xyTJYMp6UPUxhaA1YFNp3
 mN2w==
X-Gm-Message-State: AOAM531mvqF5Zkhh2qEvJc5EyfrP65BJLVdfVCJcKi3meENhKCdsbdUv
 v0Hnd+tytI2hyEU9CnsotiR+Eb+iioMSzQpdoe8s6oJ9EY8VfUtvsFj6R84E9M1A2a4fi5onBmp
 2Dq/lzDhMDuUQGrY=
X-Received: by 2002:a05:6402:5162:b0:419:2d46:c8c3 with SMTP id
 d2-20020a056402516200b004192d46c8c3mr21468576ede.150.1648821357066; 
 Fri, 01 Apr 2022 06:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLc9nB1Ul5NJVkkYVZc5x2odIf+EiapS0PNdB8+N7z+4hiUSTwdCh5YhosMVpFLA/xRb245w==
X-Received: by 2002:a05:6402:5162:b0:419:2d46:c8c3 with SMTP id
 d2-20020a056402516200b004192d46c8c3mr21468564ede.150.1648821356818; 
 Fri, 01 Apr 2022 06:55:56 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 gq12-20020a170906e24c00b006e067c93e1bsm1052757ejb.39.2022.04.01.06.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:55:56 -0700 (PDT)
Message-ID: <3f31ab85-29c8-7e37-a4d0-f06dfcbc6db2@redhat.com>
Date: Fri, 1 Apr 2022 15:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] iotests/108: Test new refcount rebuild algorithm
To: Eric Blake <eblake@redhat.com>
References: <20220329091917.24512-1-hreitz@redhat.com>
 <20220329091917.24512-3-hreitz@redhat.com>
 <20220330150752.giunc3fr3kbmivex@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330150752.giunc3fr3kbmivex@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.22 17:07, Eric Blake wrote:
> On Tue, Mar 29, 2022 at 11:19:17AM +0200, Hanna Reitz wrote:
>> One clear problem with how qcow2's refcount structure rebuild algorithm
>> used to be before "qcow2: Improve refcount structure rebuilding" was
>> that it is prone to failure for qcow2 images on block devices: There is
>> generally unused space after the actual image, and if that exceeds what
>> one refblock covers, the old algorithm would invariably write the
>> reftable past the block device's end, which cannot work.  The new
>> algorithm does not have this problem.
>>
>> Test it with three tests:
>> (1) Create an image with more empty space at the end than what one
>>      refblock covers, see whether rebuilding the refcount structures
>>      results in a change in the image file length.  (It should not.)
>>
>> (2) Leave precisely enough space somewhere at the beginning of the image
>>      for the new reftable (and the refblock for that place), see whether
>>      the new algorithm puts the reftable there.  (It should.)
>>
>> (3) Test the original problem: Create (something like) a block device
>>      with a fixed size, then create a qcow2 image in there, write some
>>      data, and then have qemu-img check rebuild the refcount structures.
>>      Before HEAD^, the reftable would have been written past the image
>>      file end, i.e. outside of what the block device provides, which
>>      cannot work.  HEAD^ should have fixed that.
>>      ("Something like a block device" means a loop device if we can use
>>      one ("sudo -n losetup" works), or a FUSE block export with
>>      growable=false otherwise.)
> NBD might work for that purpose as well.  But no need to rewrite your
> test for yet another block-alike behavior ;)
>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/108     | 259 ++++++++++++++++++++++++++++++++++++-
>>   tests/qemu-iotests/108.out |  81 ++++++++++++
>>   2 files changed, 339 insertions(+), 1 deletion(-)

[...]

>> +if $loopdev; then
>> +    export_mp=$(sudo -n losetup --show -f "$TEST_IMG")
>> +    export_mp_driver=host_device
>> +    sudo -n chmod go+rw "$export_mp"
>> +else
>> +    # Create non-growable FUSE export that is a bit like an empty
>> +    # block device
>> +    export_mp="$TEST_DIR/fuse-export"
>> +    export_mp_driver=file
>> +    touch "$export_mp"
>> +
>> +    $QSD \
>> +        --blockdev file,node-name=export-node,filename="$TEST_IMG" \
>> +        --export fuse,id=fuse-export,node-name=export-node,mountpoint="$export_mp",writable=on,growable=off \
>> +        --pidfile "$TEST_DIR/qsd.pid" \
>> +        --daemonize
>> +fi
>> +
>> +# Now create a qcow2 image on the device -- unfortunately, qemu-img
>> +# create force-creates the file, so we have to resort to the
>> +# blockdev-create job.
> Huh. Why do we have 'qemu-img convert -n' but not 'qemu-img create -n'
> for writing a particular destination format into an already existing
> storage space?

`qemu-img convert -n` is actually different than what `qemu-img create 
-n` would be.  The former will not create the image format either, and 
so you can’t emulate the latter’s behavior with something like `qemu-img 
convert -n null-co:// target.qcow2`.

I think at some point I dabbled with a `qemu-img create -n`, but didn’t 
really get anywhere.  I don’t remember why, I think it had something to 
do with that if you don’t want to create the protocol layer, you will 
have to use the blockdev-create infrastructure, and can’t use 
bdrv_img_create().  So it all became a bit more complicated than I’d 
hoped for.

Maybe a `run-job` subcommand for qemu-img might be a reasonable stop-gap.

(Again, thanks for the review!)

Hanna


