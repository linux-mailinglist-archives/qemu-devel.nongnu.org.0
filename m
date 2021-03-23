Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6AB346255
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:07:53 +0100 (CET)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOidM-0001OE-KK
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lOibY-0000LS-OF
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lOibX-00037O-B6
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616511958;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Qmj97rjvukiZQXStNLtjrqOF+gonfJqLw/T6ZtqqzOE=;
 b=MPBHg7J03pUZBj0p+L3/l5304EUQCJennUnsLfxe9N+cCIFAg1oCPfzhrn8BvR0ZGuiudF
 yDiLI66dtzMUGvUztL30Lfjx0ds09uo17OX5Kq7YIc2T9EggG5wlBit5zLOWVHiu+oWDEw
 PsPqyZcZxPDrjnEpUIJsnvb2Tmz1nKQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-Ndnbyg_LOIm79zhLhdFYhA-1; Tue, 23 Mar 2021 11:04:48 -0400
X-MC-Unique: Ndnbyg_LOIm79zhLhdFYhA-1
Received: by mail-wr1-f69.google.com with SMTP id o11so1234848wrc.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Qmj97rjvukiZQXStNLtjrqOF+gonfJqLw/T6ZtqqzOE=;
 b=UBjvDtBR3fVjYlL1HluI8mnu1gm6+FlZfE0UmvWd1HchTo7r6mJW/oFsRYXQdT4gax
 mfPcT4pLWLINrwI+Gk0xDpwquG73vLtpymPORZ3cvwzp+qRXIeUbuvH+UdQu0NQ/+sxf
 pfxcgoXUVb5An72n67k/GY8wc4Ly4nEfBDvWgmL1rmZOa/CKtY0aDXdr444zg6tOme5m
 viLnRf+w2JhMUNADnzW7qe69jpumxwySzRFSY4oaQUExnnYyB04vLGlO/zUalZKrQgxj
 147XZSH47/9b2ZviUW1RDHd1BVk0D5za/RkHDCMK1+VwIALfViLW+XyJreoFwLYpcf/h
 Ce2Q==
X-Gm-Message-State: AOAM530sG6unrPUb3QlO92hhrNqfzTGv+8itsj05U+erYGJw/IiwpV+H
 JSMMa/iuomVDdDrzspqFtEhauMj4Vuzf7LyeKCjZ/ZwLociUzQtHgzjakhQPa7jI6yJcJ2Hj8Tb
 TLGHdv6Gmxy8pR04=
X-Received: by 2002:a1c:6241:: with SMTP id w62mr3793357wmb.79.1616511887074; 
 Tue, 23 Mar 2021 08:04:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYrD/o0IwHv5v0lalFAHz1HL3sCJV7Y7H49pFfkM2MhdOEvRvZgcAX70FsG8AWmWh2TwKlGw==
X-Received: by 2002:a1c:6241:: with SMTP id w62mr3793334wmb.79.1616511886864; 
 Tue, 23 Mar 2021 08:04:46 -0700 (PDT)
Received: from localhost ([94.248.65.59])
 by smtp.gmail.com with ESMTPSA id e8sm2971008wme.14.2021.03.23.08.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:04:46 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v2] meson: Propagate gnutls dependency to migration
In-Reply-To: <20210320171221.37437-1-jrtc27@jrtc27.com> (Jessica Clarke's
 message of "Sat, 20 Mar 2021 17:12:21 +0000")
References: <20210320164730.33285-1-jrtc27@jrtc27.com>
 <20210320171221.37437-1-jrtc27@jrtc27.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Tue, 23 Mar 2021 16:04:48 +0100
Message-ID: <87mtutewrz.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jessica Clarke <jrtc27@jrtc27.com> wrote:
> Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
> for softmmu configs, which pull in migration's use of gnutls.
>
> This fixes the following compilation failure on Arm-based Macs:
>
>   In file included from migration/multifd.c:23:
>   In file included from migration/tls.h:25:
>   In file included from include/io/channel-tls.h:26:
>   In file included from include/crypto/tlssession.h:24:
>   include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
>   #include <gnutls/gnutls.h>
>            ^~~~~~~~~~~~~~~~~
>   1 error generated.
>
> (as well as for channel.c and tls.c)
>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I would preffer to be the other way around, i.e. modularize tls out of
migration, but a fast look at it shows it as a big job.  As said on the
commint message, channel.c & tls.c both use tls not conditionally.
Once there, multifd.c also requires tls compiled in.
Can we realistically build qemu without tls nowadays?

Later, Juan.


