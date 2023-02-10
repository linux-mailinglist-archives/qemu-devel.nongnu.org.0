Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE7069244A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 18:18:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQX2P-0000je-QU; Fri, 10 Feb 2023 12:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQX2O-0000jV-9N
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:18:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQX2M-0000LE-Qz
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676049494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7z3PLu4lCZWvVsjGwmylwj3y7DxZB8zXqqZSy9meVwU=;
 b=DsD7XhzqaZQgi5zKt3w5fpbUrLgQRc9SKQNcDRl3idxfUdU8Bhw6CRAazXCWPmI1OFtRXO
 JK8E9X4YH1Qx2MdZAwTWb2DR5T+VpzpNv/XmePxWah/ygd9ZSrwveZWNTaWMasdGcXXOxa
 lQWC4845UiikVkHFGJQYBPllDeNIfAg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16--N1tiV7JOWGqlbBF1oH0xQ-1; Fri, 10 Feb 2023 12:18:12 -0500
X-MC-Unique: -N1tiV7JOWGqlbBF1oH0xQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 130-20020a370588000000b0072fcbe20069so3694225qkf.22
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 09:18:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7z3PLu4lCZWvVsjGwmylwj3y7DxZB8zXqqZSy9meVwU=;
 b=S0nF+3EaVAb0rYZ/Go+OMKaRp9vEPV/ctFwLiCjioUQvKZxGstzoqtkf//b4fEHUjw
 z0Q2iYB7BPcL6yCOu8NgQB152rvuWFsyV6CS5G/nar9hRQO7AJPJoC1EYcUVWMelWV3o
 puphj5GiZ96D1q+IKZR8ocCiKlMM/VTdqNoNlGYSN/PenCeg/HiWx5GV1iL9/XmeDc5m
 /P4skYnvLnC8AP2R0yl70jwttluu7NRYtBNNuBuds7FUAJR7uKtmxkZYENQopOpWpGDC
 S0cqdJfNGD0Vfz7TgVrPwmJU0UqQaaHzhvB6d/kLNOyH3loVZIAesbUx0vkV2ayYgdbm
 jEtA==
X-Gm-Message-State: AO0yUKXNzdDm2JMwBfEofsFN/yVr6ycjrhjbIHwe+XLzgmojbx6sBaCa
 T1cxe7v7ZTxcmPM1qtEAjTz0w2pHW87HqE1+Pewi2vfouVepi+fabIOxKHr0UbDMz0suOP3pAlt
 ycJ0YrRenEmdpDWg=
X-Received: by 2002:ac8:5809:0:b0:3b5:87db:f979 with SMTP id
 g9-20020ac85809000000b003b587dbf979mr33086135qtg.5.1676049491801; 
 Fri, 10 Feb 2023 09:18:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9GIHV333YbARYc+/P301jZDpLn8XvAHjKOLFvUGPIXPVOSGl6T56I4HAQ9xirtwfdEfr8DMw==
X-Received: by 2002:ac8:5809:0:b0:3b5:87db:f979 with SMTP id
 g9-20020ac85809000000b003b587dbf979mr33086095qtg.5.1676049491512; 
 Fri, 10 Feb 2023 09:18:11 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 i184-20020a3786c1000000b00719165e9e72sm3987475qkd.91.2023.02.10.09.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 09:18:10 -0800 (PST)
Date: Fri, 10 Feb 2023 12:18:10 -0500
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/4] migration/multifd: Change multifd_load_cleanup()
 signature and usage
Message-ID: <Y+Z8UgSgRNs8Umln@x1n>
References: <20230210063630.532185-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230210063630.532185-1-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Leo,

Please still provide a cover letter as long as >1 patches will be posted as
a set.

Not only because it still always help to provide an overview for reviewers
before reading each of them (e.g. I have a habit of prioritizing reviews
based on cover letters first), but also when you're confident enough the
reviewer(s) can ACK the patches in one reply. :-)

On Fri, Feb 10, 2023 at 03:36:28AM -0300, Leonardo Bras wrote:
> Since it's introduction in commit f986c3d256 ("migration: Create multifd
> migration threads"), multifd_load_cleanup() never returned any value
> different than 0, neither set up any error on errp.
> 
> Even though, on process_incoming_migration_bh() an if clause uses it's
> return value to decide on setting autostart = false, which will never
> happen.
> 
> In order to simplify the codebase, change multifd_load_cleanup() signature
> to 'void multifd_load_cleanup(void)', and for every usage remove error
> handling or decision made based on return value != 0.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


