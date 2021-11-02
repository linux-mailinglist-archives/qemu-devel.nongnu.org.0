Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913804430C1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:47:48 +0100 (CET)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhv4l-0007aO-O0
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhuoJ-0008NL-1n
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhuoF-0005bU-Tc
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635863441;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LE1Tvl8v65SAcDTQfkcLfP3vur1qhojh2EODPe1ml/s=;
 b=QPpkA+dZEBr9FJd2PryrpBYMMCLGsw++/EBj6uhgS5zKTFRcOzzAf4EaxzH2PJ3QaBe/w0
 eAucQCofVmv81ehvMdIfKeZCuAph2lVD7PVr4p8f5tsXz13PkunMcabz5eVJVttO+Jb+PF
 gLQ78zBR9tkpLZVKtly3baqrDkIIcQs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-UtoloUsYPEeTuN4yNvHXmw-1; Tue, 02 Nov 2021 10:30:40 -0400
X-MC-Unique: UtoloUsYPEeTuN4yNvHXmw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so4677920wro.19
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=LE1Tvl8v65SAcDTQfkcLfP3vur1qhojh2EODPe1ml/s=;
 b=tgKlgMFI45dQ/baqGJTfl9doW5NzfXVO+Cp6M1O4zsUwbSzH1YcyELrDqusrBDVqLx
 MkhURVr0igqJP11oluOpqPM7ZhJQpOP/CZESIdqqTKPYbN5KDwVURyVVl3z5D5EsTqO2
 f+DKvSuutAcXKKXpeyFfWfiFjbBIQCgLQJsEwRvcPBWHkwz7L0wicSQ320bsU0mOFwua
 meakgN+l1KrvBs0UuwJMWqstNq56J/XsfveU3JMHJQYUWA6zExX4PrsptfMqA9HIeZgF
 Cu3FNQCiy6l/61ASbCD3PfSdnQMkH7K6QWK9DWHM/TrvJKvvCKSEuHTYQ8+7OSFDVttX
 mVYA==
X-Gm-Message-State: AOAM532tZx7QEYi/0GRlSnb010DbyYrLdhD1DZPA5vm33ma40pYU3nRR
 G9Akqia7la8O2kYHR2fqJSg2bUGtyjTLl9KxyQ9WWMREzedRz+edQJPGf896a61INxK7lfCmnJb
 PyFxBe3wq/hpMvo4=
X-Received: by 2002:a5d:400e:: with SMTP id n14mr34479061wrp.368.1635863439342; 
 Tue, 02 Nov 2021 07:30:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQtVjWvKR9vGcnrhh1QuVMwSMHig10xgOMjorXbNWGj3ar0+bmSJqZaTmm5ZcyNYpQC2LI+w==
X-Received: by 2002:a5d:400e:: with SMTP id n14mr34479034wrp.368.1635863439127; 
 Tue, 02 Nov 2021 07:30:39 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id a9sm13480916wrt.66.2021.11.02.07.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 07:30:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: -only-migrate and the two different uses of migration blockers
In-Reply-To: <87sg0amuuz.fsf_-_@dusky.pond.sub.org> (Markus Armbruster's
 message of "Mon, 19 Jul 2021 13:00:20 +0200")
References: <87tukvaejt.fsf@dusky.pond.sub.org> <YPTj6ml6LoMJkypI@yekko>
 <87lf62ydow.fsf@dusky.pond.sub.org> <YPUn2quWrztTqyML@yekko>
 <875yx6oabe.fsf@dusky.pond.sub.org>
 <87sg0amuuz.fsf_-_@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 15:30:37 +0100
Message-ID: <875ytak4tu.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> wrote:
> We appear to use migration blockers in two ways:
>
> (1) Prevent migration for an indefinite time, typically due to use of
> some feature that isn't compatible with migration.
>
> (2) Delay migration for a short time.
>
> Option -only-migrate is designed for (1).  It interferes with (2).
>
> Example for (1): device "x-pci-proxy-dev" doesn't support migration.  It
> adds a migration blocker on realize, and deletes it on unrealize.  With
> -only-migrate, device realize fails.  Works as designed.
>
> Example for (2): spapr_mce_req_event() makes an effort to prevent
> migration degrate the reporting of FWNMIs.  It adds a migration blocker
> when it receives one, and deletes it when it's done handling it.  This
> is a best effort; if migration is already in progress by the time FWNMI
> is received, we simply carry on, and that's okay.  However, option
> -only-migrate sabotages the best effort entirely.
>
> While this isn't exactly terrible, it may be a weakness in our thinking
> and our infrastructure.  I'm bringing it up so the people in charge are
> aware :)

Hi

On the past, we have talked about this (but done nothing).

What we "thought" was to change save_complete() to just return the
equivalent of -EAGAIN, i.e. right now it is not a good time for doing a
migration, wait a little while and try again.

There is no code for that.

Fixing this will also help with latency issues.  When we move to the
complation stage, we have the equivalent of a sync in the block layer.
that can take a long time, but we don't have a way to timeout and get
back to normal migration and try it a bit later.

Later, Juan.


