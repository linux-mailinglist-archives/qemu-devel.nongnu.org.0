Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE86C44E5A0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:33:24 +0100 (CET)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUo7-0002mn-Dr
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlUmZ-0001Gl-OW
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:31:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlUmW-00016c-Ir
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636716703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vN/Fu+GJXa3fskk8XkIlq+14Fi5o7Jrmx02H9bIiKl0=;
 b=P3iCeuHYcceMm0TN25F++eVTPtw8gsuf6DB5VJcVYaLjTiz7cjPMKUhuBmxS6H7aFQi5JK
 WAX/65gO42KQo0ix1IfvHVtYKfpKqkKX4BZWlETV8EpH+w09voCJhB9hhwFvrAm7do0TA+
 hszzew3dUSFYjAX2uGPJijcDIfGAXCY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-HrsdTHisPAuI_Zx_LqbyKQ-1; Fri, 12 Nov 2021 06:31:39 -0500
X-MC-Unique: HrsdTHisPAuI_Zx_LqbyKQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso6154344wme.5
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 03:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vN/Fu+GJXa3fskk8XkIlq+14Fi5o7Jrmx02H9bIiKl0=;
 b=EQIVAff80jkyBhX4fGh8jobeM9/8I9qgmePKDVsXddI+wQCs2qAgZwM6e13snSYIcG
 8m5mZ914QJNxEQEK3QV1Ijaei3dprydJKk8ISEGq5o57u7Jpo0mYpskgJylVgSIRTSet
 QBtNxha/P2KQqd1tU7DEOiF+Tk46dsE3NzuzHRnlR+4nnSqHZzOVWgvHI3LS4cPIzDpJ
 ftjGRZZpyHP0O1pIYnEh0HzHODo58pYzNiPjl0loMCtZZxIg73I8v0J6TDn9ktlVEocw
 ChflG1dv9Pxnf13bCXnLQqNIrbIry8x5VtR2aBrvHwrS0+dzyy065ys1aPn3XkSayu9U
 sP6Q==
X-Gm-Message-State: AOAM531dJo0hdvy6T3Q+VhKBfJD6hC+23bYGsziHclVMigE3mVhQ/0bu
 rIu4BwfoZm58pScJcXCxV9oGPUSBVTDIILsyBl06AtVYj3dX+Y/bGvvoZSWgjfIqeYaZ42tGPzV
 xGwImWX4i/xt84Ow=
X-Received: by 2002:a5d:6043:: with SMTP id j3mr17485355wrt.375.1636716698198; 
 Fri, 12 Nov 2021 03:31:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU7ByB2rNaGtwMCf7Wnr9a7MeFHh6IsuV9bqRRUXW029brQLYvsuPqWSQ5KAmL1aOWkPDO3Q==
X-Received: by 2002:a5d:6043:: with SMTP id j3mr17485320wrt.375.1636716698007; 
 Fri, 12 Nov 2021 03:31:38 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id a12sm5363933wrm.62.2021.11.12.03.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 03:31:37 -0800 (PST)
Message-ID: <702bbf7a-15f9-8be3-98f2-40a5eebdd5a1@redhat.com>
Date: Fri, 12 Nov 2021 12:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 03/25] assertions for block global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-4-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-4-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> All the global state (GS) API functions will check that
> qemu_in_main_thread() returns true. If not, it means
> that the safety of BQL cannot be guaranteed, and
> they need to be moved to I/O.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c        | 136 +++++++++++++++++++++++++++++++++++++++++++++++--
>   block/commit.c |   2 +
>   block/io.c     |  20 ++++++++
>   blockdev.c     |   1 +
>   4 files changed, 156 insertions(+), 3 deletions(-)

bdrv_make_zero() seems missing here – it can be considered an I/O or a 
GS function, but patch 2 classified it as GS.

Hanna


