Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806AC49DE67
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:49:18 +0100 (CET)
Received: from localhost ([::1]:58664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1P3-0005Yi-6Y
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1He-0003Pq-AP
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:41:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1Hb-00018n-JJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643276495;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=b3R08/D0Qe5OWLLh8asKZonaCRNtD+yxqTYXUKv5Vfs=;
 b=aJepPvHAY1Hy01koVOusBulu4gBANSByNV9onbspltcbvji2xLYw6R7eremw2luTaMUmG+
 LqeGo4C8YpbkDuqTZkezo65FB2LG7b48DkNGP/nTuXKLig02+Tk3s5DljemoiKZH+61g6X
 HWPvNbINM0tVWN4TUoz9g3+mVCghdmM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-JWoJx0nrPlilIqVgmXXm7A-1; Thu, 27 Jan 2022 04:41:33 -0500
X-MC-Unique: JWoJx0nrPlilIqVgmXXm7A-1
Received: by mail-wr1-f69.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so858330wrc.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=b3R08/D0Qe5OWLLh8asKZonaCRNtD+yxqTYXUKv5Vfs=;
 b=nbqru1WVnHzBD84NBX1XTMcfjBVOvaNop2M5uzfK1F7ne5qxqHD6qfDSglvzmOncKO
 Dojk0zGpN+1BQJSh43s8VGRmbsSGFRDseFHk7RGTuSpDnIHVaa8qoK71cjSidqYulbdn
 A/e/qZS2f7/+U3hngp9b+JigxVRkHil0fCcXh+FrGNbjrcvCqN/48CyquFSbRjtMpT6c
 YceCA0d3JiYJckTlv3ermZskUIhClSzLzYj9ZBTw9G2JuA9h8+OSllRFd15IMWHUwNgh
 MImX9su97phi+zlb2UO6jzkwXvmeKbZhOWcpOZBiFfzKEf4gaxGxL/EmMcftvyKfDigR
 z5fQ==
X-Gm-Message-State: AOAM531jWtmGD2oBL4oZ6HUgnmZ71GehMSfXP8eVw5gRVrhdoGbthtx0
 Pp5E6L0OTl/YB7O5ibh5w05gKOlgAsWi2P33QTydoGIidx64qOic22fQGQYGXCMaUU6CGgib6XJ
 ZyAyrb2he8ZemCAA=
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr2373507wrx.70.1643276492393; 
 Thu, 27 Jan 2022 01:41:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOWxJDj4PDGQctGI9uBWWdeOWACJulaSJ7BmIu5zC4Q4bbYGskvNZ0PkvQIkg95XHA6QXvlg==
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr2373488wrx.70.1643276492187; 
 Thu, 27 Jan 2022 01:41:32 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id h127sm6161987wmh.27.2022.01.27.01.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:41:31 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 05/15] migration: Simplify unqueue_page()
In-Reply-To: <20220119080929.39485-6-peterx@redhat.com> (Peter Xu's message of
 "Wed, 19 Jan 2022 16:09:19 +0800")
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-6-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 27 Jan 2022 10:41:31 +0100
Message-ID: <87lez1ldmc.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
> This patch simplifies unqueue_page() on both sides of it (itself, and caller).
>
> Firstly, due to the fact that right after unqueue_page() returned true, we'll
> definitely send a huge page (see ram_save_huge_page() call - it will _never_
> exit before finish sending that huge page), so unqueue_page() does not need to
> jump in small page size if huge page is enabled on the ramblock.  IOW, it's
> destined that only the 1st 4K page will be valid, when unqueue the 2nd+ time
> we'll notice the whole huge page has already been sent anyway.  Switching to
> operating on huge page reduces a lot of the loops of redundant unqueue_page().
>
> Meanwhile, drop the dirty check.  It's not helpful to call test_bit() every
> time to jump over clean pages, as ram_save_host_page() has already done so,
> while in a faster way (see commit ba1b7c812c ("migration/ram: Optimize
> ram_save_host_page()", 2021-05-13)).  So that's not necessary too.
>
> Drop the two tracepoints along the way - based on above analysis it's very
> possible that no one is really using it..
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.

I added the extra tracepoint that you added later.


