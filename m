Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D4C6A6FD7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:35:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOT9-0001ih-F3; Wed, 01 Mar 2023 10:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXOT6-0001hD-26
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:34:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXOT4-0003u8-MZ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677684849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dq1RwCYR+KJ9Q6VxPAd3pMkVtzXDFhIdUkxBJ5Jhcwc=;
 b=hgVg70PkRyCWPD0ueLZBVoSXVptJa6/9R1Rcv3ozfAPHCiXYYDmn3mB4oez0uwJdAWHT2r
 oCE85Yj1pukB5MKC3XtZyUjSNdNSXS32kWjb9Z9q9fjay9vuuZXv8O168hrmDDB9f+PQOW
 sbzSCNYVfNqZHDojudAW93Ye/ig/r8A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-jUkLnTMqNtu35qB-8tFniw-1; Wed, 01 Mar 2023 10:34:00 -0500
X-MC-Unique: jUkLnTMqNtu35qB-8tFniw-1
Received: by mail-wr1-f71.google.com with SMTP id
 a7-20020a056000188700b002cdd0562b11so240258wri.11
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677684839;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dq1RwCYR+KJ9Q6VxPAd3pMkVtzXDFhIdUkxBJ5Jhcwc=;
 b=J0Z1CQ2861KhX65bLLTEI5cIp02NtVIO9bWjuD6ruO3ewEdwGiHbQ1tk7oQDdBbrti
 Xtdj6D7FtcunlACeQJRjKgGsjq4WbnrWBXnJIXE/Yy5TJrl/Rfe0ES1pLna6af1TLVK/
 DKnZ6GZAaIv+iEhMaDaZHHhFCuxbj6JTfOoSOhYrgu/Y7+9FoJsO4hMy6/rWQlpQPSaz
 sraS7Ua+9PP2drPiedmI5qiliTyfuG6ZYXNIxT3AZeOcWxMU2sjhadwbVru5gwB2cZ6x
 4LqiT5ArPU+Phc2AXD2EW2mC5O0R5VjvbM07twGTv6e/xF7Sts/EnjLdOPVskdks+5GD
 xDYQ==
X-Gm-Message-State: AO0yUKUnMNs3th81gJ62XpQLmHMbwCRJp55cnukPBiPQTNceAgFG7ocL
 YsWfWYmUtDxeux+fahichNKj50Vy5LZ4iW5cagIjC4HB+/EM4aWCR8pY3ZeChPx9NieaT8m6u58
 iCSoCrPPgzekiQ7I=
X-Received: by 2002:a05:600c:16c4:b0:3db:15b1:fb28 with SMTP id
 l4-20020a05600c16c400b003db15b1fb28mr5971039wmn.19.1677684839559; 
 Wed, 01 Mar 2023 07:33:59 -0800 (PST)
X-Google-Smtp-Source: AK7set8YaIUy6SyRc3447C45+J8hOvrvgIJUM6g9YsZU+XPIrCp/1SX/RVF+GSzOCsXMJjxKeYVcHg==
X-Received: by 2002:a05:600c:16c4:b0:3db:15b1:fb28 with SMTP id
 l4-20020a05600c16c400b003db15b1fb28mr5971017wmn.19.1677684839237; 
 Wed, 01 Mar 2023 07:33:59 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c35c600b003dc4fd6e624sm17335422wmq.19.2023.03.01.07.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:33:58 -0800 (PST)
Date: Wed, 1 Mar 2023 10:33:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230301102757-mutt-send-email-mst@kernel.org>
References: <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 28, 2023 at 07:59:54PM +0200, Anton Kuchin wrote:
> We can't rely here entirely on
> destination to block this because if VM is migrated to file and then
> can't be loaded by destination there is no way to fallback and resume
> the source so we need to have some kind of blocker on source by default.

So I commented about a fallback. IMO it's just orchestrator being silly:
don't kill source qemu until you have made sure destination loaded the
file, or re-load it, and all will be well.


But a bigger issue that this highlights is simply that if migrating to
file you have no idea at all where will the file be loaded.  Maybe some
orchestrators know but I don't see how we can be sure all of them know.
The only time where we know whether the file is loaded on the same host
where it was saved is when we actually load it.

-- 
MST


