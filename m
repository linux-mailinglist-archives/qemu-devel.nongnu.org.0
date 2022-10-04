Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044CB5F46A8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:28:08 +0200 (CEST)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjq2-0005SG-34
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofj2R-000196-Kw
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofj2O-00068v-9e
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664894206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1zlabu88nVSW3ZQmbqxXESqxuC9mdf7gA1w/K9ROZM=;
 b=G6MOv6XIFVb3jGVyoM7v4As+lXVJof2t0pPZgQOPqHmQQHUSFnl+cKdCVp0gFjuQNg9B7m
 +aNnVm9tYpPEVtvr66ohXXQMHSJJ9EmfuHbHUCXTqAj3syM2AOwVC6uwCjLBvh/K0QcId1
 QJDVeuAhbzaqTcVbDxkaj7NJsTZ+IJg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-EztS2S5BObel-usRnfXAXA-1; Tue, 04 Oct 2022 10:36:44 -0400
X-MC-Unique: EztS2S5BObel-usRnfXAXA-1
Received: by mail-qk1-f200.google.com with SMTP id
 i7-20020a05620a404700b006ced0d02b68so11844334qko.10
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=/1zlabu88nVSW3ZQmbqxXESqxuC9mdf7gA1w/K9ROZM=;
 b=BbugwjaWchR/fXkKFwD/i0DtqbS5YFy3v0XZX1HBB2Eczrx7zlMduFXFN7Ecjv2/0v
 HQuq78P1V8EYWg5gmMgSX83kkkepk/GiKDcNwjBQa7BBphs67+UT6pbwhHOZeC0a6NaH
 iOIb3PyQNicyyDxqgurGbQtSxv7exqYjoNl5/e0Cp6riQvI0NzeW0blLewx570PN18MZ
 5q3cQ1k/yQaJbG3DgfxMrQUUU1rMcOoCuLeG3TJ0KNObzwUCSxYg9VskCIigZ9N8fscL
 smvqPIAWE0AUvXt/cML2DNLBeeMh1OU1J2eO7lun5qfitERME5iWMRYvJlFPyHmL2X64
 gE6Q==
X-Gm-Message-State: ACrzQf3vajh8QIk37UWpDVqe7RZJdSH8ua7cUhkMuqiGueYQH3FDEXxu
 A/udv/qdoJRjiuQwMxi1hpZKv1f+mzAezE2SD0Qz49MYUOUs4cYuPdT014eUdJ8qYD5eqOdICG+
 UZsG1NoZ/pQvDXzo=
X-Received: by 2002:a05:620a:4505:b0:6cf:9668:f274 with SMTP id
 t5-20020a05620a450500b006cf9668f274mr16904009qkp.603.1664894204520; 
 Tue, 04 Oct 2022 07:36:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40PPx3Jy9Sq2CnqMTfkKkOnLlQUY2tgzv1Gz80vNeiGu+X801ws/fs/AwZj0C6d+LJOtQODA==
X-Received: by 2002:a05:620a:4505:b0:6cf:9668:f274 with SMTP id
 t5-20020a05620a450500b006cf9668f274mr16903994qkp.603.1664894204268; 
 Tue, 04 Oct 2022 07:36:44 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 k19-20020a05620a415300b006ce60f5d8e4sm15054640qko.130.2022.10.04.07.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:36:43 -0700 (PDT)
Date: Tue, 4 Oct 2022 10:36:42 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, ani@anisinha.ca,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 04/14] migration: Remove RAMState.f references in
 compression code
Message-ID: <YzxE+vMT+FhNtyks@x1n>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225106.48451-5-peterx@redhat.com>
 <YzwQyty0Ds935+wr@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YzwQyty0Ds935+wr@work-vm>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 04, 2022 at 11:54:02AM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Removing referencing to RAMState.f in compress_page_with_multi_thread() and
> > flush_compressed_data().
> > 
> > Compression code by default isn't compatible with having >1 channels (or it
> > won't currently know which channel to flush the compressed data), so to
> > make it simple we always flush on the default to_dst_file port until
> > someone wants to add >1 ports support, as rs->f right now can really
> > change (after postcopy preempt is introduced).
> > 
> > There should be no functional change at all after patch applied, since as
> > long as rs->f referenced in compression code, it must be to_dst_file.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Yes, I think that's true - although I think we need to add checks to
> stop someone trying to enable compression+multifd?

We could.  I think they can be enabled and migration will just ignore the
multifd feature as ram_save_target_page() handles compress earlier.  Even
if save_compress_page() fails with -EBUSY we'll still skip multifd:

    if (!save_page_use_compression(rs) && migrate_use_multifd()
        && !migration_in_postcopy()) {
        return ram_save_multifd_page(rs, block, offset);
    }

Explicitly disable compression would be still cleaner, then we can even
drop above check on save_page_use_compression().  Slight risk of breaking
someone's config, but I don't think it should be majority.

If that looks good, I can add one patch for it (probably in the other
patchset, though, which I'll repost today).

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks!

-- 
Peter Xu


