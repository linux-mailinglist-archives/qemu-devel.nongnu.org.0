Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94B73CBCBA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 21:37:39 +0200 (CEST)
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4TeU-0002ej-DN
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 15:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m4Tdh-0001zh-KS
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 15:36:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m4Tdd-0006fS-Sf
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 15:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626464203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8Ji7V1nfCA/6JHUTnR5N/6QLaujgBFlDqYhmJpz9No=;
 b=BYta1rmmv9ZO1FpO3VGl4VfED40eYYcHwqYmGtJ1pPLSjmchvTNCTVLW86sh+kBWSoeHF8
 HvjAXX8zdk5x7lssVYSVJ+rUO28EF2lZQEPlAVeF5PO4RwD69281sFDer6gwxd8XsrqI1e
 W++jyp3QoCcM38JKXSjpBlLUusyQzC4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-nSV4E8juPRy5FKZhG_BdvA-1; Fri, 16 Jul 2021 15:36:39 -0400
X-MC-Unique: nSV4E8juPRy5FKZhG_BdvA-1
Received: by mail-qv1-f69.google.com with SMTP id
 x18-20020ad440d20000b02902e121b2b364so7416062qvp.12
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 12:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N8Ji7V1nfCA/6JHUTnR5N/6QLaujgBFlDqYhmJpz9No=;
 b=q+Xx0HkP/WA6ghmmGw0VqIWrY8hgFztB6V9E0dZgRIKIkLSWMRhr0TUjcK9fStHP1F
 pr85Z8DfHvnWhT4U8jPOVqE2RSIkTtlhQJcAaQPZSWYS3SRJqhio4VYwVn2qo2tSAiEX
 Dq4tiTh+YR5Qi8hraLzzwm6yo4jEX/KwrJ6RsslXkYIoYuSQ0spD+4K5INLl73ZYlwAY
 ilg7o2rXETS0B1wEDggCEhVAPl5ujGzswZYkpCXh4N6zHcXF/+/eJFRWavo7mZaxz5kP
 WoPaEEjHwigcHSwBIRD0qyYx8xU3C8Z+U+uYljmO+wqFLz/wda+s2Z4js9u55RYW31AO
 OFjQ==
X-Gm-Message-State: AOAM532u9bkDs+LqeO04ScnUflNFRRd34S+L9Cp1+yqytCAFTaBnG7K4
 jsDhGFUvXF6aVKevq4PdzSyEU3hPhBokO1cr0QOVxagrH79rjOqOTiR+CN9/lUiT19ly/VxiOrW
 FssK6797Bxpjnd9Y=
X-Received: by 2002:a37:8387:: with SMTP id f129mr11583832qkd.79.1626464199369; 
 Fri, 16 Jul 2021 12:36:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUF7dwSXrs4inkOqV32ZcO2HdR/VyzTrZ6G9nanfjZgg5DFH2ZBlD9zB4ZL79eHBjOPTAcEA==
X-Received: by 2002:a37:8387:: with SMTP id f129mr11583801qkd.79.1626464199104; 
 Fri, 16 Jul 2021 12:36:39 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id s19sm149570qtx.5.2021.07.16.12.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 12:36:38 -0700 (PDT)
Date: Fri, 16 Jul 2021 15:36:37 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v6 2/2] migration/dirtyrate: implement dirty-bitmap
 dirtyrate calculation
Message-ID: <YPHfxRAbsIhOFyKl@t490s>
References: <cover.1626433753.git.huangy81@chinatelecom.cn>
 <156478c0b13ea74783925bc6fc730452260c81dd.1626433753.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <156478c0b13ea74783925bc6fc730452260c81dd.1626433753.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Fri, Jul 16, 2021 at 07:13:47PM +0800, huangy81@chinatelecom.cn wrote:
> +static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
> +{
> +    int64_t msec = 0;
> +    int64_t start_time;
> +    DirtyPageRecord dirty_pages;

[1]

> +
> +    dirtyrate_global_dirty_log_start();
> +
> +    /*
> +     * 1'round of log sync may return all 1 bits with
> +     * KVM_DIRTY_LOG_INITIALLY_SET enable
> +     * skip it unconditionally and start dirty tracking
> +     * from 2'round of log sync
> +     */
> +    dirtyrate_global_dirty_log_sync();
> +
> +    /*
> +     * reset page protect manually and unconditionally.
> +     * this make sure kvm dirty log be cleared if
> +     * KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE cap is enabled.
> +     */
> +    dirtyrate_manual_reset_protect();
> +

[2]

> +    record_dirtypages_bitmap(&dirty_pages, true);

[3]

> +
> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    DirtyStat.start_time = start_time / 1000;
> +
> +    msec = config.sample_period_seconds * 1000;
> +    msec = set_sample_page_period(msec, start_time);
> +    DirtyStat.calc_time = msec / 1000;
> +
> +    /* fetch dirty bitmap from kvm and stop dirty tracking */

I don't think it really fetched anything..  So I think we need:

       dirtyrate_global_dirty_log_sync();

It seems to be there in older versions but not in the latest two versions.

Please still remember to smoke the patches before posting, because without the
log sync we'll read nothing.

> +    dirtyrate_global_dirty_log_stop();
> +
> +    record_dirtypages_bitmap(&dirty_pages, false);

[4]

I think it's easier we take bql at [1]/[3] and release at [2]/[4], rather than
taking it for every function.  Then we can move the bql operations out of
dirtyrate_global_dirty_log_stop() in this patch.

Thanks,

> +
> +    do_calculate_dirtyrate_bitmap(dirty_pages);
> +}

-- 
Peter Xu


