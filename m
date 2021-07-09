Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1CC3C2912
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 20:34:05 +0200 (CEST)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1vK8-0005IM-HT
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 14:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1vJC-0004dA-Jv
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 14:33:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1vJA-0001b5-HW
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 14:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625855583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sYDKHvwYEPpR9boFrulurYSMBTT3+JEUGDaNY+bZ3e4=;
 b=F9EwaSWJsltXEHSyAxAOhJ2tlie+R1BTyLdEb/8YEgTJpWEbT1YPNXoh4rfgRO9lcNHiCt
 pcO4f/7TIG/KsHmItdDok1qzshh3K4YwxkamfBCKIcY1FYXUs9kFML/yvjeCUtQcWDuwgO
 +ipUpF2YIQHFHcJuIp9N3nqjdOQiMsU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-mL-0o905M1G7cxGPQJJQfQ-1; Fri, 09 Jul 2021 14:33:00 -0400
X-MC-Unique: mL-0o905M1G7cxGPQJJQfQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 ke6-20020a0562143006b029028b8546bb01so7001920qvb.20
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 11:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sYDKHvwYEPpR9boFrulurYSMBTT3+JEUGDaNY+bZ3e4=;
 b=ppHjJsulE1GbURroK3Nyp8uoydyPlMPCJztASG+JLYYzL2achaGLUqj9z//daEASfD
 tm5Wj56J/7v4lEVjhSROXIlv/5LC1K5jU+FmmBe7TIRozucdUURpihQ0l3JDOuIuQrOD
 YNaWu0nHT0C9JcLDn6uwpOgc/QQEJ7oFzEUi6kasOqSJgYSkiPlDJS8p6HSSUCaWRMKe
 E5Bx9k72bJU5caA91Qm7ZaitLxTYoP7uKY3RiiJV3Q1zDz2l05RgxBEsYd6XmRHvCJqn
 /1uOuRzxORtwwfD62jdPkwGeEvBncqIGHJgoRAiwQVunN2yif4VCvKm5wuC0zcT5kBgL
 QnFA==
X-Gm-Message-State: AOAM5339RYR1vT76CweysimhCU7nYcaIdZ3b+k6B+GyzS0+1ozGKq1ze
 uOdJLPQ3FSwWkyzmJDxJA8VYgha93eJC4jsS9Vha+6Sa8+l6x+OzzoylmqorIyRyjeYax7hmsso
 uGB9JEtt6E3kFK0Q=
X-Received: by 2002:a05:620a:138f:: with SMTP id
 k15mr21494349qki.124.1625855579470; 
 Fri, 09 Jul 2021 11:32:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzplEQLFyWXlOWYVmEGdVEP2nY8Jf1klDO6gVm41rtGS4q3bXYcmRbUyehkJzoVC8PkO8GVKw==
X-Received: by 2002:a05:620a:138f:: with SMTP id
 k15mr21494327qki.124.1625855579275; 
 Fri, 09 Jul 2021 11:32:59 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id k17sm2397296qta.85.2021.07.09.11.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 11:32:58 -0700 (PDT)
Date: Fri, 9 Jul 2021 14:32:57 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH 4/4] migration/dirtyrate: implement dirty-bitmap
 dirtyrate calculation
Message-ID: <YOiWWdF5cK3XKwml@t490s>
References: <cover.1624771216.git.huangy81@chinatelecom.cn>
 <d7079fd32152065b5301b88571b46bdf5dc62867.1624771216.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <d7079fd32152065b5301b88571b46bdf5dc62867.1624771216.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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

On Sun, Jun 27, 2021 at 01:38:17PM +0800, huangy81@chinatelecom.cn wrote:
> +static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
> +{
> +    int64_t msec = 0;
> +    int64_t start_time;
> +    uint64_t protect_flags = 0;
> +    uint64_t initially_set = 0;
> +    uint64_t protect_only = 0;
> +
> +    protect_flags = kvm_get_manual_dirty_log_protect();
> +    protect_only = KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE;
> +    initially_set =
> +        (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | KVM_DIRTY_LOG_INITIALLY_SET);
> +
> +    dirtyrate_global_dirty_log_start();
> +
> +    /* absense of migration */
> +    if (!(global_dirty_tracking & GLOBAL_DIRTY_MIGRATION)) {
> +        if ((protect_flags & initially_set) == initially_set) {
> +            /* skip the 1'round which return all 1 bits */
> +            memory_global_dirty_log_sync();
> +            /*
> +             * reset page protect manually and
> +             * start dirty tracking from now on
> +             **/
> +            dirtyrate_manual_reset_protect();
> +        }
> +    }

Right, clear dirty log is a bit tricky.

Wondering whether we can simplify this into something like:

  1. dirty_log_sync()
  2. if (manual_protect) reset_protect()
  3. record initial total dirty stats (total dirty stats updated when sync)
  4. sleep(SECONDS)
  5. dirty_log_sync()
  6. record final total dirty stats

Then I think it's not related to initial-all-set anymore. Do you think this
would work?

Thanks,

-- 
Peter Xu


