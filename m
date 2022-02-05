Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79B4AAAAF
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 18:46:04 +0100 (CET)
Received: from localhost ([::1]:42858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGP8M-0002GE-Mv
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 12:46:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGP5Q-0001Hu-Gg
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 12:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGP5M-00072B-Ih
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 12:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644082975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9SXO8fQyfMDO/23QiQ0kT+VmrxC3HLEjxoknDARGbvM=;
 b=HQ4LNOsrrRHgWdooJICdHOd3rL2Hi96f2crAiLLztxyNosY9NMQZnoHbC7lp2uWfQSkF4f
 HbfyLtV4w8L45sK6s35IG5GluQyiE/QcHKRd7nc7K76oByNhBcF2bVXlBM7SXbf8X5cJoR
 bX8hCJe6p1+xkerc2erFlIfKvUXSAzU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-Fh_z-B7bN5WLNYjRRWbJkQ-1; Sat, 05 Feb 2022 12:42:54 -0500
X-MC-Unique: Fh_z-B7bN5WLNYjRRWbJkQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so9046780wme.1
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 09:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9SXO8fQyfMDO/23QiQ0kT+VmrxC3HLEjxoknDARGbvM=;
 b=oKOavHkRdHa0u7h21JPcjsuQFv9oYiN9Mhr9Q1d/vYpm/V1PkfwRXT+3ZZ4SrlNHu5
 KPvuLWBdiyQadAOtEyCMGsV1m9TlDeSc6SspurHNpQi6NqFUeTQ5Dtp5XVRnPuzohLDL
 ESGfuTjI7SIbXhB7cQAJLjMsUKy6fq+LhB91xLD/kQkZ/oAykcIW87LHJi+e7xGD10QZ
 I7gDOfWlBUeUhsOJD/ShzYdYGZUcv0zI34A01Z33+ccZIsql0eGiuwcWZ6sgV5pZh6rU
 6ZnBeFVQ5cPi4dFU4fq6JLH86PppmsTbs8okrHKy+7QVWIMxNUo5QTbqgRsS2gZEaLtA
 r0IA==
X-Gm-Message-State: AOAM530kdxinOgrqxOq9vzvoeWHQsTWEzel96ciW5hQ++nHOdJxVpVb9
 EWMw2SMjxor0kD8FOxS4Cb0f8HfdEmsBa/shenFQ6oJ7OpFKU49f8prvbuUTsZkpxOrOhfyLkIp
 UUkQCD1JNxi2ccB4=
X-Received: by 2002:a05:6000:168f:: with SMTP id
 y15mr3777630wrd.367.1644082972790; 
 Sat, 05 Feb 2022 09:42:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFIXM7ZDplOG6w39wR89VE8KVw6f78REoo1ddY6ERzEZoKLd7bBEhomovhIIsoS5y/IWtQCQ==
X-Received: by 2002:a05:6000:168f:: with SMTP id
 y15mr3777621wrd.367.1644082972557; 
 Sat, 05 Feb 2022 09:42:52 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id m64sm4548733wmm.31.2022.02.05.09.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 09:42:51 -0800 (PST)
Date: Sat, 5 Feb 2022 12:42:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/32] virtio,pc: features, cleanups, fixes
Message-ID: <20220205124235-mutt-send-email-mst@kernel.org>
References: <20220205014149.1189026-1-mst@redhat.com>
 <CAFEAcA91cVDym5fVCXgHFHJ8fkt8GhrOis-EPHN6YWpVn9TOCA@mail.gmail.com>
 <20220205072452-mutt-send-email-mst@kernel.org>
 <CAFEAcA-RJ8OkwaXWx=bRHJCDoWrQvZbdSEuuyz1j9ZFod0kcfg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-RJ8OkwaXWx=bRHJCDoWrQvZbdSEuuyz1j9ZFod0kcfg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 05, 2022 at 01:31:17PM +0000, Peter Maydell wrote:
> On Sat, 5 Feb 2022 at 12:25, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sat, Feb 05, 2022 at 11:07:33AM +0000, Peter Maydell wrote:
> > > On Sat, 5 Feb 2022 at 01:42, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:
> > > >
> > > >   Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-request' into staging (2022-02-02 19:54:30 +0000)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > > >
> > > > for you to fetch changes up to 593a84174b09f0c8ae4d35ad014f93d1fb7cac00:
> > > >
> > > >   util/oslib-posix: Fix missing unlock in the error path of os_mem_prealloc() (2022-02-04 20:16:59 -0500)
> > > >
> > > > ----------------------------------------------------------------
> > > > virtio,pc: features, cleanups, fixes
> > > >
> > > > virtio introspection commands
> > > > Part of ACPI ERST support
> > > > fixes, cleanups
> > > >
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > > Fails to compile for 32-bit, Windows and macos because of format
> > > string issues in hmp-cmds.c. Here's a sample job with the errors:
> > >
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2058116754593a84174b0
> 
> > Just re-pushed with a fixup patch. Can you try again pls?
> 
> Tag still seems to be pointing at 593a84174b0 ?
> 
> -- PMM

my bad. pushed a the tag now.


