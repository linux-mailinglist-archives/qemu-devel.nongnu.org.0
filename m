Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1573A44C1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 17:17:18 +0200 (CEST)
Received: from localhost ([::1]:56544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lriuL-0002sa-JA
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 11:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lrisq-00026m-5S
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 11:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lrisk-0000ZW-Ay
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 11:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623424536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CP/1WMP4chMgST/V6tZQleiSFeE6MNPm8WB/WwEItYk=;
 b=LMlmWeqJWJ/Hu8w/ZS7eoTWJRjkQh+gFkjBgtXxTuWRjgrcz5khso6SqUCwJSD9I39Xya3
 GLZkC4SSoX2KpXdTor9l0AJs5kmji3KHpiS9/G2zZAwKKO+E8Ti5lO7BWthkg4zxdp4kMJ
 vXScXuElZcq6X8RU6ky9If6rd0YWBjk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-EFlQ8ZVNNM6-XSEnSDqe-Q-1; Fri, 11 Jun 2021 11:15:35 -0400
X-MC-Unique: EFlQ8ZVNNM6-XSEnSDqe-Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 c15-20020ae9e20f0000b02903aafa8c83e7so7272048qkc.21
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 08:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CP/1WMP4chMgST/V6tZQleiSFeE6MNPm8WB/WwEItYk=;
 b=PvsveTSkmfyae8wLTSRGfdTidyD88VS1l/vbv8b5wl5OxpXldqW0+Z51IF5shGgr1h
 lyt+l+bI06qG9lapoXwUCG6LJxT1M4ZC1acgKhWW2RZdRwhMoIOiyS1ke4uFroWjxZNK
 HhVXCBFnKz2JBVzRAthQw+37tlaFxKX/otMgaW2r3T+WsbNCFZ8KwQSVDU9eFUpc6f11
 CRgv41jFhm0yXbbdSLTb3IAEp9nGgechT0gdZ83y74SWIhJJsgert2+cb4fZbEsNo82B
 T1UBxZf3ZXgDoa7k60w3hUXbS7Z7CpAUViZbCX7JOe/UpcUWdR2hUvFJN+x4p8iS6joO
 IX4Q==
X-Gm-Message-State: AOAM531upyh3scCZ9E4ls8A/KfAMuCaret2Z8lHk7tcMcgmhadFCnUl3
 0lWaA6hkTXtxWpYubguHMLPira2SxikrIH4j8lOXFcUtLKGyKJkMNfStGcVy9n/Jnz16eg2HcaL
 bqhu2JuoiS29qB8I=
X-Received: by 2002:ac8:424a:: with SMTP id r10mr4240988qtm.147.1623424535044; 
 Fri, 11 Jun 2021 08:15:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt/ixAxHciRSF50mRYrU6sgQBJLqGCkis/unulnAvUav0BHSI6cnPh6T/bAjvsLV+ap558BQ==
X-Received: by 2002:ac8:424a:: with SMTP id r10mr4240960qtm.147.1623424534847; 
 Fri, 11 Jun 2021 08:15:34 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id f193sm4581479qke.43.2021.06.11.08.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 08:15:34 -0700 (PDT)
Date: Fri, 11 Jun 2021 11:15:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v3 7/7] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
Message-ID: <YMN+Ff2f+aSXOhCw@t490s>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
 <a930f410178862fda49ae2c613a0757c7e07e006.1623027729.git.huangy81@chinatelecom.cn>
 <YL5nNYXmrqMlXF3v@t490s>
 <8401d4fe-2395-67f4-ba33-2c388ac246d9@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <8401d4fe-2395-67f4-ba33-2c388ac246d9@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 10:05:22PM +0800, Hyman Huang wrote:
> > > +    switch (last_method) {
> > > +    case CALC_NONE:
> > > +    case CALC_SAMPLE_PAGES:
> > > +        if (config.per_vcpu) {
> > > +            DirtyStat.method.vcpu.nvcpu = -1;
> > > +            DirtyStat.method.vcpu.rates = NULL;
> > > +        } else {
> > > +            DirtyStat.method.vm.total_dirty_samples = 0;
> > > +            DirtyStat.method.vm.total_sample_count = 0;
> > > +            DirtyStat.method.vm.total_block_mem_MB = 0;
> > > +        }
> > > +        break;
> > > +    case CALC_DIRTY_RING:
> > > +        if (!config.per_vcpu) {
> > > +            g_free(DirtyStat.method.vcpu.rates);
> > > +            DirtyStat.method.vcpu.rates = NULL;
> > > +            DirtyStat.method.vm.total_dirty_samples = 0;
> > > +            DirtyStat.method.vm.total_sample_count = 0;
> > > +            DirtyStat.method.vm.total_block_mem_MB = 0;
> > > +        }
> > 
> > I'm a bit confused; why it's CALC_DIRTY_RING but per_vcpu not set?  Why we need
> > to care about "last_method" at all?..
> this two method share the union, the sample method use the local variable of
> SampleVMStat type, the dirty ring method should alloc rates of DirtyRateVcpu
> type every time qmp calc_dirty_rate called in case of add vcpu, once rates
> has been store dirty rate value, it can't be freed until the next time of
> executing calc_dirty_rate, because info dirty rate may access the rates
> struct, so the rates struct can only be freed before calc_dirty_rate with
> sample.

OK, then please consider separate the cleanup and init, otherwise as mode
grows, it'll be a N*N matrix, afaict..

So we can always clean everything first depending on the old mode, then update
last_method (or whatever its new name is...) to the new mode, and init the stat
for the new mode.  Then it'll always be 2*N.

Another note is that I also suggest you do all these in the main thread, not
the sampling thread.  Because if you do that in sampling thread it means main
thread can "query" at any time, then we'd better need a mutex to protect the
whole section when you update either last_method or DirtyStat.  In main thread
it should be serialized already as there's either BQL or a single QMP monitor
thread.

Oh wait... not sure whether "only one QMP iothread" will still keep true
forever.. So maybe always introduce a mutex and protect all those fields; who
knows when QMP will start concurrent execution of these "info" commands (it
looks doable.. :).

-- 
Peter Xu


