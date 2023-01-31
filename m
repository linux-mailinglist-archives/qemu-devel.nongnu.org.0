Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06068312B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:18:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsO0-0002yc-Ed; Tue, 31 Jan 2023 10:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMsNx-0002uy-G4
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:17:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMsNw-0005Oo-3d
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675178242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4YKJmiFaesOgK0IX2KtOQWBaDWh57i/+9uFHCgvH6oY=;
 b=QUkbLQlACnUVdOjRqQ+rEa9qV5kXdKx5LBaA0uuhDDySCuhNLaRmNcK1RMoxgIglpj2LF3
 4n5DHZFIYaLFFyrbFYRIneZjKVfJWDDkfjkAtWLIJPrxpPWZ7C1pdfqTSFJLxJzXhPS8GC
 5EojxxSrcDindCnB/MKA/iyp6lwylWA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-rDdSwbdwMC-zgipzPz46Tg-1; Tue, 31 Jan 2023 10:17:18 -0500
X-MC-Unique: rDdSwbdwMC-zgipzPz46Tg-1
Received: by mail-qt1-f200.google.com with SMTP id
 o16-20020ac841d0000000b003b689580725so6770139qtm.22
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 07:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4YKJmiFaesOgK0IX2KtOQWBaDWh57i/+9uFHCgvH6oY=;
 b=8NQFbAookBIlh9GH623pLTavlCM4jnCJf9hOOCoyr9B3vZyGCLRqTzf1D8QwqQLzXD
 3uzWFVKGQu1f8pG8gLq4Y3EYowGldOyxtuYVLwjd7hmpvADgvlKaUBtE2fXgFjDNGPz7
 UpokypNSUCPQ5SIRk41e2PkzD8B6ZdNkmdzctgaKQ9f47oVOKlIIJjToqkw2bu0oP8D8
 lwvEL6sKXJqfsx0LIGusuSI2jDDKN7s1oYcSB3WKYemqf5bf0fvETceo+/6IdTX5WEnG
 E5xTvYgxvopRz4X5/OSVM5FOwUlsXkU1KXtvqKbWKsXcKL3x2qgevqx/OaC+YytK9Kw4
 hkwA==
X-Gm-Message-State: AO0yUKWHWXZa3P1FnOLOIIapP9LOcwkPYOyI50E/ZrttD9RFoCnNsOQg
 fiUdWCxpvH4dQlkk1FHWXh1NeIsqxnzco6AUe0OMUgF/u/VvYvLFPL9nfsg8ZCfqoCkE5qc4uVm
 jpKyfc5idJi/+zKE=
X-Received: by 2002:ac8:4b65:0:b0:3b8:58d0:b4d4 with SMTP id
 g5-20020ac84b65000000b003b858d0b4d4mr6406974qts.2.1675178230840; 
 Tue, 31 Jan 2023 07:17:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9OU4z03iyEmlnh/1h/rtuRKaBzVjkNpJrZsM+UZr6uxmA2iYy3DAgRlNIpgB8+P0fGQw6j/A==
X-Received: by 2002:ac8:4b65:0:b0:3b8:58d0:b4d4 with SMTP id
 g5-20020ac84b65000000b003b858d0b4d4mr6406949qts.2.1675178230524; 
 Tue, 31 Jan 2023 07:17:10 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 a14-20020ac8720e000000b003afbf704c7csm9913888qtp.24.2023.01.31.07.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 07:17:09 -0800 (PST)
Date: Tue, 31 Jan 2023 10:17:07 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 lsoaresp@redhat.com, "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v6 0/2] check magic value for deciding the mapping of
 channels
Message-ID: <Y9kw85QnNfeRsdLX@x1n>
References: <20221220183616.228621-1-manish.mishra@nutanix.com>
 <f50993b5-716f-ffef-1d0d-2ce1bdd086fd@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f50993b5-716f-ffef-1d0d-2ce1bdd086fd@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 31, 2023 at 08:29:08PM +0530, manish.mishra wrote:
> Hi Peter, Daniel,
> 
> Just a gentle reminder on this patch if it can be merged, and really
> sorry i see now earlier reminders i sent were on v6[0/2] and somehow you
> were not CCed on that earlier. You were CCed just on v6[1/2] and v6[2,2]
> so that's why probably missed it.

Yes I think so.  For some reason I guess Juan missed this set when sending
the most recent PR. We should pick them up soon.

-- 
Peter Xu


