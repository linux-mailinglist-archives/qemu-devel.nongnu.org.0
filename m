Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90E3CDEE1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:49:58 +0200 (CEST)
Received: from localhost ([::1]:50758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5VWn-00045d-6w
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5VVO-0003FY-IQ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5VVJ-0004Uo-9c
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626709703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lyk5MSl+fJRqHic0UYt1CNYJo7dHYeT+DDdkF5XFDZQ=;
 b=RSNlK/bthtsVSDSWw3IHjqlQZbJKHPo8u/o8g9ksoDR8dqNYOZUkhIm6T4pCnaSyNI/ShR
 YNKscgC645wTCIEYmdB6alAJCcodvLJ1bI87Hmmln7JzMBzs9DABapoA9DwIXF/BvybVQ6
 EPQBTzGNlI3DRu7TafaWnLf1mz/+l2M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-KsDOUEFfNT-ZCeLoxrzVpg-1; Mon, 19 Jul 2021 11:48:20 -0400
X-MC-Unique: KsDOUEFfNT-ZCeLoxrzVpg-1
Received: by mail-qv1-f70.google.com with SMTP id
 e19-20020ad442b30000b02902dc988b8675so15561551qvr.3
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 08:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Lyk5MSl+fJRqHic0UYt1CNYJo7dHYeT+DDdkF5XFDZQ=;
 b=Nvn4Cxix8FBTs3I7jPBeYYxBhArN8rI7n0o0vsp4dTX5iJHJE0DLGYwtuOELO2Wtew
 NDn6hHAG1XUnguqNnI42biW0U3mVbKwjnCoKy0LW4KXpbJnezhOoM6OmXxCT8dW/oiRu
 A2PmA6kQxZ052hevXHIyCc1urQPrjNPcqZNQNk4CCLse34ejaoiJ+Ku5iO0HEX6Cy8WL
 zxFn3yIdaJ2+UJcULJrvppDEOZloCWaIPhkWXjKrlpuz3nYjuH+GZwwj8qfRvPxNnzfj
 9akNv/n/WiUz3KZXkjJWV65F5PAFnbsHilBgWXKWMDTQ9jpfeJ9iFHWahk80m5bmFyOt
 H54w==
X-Gm-Message-State: AOAM530B4wRIR5J/gMkL/S2BRbAwagvMa9AoHYxADtyLmaj4lV4p8Bhm
 ckV13WAo8i0+JMYoPgSiuFNgbmb0vrcwHIgduD+VYSxGGmU7HOY0pugUe9lEqRdJa4wCnTvj0wS
 RtsIZWUXSnGDVhdY=
X-Received: by 2002:a37:9445:: with SMTP id w66mr24556380qkd.410.1626709699971; 
 Mon, 19 Jul 2021 08:48:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXKKtDhHQBukmrcoGshfvGYdRIu1hBXeg/wXtjUg+VqE/G4VgHkAv48avEyQGwQyIBSNHrGw==
X-Received: by 2002:a37:9445:: with SMTP id w66mr24556365qkd.410.1626709699719; 
 Mon, 19 Jul 2021 08:48:19 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id a132sm8244626qkg.55.2021.07.19.08.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 08:48:19 -0700 (PDT)
Date: Mon, 19 Jul 2021 11:48:18 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v6 2/2] migration/dirtyrate: implement dirty-bitmap
 dirtyrate calculation
Message-ID: <YPWewmqqke30dLGW@t490s>
References: <cover.1626433753.git.huangy81@chinatelecom.cn>
 <156478c0b13ea74783925bc6fc730452260c81dd.1626433753.git.huangy81@chinatelecom.cn>
 <YPHfxRAbsIhOFyKl@t490s>
 <7e12280a-db24-d947-fdb5-83b83f3ac814@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <7e12280a-db24-d947-fdb5-83b83f3ac814@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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

On Sat, Jul 17, 2021 at 10:57:50AM +0800, Hyman wrote:
> 
> 
> 在 2021/7/17 3:36, Peter Xu 写道:
> > On Fri, Jul 16, 2021 at 07:13:47PM +0800, huangy81@chinatelecom.cn wrote:
> > > +static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
> > > +{
> > > +    int64_t msec = 0;
> > > +    int64_t start_time;
> > > +    DirtyPageRecord dirty_pages;
> > 
> > [1]
> > 
> > > +
> > > +    dirtyrate_global_dirty_log_start();
> > > +
> > > +    /*
> > > +     * 1'round of log sync may return all 1 bits with
> > > +     * KVM_DIRTY_LOG_INITIALLY_SET enable
> > > +     * skip it unconditionally and start dirty tracking
> > > +     * from 2'round of log sync
> > > +     */
> > > +    dirtyrate_global_dirty_log_sync();
> > > +
> > > +    /*
> > > +     * reset page protect manually and unconditionally.
> > > +     * this make sure kvm dirty log be cleared if
> > > +     * KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE cap is enabled.
> > > +     */
> > > +    dirtyrate_manual_reset_protect();
> > > +
> > 
> > [2]
> > 
> > > +    record_dirtypages_bitmap(&dirty_pages, true);
> > 
> > [3]
> > 
> > > +
> > > +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> > > +    DirtyStat.start_time = start_time / 1000;
> > > +
> > > +    msec = config.sample_period_seconds * 1000;
> > > +    msec = set_sample_page_period(msec, start_time);
> > > +    DirtyStat.calc_time = msec / 1000;
> > > +
> > > +    /* fetch dirty bitmap from kvm and stop dirty tracking */
> > 
> > I don't think it really fetched anything..  So I think we need:
> > 
> >         dirtyrate_global_dirty_log_sync();
> > 
> > It seems to be there in older versions but not in the latest two versions.
> yes, latest version dropped this because dirtyrate_global_dirty_log_stop
> below already do the sync before stop dirty log, which is recommended in
> patchset of "support dirtyrate at the granualrity of vcpu" and make
> dirtyrate more accurate. the older version do not consider this. :)

Oh I see.  I was still using your old code so it does not have that bit.  It's okay.

> > 
> > Please still remember to smoke the patches before posting, because without the
> > log sync we'll read nothing.
> > 
> > > +    dirtyrate_global_dirty_log_stop();
> > > +
> > > +    record_dirtypages_bitmap(&dirty_pages, false);
> > 
> > [4]
> > 
> > I think it's easier we take bql at [1]/[3] and release at [2]/[4], rather than
> > taking it for every function.  Then we can move the bql operations out of
> > dirtyrate_global_dirty_log_stop() in this patch.
> yeah, take bql at [1] and release at [2] is reasonable.
> but if we try to take bql at [3], it will sleep for calculation time in
> set_sample_page_period which is configured by user, which may be a heavy
> overhead.
> how about we take bql at [1] and release at [2], ingore bql at [3]/[4] and
> let it be the same as older versoin. since we only copy total_dirty_pages to
> local var in "get_dirtyrate" thread and maybe we don't need bql.

Sounds good, thanks.

-- 
Peter Xu


