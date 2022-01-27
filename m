Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBAF49DE48
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:43:23 +0100 (CET)
Received: from localhost ([::1]:46026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1JK-0004w8-C7
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:43:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1HJ-00034K-Ek
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:41:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1HI-00017U-0b
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643276474;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Y1ck0GyJZcwS6EaXwV1gwHdJJoHsak3GChHp6ApfJOA=;
 b=QcZnC3ZnXHxASNhhq5D69S84y/S7NHGA6nrywbKjl+bf0tn1KnqPWrqs8jX5mnJzicZuDf
 GPsHXCd+ns+tiLtWojvKajMPlS+9CwB9WQx23BQMwtRT3bROdjjcO24dGe2dWIJhk+NnM+
 86YiFygbnyOTSkjcc1GUXAalpZbd4qw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-2RizZrc3OoOKMFKurAajig-1; Thu, 27 Jan 2022 04:41:13 -0500
X-MC-Unique: 2RizZrc3OoOKMFKurAajig-1
Received: by mail-wm1-f72.google.com with SMTP id
 o140-20020a1ca592000000b00350aef3949aso453549wme.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Y1ck0GyJZcwS6EaXwV1gwHdJJoHsak3GChHp6ApfJOA=;
 b=eXsHnaNA2BKsprpAE4C3Kopa6ggvvRVh0W3PVczhr/ibD9NJjgLkU4onLdAHDt014+
 AkHrhBejYnry3qECh63Pn7FMzpn9nbX8D3Q2hwU5fDIaEGRIDFQ4Hn4kgqWZTl/kg5UA
 FIGOiwkHB2XkRZ/DBMVtpRsXlW3AASyW4gfsi+Pxbse56NAk03DcY+SIeJjsZb05Owjq
 9wV/Kc/kOC9CRa6I5MAbeWF7HUhl7v+MRWidN3W2TDQrTsP+Pkt99GMLONbZ4u9RxubF
 cEJFONcyajd0B12nORmoeKugX8ZZRK9YDgHxoMrDCtZIeQTjfWvS25/oCSMQWSGrZjms
 jJMw==
X-Gm-Message-State: AOAM530VtT7qyq78kwY9nLM7VyPfFubrYKLbl6ctRm1P9/ZaxX1SR+Ny
 ALUAZMVcoArF5rkLXLTawReSOTAWs1b2fchtFx3m3+gl8a8SmTrYi5RQthHQ+qidbfFifLZMbtp
 NyqPywYpAB7sETvk=
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr2327977wrs.471.1643276472104; 
 Thu, 27 Jan 2022 01:41:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwadI8yzHxT+dBvtmTUwQuSl3cuaRG1FzMVy6UuKt9pGdfIC7mABWi/sf9wUK7kTSya5al8Q==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr2327964wrs.471.1643276471936; 
 Thu, 27 Jan 2022 01:41:11 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id i17sm1615486wru.107.2022.01.27.01.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:41:11 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 04/15] migration: Add postcopy_has_request()
In-Reply-To: <20220119080929.39485-5-peterx@redhat.com> (Peter Xu's message of
 "Wed, 19 Jan 2022 16:09:18 +0800")
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-5-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 27 Jan 2022 10:41:10 +0100
Message-ID: <87pmodldmx.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> Add a helper to detect whether postcopy has pending request.
>
> Since at it, cleanup the code a bit, e.g. in unqueue_page() we shouldn't need
> to check it again on queue empty because we're the only one (besides cleanup
> code, which should never run during this process) that will take a request off
> the list, so the request list can only grow but not shrink under the hood.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>
queued


