Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D93865DB38
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 18:25:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD7Ul-0002hh-Rc; Wed, 04 Jan 2023 12:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pD7Uj-0002hE-Pw
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 12:24:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pD7Uh-0007sv-Jt
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 12:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672853041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+fbscNjl8kB8+/aweqlu8Rh7fmqFtY4TlB1L9/evAVg=;
 b=TApe5lHKBKhaMVosSm7rNmX0XB+ZbTyYY+Mljo5HIjZQ1rpoHGjWl7Pg9EvZPkJp+BZd8i
 zboJ/yYqNJbFzNw3/NzaRCq1oF/62LzSNtXPoAQB9JOobjQU2gpCl5WtWjCbfGTHzUA+YR
 skOdAZCSJZxrF3ZaFNesrvtTyzjUimY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-VhcPSUFeM3u37yeGH_aV9g-1; Wed, 04 Jan 2023 12:24:00 -0500
X-MC-Unique: VhcPSUFeM3u37yeGH_aV9g-1
Received: by mail-qk1-f199.google.com with SMTP id
 bm30-20020a05620a199e00b006ff813575b1so23522039qkb.16
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 09:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+fbscNjl8kB8+/aweqlu8Rh7fmqFtY4TlB1L9/evAVg=;
 b=zkvA3H7NMvYfpWQOTpbxZmzc6037u5pyC2PnqT9L+9FKJuTwpqqlYoF9GNafkJFuqB
 Go15vZV9frOle7yMlA6ujIQ43CXalpF9hnV8mMIRZGCg77MCD/3SB5f6eQbdiLDLhAfv
 AkeXECUolcXQkFwFWySYcNqmUdxt86eX+mkxZ+XnMdWqogu90HN1R2hb50BBtINoRUAT
 7/UORvU3k0TZxlqUq6gufkOCUSoZjc/z2qN9YoX4gzJABbLPCdnT6NWNLh8/eg6j4t2o
 NzlTHY1z/bI6KBOEcLPtub6baOk6UAXyP1pdfSHIQ9B6zFOjpFueCg7BYz4z1Sn0ttuJ
 5tXQ==
X-Gm-Message-State: AFqh2koiGulUpcu6QpEzbgnSONj7SHOh/eI2nRgI99RVWsnQNCzJGwB/
 NsyW4SzsW4IWy5fxbKtmb/PPbwzt6orHSLuAwwiz2RJVeMlHzm7V/1emEGKZMt6FvsGFXclx7QV
 yEDznZecLQlBmvBk=
X-Received: by 2002:ac8:4519:0:b0:39c:da20:609 with SMTP id
 q25-20020ac84519000000b0039cda200609mr67803972qtn.19.1672853040000; 
 Wed, 04 Jan 2023 09:24:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXviDAtad8aZ7oHcrTJUmI7K547Lf65X7f3QHf8O5O22MnDuvGpF2GH+BnfBTAszer/lZO+reQ==
X-Received: by 2002:ac8:4519:0:b0:39c:da20:609 with SMTP id
 q25-20020ac84519000000b0039cda200609mr67803954qtn.19.1672853039781; 
 Wed, 04 Jan 2023 09:23:59 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 gc11-20020a05622a59cb00b003a50d92f9b4sm20637836qtb.1.2023.01.04.09.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 09:23:59 -0800 (PST)
Date: Wed, 4 Jan 2023 12:23:58 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
Message-ID: <Y7W2LtO5/m1r3VaL@x1n>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221222110215.130392-2-david@redhat.com>
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

On Thu, Dec 22, 2022 at 12:02:10PM +0100, David Hildenbrand wrote:
> Migrating device state before we start iterating is currently impossible.
> Introduce and use qemu_savevm_state_start_precopy(), and use
> a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
> state will be saved in qemu_savevm_state_start_precopy() or in
> qemu_savevm_state_complete_precopy_*().

Can something like this be done in qemu_savevm_state_setup()?

Thanks,

-- 
Peter Xu


