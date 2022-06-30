Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB27561B6F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 15:34:18 +0200 (CEST)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6uJE-0002db-Ia
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 09:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6uEU-0000ZD-OU
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 09:29:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6uES-0007Ee-OP
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 09:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656595760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaikCOoba8HKUxhUXQRTdaMddW9hjXsEat4yXQpvoLs=;
 b=bjZnjjXto+f5ICdrlS1PdIxN8vfRGsnWpsgeFbUPdLGuFAAAf9S/k3V2w1+VAlMNqBNTx5
 hBKQF0y3QXBb8y1ERquOTkxlcz9WY1etIo/ftUpHN6sr7GZ5QfXzxw7p4OxUzrL29cxpRX
 UnqO0S+gncgVkSrhIeqi/0MFOAqau7E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-7-GlTISUNVaYI8h803-xJA-1; Thu, 30 Jun 2022 09:29:18 -0400
X-MC-Unique: 7-GlTISUNVaYI8h803-xJA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q6-20020adfea06000000b0021bad47edaeso3144905wrm.20
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 06:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VaikCOoba8HKUxhUXQRTdaMddW9hjXsEat4yXQpvoLs=;
 b=qk68X2BGoglGg61CSoQ1wcUWVUDqwZHvGzo1WA8VZCKLagSK3eBGheEF8BKL+Q9dIV
 jm8ahw8lwMor8UyAD5n+yk6hrmdpKOwdHZ3WrSvfNoZOCGYeZTd5HZ9+67gymyiex5Gq
 2fcCBtjqUqUL2phtl4kdzR/tN2GIhEV7g+mJVNtln1gOJXBrEficvZYBEwODaCZzvNBV
 1b9d99qdtpL97iEY31BIPOIaeIV+1YQV8+IBZEeOFmtz/349OsVJZv2sQWXh8krVgwcR
 Dyy7BTmiTYchUBIr4R+yh58wh6KDh5Lz3K6IP8mPt+riezfvdFsaNNLobH8TE2V5ABAY
 /McA==
X-Gm-Message-State: AJIora8o2piH/iuzPzrM+JUIZE7yEUxhl6SKfM/VU+VB3g9U3iXl93+k
 6YMzc04MSWuDHWFP2i9v0ixk+McuyOwseYhzywxYcs69RVEH5e6TkCD5TofJPlLnvBWA4BjF0m5
 +1xQ16awgiiTE8tk=
X-Received: by 2002:a05:600c:1d17:b0:3a0:481b:f1e1 with SMTP id
 l23-20020a05600c1d1700b003a0481bf1e1mr12108059wms.136.1656595757354; 
 Thu, 30 Jun 2022 06:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ts7zZVktp7Bde+wiQyZC3Xe2481XrVMwk8esk2d4ajmU7FKC8yZwbIYINon20MVC4EuF+Tqw==
X-Received: by 2002:a05:600c:1d17:b0:3a0:481b:f1e1 with SMTP id
 l23-20020a05600c1d1700b003a0481bf1e1mr12108037wms.136.1656595757159; 
 Thu, 30 Jun 2022 06:29:17 -0700 (PDT)
Received: from redhat.com ([2.55.3.188]) by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b0039c4e2ff7cfsm2872229wmq.43.2022.06.30.06.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 06:29:16 -0700 (PDT)
Date: Thu, 30 Jun 2022 09:29:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Brice Goglin <Brice.Goglin@inria.fr>,
 QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi <jingqi.liu@intel.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v4 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220630092833-mutt-send-email-mst@kernel.org>
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
 <20220630142347.22485226@redhat.com>
 <17551978-4608-f9e4-8aab-d5d7512dc5a7@inria.fr>
 <20220630145616.3c070af4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630145616.3c070af4@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 30, 2022 at 02:56:16PM +0200, Igor Mammedov wrote:
> On Thu, 30 Jun 2022 14:40:13 +0200
> Brice Goglin <Brice.Goglin@inria.fr> wrote:
> 
> > Le 30/06/2022 à 14:23, Igor Mammedov a écrit :
> > > On Thu, 30 Jun 2022 09:36:47 +0200
> > > Brice Goglin <Brice.Goglin@inria.fr> wrote:
> > >  
> > >> Allow -numa without initiator value when hmat=on so that we may
> > >> build more complex topologies, e.g. NUMA nodes whose best initiators
> > >> are not just another single node.
> > >>  
> > > patches looks fine code-wise,
> > > however something wrong with them, i.e. 'git am' doesn't like them
> > > nor ./scripts/checkpatch (which one should use before sending patches).
> > >
> > > I've checked it's not my mail server/client issue(or whatever)
> > > that corrupts them (ones downloaded from patchew are broken as well)  
> > 
> > 
> > I don't know what's going on. These 4 patches are in 
> > https://github.com/bgoglin/qemu/commits/hmat-noinitiator (rebased on 
> > master 10mn ago).
> 
> I'm not sure if we take patches from directly from git-forges,
> I guess it's upto maintainers.
> 
> CCing Michael,
>  since these should go through his tree

I could if nothing else worked, but I would much rather get
patches that did get processed by patchew and other automated
mail based tools.


> > 
> > Do whatever you want with them. I am not allowed to spend more time on this.
> > 
> > Brice
> > 
> > 
> > 


