Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F5F642CCD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 17:29:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2EKq-0003CW-Iq; Mon, 05 Dec 2022 11:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2EKo-0003C0-Tj
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 11:28:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2EKn-0004Dx-Cz
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 11:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670257728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1H2u5IQW77IX4rsv+0lir34838s3eV6vMnaX5cymjJ4=;
 b=IZ7X8mfFWHGOXBBPKNq7piHJPhkaYHdlSwYqqFSfrm3g0WH1865GFE7fDrzopq7eu3kSMR
 OsuymrQrd4rl68eex0nNUP/rT3S1PLQdKOnBssG/cyfoRQNO2RblQlpeDPTckc7Fgq3g7y
 AXsui5AytHfFPHXLutWSShekgGhS9ec=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-597-2qvBSoyUPCO5TNUNK_h3Cw-1; Mon, 05 Dec 2022 11:28:39 -0500
X-MC-Unique: 2qvBSoyUPCO5TNUNK_h3Cw-1
Received: by mail-qv1-f69.google.com with SMTP id
 u15-20020a0cec8f000000b004c704e015f7so30035206qvo.1
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 08:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1H2u5IQW77IX4rsv+0lir34838s3eV6vMnaX5cymjJ4=;
 b=2D6G/6zu16WwAFQWKh+91e+o+1N+smH/Uz8+xzX1A7lAROropkgp1FMD7HIaF4GfbB
 Am199+OSFRqguvj+ZIBdhODzLa/pvy2G0wu4XvsOPJPog7cESLmPbVqKaUkxH8cIPsKM
 oCAzg5Sv4V1IIGQU7KjkgkCrFchxagbt0AhDw0faxYg/DUiVOSFkRBGI91oYGGz0OwK7
 r9o2MHpu87yCJNLS0mbtgA0A6t2K9Y2t0r0rAR5u6SPxztFe8OYbgzCUAz2hWQwayA+J
 U3QfY54incGnTSKolD5RuMa1phuZ9SG8Ow+BrHKVTZEmXKyAHKrNX+b+/0Iu1B37EJ1C
 iOgQ==
X-Gm-Message-State: ANoB5plQKRUYw2QHVvJEGTg0VJVsaGv/FCZ1Uq/cN1OtL8FbidvHP7yx
 OvqSLkFtlHUG8dYfvJpHBAc5cdY7qNLncXeMxGsb+hB5dX6kX76C3xXs00hrAg9yR1i2GjgtgV1
 hr9La+S1a3wPtFu8=
X-Received: by 2002:ad4:5347:0:b0:4b9:e098:e334 with SMTP id
 v7-20020ad45347000000b004b9e098e334mr63699824qvs.38.1670257719392; 
 Mon, 05 Dec 2022 08:28:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7O84e1Ee57tTLoQOw/JuoT0rFAxHEb807g9YVz6s4LM3DvXVFd7h1qDgfILh/gBAVOcTKVyw==
X-Received: by 2002:ad4:5347:0:b0:4b9:e098:e334 with SMTP id
 v7-20020ad45347000000b004b9e098e334mr63699800qvs.38.1670257719102; 
 Mon, 05 Dec 2022 08:28:39 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 r16-20020ae9d610000000b006e42a8e9f9bsm4688121qkk.121.2022.12.05.08.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:28:38 -0800 (PST)
Date: Mon, 5 Dec 2022 11:28:37 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] migration: reduce time of loading non-iterable vmstate
Message-ID: <Y44cNenFueVE4RFW@x1n>
References: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
 <Y3+egjXTvLEHDjuT@x1n>
 <7e5c5d6c-8f23-c0c5-5f5c-5daad854c2e7@bytedance.com>
 <Y4Ty07M/HN9UnsGb@x1n>
 <1adf426d-a9c8-9015-383b-3e82eb6b7c54@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1adf426d-a9c8-9015-383b-3e82eb6b7c54@bytedance.com>
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

Chuang,

No worry on the delay; you're faster than when I read yours. :)

On Mon, Dec 05, 2022 at 02:56:15PM +0800, Chuang Xu wrote:
> > As a start, maybe you can try with poison address_space_to_flatview() (by
> > e.g. checking the start_pack_mr_change flag and assert it is not set)
> > during this process to see whether any call stack can even try to
> > dereference a flatview.
> > 
> > It's just that I didn't figure a good way to "prove" its validity, even if
> > I think this is an interesting idea worth thinking to shrink the downtime.
> 
> Thanks for your sugguestions!
> I used a thread local variable to identify whether the current thread is a
> migration thread(main thread of target qemu) and I modified the code of
> qemu_coroutine_switch to make sure the thread local variable true only in
> process_incoming_migration_co call stack. If the target qemu detects that
> start_pack_mr_change is set and address_space_to_flatview() is called in
> non-migrating threads or non-migrating coroutine, it will crash.

Are you using the thread var just to avoid the assert triggering in the
migration thread when commiting memory changes?

I think _maybe_ another cleaner way to sanity check this is directly upon
the depth:

static inline FlatView *address_space_to_flatview(AddressSpace *as)
{
    /*
     * Before using any flatview, sanity check we're not during a memory
     * region transaction or the map can be invalid.  Note that this can
     * also be called during commit phase of memory transaction, but that
     * should also only happen when the depth decreases to 0 first.
     */
    assert(memory_region_transaction_depth == 0);
    return qatomic_rcu_read(&as->current_map);
}

That should also cover the safe cases of memory transaction commits during
migration.

> I tested migration for lots of times, there was no crash. Does this prove
> the validity to some extent?

Yes I think so, it's just that if we cannot 100% prove it's safe (e.g. you
cannot cover all the code paths in qemu that migration can trigger) then we
may need some sanity check like above along with the solution to make sure
even if something wrong it won't go wrong as weird.

And if we want to try this out, it'll better be at the start of a dev cycle
and we fix things or revert before the next rc0 releases.

I'm not sure whether that assert might be too strong, we can use an error
instead, but so far I don't see how that can happen and if that happens I
feel like it's bad enough, so maybe not so much.  Then AFAICT we can
completely drop start_pack_mr_change with that stronger check.

If you agree with above, feel free to have two patches in the new version,
making the depth assert a separate patch.  At the meantime, let's see
whether you can get some other comments from others.

-- 
Peter Xu


