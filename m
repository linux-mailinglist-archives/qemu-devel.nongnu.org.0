Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8EF685E3B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 05:15:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN4Wg-0003Kv-60; Tue, 31 Jan 2023 23:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pN4Wd-0003GH-Mc
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:15:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pN4Wb-0001W2-EU
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675224908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3Fc/FH7Z4Zx96ZCFRLiAr2mL5UTMMhhCgdM5eDt12s=;
 b=bm9siEPnirzxFK62l3EPbc8ccji5dcXJ7UybPdY5li/oY5NLa/NHCpgurnD17E/DYp6sfa
 ss2sBsikY8DtxvPIShoz31fuRbNTuCNak7FRdeYfzQRw0MbWWS38Eg0HMx+tHMU9YF4MAu
 JoJ/HBkh87LTNaWPDhh+N5j5Qt/NW/Y=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-dm-SuEVrNBeYROjgxJ6Ptw-1; Tue, 31 Jan 2023 23:15:06 -0500
X-MC-Unique: dm-SuEVrNBeYROjgxJ6Ptw-1
Received: by mail-io1-f72.google.com with SMTP id
 n64-20020a6b8b43000000b00719e397eac0so5267855iod.14
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v3Fc/FH7Z4Zx96ZCFRLiAr2mL5UTMMhhCgdM5eDt12s=;
 b=wBKlt1tiIzdbdazfq3n45tlZx6ByaE0LaeJ3Yc0K05cmjMsutMBSBcXL4AxMRRr2y7
 +tP+vnOvbTEVxUEIAn23FFLHZZCGjfHwugACwRaE7l7TsHUFmszml+xhenO7+Ws1rGmw
 CWogPGHWtcxnEMYU7x9Yz0bx7XHhS+OrNcxjxNmPATndVN9oY4q0CVcbtNpSPP9F6EHG
 ZO0mvmMomSY/iBh38YwMRDatbDPLv/cTuxGtneHZzrUupJ/DF8hAEHhIZflaIfriEgx3
 6dYsTcdLYu9R17v8lnvZgK6i2xua1fA86HTY8ZcWc/Td48crf+SoWl1eqPSheo70aiRR
 U+tg==
X-Gm-Message-State: AO0yUKXqFItsM5JDDmlJquQwPnRaXSNo0BaodfH27ouM1NGqen6foc3p
 F3CzRTWHUIwcLPqDYdcmewQyB78rfYN1uK4oi735vL1EK1wbECsFRhhpIzC4ro8EweSubg7Tnec
 hA7cyvM9xLiSYLQM=
X-Received: by 2002:a05:6e02:1b8f:b0:310:ff6b:51ae with SMTP id
 h15-20020a056e021b8f00b00310ff6b51aemr6319578ili.23.1675224905739; 
 Tue, 31 Jan 2023 20:15:05 -0800 (PST)
X-Google-Smtp-Source: AK7set85AU/c3o2iGtsS5OsU7oK86H7BdparPI4gSEZxRj5e4BYF4cgCTIrkuixLgogy6HfitugdvA==
X-Received: by 2002:a05:6e02:1b8f:b0:310:ff6b:51ae with SMTP id
 h15-20020a056e021b8f00b00310ff6b51aemr6319559ili.23.1675224905461; 
 Tue, 31 Jan 2023 20:15:05 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c4-20020a92cf44000000b00310c6f85ea9sm4733736ilr.82.2023.01.31.20.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 20:15:04 -0800 (PST)
Date: Tue, 31 Jan 2023 21:15:03 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 01/18] vfio/migration: Add VFIO migration pre-copy support
Message-ID: <20230131211503.3a328e0a.alex.williamson@redhat.com>
In-Reply-To: <Y9mkbLczUb2LFb1o@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-2-avihaih@nvidia.com>
 <20230126165232.0e7a2316.alex.williamson@redhat.com>
 <0c6856e7-ab92-7276-256c-6226aa692698@nvidia.com>
 <20230131154301.4aaa8448.alex.williamson@redhat.com>
 <Y9mkbLczUb2LFb1o@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 31 Jan 2023 19:29:48 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Jan 31, 2023 at 03:43:01PM -0700, Alex Williamson wrote:
> 
> > How does this affect our path towards supported migration?  I'm
> > thinking about a user experience where QEMU supports migration if
> > device A OR device B are attached, but not devices A and B attached to
> > the same VM.  We might have a device C where QEMU supports migration
> > with B AND C, but not A AND C, nor A AND B AND C.  This would be the
> > case if device B and device C both supported P2P states, but device A
> > did not. The user has no observability of this feature, so all of this
> > looks effectively random to the user.  
> 
> I think qemu should just log if it encounters a device without P2P
> support.

Better for debugging, but still poor from a VM management perspective.

> > Even in the single device case, we need to make an assumption that a
> > device that does not support P2P migration states (or when QEMU doesn't
> > make use of P2P states) cannot be a DMA target, or otherwise have its
> > MMIO space accessed while in a STOP state.  Can we guarantee that when
> > other devices have not yet transitioned to STOP?  
> 
> You mean the software devices created by qemu?

Other devices, software or otherwise, yes.

> > We could disable the direct map MemoryRegions when we move to a STOP
> > state, which would give QEMU visibility to those accesses, but besides
> > pulling an abort should such an access occur, could we queue them in
> > software, add them to the migration stream, and replay them after the
> > device moves to the RUNNING state?  We'd need to account for the lack of
> > RESUMING_P2P states as well, trapping and queue accesses from devices
> > already RUNNING to those still in RESUMING (not _P2P).  
> 
> I think any internal SW devices should just fail all accesses to the
> P2P space, all the time.
> 
> qemu simply acts like a real system that doesn't support P2P.
> 
> IMHO this is generally the way forward to do multi-device as well,
> remove the MMIO from all the address maps: VFIO, SW access, all of
> them. Nothing can touch MMIO except for the vCPU.

Are you suggesting this relative to migration or in general?  P2P is a
feature with tangible benefits and real use cases.  Real systems seem
to be moving towards making P2P work better, so it would seem short
sighted to move to and enforce only configurations w/o P2P in QEMU
generally.  Besides, this would require some sort of deprecation, so are
we intending to make users choose between migration and P2P?
 
> > This all looks complicated.  Is it better to start with requiring P2P
> > state support?  Thanks,  
> 
> People have built HW without it, so I don't see this as so good..

Are we obliged to start with that hardware?  I'm just trying to think
about whether a single device restriction is sufficient to prevent any
possible P2P or whether there might be an easier starting point for
more capable hardware.  There's no shortage of hardware that could
support migration given sufficient effort.  Thanks,

Alex


