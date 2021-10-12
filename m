Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77C442A318
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:21:07 +0200 (CEST)
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFqD-00056k-EY
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFd1-0007hP-S1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFd0-0004JA-Hi
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634036845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1pIezMbhu/ZUJGvChjLsulZRhOSkNjEL3mJJJ0O4CI4=;
 b=cecOPtgX0ll8kAvndFXxHKZ1D5w+8nSGLjsHVsQrQnz8/WPl+R/4Xs5m2vkbX2ZVGUKBHG
 uLhhlavnD/Fxdo4lw4qxcYOjFEEotJB1hq1/nhKf4EIlIy7QosR53BWxz03bhiA8SxYr6n
 /QWVLx0P4Om08FMQgtV1NiqBrwzE0qA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-upZrqsa2PcyHVHD3Ls-Qig-1; Tue, 12 Oct 2021 07:07:04 -0400
X-MC-Unique: upZrqsa2PcyHVHD3Ls-Qig-1
Received: by mail-ed1-f71.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso18521921edj.20
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1pIezMbhu/ZUJGvChjLsulZRhOSkNjEL3mJJJ0O4CI4=;
 b=lTw8xlrvooxAUkgHUGbiL6IN0yqyZpxQoVyLVq1rCat/3SuH4asx575GBngk7MdVeQ
 UO/aDRUSLLDN9jO+rZPb/dDeyPqzzAwTH1rR3Tvnr+w0uhoD5Biy5Y2e69lWxMGrYY95
 ehSNA4tPy39ifo8M9CBcQFRQ4q5/tF9H7NYM91P1UZ8QFq9uZpsRhUCSL65sPOCwecwq
 HCXJRGsMdB8+epgse/Teto5xNlFevrNTSv+3f9SeSPhZzCarz/5WVkqs3t3PwT2J5mU/
 PlWqzLpovYk0eTknbLea0MbGbEqWRHP1w5eQuNIrbF+S9uMtpjfH3lQRlo4qp3AVpIq/
 SQ9g==
X-Gm-Message-State: AOAM531XFat6u5m6qLqNjf7xScotLjM4SL9RK+MEmktanTbjWFRCvF9W
 0ozi5KwPimyLIazCoSEr/TRDMpc4duNj+yxjLfDlcbEm5bZY36ygNAeHsdh/drl16DrFOt4IZUR
 ZG5AirtiW3UuF/Lg=
X-Received: by 2002:a50:a2a5:: with SMTP id 34mr49769827edm.207.1634036823467; 
 Tue, 12 Oct 2021 04:07:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVoCYuATPtxrZ77hKj72D1NW3RSZsKd12qJq4LYRE99en/lrWaXd2GuuQHmmManNLZBigHqg==
X-Received: by 2002:a50:a2a5:: with SMTP id 34mr49769801edm.207.1634036823313; 
 Tue, 12 Oct 2021 04:07:03 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oz11sm4726517ejc.72.2021.10.12.04.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 04:07:02 -0700 (PDT)
Message-ID: <c3614855-6d10-0ef2-a1c1-f304ef9828d2@redhat.com>
Date: Tue, 12 Oct 2021 13:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 14/25] include/systemu/blockdev.h: global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-15-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211012084906.2060507-15-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 10:48, Emanuele Giuseppe Esposito wrote:
> +/* Common functions that are neither I/O nor Global State */
> +
> +DriveInfo *blk_legacy_dinfo(BlockBackend *blk);
> +int drive_get_max_devs(BlockInterfaceType type);
> +

blk_legacy_dinfo should count as global state (blk->legacy_dinfo is 
protected by BQL).

Paolo


