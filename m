Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0343C321E50
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:41:27 +0100 (CET)
Received: from localhost ([::1]:41216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFD3-0006s8-Sh
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lEF1b-0001bU-0D
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:29:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lEF1W-0007Xh-I1
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614014969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERK8uTwC5RSKs0OQ+RFbA/HGiVJ4gnRoDlz1RHPtIjE=;
 b=OyxMjGPM5s6YguA1O2UTphlK629voOH6uWd+GuqXYxG5jZDylWfUwtNxv8OFiMfM85hkx7
 f4FxFtGW042su5j47PuQ98QsLCvpj2eB+KXq/piFTnfY3TzKa6uIrQCIgH6XqPSe7wEc7D
 tpNzijeHn6fl/h+01s9UT8IGoq1Ud4M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-RFH_IpIONXazER1QpHH3DA-1; Mon, 22 Feb 2021 12:29:26 -0500
X-MC-Unique: RFH_IpIONXazER1QpHH3DA-1
Received: by mail-qk1-f200.google.com with SMTP id d66so9690829qke.9
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ERK8uTwC5RSKs0OQ+RFbA/HGiVJ4gnRoDlz1RHPtIjE=;
 b=S7gSVA6nhAdvxcDFsz3CTwOgExcdpQpNAafBAY+2meK2da4Muhyf7Z6VXq6z4VXAWv
 z65XL8QLWe+qWbwaIWUf9DAMoZImOhfQiehgpit4EPYeuYD8VLoJlVFDBhrCxnY2ZWKN
 +9TBX8OsBP9hIoYsc9pOl0FoWGwxdI+btVTEOsBM20EedvYg6Pv9hI1D5yMQuwZhot5t
 X1TC215XY9zuyrSViPoKgV7ZrhHMiB2OSz/6OwnHUqk/1I+Eke6biPPO16sEuWxnNI1C
 Z4bYMAlOPjJK//BHButSYHg17mRQw3cn0Wy4mzCUToerzssf1zxSuCpkaZQQNRfmYZJ1
 yalQ==
X-Gm-Message-State: AOAM530LedHZgyYGMq13bZA3Jli4Wk6B6JS2a9eOQgX2ATwLQdiKG2Wr
 /CnqemsBKgtx3fxOOs3j/zk87ObZG9Py+msF3PEkpmE5RgomJXA3RGc0dDEYcUKMdxm+r4dXd1B
 v1tV/fpy/Cemsvxg=
X-Received: by 2002:a37:49c4:: with SMTP id
 w187mr21599944qka.444.1614014965970; 
 Mon, 22 Feb 2021 09:29:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/neVhFi+ElMiklEaUTwxSr08oCDiBCE06gipq4XKPwLfTuMwHK/IJ2vIFHGaT5r1izM22BA==
X-Received: by 2002:a37:49c4:: with SMTP id
 w187mr21599928qka.444.1614014965790; 
 Mon, 22 Feb 2021 09:29:25 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id c143sm12788017qkg.83.2021.02.22.09.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 09:29:24 -0800 (PST)
Date: Mon, 22 Feb 2021 12:29:23 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <dhildenb@redhat.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210222172923.GS6669@xz-x1>
References: <20210219224719.GN6669@xz-x1>
 <68564940-6276-465D-9945-A50A900B90BF@redhat.com>
MIME-Version: 1.0
In-Reply-To: <68564940-6276-465D-9945-A50A900B90BF@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Den Lunev <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 20, 2021 at 02:59:42AM -0500, David Hildenbrand wrote:
> Live snapshotting ends up reading all guest memory (dirty bitmap starts with all 1s), which is not what we want for virtio-mem - we don’t want to read and migrate memory that has been discarded and has no stable content.
> 
> For ordinary migration we use the guest page hint API to clear bits in the dirty bitmap after dirty bitmap sync. Well, if we don‘t do bitmap syncs we‘ll never clear any dirty bits. That‘s the problem.

Using dirty bitmap for that information is less efficient, becase it's
definitely a larger granularity information than PAGE_SIZE.  If the disgarded
ranges are always continuous and at the end of a memory region, we should have
some parameter in the ramblock showing that where we got shrinked then we don't
check dirty bitmap at all, rather than always assuming used_length is the one.

Thanks,

-- 
Peter Xu


