Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F415743FB59
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 13:28:18 +0200 (CEST)
Received: from localhost ([::1]:46802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgQ3V-00080m-NX
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 07:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgQ1i-0007Fj-DM
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgQ1e-0004Y0-CI
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635506780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbkSlHbtwdX1q3BxXDbXODn1DxxCUz3xWCHFThK4NbY=;
 b=Y+fdTRmQABVz8XK0MpxJXCsjTzsENfwsC8EV86Y8xCo2YPlpYewW3SlfnFDEGncwMM3vja
 RnXQ715is1DllCyrbgeh84keXYtk2j1BPeW8Gae8FtnmnwS1DHAFpGhuSs7DZw/04M3UE3
 8C9EnVjaIXsUmN70t2a9H8MUVBSRHjM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-GEnaWUT7Mu6H8vfItVppGQ-1; Fri, 29 Oct 2021 07:26:19 -0400
X-MC-Unique: GEnaWUT7Mu6H8vfItVppGQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 125-20020a1c0183000000b003306ae8bfb7so1295895wmb.7
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 04:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FbkSlHbtwdX1q3BxXDbXODn1DxxCUz3xWCHFThK4NbY=;
 b=0/vnpJxu8/3X/NZOaijpFTh2fj8IappiVi8o2mB/PklSWGicDBQAfQZ+56LKEgPP1m
 yuwc/LURSWJM2ahCj4Wik6fEFUmFMVABEQUjbYaUUn+TcHeIrXHnz3IuWKYA6GcDGt82
 M+NwXjUHBqpqUh0hwPGWL4YNM9sPLfbVsO643GihF5Gjs1sBPPFBxupX5XPPWs/bMsFT
 xsOHy8CM16oJHxd4fQCaYjemlmioDtXapmQ60mhna8l/PJvdT+Lp7LVAfYZBhsWRlumV
 YT66djiay2KqU6vOw1QZ4hXEoJBScGFxN6DnxPmJwx8h85Je6jHgvOwVV14EKAJt6llS
 CV+w==
X-Gm-Message-State: AOAM531+Pq127XvZfei+EzYcnk7UkacyAxFztsrhYo5Oe6DrKz33vXJm
 vpkhmWvsRmd0RJ3AiYvw8CCLrgFY+7CxyfXGKqlxyOsb9FuS+t62JoUz0PI1F61hjF+Q/wP0jOv
 /3ZfKm+T5kBFVCqw=
X-Received: by 2002:a5d:58ed:: with SMTP id f13mr3126865wrd.373.1635506778361; 
 Fri, 29 Oct 2021 04:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYeQXXninl8nuhNJuTLD6xm/Ux86/drY1uv88o5PX7M/NaVFtLBootDPTWWMN3Q7FaRNGzaA==
X-Received: by 2002:a5d:58ed:: with SMTP id f13mr3126821wrd.373.1635506778163; 
 Fri, 29 Oct 2021 04:26:18 -0700 (PDT)
Received: from [192.168.20.130] (192.red-83-57-30.dynamicip.rima-tde.net.
 [83.57.30.192])
 by smtp.gmail.com with ESMTPSA id z18sm2131113wrq.11.2021.10.29.04.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 04:26:17 -0700 (PDT)
Message-ID: <7453ba81-3d0c-2ee5-3992-86ecda770755@redhat.com>
Date: Fri, 29 Oct 2021 13:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 14/22] qapi: introduce x-query-rdma QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-15-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-15-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info rdma" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hmp-commands-info.hx      |   2 +-
>  hw/rdma/rdma_rm.c         | 104 +++++++++++++++++++-------------------
>  hw/rdma/rdma_rm.h         |   2 +-
>  hw/rdma/vmw/pvrdma_main.c |  31 ++++++------
>  include/hw/rdma/rdma.h    |   2 +-
>  monitor/hmp-cmds.c        |  27 ----------
>  monitor/qmp-cmds.c        |  32 ++++++++++++
>  qapi/machine.json         |  12 +++++
>  8 files changed, 115 insertions(+), 97 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


