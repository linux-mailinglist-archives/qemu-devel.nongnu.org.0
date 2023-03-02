Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A495B6A83AE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:39:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXj9j-0005WZ-6N; Thu, 02 Mar 2023 08:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pXj9f-0005Rp-0b
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:39:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pXj9d-0002SE-Eb
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677764368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8UnfSbMYNNgzoZGawsXpWGkv+4jmC6nkFsLTYDbxsTI=;
 b=JPCVteBBveJAFKPUxSYUIR65N7ucVurpCC6W9/2BOMwr0nH1n2cE5fq9dCxWr4Wq55bmEq
 6mmvNHdmKtJMXe5VscaCMUY2tO0PdKnceZCoCZ4MHI7NjjqzuFaNHMJV2Fn/Q6goxDnimj
 ikbAANnRz7/2sysEKUDoIjKULzaOzOs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-j6k1-qSoMam2QEuC2dcP8Q-1; Thu, 02 Mar 2023 08:39:27 -0500
X-MC-Unique: j6k1-qSoMam2QEuC2dcP8Q-1
Received: by mail-pj1-f69.google.com with SMTP id
 cl18-20020a17090af69200b0023470d96ae6so2059858pjb.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 05:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8UnfSbMYNNgzoZGawsXpWGkv+4jmC6nkFsLTYDbxsTI=;
 b=Gjn5fhTBwN7FRIERJ0Vo8N7ratq/L5Y39RyJLboSjEJlpBp03ZPSs22YjIgsV3BRlx
 pJhbXOO13TnmcdsI/WjdKiGRjWapWHta6JajG+1CBlXKpd3WO3Q1IiVQnaEyiqzyWbmK
 3QPb+7tQyVqss8XrAtkPRupvG5ib1gQxXTyPmjBFnZ4DFldqeoBYUKORhiIKLxPB1WhP
 YuuhZxnBHkbtidePPaRr2AiA52iXMz3XHAwiAfW2GQBb3q+07ML9qZ0EMxfsItfO6wub
 jlKuTsa2UwYIzU7QcnIoQMrD9eq4dF3AFvLOzK4WtoDOhI9sNJrXYVg4qSqSvm0rA3qi
 TSHw==
X-Gm-Message-State: AO0yUKXeUsqRGaVKeCCuXo7RgUHVtFRSUTNFZe/FD4eCms9PexMDBN5F
 jl58aXpueLSVspy899MZPyUPT5rIRF+mLb/ozs+hldSlYVyd4v/1a2Gxmeq/Lri77s1WZPCTMfz
 VMe6m9z9k5oq2rYtHAjIrstLAjvPtHlA=
X-Received: by 2002:a62:8281:0:b0:5df:9809:6220 with SMTP id
 w123-20020a628281000000b005df98096220mr4033074pfd.3.1677764366151; 
 Thu, 02 Mar 2023 05:39:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+a/fgG1sDJY0Wg8HtsQNqmWTjIiDBcdwXGiUihFqPgAS6qxO7QGc+qdB4z1VCvahkPJUDsTDuwl9pcbHRIcSE=
X-Received: by 2002:a62:8281:0:b0:5df:9809:6220 with SMTP id
 w123-20020a628281000000b005df98096220mr4033067pfd.3.1677764365873; Thu, 02
 Mar 2023 05:39:25 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Mar 2023 05:39:25 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
 <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
 <87sfeoblsa.fsf@redhat.com>
 <CABJz62PbzFMB3ifg7OvTXe34TS5b3xDHJk8XGs-inA5t5UEAtA@mail.gmail.com>
 <87fsanmgi9.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87fsanmgi9.fsf@redhat.com>
Date: Thu, 2 Mar 2023 05:39:25 -0800
Message-ID: <CABJz62OMj+ahAKWcyd5xKFnQ9g2ODoKyi2AvAtxe_bYWLXKUOQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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

On Thu, Mar 02, 2023 at 02:26:06PM +0100, Cornelia Huck wrote:
> On Wed, Mar 01 2023, Andrea Bolognani <abologna@redhat.com> wrote:
> > Note that, from libvirt's point of view, there's no advantage to
> > doing things that way instead of what you already have. Handling the
> > additional machine property is a complete non-issue. But it would
> > make things nicer for people running QEMU directly, I think.
>
> I'm tempted to simply consider this to be another wart of the QEMU
> command line :)

Fine by me! Papering over such idiosyncrasies is part of libvirt's
core mission after all :)

-- 
Andrea Bolognani / Red Hat / Virtualization


