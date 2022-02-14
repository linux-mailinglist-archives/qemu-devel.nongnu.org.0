Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6684B435C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:13:14 +0100 (CET)
Received: from localhost ([::1]:42042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWTw-0003T7-D5
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:13:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWF1-0006s8-JG
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWEx-00059T-BV
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644825462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tlNehD9KZAOgW/SS2Ujm2hs4Zcpr2/G5irmlf+JKz5s=;
 b=UgJGYkJ1C1GE4vQ/JwaK1p0a77GyllNICoRJFKv/Xhm1HHasgnNUVdMxDgIUW1P70oQCyC
 ZQKIiGF5fUmDPWS2i5fXf+wxmQybru6OM/ysNmpJuCj2J4w1+wlhbe1qOPsNcRjfHEBRD+
 QWgb+n/cps409whZIcv3f4GCz1sGjsw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-aiZEy0HgNNmaEUYIhmQ7ug-1; Mon, 14 Feb 2022 02:57:40 -0500
X-MC-Unique: aiZEy0HgNNmaEUYIhmQ7ug-1
Received: by mail-pj1-f72.google.com with SMTP id
 s10-20020a17090a948a00b001b96be201f6so6325090pjo.4
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 23:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tlNehD9KZAOgW/SS2Ujm2hs4Zcpr2/G5irmlf+JKz5s=;
 b=F7ZqpLAn7GWimBDxDJWSzwHJKZhPOKPztvSc/0V/QmJjeh0+yYTt8N3Gi+hiIE60Gd
 CGQTwQAxwkzCxg+7hL3H9e4IfWQM3RMHyvB4ZEuBGMJHg97YYaEcPzbwcnCkDv0RilFK
 MUub7OcHNPvJR0AntZREYyU1v/ZYx/bGHA7Fd+O5IS/3x1Z+85ZMt9lI7gQbu/S2qr+9
 r0F1rApsAf4aWSF3GNT8/hCOFa/78UH3IarZn06Rtn75Lg64/6IxPikF86km05myYYsI
 P3yAh8V50GWFz9H1nj0znUm1stOHMfhOTKL77AfkKKtNNLdtb6Fyw9KhlHRVa8oF3VS7
 epLw==
X-Gm-Message-State: AOAM5314sz61bLlBvQLgN+pF8a4DEfGms+TIHWfbgcwpCfccLKSzaJf9
 buHIatWCExgiX3652yMH/9up+78bGZNPGXpXYDNFXyxGRnv4osETjN+bZ7mrJELWc2Ctbeq5jjY
 T+5b0mu56tr3VSTY=
X-Received: by 2002:a05:6a00:894:: with SMTP id
 q20mr13006072pfj.79.1644825459869; 
 Sun, 13 Feb 2022 23:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymDxwUqXurPgHk5nWyic6/s/k5mnugH/PGpJDJ0KzZoVyUjzhaIXcRTBdzX7FwCA/Ctibo8Q==
X-Received: by 2002:a05:6a00:894:: with SMTP id
 q20mr13006053pfj.79.1644825459545; 
 Sun, 13 Feb 2022 23:57:39 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id k16sm35803947pfu.140.2022.02.13.23.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 23:57:39 -0800 (PST)
Date: Mon, 14 Feb 2022 15:57:31 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v14 3/7] migration/dirtyrate: Refactor dirty page rate
 calculation
Message-ID: <YgoLa4B7Eq8OOJq7@xz-m1.local>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <5984c1faf2de00df1a4add819fdab5cbe4014746.1644509582.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <5984c1faf2de00df1a4add819fdab5cbe4014746.1644509582.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Mostly good, one trivial nit below:

On Fri, Feb 11, 2022 at 12:17:37AM +0800, huangy81@chinatelecom.cn wrote:
> +int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
> +                                 int64_t init_time_ms,
> +                                 VcpuStat *stat,
> +                                 unsigned int flag,
> +                                 bool one_shot)
> +{
> +    DirtyPageRecord *records;
> +    int64_t duration;
> +    int64_t dirtyrate;
> +    int i = 0;
> +    unsigned int gen_id;
> +
> +retry:
> +    cpu_list_lock();
> +    gen_id = cpu_list_generation_id_get();
> +    records = vcpu_dirty_stat_alloc(stat);
> +    vcpu_dirty_stat_collect(stat, records, true);
> +    cpu_list_unlock();
> +
> +    duration = dirty_stat_wait(calc_time_ms, init_time_ms);

Is it a must to pass in init_time_ms rather than always sleep in
dirty_stat_wait()?  Could we simply drop it?

-- 
Peter Xu


