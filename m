Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EED43C667
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 11:24:12 +0200 (CEST)
Received: from localhost ([::1]:49022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mffAJ-00036h-8R
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 05:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mff9N-0002Bx-S3
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 05:23:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mff9L-0006Ik-BW
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 05:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635326589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uj4Im57UYZb73bloQ6/FXUMgRkBsKA9LXcUTdaHhM2E=;
 b=FESuKgjXFWxurANy7uhtfFsoX0iNHGMIPbF3rPp/GXL/BbGpXCSHlEn8eZYCCakgBFxDaQ
 h3K/fZXZTwtDRGHoTisCrKTy5jU04WwVgKFUqPZxF3apV1vnN4NoGP5j9PvPEMc9hLTaGQ
 jHJ50SbYtOPYcFYHk/Jredji96VeBmA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-ObIkVlp3Pl-FUaM0I6ibBQ-1; Wed, 27 Oct 2021 05:23:08 -0400
X-MC-Unique: ObIkVlp3Pl-FUaM0I6ibBQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 m16-20020a056402431000b003dd2005af01so1749388edc.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 02:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uj4Im57UYZb73bloQ6/FXUMgRkBsKA9LXcUTdaHhM2E=;
 b=Oi8r/CRbGrJ+ZMgOyJt40gWBSQD0T8Ij8ls3Qd0n9JROSkXMEmusP+USHVhaDOE1SP
 IllzTfUOH8oycFgl+0/WVt64L9sRcpc/6BagvuXexBLtgkdSAzqJhf42fH4KtCfcq/F+
 aNCsyOjoxgyYSoarybF+XIGEmMpL6GvYjTZ8AJh3tsIJb5UYwh6zqyV5TTnSpWg5Q43n
 oB16NVf1TvOC4RDxInp2OgWpXw9JuGhsfnTEn3Vc5jhO/SEs72GLEnVhRvMtAmpTyShe
 afzDFJCVhg5uq8XJ+5iyhlHNTzPLmT+3MAfNfAxW/Wij6JWHKz1s0u47c1vRiDdw1Gs5
 3P3Q==
X-Gm-Message-State: AOAM5315g78iozn4ZnFw9l+COrIPea/H62Ji3YqkXU/wSmOYiH/UO5Fa
 2dYTpHx/rKZIkHTi+S4dUwzg+Ck62Zv8+jJMjZAko+IOB/bQjHhB1EH64HhFMBcTViciYxW9ZGw
 +hZV2f5+vQ4W1ny8=
X-Received: by 2002:a17:907:971e:: with SMTP id
 jg30mr36605098ejc.169.1635326587515; 
 Wed, 27 Oct 2021 02:23:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjC1fvqWcOdrlZAqdgwkTxgkMH5HOwKd+aJ+3w2ahaGywzQxRc+N//nwyL1TX8B5DWhvfgcg==
X-Received: by 2002:a17:907:971e:: with SMTP id
 jg30mr36605072ejc.169.1635326587302; 
 Wed, 27 Oct 2021 02:23:07 -0700 (PDT)
Received: from steredhat (host-79-30-88-77.retail.telecomitalia.it.
 [79.30.88.77])
 by smtp.gmail.com with ESMTPSA id jg36sm4888793ejc.30.2021.10.27.02.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 02:23:06 -0700 (PDT)
Date: Wed, 27 Oct 2021 11:23:04 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 1/3] file-posix: add `aio-max-batch` option
Message-ID: <20211027092304.43zhzjp5u6x66nbq@steredhat>
References: <20211026162346.253081-1-sgarzare@redhat.com>
 <20211026162346.253081-2-sgarzare@redhat.com>
 <87zgqvccqk.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87zgqvccqk.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 06:28:51AM +0200, Markus Armbruster wrote:
>Stefano Garzarella <sgarzare@redhat.com> writes:
>
>> Commit d7ddd0a161 ("linux-aio: limit the batch size using
>> `aio-max-batch` parameter") added a way to limit the batch size
>> of Linux AIO backend for the entire AIO context.
>>
>> The same AIO context can be shared by multiple devices, so
>> latency-sensitive devices may want to limit the batch size even
>> more to avoid increasing latency.
>>
>> For this reason we add the `aio-max-batch` option to the file
>> backend, which will be used by the next commits to limit the size of
>> batches including requests generated by this device.
>>
>> Suggested-by: Kevin Wolf <kwolf@redhat.com>
>> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>
>> Notes:
>>     v2:
>>     - @aio-max-batch documentation rewrite [Stefan, Kevin]
>>
>>  qapi/block-core.json | 7 +++++++
>>  block/file-posix.c   | 9 +++++++++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 6d3217abb6..fef76b0ea2 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -2896,6 +2896,12 @@
>>  #              for this device (default: none, forward the commands via SG_IO;
>>  #              since 2.11)
>>  # @aio: AIO backend (default: threads) (since: 2.8)
>> +# @aio-max-batch: maximum number of requests to batch together into a single
>> +#                 submission in the AIO backend. The smallest value between
>> +#                 this and the aio-max-batch value of the IOThread object is
>> +#                 chosen.
>> +#                 0 means that the AIO backend will handle it automatically.
>> +#                 (default: 0, since 6.2)
>
>"(default 0) (since 6.2)" seems to be more common.

Indeed I wasn't sure, so I followed @drop-cache, the last one added in 
@BlockdevOptionsFile.

I'll fix in v3 :-)

Thanks,
Stefano


