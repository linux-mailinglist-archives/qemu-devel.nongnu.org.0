Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE1C49779E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 04:12:54 +0100 (CET)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBpmn-0006Db-KT
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 22:12:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nBpkN-0004nc-PG
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 22:10:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nBpkK-0000uG-1N
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 22:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642993819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y9KHpPF9Sf/daLG4rcZ3Cx+C1pPp/FMJTR/ZjJpY3sc=;
 b=KeEkmcO+0pBtIN5k0nqwWQ7urYnECE6y8lLmvTeI69L4dWJAWxx8O9bcKOlEjFi3rorNJ3
 vM1FIIXqh9YwPUCGRnc+57GadWvDDKgMHm27UQqqE9jRg0u7xfSeY8ZcO3QaECBA7GrGpF
 rWm7O3/KA/v7rtKQVGNQH3rd8siUE5o=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-FX4MnYnrOEm0l30_TYabYg-1; Sun, 23 Jan 2022 22:10:18 -0500
X-MC-Unique: FX4MnYnrOEm0l30_TYabYg-1
Received: by mail-pl1-f198.google.com with SMTP id
 l9-20020a170903120900b0014a4205ebe3so2867358plh.11
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 19:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y9KHpPF9Sf/daLG4rcZ3Cx+C1pPp/FMJTR/ZjJpY3sc=;
 b=yXjGgqhMkmVewDSvg2BEap94e6Uvw+MzgRiYaHBNmbGbYq0sshHE7jssgZSPp06nys
 a/hhk081WZuEpC+2E08rG1HGhCbw/q9Im8ertfcOy7uF/TO/cYEN3aHybPoh5Tycn9vm
 70Hr0bdwXgdTiAb+I7pJBMKTnfkLiQ8pCK5BwZ2xEEgsJzYPGkW21l+ia4sCTDAWmN91
 vu4TxaToQvY1wYuEslTnFIhw6pFw8Hoot+fCzSWcZgHu1XZK2OGNZWHkRF4sRMGM13js
 LCfrlAlQWbgeoN1P2Cnc7Ha2M+B23Z++QHPQWyxVyPQ3XmUU9aKPSkFBpjXgJmHLNF+L
 Zfhw==
X-Gm-Message-State: AOAM5307FJTk+th7OLPtoiMLqe2U3O9y+3UJrGIjnX/ioAogPG8kxSGL
 z+Y/QuBVtusvXtgJCdh2KZVXsbZyTS5b5EhyST5LViBowxmvEDfC3fk81ADL1NWJ7vEvq8e41JH
 Iz0DFdWGfFKJ+Duw=
X-Received: by 2002:a17:90b:4b4b:: with SMTP id
 mi11mr344550pjb.1.1642993817044; 
 Sun, 23 Jan 2022 19:10:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhgWrZySrP+Lvvk/7K9MS2xcG0Uz9MeLxeomsqhdfNb5Y1a/P3njdrOxGd3cf7S8CbRO25BQ==
X-Received: by 2002:a17:90b:4b4b:: with SMTP id
 mi11mr344537pjb.1.1642993816792; 
 Sun, 23 Jan 2022 19:10:16 -0800 (PST)
Received: from xz-m1.local ([94.177.118.73])
 by smtp.gmail.com with ESMTPSA id pj5sm11326125pjb.0.2022.01.23.19.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 19:10:16 -0800 (PST)
Date: Mon, 24 Jan 2022 11:10:09 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
Message-ID: <Ye4YkaR6dB6vozA0@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
 <1a7103b2-a070-6e08-cd03-f4186caca9c1@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <1a7103b2-a070-6e08-cd03-f4186caca9c1@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 22, 2022 at 11:54:07AM +0800, Hyman Huang wrote:
> 
> > > +static void *dirtylimit_thread(void *opaque)
> > > +{
> > > +    CPUState *cpu;
> > > +
> > > +    rcu_register_thread();
> > > +
> > > +    while (!qatomic_read(&dirtylimit_quit)) {
> > > +        sleep(DIRTYLIMIT_CALC_TIME_MS / 1000);
> > 
> > Sorry to have not mentioned this: I think we probably don't even need this
> > dirtylimit thread.
> > 
> > It'll be hard to make the "sleep" right here.. you could read two identical
> > values from the dirty calc thread because the 1sec sleep is not accurate, so
> > even after this sleep() the calc thread may not have provided the latest number
> > yet.
> > 
> > It'll be much cleaner (and most importantly, accurate..) to me if we could make
> > this a hook function being passed over to the vcpu_dirty_rate_stat_thread()
> > thread, then after each vcpu_dirty_rate_stat_collect() we call the hook

Another cut-off email?  Please try again?.. :)

-- 
Peter Xu


