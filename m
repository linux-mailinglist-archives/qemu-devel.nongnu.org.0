Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EFC41B304
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 17:34:21 +0200 (CEST)
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVF7b-0006FN-P7
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 11:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVF51-0004m2-Sd
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 11:31:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVF4z-000383-AK
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 11:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632843093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HR5vCgNYmLE0hfJxYxz1VzCmC52WTUr/U4cBsu0WOi8=;
 b=Wp/V+gIpTUe7OPEpKQD33CyeHlRvwxYMMRAhOH/0KwJrLoTlMgisPioiU2pn/lehtL0+GX
 gEt8Vg2cYbG6g2+OsqIzSAVhoa49/LlxesBDu+EH+wnjh/r+SW+OGdl5B/Wxdfw/NrQfe/
 tZ1wiESec27lqAp83QXcJLgpO2rKsuY=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-ax_S3kpWMNyN2cMy8C2vpw-1; Tue, 28 Sep 2021 11:31:32 -0400
X-MC-Unique: ax_S3kpWMNyN2cMy8C2vpw-1
Received: by mail-il1-f199.google.com with SMTP id
 x10-20020a056e021bca00b00257b189ffbfso24375232ilv.8
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 08:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HR5vCgNYmLE0hfJxYxz1VzCmC52WTUr/U4cBsu0WOi8=;
 b=DAr1hmajhMTX2pTTRW2Hrs+fQ27MRjG4FNFssPb0TonvNup7nElsME25j6Gx+WTFtv
 qspCSqDCKscz/JYfn1MW2+ft6yR3gKaznVM8lI990d34hzi2wnv7hZqfs6GHLCotU0dP
 u/NciuJ3cgqKb6lsZs+Di3Ob8WJaRPNS5B6mVP5lM9Bishcoi61Mu5UQjAZrfyva8eT4
 o8lLbHNB/fI/GwLbzPVPzuV3uLYFIfo5fqPIDAb4qPDcTsF3UPVWzfw8uU6bjqruLg1h
 NFXXGxwLntyYngbTKLVehEF2qmS4RX6nj/i8gi3vwvlpzq4yC95QQYDmVSJ0EIlakH7C
 CZhg==
X-Gm-Message-State: AOAM532PUtfMTF4d7qARBdw+cN4RKekXMXyfOKxb4yapCryi5r8IyPIt
 UO1wwi3q8jlO6yx7dfWB50yigpEFGwRbrZpb3Pe52Txa5uSnCilPflymfNsbVTESDNio6GnDa/T
 Y4DTaD6S0EEjCMKw=
X-Received: by 2002:a05:6638:1649:: with SMTP id
 a9mr5164494jat.67.1632843091367; 
 Tue, 28 Sep 2021 08:31:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb936Sn3khxzKVfiKh/Hj5Rrb0TUCgLT4keJx9OfL4PgpasoKAWarmyBsijNou8hjedAfDhA==
X-Received: by 2002:a05:6638:1649:: with SMTP id
 a9mr5164460jat.67.1632843091123; 
 Tue, 28 Sep 2021 08:31:31 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id e13sm10817523iod.36.2021.09.28.08.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 08:31:30 -0700 (PDT)
Date: Tue, 28 Sep 2021 11:31:28 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 7/9] migration: Simplify alignment and alignment checks
Message-ID: <YVM1UCEuyJaAPl8d@t490s>
References: <20210904160913.17785-1-david@redhat.com>
 <20210904160913.17785-8-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904160913.17785-8-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 04, 2021 at 06:09:11PM +0200, David Hildenbrand wrote:
> Let's use QEMU_ALIGN_DOWN() and friends to make the code a bit easier to
> read.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


