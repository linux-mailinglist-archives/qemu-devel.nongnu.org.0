Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5443D3A1A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 14:23:09 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6uCq-0001Ho-Rw
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 08:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6uB7-0008Jm-0J
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6uB5-0007Or-4d
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627042877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RfI8Mu79gk/qrdP+IpAEM5FTTBZdmTexqgUT1Jby9zA=;
 b=YQfCONPs2MFGCoAFyVuOSyP8QlkXIVYFJ1DN9zRCloZRfjka32AIxT2iDsW0WlKYWGkRA3
 dQexp9CE1iFL7NYj39akyMT9bdbrbMIQScg8mOkaWDfW2M1oMS5ddT30FBSZ29MJcBNm0U
 vUcC68JHhI1AmJy4zXNLbltToDJPYTk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-uCpWrr5iPtmBR-uBMFl4Nw-1; Fri, 23 Jul 2021 08:21:14 -0400
X-MC-Unique: uCpWrr5iPtmBR-uBMFl4Nw-1
Received: by mail-qv1-f70.google.com with SMTP id
 r14-20020a0c8d0e0000b02902e82df307f0so1753567qvb.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 05:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RfI8Mu79gk/qrdP+IpAEM5FTTBZdmTexqgUT1Jby9zA=;
 b=cfXousg2ty6H6IMepTsiYgtoOY4qLFFsYm7zYwoZfKkWQxG2jdB2Erru5uCgTgugxb
 CDMJpSbTdrJfADucZ7KSYx6wEKOVoksX1jnfor42Jfhq1ltH5IXAIVfjBOyDCWHfyBiJ
 tc14bs3l6gbWEy69nfHWmU0A0/SRGhcN3UR+UhKxxwSvhEXrM4rHMi8i3JWzBavCQxeq
 T6EdSzsrotAWaI8Dyiq3VU3y+qOpoScr6tehr0dOM0lxnw2r9cKtKCzmq/wV7VE4nFnm
 YNAJhSrS95nv553Gfb86Ic4nDwsCgp1GMkWDxrMS1JmIiQZh2fdNFSei40TOEsB9nIpP
 m5Pw==
X-Gm-Message-State: AOAM5330ItHST2F/okNxvoD96RqE43irID5s5Xt/gXat2ojEzmrerwZh
 WRQAu6nauEglih8qBsYt5FGoP+sNZBiyCBVFd7vpxDIZjVqj0hsEU04vus0Qmcfa0ktIrwX7fjL
 mUiZKUIGJyUkC2Qw=
X-Received: by 2002:a37:394:: with SMTP id 142mr4330597qkd.423.1627042873958; 
 Fri, 23 Jul 2021 05:21:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ/vuEOTHG4wVMmY3/zhaz1FdXJ52O1rpcWAPCAa+uhU7CAH3K8zNn88tbjv3mIUibtsch1A==
X-Received: by 2002:a37:394:: with SMTP id 142mr4330572qkd.423.1627042873738; 
 Fri, 23 Jul 2021 05:21:13 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id d25sm11317956qtq.55.2021.07.23.05.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 05:21:13 -0700 (PDT)
Date: Fri, 23 Jul 2021 08:21:12 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/3] MAINTAINERS: Add Peter Xu and myself as
 co-maintainer of "Memory API"
Message-ID: <YPq0OKDegnhW/YE2@t490s>
References: <20210723100532.27353-1-david@redhat.com>
 <20210723100532.27353-3-david@redhat.com>
 <f703ed50-de43-8943-2a07-fb6babf85ae5@redhat.com>
 <68af7a38-9e0a-586e-7c6f-2f4c2aa7cd9c@redhat.com>
 <b0485ab7-3dfc-c454-64b8-7cdd39ac4a6f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b0485ab7-3dfc-c454-64b8-7cdd39ac4a6f@redhat.com>
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 12:28:30PM +0200, Philippe Mathieu-Daudé wrote:
> On 7/23/21 12:24 PM, David Hildenbrand wrote:
> > On 23.07.21 12:23, Philippe Mathieu-Daudé wrote:
> >> On 7/23/21 12:05 PM, David Hildenbrand wrote:
> >>> Peter and myself volunteered to help out co-maintaining "Memory API"
> >>> with Paolo, so let's update the MAINTAINERS file.
> >>
> >> I'm very interested in following changes in this area
> >> (although I'm not assigned to work on it, I have genuine
> >> interest and found some flaws I'd like to fix one day).
> >>
> >> Might I be listed as R:?
> > 
> > Sure thing, thanks! I can either send a v2 or you'll simply add a patch
> > adding yourself (preferred) :)
> 
> I'll send a patch later if the other recipient don't object ;)

Definitely. :)

Acked-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


