Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC0C6F1358
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:39:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJcs-0000RX-V3; Fri, 28 Apr 2023 04:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psJcm-0000RI-P3
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psJcj-0003tu-0q
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682671116;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UBBPpHwpzECYzhozV0QiB4ThTtPjeHDUVs/xczJBfK8=;
 b=DgAIYZnmbI9qXNp6mIUkskUKN/JWwVMUHcoBWlwytp3qzBjvtX7ZRHa8r5OMxmcoUVi0fR
 mXP+bSEMltIdseGPNc58PHUqccGN2twe9xsnP/iZ5NPnY7X/LlkuwiQhVgu3mxskM7oIKk
 D37t69uoFPvvfzT2ZvShyNFahJPZl0E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-4oJpvdyFOnmZgTAphgxSqw-1; Fri, 28 Apr 2023 04:38:34 -0400
X-MC-Unique: 4oJpvdyFOnmZgTAphgxSqw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f065208a64so58301265e9.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 01:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682671113; x=1685263113;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UBBPpHwpzECYzhozV0QiB4ThTtPjeHDUVs/xczJBfK8=;
 b=ewZhlB+KIR2kg/t7M55y4SgHfw4ufBseOQfZLR05IhT3F9aFxbM98bTvKcFmi/4hA9
 MFhdwnR5G6xI4g0iRe1ZsMUlQcaaxgqkyJ4ZJqQqvxMGt083/PMbkhea7X1HYTeMX+SD
 Ily0bT0TXJtru/5NJ7jBkUuJ/lEKufXB6o3F1xb4+0f6NUmqIFywrDtGwU1zcHWSzCGk
 9cbzvkZ7arnPQdWbQpSBuMydATtp7LY3L4sOemkDNZJZX8n28dhgS1/1ElCnertPB9TN
 mhBTDZIhXEXIQyK5FTGWPKazQJ/azuyEMfBdBRJpVE+RigPKF+kSgsYPm/DMHgL382kv
 2KIw==
X-Gm-Message-State: AC+VfDxPVMbYHpmxI6YyegWccrnDGxJH15NGxVpYr+8iiDL01Ftfiro8
 UDjPolPTXb8PcSPwSEqI4avqLVg4fB1C9GSsOrCWCYnf9Abl1cbTQas2QhRvn7+iOI7IXjngzl9
 ofk+9hENMaXFuHxM=
X-Received: by 2002:a05:600c:2189:b0:3f1:6fca:d5a5 with SMTP id
 e9-20020a05600c218900b003f16fcad5a5mr2960808wme.17.1682671113250; 
 Fri, 28 Apr 2023 01:38:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6yZ7qrgSjDUJMo6+sK1rXFo2IPibi1VBzoCxEtrUevi9vRKmQvkIIXXG8P2KkaxOlB7IlPnw==
X-Received: by 2002:a05:600c:2189:b0:3f1:6fca:d5a5 with SMTP id
 e9-20020a05600c218900b003f16fcad5a5mr2960791wme.17.1682671112938; 
 Fri, 28 Apr 2023 01:38:32 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c22c300b003f31d44f0cbsm2803129wmg.29.2023.04.28.01.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 01:38:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  QEMU Developers
 <qemu-devel@nongnu.org>,  "open list:Block layer core"
 <qemu-block@nongnu.org>,  Michael Roth <michael.roth@amd.com>,  Fam Zheng
 <fam@euphon.net>,  Stefan Hajnoczi <stefanha@redhat.com>,  Thomas
 Lamprecht <t.lamprecht@proxmox.com>,  Peter Xu <peterx@redhat.com>
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
In-Reply-To: <ZEuEIhe86udi38kx@redhat.com> (Kevin Wolf's message of "Fri, 28
 Apr 2023 10:30:26 +0200")
References: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
 <877cu7gk1g.fsf@pond.sub.org>
 <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
 <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
 <ZEpWd+273aIVZrRV@redhat.com>
 <515e6a39-8515-b32b-05ce-6d7511779b1b@proxmox.com>
 <87zg6tbdep.fsf@secure.mitica>
 <b1402ecd-1288-1ceb-ce58-65fc90636fac@proxmox.com>
 <87bkj8bg8g.fsf@secure.mitica> <ZEuEIhe86udi38kx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 10:38:31 +0200
Message-ID: <87354kbdvc.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kevin Wolf <kwolf@redhat.com> wrote:

>> 
>> I am perhaps a bit ingenuous here, but it is there a way to convince
>> qemu that snapshot_save_job_bh *HAS* to run on the main thread?
>
> I believe we're talking about a technicality here. I asked another more
> fundamental question that nobody has answered yet:
>
> Why do you think that it's ok to call bdrv_writev_vmstate() without
> holding the BQL?

I will say this function starts by bdrv_ (i.e. block layer people) and
endes with _vmstate (i.e. migration people).

To be honest, I don't know.  That is why I _supposed_ you have an idea.

> Because if we come to the conclusion that it's not ok (which is what I
> think), then it doesn't matter whether we violate the condition in the
> main thread or a vcpu thread. It's wrong in both cases, just the failure
> mode differs - one crashes spectacularly with an assertion failure, the
> other has a race condition. Moving from the assertion failure to a race
> condition is not a proper fix.

Fully agree there.  Just that I don't know the answer.

Later, Juan.


