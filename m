Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C637D395AFD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 14:54:10 +0200 (CEST)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnhQn-000337-BY
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 08:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnhPC-0002CV-Ix
 for qemu-devel@nongnu.org; Mon, 31 May 2021 08:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnhP9-00012y-Jh
 for qemu-devel@nongnu.org; Mon, 31 May 2021 08:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622465545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofZGdjBXnxwxMRNpXPi7QdUm/aRz77ZAcFGZaj5PnMc=;
 b=LANHiTUt8mdzSLNQKgiqXjYAb4QuJNjy9o0Doi+0FYFSY4tggj1w3fUwsB40rGNPxJ/+SP
 J+9Ns79IWC3IJmhEfIfZFSpv0zOZJPPwVvPXj/MTNXIyeFBv1pHj2/6b4iNpztRVACjDEH
 RnapKzAHBuaNv5MRn0xWReCpkYH2/R0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-KwO5BD9yOg6WjqS7Wd87UA-1; Mon, 31 May 2021 08:52:24 -0400
X-MC-Unique: KwO5BD9yOg6WjqS7Wd87UA-1
Received: by mail-ej1-f72.google.com with SMTP id
 nd10-20020a170907628ab02903a324b229bfso2425813ejc.7
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 05:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ofZGdjBXnxwxMRNpXPi7QdUm/aRz77ZAcFGZaj5PnMc=;
 b=WfvHClIkEFERER/JyvvRasubz6mzvYk4UjwiR2JBhoHqOFjWQ6YjsykZ0a5L+0eP+y
 9rMIogwY1b4KLhCqVdL1czg/gv7Ip37epGwYqdo2uMnT5jeuSgNpCMYyeDYSMtOICK3r
 5ALokEx4KaqeDH/TNZj2O0eXoot01lDC7tp47rlzsteZ5oShGm3/PkWzk4RXV2uerLJv
 UH4atA+tTkcXcVIY5cSqgPuHURNbvdQX1/P7mk/Z21VDisQxuSHw1R3KjzkWoDNgIES7
 cK3n9PEmuS2iaTfewEZPD5UTCAnYfQsD1I594R/dYZz546kNW+TNNmSVkfiFwC1XCtx3
 vTRg==
X-Gm-Message-State: AOAM532q5qo0643Qv5hou14Dz4+gMvVlKMelQWGAVPfOLYibIzu0lLuq
 VHvMI1h0oYVhRTRZrlz7N9YobW3IaG+546a2sFy6osAYgx8wjCYiAo5eRvnxl+MS5gv4oW8Pg1V
 u6CpEdTGb3AvYdaM=
X-Received: by 2002:a50:9e2e:: with SMTP id z43mr24846151ede.70.1622465543123; 
 Mon, 31 May 2021 05:52:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8D9PBgE4lApJBXDEe9Qsng/tJAVcVufIXHiGRNuu29Mb4TSKtAkpzwiZAOqo1v1EbYQKIAQ==
X-Received: by 2002:a50:9e2e:: with SMTP id z43mr24846115ede.70.1622465542806; 
 Mon, 31 May 2021 05:52:22 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 m19sm7039553edd.12.2021.05.31.05.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 05:52:22 -0700 (PDT)
Subject: Re: [PATCH v2 01/33] block: rename bdrv_replace_child to
 bdrv_replace_child_tran
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-2-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <bab73153-0faa-e5bf-2a71-4ecb87e2e7e0@redhat.com>
Date: Mon, 31 May 2021 14:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-2-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> We have bdrv_replace_child() wrapper on bdrv_replace_child_noperm().
> But bdrv_replace_child() doesn't update permissions. It's rather
> strange, as normally it's expected that foo() should call foo_noperm()
> and update permissions.
>
> Let's rename and add comment.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)


Reviewed-by: Max Reitz <mreitz@redhat.com>


