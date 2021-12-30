Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02AC481DDF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 16:55:12 +0100 (CET)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2xln-0007YT-Ox
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 10:55:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xka-0006Dj-Ec
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:53:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xkY-0002ul-Oo
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640879634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5WBdadtyv8vwBqsDtVwfVLBxP0ZqC09RN4F0iSeJu4=;
 b=TXGoRZQAV6t4SYOa3JS28et14QpMalHfrZUeaVjXrFDN3jib2A2Vk6AiTJQkq0XaD9jYVT
 BsyXcjyF9KZPHrVFKbpkAl7uztgLBV1zSDTCX5fQdp1xsBK3GwMYdfKDR/4I27HiZSrz9M
 zw/fJH0GZrVyrUukb7KGHqclLCalhd0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-qk5_T1i6NlOo6KeNNYUPTA-1; Thu, 30 Dec 2021 10:53:52 -0500
X-MC-Unique: qk5_T1i6NlOo6KeNNYUPTA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b003458e02cea0so13595419wms.7
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 07:53:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V5WBdadtyv8vwBqsDtVwfVLBxP0ZqC09RN4F0iSeJu4=;
 b=DtfLLsOZ4K+/m6R8xMw6itKwNeNd95xDrdcXYc9RP2OSgs3chhmisPvnTDjaI1IVNm
 qZDL/Un6gs9C8XMvoVWnRQnKkc+GLLc+x9lsUrAtGuT2bHjjO9QW+DFDKS8264FNqTkC
 QYk9sgK6q47iJ1DfHHTfWTdT3e6aydxSA6XVbbSzUW+gvjexgA/Le2lsjeCp/ziH7Fum
 idulJ2lxF+KXfIruk3CPBQ8gPof9Z0fnVlNY0J2Y9e0aGbrY28qhFcdaFyjInIo3rxtI
 rDnxZ3liOD8qHyRoywREhK4clWHW2QXwGrd/iSkbSdwx7+WBf92Am60F5oYA1Sze30Xd
 GDVQ==
X-Gm-Message-State: AOAM530HdHx8owiuvFsrV5XhyVbxo1/tdXe/19eExB3h3MLr/tUAPpCE
 EKRlKc+qXTTtvAhHeRGj2z5l84Q8+Qno5we0X9odftdicrleX3HKXqBUUjLkCA2og6YyQtlZlMC
 a5Udw3QpFWAk3VIY=
X-Received: by 2002:a5d:6cd0:: with SMTP id c16mr25369713wrc.625.1640879631758; 
 Thu, 30 Dec 2021 07:53:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxegwzUw7LV/J9wYEZ+L6Nyet+AUxPc6sSypiDqL5H0bfpi0wVyDQ6u4W4A118lAg5JBxUiPQ==
X-Received: by 2002:a5d:6cd0:: with SMTP id c16mr25369698wrc.625.1640879631620; 
 Thu, 30 Dec 2021 07:53:51 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id p18sm4407986wms.16.2021.12.30.07.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 07:53:51 -0800 (PST)
Message-ID: <b84cf18f-f759-802c-832d-4a81edc749c4@redhat.com>
Date: Thu, 30 Dec 2021 16:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 1/8] migration: Drop dead code of
 ram_debug_dump_bitmap()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211224065000.97572-1-peterx@redhat.com>
 <20211224065000.97572-2-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211224065000.97572-2-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/21 07:49, Peter Xu wrote:
> I planned to add "#ifdef DEBUG_POSTCOPY" around the function too because
> otherwise it'll be compiled into qemu binary even if it'll never be used.  Then
> I found that maybe it's easier to just drop it for good..
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/ram.c | 39 ---------------------------------------
>  migration/ram.h |  2 --
>  2 files changed, 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


