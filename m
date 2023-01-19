Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83884673547
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:16:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIQMQ-0004xw-PD; Thu, 19 Jan 2023 03:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pIQLq-0004wK-AR
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:32:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pIQLn-00059B-6f
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674117132;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ds13oG1zYdV/jNih1bjngS8I96WrY0cUn41PSAOGAnM=;
 b=RTrjBgh9s4Ih4tfmdagjvpl+Z2YAC1+zndDpuLXoEWIbawG+6c+hL2PKtTqXY44yKITa8j
 gMb3ozL6Mcbcz4M5LI13C3s8rcbGnYIh5qnL+3VAcwpAfQMC3f8AsOclgIEFpvLqA6kjPg
 Cvbxgrk/3fYJl/+WqljETnqxzJJxKIs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-8r8ny8lAMPSc7f51cD1gow-1; Thu, 19 Jan 2023 03:12:43 -0500
X-MC-Unique: 8r8ny8lAMPSc7f51cD1gow-1
Received: by mail-wm1-f71.google.com with SMTP id
 p1-20020a05600c1d8100b003daff82f5edso824870wms.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 00:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ds13oG1zYdV/jNih1bjngS8I96WrY0cUn41PSAOGAnM=;
 b=Zqt8ssDwXs3UVs9EawxoX5zBOF22nrJvJIk6/Ci7pyA1XQ6vRW2lEAiLym7sRVRY2y
 Xw/HasC8i8V9hHHP4v7RpQeb0uF4Dikg6UxmWDZj6ibDnGc9mYV5N8GR5lMJEAcSz9Zk
 69sJ56JpfcchVtzr9JL22N8A93S72NJ3iHqeaSXiksefCBNMwoAy6Qt1ciodc/YiMyAi
 ypZg2KtlaXfUTFdqlsDAKJtZPpPUQwcJyulkX4TkWZiu55rZ6Y+ADfCArtQyQu8k0liL
 bgQ9ryHDM4ZzgAmr9UT7//6H4Z1bLxqCasL8fCQXJEHXESGsJQe2dePDqszxUTWoVc2G
 Eh2w==
X-Gm-Message-State: AFqh2kriovbddtqlrcgaX/ev2XhpKNdmCBC9FELgw6KwZ+XKONwW/fAD
 q8McGpbbjuoc4E8u32JyupeoWuhsrAKwcpQVO0bDXEJ5AzlZg4i9DKs+NMSofBhGTfGD767JDFg
 K5mVmuuBGgPLkeWs=
X-Received: by 2002:adf:ff90:0:b0:2bd:de40:3a45 with SMTP id
 j16-20020adfff90000000b002bdde403a45mr8263551wrr.51.1674115962390; 
 Thu, 19 Jan 2023 00:12:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvaYpJYThPkGE+Rd6/7/rQLDSkjwd5CVRuAJhF1hPHhir6qnVsLDLXgetDp48o9a/O574KaIg==
X-Received: by 2002:adf:ff90:0:b0:2bd:de40:3a45 with SMTP id
 j16-20020adfff90000000b002bdde403a45mr8263533wrr.51.1674115962105; 
 Thu, 19 Jan 2023 00:12:42 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5186000000b002bbddb89c71sm29449962wrv.67.2023.01.19.00.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 00:12:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Dr. David Alan Gilbert <dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>
Subject: Re: Who maintains util/userfaultfd.c?
In-Reply-To: <873587yqm7.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 19 Jan 2023 07:40:00 +0100")
References: <873587yqm7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Thu, 19 Jan 2023 09:12:39 +0100
Message-ID: <87v8l3hrig.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> commit 0e9b5cd6b238b7ca9a3a50d957f50c37082705a0
> Author: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> Date:   Fri Jan 29 13:14:04 2021 +0300
>
>     migration: introduce UFFD-WP low-level interface helpers
>     
>     Glue code to the userfaultfd kernel implementation.
>     Querying feature support, createing file descriptor, feature control,
>     memory region registration, IOCTLs on registered registered regions.
>     
>     Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>     Reviewed-by: Peter Xu <peterx@redhat.com>
>     Message-Id: <20210129101407.103458-3-andrey.gruzdev@virtuozzo.com>
>     Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>       Fixed up range.start casting for 32bit
>
> added util/userfaultfd.c without covering it in MAINTAINERS.  Only user
> is migration/ram.c, as far as I can tell.  Should it be added to
> MAINTAINERS section "Migration"?

Hi

It should be added to the Migration maintainers.  Who used to develop
in that particular corner is David.

Later, Juan.


