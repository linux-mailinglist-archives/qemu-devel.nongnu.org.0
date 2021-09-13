Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B4E408944
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:42:39 +0200 (CEST)
Received: from localhost ([::1]:38088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjQ6-0000PT-7t
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPjO8-0007E1-40
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPjO6-0006g7-Hi
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631529633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHe257iJ5+fR1q8l3Ohg1DPA7ASfQHlRDw8cq8+KLj4=;
 b=fi60hzOnrMpBBQbpCv5+WnLOy2PqsAwBfgyViZ+scaNAHUiv+Gh0J4L/E9dRz6rT0aOt4k
 c1REqSndIPGdZHBis4Eb6V+VtVsKgJ0hz6JYCCqozuNI0s4bhABTG1KhJK00kpneQa1Vm2
 Q0HjSvjfLNx8uaoDooKbi+m1fRN57jM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-BTdelidDO1CaHg8dTBTtHw-1; Mon, 13 Sep 2021 06:40:31 -0400
X-MC-Unique: BTdelidDO1CaHg8dTBTtHw-1
Received: by mail-wr1-f69.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so780605wrt.21
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 03:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hHe257iJ5+fR1q8l3Ohg1DPA7ASfQHlRDw8cq8+KLj4=;
 b=6o5YmcyS3UOed48e1jD3DhDL1H7cXXCPlUG6bgDtcj9VVuY4kfhJT/FBSQNO3n8V/u
 N4Nio3CHidDnkWTl6gyIMqEOsD0KSio1av2uMa1ht2DoJMEYSZu0o/0gwlNTFkDAaZU+
 oj3V0wiIZnmRakg0gqHjOZ2dADIshjWuXB9OzKZqN74ELKzs9hC0ATAy3cIPvoraUXKu
 ZE3AwKCHcI/be1HNqgzVjnpJBFMigFwgYh0wKx2OMmZtPq6rnB6sVpSdsqukzDshs2fI
 3yC746zRvKuMM1lBpMzRk/AaztD8u8oBaEn97ka3HQG2vXbwWA4SJ5smfSX03rRqDgx1
 Z1Jg==
X-Gm-Message-State: AOAM531T6M2k6uQToAupbBl2tfd6FDXUihIU4gl4N67mWxxTBHBnkAaD
 MLMbsxyAk5OLMN65Z+v5WYFmlwliCvdcMYmvpa5mtYKftb/P2pviJpGsqiQzmxKr/j+1XaTIAV1
 aYCVGUQoTHdLuVnc=
X-Received: by 2002:adf:ce03:: with SMTP id p3mr11869485wrn.261.1631529630650; 
 Mon, 13 Sep 2021 03:40:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlNA6Ed0nJBdbgBxsWLlMF8GGhJI3k9bK3vf/AxjO15GMJUoUjgn8s3W1x/sxcJBjIDgiSgQ==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr11869467wrn.261.1631529630505; 
 Mon, 13 Sep 2021 03:40:30 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id c17sm1483856wrn.54.2021.09.13.03.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 03:40:30 -0700 (PDT)
Subject: Re: [PATCH v2 02/17] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-3-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <7492a84f-4ce2-9145-81d8-cbfa53305aa3@redhat.com>
Date: Mon, 13 Sep 2021 12:40:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720113832.586428-3-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
> Adding support of IMGOPTS (like in bash tests) allows user to pass a
> lot of different options. Still, some may require additional logic.
>
> Now we want compression_type option, so add some smart logic around it:
> ignore compression_type=zstd in IMGOPTS, if test want qcow2 in
> compatibility mode. As well, ignore compression_type for non-qcow2
> formats.
>
> Note that we may instead add support only to qemu_img_create(), but
> that works bad:
>
> 1. We'll have to update a lot of tests to use qemu_img_create instead
>     of qemu_img('create'). (still, we may want do it anyway, but no
>     reason to create a dependancy between task of supporting IMGOPTS and
>     updating a lot of tests)
>
> 2. Some tests use qemu_img_pipe('create', ..) - even more work on
>     updating
>
> 3. Even if we update all tests to go through qemu_img_create, we'll
>     need a way to avoid creating new tests using qemu_img*('create') -
>     add assertions.. That doesn't seem good.
>
> So, let's add support of IMGOPTS to most generic
> qemu_img_pipe_and_status().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/iotests.py | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


