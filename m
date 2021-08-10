Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483283E7C18
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:24:48 +0200 (CEST)
Received: from localhost ([::1]:41840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTcV-0003LQ-9R
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTZz-0007Xe-QZ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTZy-0003wm-D4
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628608929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIhvvHEtW0p7zYgvN+Tlwmt5AWBL5xOvdkzJqpkDNAE=;
 b=diB6k6BShBxnLEg3W0blTxTVgkasb9j9sRFsblU4hXps7X+SyYOEctQmLPgE0gnO5NPhO+
 MItOvSrDO1YTmZyqhzlwjwAaTRV3nFYDstHqz4lRql3WyhGcJEv00WI2MGkF7LeiG3iDul
 Zo6wRD4m/NWZGVTG/CQ0XOzWAk58M74=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-N0oJkWkfNHmJ9s3hcWCc4w-1; Tue, 10 Aug 2021 11:22:08 -0400
X-MC-Unique: N0oJkWkfNHmJ9s3hcWCc4w-1
Received: by mail-wr1-f69.google.com with SMTP id
 d10-20020a056000114ab02901537f048363so6542875wrx.8
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gIhvvHEtW0p7zYgvN+Tlwmt5AWBL5xOvdkzJqpkDNAE=;
 b=a1oLOszBwRRna28vVjCiTf2Qw0fGkFDZhZkGqCsolTv33njm9+UHDlGwNUWseynTXb
 gD5omGDdFZ+V4sgcxhl7ut69QyrPQvzQ2zepVVHnamevm1XBlJrcnPTzoreZUffMMWTW
 v9lO9XqArIGltHj+q6Tpo5CJ8M0md/iUtIqO0iD82HhoZxcjo/IkToICoM437OKs8/RC
 u1aHd3HbmFTYeYWNu7yZ7a6vGaxrnCzFiho7c8P6vsCQLTq+PU4L+rY2xqU/4sUvA+IZ
 xu339LxdOqvxKkAFoGkJVS6aSqftba8pkFFa8g+tdhUwDdibHzBubES29PyJ9duPNMCy
 sayQ==
X-Gm-Message-State: AOAM530qaPyzbxkCY3nFf4wkn0FQ73hGcEEf4z8LfviV59aRz1GuaUYA
 0HTrtmlLz3ZMtdFePlQHKhuXnWnwWOwnks3LoMjfZaXimSFOHYy9zHRf1mNb/hlsTKwB6ta6Eyg
 mjzEFcsXPqo9IJ08=
X-Received: by 2002:adf:eac7:: with SMTP id o7mr31323669wrn.52.1628608927752; 
 Tue, 10 Aug 2021 08:22:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoyZhAMhROnf0uKkR7tlp3io6IyN8ZFZFuzWd7F2/GuHWvhur2mU+suyRvZuLm3wZqiAveMg==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr31323657wrn.52.1628608927639; 
 Tue, 10 Aug 2021 08:22:07 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 g35sm3594967wmp.9.2021.08.10.08.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:22:06 -0700 (PDT)
Subject: Re: [PATCH v2 20/33] block/block-copy: make setting progress optional
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-21-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <5a4ecbb2-186f-7a86-62b5-0516005a4d59@redhat.com>
Date: Tue, 10 Aug 2021 17:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-21-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.704, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> Now block-copy will crash if user don't set progress meter by
> block_copy_set_progress_meter(). copy-before-write filter will be used
> in separate of backup job, and it doesn't want any progress meter (for
> now). So, allow not setting it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/block-copy.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)

OK, looks a bit different because of the rebase on 
e3dd339feec2da3bcd82021e4ce4fe09dbf9c8b4, but R-b stands.

Hanna


