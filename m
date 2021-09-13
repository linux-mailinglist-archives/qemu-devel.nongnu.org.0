Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C4409A89
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 19:19:17 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPpbw-00020X-6A
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 13:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPpUQ-0003W8-Lw
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 13:11:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPpUM-000816-Ot
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 13:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631553084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGoyPTmtkLVyzcmMD1uqp6g8Yxb+dPTy97y+dnJ8wIg=;
 b=fl0+yX45N1D9tJX/F4EZGe9rbzqOPI/UdlCDo/LzlIv6cV0Mv3+Tj5+FJN1qeciJf0KtEH
 O6MfiRLFHUFXl1EzZGRcRepGplaNc1gTHmf/XkgxKjEOY8eOomzQP6NrCCsVZzQj5E4Zxc
 kETjZjkeD+8rSOTyLFOVYLPZ9i3MDxo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-gXLz0MSGNSyXiNrA2D7xrQ-1; Mon, 13 Sep 2021 13:11:21 -0400
X-MC-Unique: gXLz0MSGNSyXiNrA2D7xrQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 bo11-20020a170906d04b00b005d477e1e41fso3974595ejb.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 10:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lGoyPTmtkLVyzcmMD1uqp6g8Yxb+dPTy97y+dnJ8wIg=;
 b=IFSROOdXT/jHHp427l4/1DjxNEoKYvpuQX9RFLJIWRSu//adQEzSDqoTaLRQQ8E7/i
 82JUqAqZmccin7sEwVuAQhSXIsJpX2vWAK0JKLO0C9rxdMx7U/4n7oOeqUho71B7HPZ7
 z+FcA8W5H8HGIVWcbEN0/zeBUvZ6Aw6SQ+aOL+gZeB1Eb56l1uIGMP8QIGiMeltGMCTo
 FaJepnu65Nh2UG3dYxV1NS3nV2u/A114RczhB8uI7mPno47fWkdYZrY4PhMD2dqYtJfu
 H063Xu1O1AQ1fUAL2TP7k03V2v1weJRzF1ARNYwLXyS/9C65VCgeVfCixrJBInU27DGN
 nrpQ==
X-Gm-Message-State: AOAM533I0Duodsgg773pR+X9lAbWClKUK0fcupCWGsQylYy2/rwdVbve
 5R4TXIGyXdToajne1s40xy7ZvcCmXSIeZ/Kp8lcMdCYCRSneX0cxOVAg09kGOutoUPULAwcJkqv
 sLJn0F6eAdzZQiQ8=
X-Received: by 2002:aa7:c38c:: with SMTP id k12mr12181814edq.45.1631553080204; 
 Mon, 13 Sep 2021 10:11:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys9zhUoCedK2chX9JP/fEOavy8nbFXhQBtQwcyDHGlkvl2dlF6ID2OcJkVCCZ61Bvo9H0SFA==
X-Received: by 2002:aa7:c38c:: with SMTP id k12mr12181791edq.45.1631553079967; 
 Mon, 13 Sep 2021 10:11:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t16sm3682590ejj.54.2021.09.13.10.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 10:11:19 -0700 (PDT)
Subject: Re: [RFC v3 12/32] rust: provide a common crate for QEMU
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-13-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d84f2827-3dbf-abc1-0ce3-596f0c568cf3@redhat.com>
Date: Mon, 13 Sep 2021 19:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907121943.3498701-13-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/21 14:19, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> This crates provides common bindings and facilities for QEMU C API
> shared by various projects.
> 
> Most importantly, it defines the conversion traits used to convert from
> C to Rust types. Those traits are largely adapted from glib-rs, since
> those have proved to be very flexible, and should guide us to bind
> further QEMU types such as QOM. If glib-rs becomes a dependency, we
> should consider adopting glib translate traits. For QAPI, we need a
> smaller subset.
> 
> Cargo.lock is checked-in, as QEMU produces end-of-chain binaries, and it
> is desirable to track the exact set of packages that are involved in
> managed builds.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>

As in my previous review, the main issue I have here is with the 
complexity of this code.

I understand that this has to be manually written, but right now I find 
it really hard to understand what is going on here.  The patch needs to 
be expanded in several parts:

1) generic traits (including implementations for Option/Box)

2) implementation of the generic traits

3) io/nix errors

and these parts should be moved around to the place where they become 
necessary.


Also regarding the code itself:

1) Stash should not be a tuple.  Accesses to it should use standard Rust 
methods, such as borrow()/borrow_mut(), and it should also support 
standard Rust idioms such as map():

pub struct BorrowedMutPointer<'a, P, T: 'a> {
     native: *mut P,
     storage: T,
     _marker: PhantomData<&'a P>,
}

#[allow(dead_code)]
impl<'a, P: Copy, T: 'a> BorrowedMutPointer<'a, P, T> {
     fn as_ptr(&self) -> *const P {
         self.native
     }

     fn as_mut_ptr(&mut self) -> *mut P {
         self.native
     }

     fn map<U: 'a, F: FnOnce(T) -> U>(self, f: F) -> 
BorrowedMutPointer<'a, P, U> {
         BorrowedMutPointer {
             native: self.native,
             storage: f(self.storage),
             _marker: PhantomData,
         }
     }
}

impl<'a, P, T> Borrow<T> for BorrowedMutPointer<'a, P, T> {
     fn borrow(&self) -> &T {
         &self.storage
     }
}

impl<'a, P, T> BorrowMut<T> for BorrowedMutPointer<'a, P, T> {
     fn borrow_mut(&mut self) -> &mut T {
         &mut self.storage
     }
}

2) Does ToQemuPtr need to allow multiple implementations?  Can the type 
parameter in ToQemuPtr<'a, P> be an associated type (for example 
"Native")?  Type parameters really add a lot of complexity.

3) I would rather not have "qemu" in the names.  The Rust parts *are* 
QEMU.  So "foreign" or "c" would be better.

4) full/none is still really confusing to me.  I have finally understood 
that it's because the pair that borrows is from_qemu_full/to_qemu_none, 
and the pair that copies is from_qemu_none/to_qemu_full.  I'd really 
like to use names following the Rust naming conventions.  A possible 
improvement of my proposal from the previous review:

- from_qemu_full -> from_foreign (or from_c, same below)
                     + possibly a dual method into_native or into_rust

- from_qemu_none -> cloned_from_foreign

- to_qemu_none -> as_foreign or as_foreign_mut

- to_qemu_full -> clone_to_foreign

I will see if I have some time to do some of this work.

Paolo


