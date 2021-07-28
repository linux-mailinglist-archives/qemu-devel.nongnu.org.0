Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE463D97B0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 23:40:28 +0200 (CEST)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8rHu-0001gS-NQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 17:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8rGr-00011M-0l
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 17:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8rGn-0007dQ-CU
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 17:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627508355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=muX+q79AMrvFFcSDNNwF1F40VYOfboh5qaaafoj2xq8=;
 b=KPRwuZnRXcGDmOxr6V1tsTHevZGxqv5qmsds+ajk4a8WSliNa1wgBVMIa8bXiqq0zFzYJ2
 GJSEf62DZQaJuprfMMiBHmVhR0t4WG7PL8t0zsFsYoeEH4cXXdEIuZH1MdJCx2U0vbfdWs
 WmPdZncretEwOz9sR3mpzX/HwSC/6Ds=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-hOp85wISO3q4AZC_3ptzow-1; Wed, 28 Jul 2021 17:39:14 -0400
X-MC-Unique: hOp85wISO3q4AZC_3ptzow-1
Received: by mail-qv1-f70.google.com with SMTP id
 r14-20020a0c8d0e0000b02902e82df307f0so2768370qvb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 14:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=muX+q79AMrvFFcSDNNwF1F40VYOfboh5qaaafoj2xq8=;
 b=Th04isuOK5t7YE3Y8+o0S3gZ06cKjJsYn0dRZYRi81F34pqktTlqvPl8eRqUpdFFa/
 1AvDNjbxQbGbOC6i+5aovP3G780RU/lDceyzAaIW22/Tb6fveGDdd40AEH+USEAKPPWE
 E/8aeM658NsfQ/RWBPtLkKs96E2GG+n/89SCL7W6IYDpHZX5SFk4HsxU4FCSMVdzOH5k
 Bsfz1B9J8mCKc6y6lNvk7HyATzGemMuX2SFrUWpwDjSqVEtPPr94vLLseUZN8Surx6Gk
 k9hIuf7zfot1d7790t4P764RWbkKmryFzBLhrw4rJyuU2Pff6xMLV5QRtXkI3gT5KllN
 HKrw==
X-Gm-Message-State: AOAM532gpkpQJqlARLdy0k1jyGkjM1xX67YswPZsujDikXtVZ1jEU45m
 lzCY5ORiVjnCKTjIU3KenVpu8m/Eq3TJ15lWW7wk+L/YNIASZUy4rsjueLPGVdgbMMyVjdGS0dc
 e+HiUbiLn3Db/H6w=
X-Received: by 2002:a05:622a:1a1f:: with SMTP id
 f31mr1478885qtb.353.1627508353731; 
 Wed, 28 Jul 2021 14:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5Oqw2Xu9lAK+RTXEK9u5YASBn6cb40rMOLoMw+ZrX0b6QgZr4tAhn/08AnDKAERKBLsUAaw==
X-Received: by 2002:a05:622a:1a1f:: with SMTP id
 f31mr1478868qtb.353.1627508353479; 
 Wed, 28 Jul 2021 14:39:13 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id v5sm655657qkh.39.2021.07.28.14.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 14:39:12 -0700 (PDT)
Date: Wed, 28 Jul 2021 17:39:11 -0400
From: Peter Xu <peterx@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 2/2] tests: migration-test: Add dirty ring test
Message-ID: <YQHOfzpA4JF69Y8V@t490s>
References: <20210615175523.439830-1-peterx@redhat.com>
 <20210615175523.439830-3-peterx@redhat.com>
 <9b93e149-3147-3dca-83ce-474af99ccd2e@twiddle.net>
 <YQHAJy8lX0vt+yl2@t490s>
 <c0dbbbbe-e1c8-02e0-0455-bb954dd5f79b@linaro.org>
MIME-Version: 1.0
In-Reply-To: <c0dbbbbe-e1c8-02e0-0455-bb954dd5f79b@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 11:11:30AM -1000, Richard Henderson wrote:
> On 7/28/21 10:37 AM, Peter Xu wrote:
> > A quick fix attached; would that work for us?
> 
> Looks plausible, though perhaps just as easy to list the 5 platforms as just the one:
> 
> #if defined(__linux__) && \
>     (defined(HOST_X86_64) || \
>      defined(HOST_S390X) || \
>      ...)
> # define HAVE_KVM
> #endif

That looks good to me, especially for the long term to identify whether kvm is
with us, but for the short-term I hope I can still use the (literally :)
simpler patch as attached so hopefully that'll be more welcomed as rc2+
material..

Note again that the kvm.h inclusion is only for kvm dirty ring test in
migration-test so far, meanwhile that's only supported on x86_64, so we won't
lose anything on the rest 4 archs.

Thanks!

-- 
Peter Xu


