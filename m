Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E09477730
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:10:38 +0100 (CET)
Received: from localhost ([::1]:54636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtL3-0001Ac-5A
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:10:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxtJW-0000Hh-6Q
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:09:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxtJU-0007cO-NC
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:09:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639670939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J2NNnJCSQ82JYx1CyQEB1vPR4ho20iVVqBFJ+50KW8Q=;
 b=UTMNt9XGefzSZdJJqDro/A5+JokX84qtt3MGKrqEzv/R+l5WVAmQl6xt+shDt9qNXvOW12
 I9BNnQ1zHjbOqsWPCQboE9iy0gIlzJZ1RWf4cuy00Q51vlkXSfYcFNirKtwcauypWX0Sth
 NxvFIGy7bUxZNZACPYJme4TXeib8eiY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-a0LnCq6EOk-kh_FewzCcUA-1; Thu, 16 Dec 2021 11:08:56 -0500
X-MC-Unique: a0LnCq6EOk-kh_FewzCcUA-1
Received: by mail-wm1-f69.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so1486133wma.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:08:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J2NNnJCSQ82JYx1CyQEB1vPR4ho20iVVqBFJ+50KW8Q=;
 b=hlM5S1wxBIpZuEXpy/7uotm6qZkW1z0yvSOhB1icdD9LsiHd3kpk8LtaqZF+tZ25z1
 h0QwHy4bpzzSWSsos4f8CnBKwuCOAngZOXOTpfLlE0ck0iefZA3pbcQBXe60wpBNRwC7
 Dph/qhIbji1Nj1Lu9i17ZbXJjyGJ6yfcXvql7/0nmqtJjWcLOTrFcMnkmDkFB/DUiQzE
 1vUOMImGzT3wmSX8zS3GjC+rGVq6rm9mRDveKalIWPjkdG0+fOLnMgjtHjGqUDUtoYKj
 PyB553HO3nxTsSpu+MSCOqjfgI5UPgaqlfNBqf8IM+tyAD50cAc3dQSuRGjxHx2IGQS8
 cjHQ==
X-Gm-Message-State: AOAM530MAnT26tEA4LTehpv9cvXrE0aXCUwWbp30jCBQnrCYzdv64t3m
 F0Yz1gpgUv/hmibl05UYjZxmntbHCpwqLCQEjo//Wbnv4VsjJwXWvMlpDEmrEsEy8OsIpdBn7vp
 mOli/lsXCDjzGjyY=
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr4192340wrv.651.1639670935408; 
 Thu, 16 Dec 2021 08:08:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsI3XszDsaajekufJYYG1WRFsspgIPWUAEi5sUKX7FNsoQFSw8Gaa7pBq6EacriRF7PBruVg==
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr4192306wrv.651.1639670935168; 
 Thu, 16 Dec 2021 08:08:55 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id e11sm6495119wrq.28.2021.12.16.08.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 08:08:54 -0800 (PST)
Message-ID: <2ed0053b-0868-b60e-7a55-2987ea5efccb@redhat.com>
Date: Thu, 16 Dec 2021 17:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 13/31] block.c: add assertions to static functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-14-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124064418.3120601-14-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
> Following the assertion derived from the API split,
> propagate the assertion also in the static functions.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 44 insertions(+), 1 deletion(-)

Looks good to me, just one small question:

> diff --git a/block.c b/block.c
> index 5516c84ec4..b77ab0a104 100644
> --- a/block.c
> +++ b/block.c

[...]

> @@ -1241,6 +1252,7 @@ static void bdrv_temp_snapshot_options(int *child_flags, QDict *child_options,
>                                          int parent_flags, QDict *parent_options)
>   {
>       *child_flags = (parent_flags & ~BDRV_O_SNAPSHOT) | BDRV_O_TEMPORARY;
> +    assert(qemu_in_main_thread());

Stylistically, it’s a bit strange that in other places, this assertion 
comes right after all local variable declarations, or after some 
assertions that are already present in that place; but here, it follows 
a normal statement.  Is that on purpose?

>   
>       /* For temporary files, unconditional cache=unsafe is fine */
>       qdict_set_default_str(child_options, BDRV_OPT_CACHE_DIRECT, "off");


