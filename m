Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C86136C2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opU9l-0004JE-W5; Mon, 31 Oct 2022 08:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opU9j-0004Ic-GS
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opU9i-0008Bl-1X
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mAmnwntslzppHlEYksARP0rDXa5v33HVsGWTiUa4TQ=;
 b=JBPPKg23kaM7GpvLmHrWH5HG6kFwxYPoum3Lt4ZF0ObNmNUpk/PJIFG5WuE5qeN/lQ1JWh
 uVe6LvKyt7/24ImDqo5K7JxzUdZ0YsWaSqpc03Pq0sDcJpnG3MmG9PMQzcAFHMhV4MHRBl
 e4B7eHDYeXfQnsE0Y09QDe+AOijel9Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-QNsAPTrZOZuh3P1kn0jwHg-1; Mon, 31 Oct 2022 08:44:39 -0400
X-MC-Unique: QNsAPTrZOZuh3P1kn0jwHg-1
Received: by mail-wm1-f69.google.com with SMTP id
 83-20020a1c0256000000b003cf758f1617so191336wmc.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0mAmnwntslzppHlEYksARP0rDXa5v33HVsGWTiUa4TQ=;
 b=2plSHxqrb6jUb0ohPY6+YFv3D1NLQOlXKZ9ZBB4P7JpOPVVv82aEeJW3Th1wt16jt7
 K4YXNztii8ASqAUnoMsLZrkUkYxrmEnxQa09bJnDjGOOREwgt/dMwSTDFl5YG/F9uUgO
 UtJCWLvGqb7gOgwo6jX4uLsN7U8jNK0/0EFaQMtTzVnkGdIPMjdMINw333GR2tZvj9jK
 G81FI/6ssdaYAkmbvc40KfkfkL0yhlgfLuKAmC2cRHVC42mixlNheUhFGaHWK9js6Hmh
 VRN4uewcrCmEcdAUb8g/mB7bkIv9UVVycs5FjWiX+LMqFUkO9QNPR/5GwMpewCO4Yhnr
 I1sw==
X-Gm-Message-State: ACrzQf1Achv34a7aEEglvXg3YSbA0aSQSHP946lPS4sEu3PCq5QmEdgK
 Bf5bbK2iDG5JJ0CiFDNwJJjamxUOkrthcSNjiebpvhLMoqecmiW78SN+eQ9k8a9F3O59HC8s4jS
 gtNgFUSJKtLwKnu0=
X-Received: by 2002:a5d:5967:0:b0:236:bd27:f1b8 with SMTP id
 e39-20020a5d5967000000b00236bd27f1b8mr5420919wri.390.1667220276893; 
 Mon, 31 Oct 2022 05:44:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5hk5ZUDmzI+i0NcuLPUoE5DaIX9052MzmEd3wzuL0AWaG8LVrUFwJof2XXLwQvotMG/Hy01w==
X-Received: by 2002:a5d:5967:0:b0:236:bd27:f1b8 with SMTP id
 e39-20020a5d5967000000b00236bd27f1b8mr5420903wri.390.1667220276639; 
 Mon, 31 Oct 2022 05:44:36 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 a17-20020a05600c349100b003b47ff307e1sm7196493wmq.31.2022.10.31.05.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:44:36 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:44:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] bios-tables-test: do not ignore allowed diff list
Message-ID: <20221031083900-mutt-send-email-mst@kernel.org>
References: <20221027151135.496368-1-mst@redhat.com>
 <20221031114942.36e1dc83@fedora>
 <20221031065126-mutt-send-email-mst@kernel.org>
 <20221031133104.2e4946d8@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031133104.2e4946d8@fedora>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 01:31:04PM +0100, Igor Mammedov wrote:
> On Mon, 31 Oct 2022 06:52:11 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Oct 31, 2022 at 11:49:42AM +0100, Igor Mammedov wrote:
> > > On Thu, 27 Oct 2022 11:11:48 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >   
> > > > we had such a beautiful structure for updating
> > > > expected files, designed to keep bisect working.
> > > > It turns out that we ignored the result of
> > > > the allow list checks unless all tables matched
> > > > anyway.
> > > > 
> > > > Sigh.  
> > > 
> > > strange,
> > > it seems to be working fine (I mean white-listing) here  
> > 
> > it's pretty clear no? if we only check test_acpi_find_diff_allowed
> > when all tables match anyway, it won't help test pass.
> 
> currently all_tables_match is accumulated value that starts with 'true'

Problem is, it can be false because of another unrelated table.







> and with the meaning 'do not explode unless at least a table was not
> explicitly whitelisted'



> [...]
> > > >  
> > > > -        all_tables_match = all_tables_match &&
>   '&&' here serves as a trigger that lets flip always initial 'all_tables_match = true'
> 
> > > > +        all_tables_match = all_tables_match ||
>   once it changes to '||' the all_tables_match will never flip to false
> and trigger
>   g_assert(all_tables_match);
> at the end, when there is unexpected (non-whitelisted) table mismatch.
> 
> Am I missing something?


I agree this patch is bad.

I did not record the issue I saw and don't really want to go
debugging. Will drop for now.

> > > >              test_acpi_find_diff_allowed(exp_sdt);
> > > >  
> > > >          /*  
> > 


