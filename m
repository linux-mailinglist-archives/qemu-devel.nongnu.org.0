Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DA06D7942
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:06:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk01w-00080q-8L; Wed, 05 Apr 2023 06:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pk01u-00080e-LR
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:06:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pk01t-0002EN-4D
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680689170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7tqdHp0z7SrsceuGaqk3f4Dn2eBRCUCgxJHv4nhpXM=;
 b=L1nijB79fMcRI/dyleftMqpEVD4jY3q7xfyg9WFDoNrSqNPt12q0lva+HMGLZgX4EBNlcn
 46KG5IHWyE38uR6uTcYDv9/Aio4nTKohHL3LDExSjRdAGJyJDNKbBWONDaI6mJiJyZOyGW
 nAYCNBtGjFAYXRkcFmwYzDkD2xxBLj0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-tIvOndgvO-iCeFAkRga2Ng-1; Wed, 05 Apr 2023 06:06:09 -0400
X-MC-Unique: tIvOndgvO-iCeFAkRga2Ng-1
Received: by mail-ed1-f71.google.com with SMTP id
 f15-20020a50a6cf000000b0050050d2326aso49011313edc.18
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689168;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K7tqdHp0z7SrsceuGaqk3f4Dn2eBRCUCgxJHv4nhpXM=;
 b=pv8sAhOyVtlnfFSSdr3mtlShUsIkopq3lo3Q9VI6EijlEGNhf5p+OHwjHm2Ym6+5a+
 sJeUoHG2rnwhdFJPOEI1jQySwAjnnQAR90Gt5EbZsGbnxZfoVBpwMGio96ALyWiaGbDd
 WSbYCZFz1c6CMZHOpUN93U+SYhXfpcbn+g4X4ClWDaRSghuNqbIWdKO3mCCCXf4zlfNM
 y7JfrGdLJ/Kj2n63RvS8q0OvFT75CWO84+tiknk4pr56aH4nOgHrCPZjylbmFdV9W8SD
 Wjx659ncdGlQW5xwghDfOCSyUyENNmYI7z+dvFMBHcJCGmFIBuN9hPzWnUosnO/weA5Z
 sUYw==
X-Gm-Message-State: AAQBX9dfKd5YXfYsArfgsQg3KzyjOJ3ZtKGY5H8YBwFETfmMtMbHFGBC
 s63esw70oj5m2QobebHjCrSCUytzrYAs7ODL2IWB8m/qijFGV7JrRVEkd+0oScbx+QKRfhfu3OY
 SJ1DZNZLNMZmaxU0=
X-Received: by 2002:a17:906:a254:b0:933:37f4:2fe0 with SMTP id
 bi20-20020a170906a25400b0093337f42fe0mr2333560ejb.46.1680689168546; 
 Wed, 05 Apr 2023 03:06:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yf1A5XZK4oo80SHWAZ2GiHPkSEf5Qh7hmicDEC8A80aMGY6813loQHdU4+ZIZl0KypQH0u+A==
X-Received: by 2002:a17:906:a254:b0:933:37f4:2fe0 with SMTP id
 bi20-20020a170906a25400b0093337f42fe0mr2333546ejb.46.1680689168281; 
 Wed, 05 Apr 2023 03:06:08 -0700 (PDT)
Received: from redhat.com ([2.52.139.22]) by smtp.gmail.com with ESMTPSA id
 k15-20020a170906158f00b00948cb15c642sm3154354ejd.42.2023.04.05.03.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:06:07 -0700 (PDT)
Date: Wed, 5 Apr 2023 06:06:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org,
 virtio-dev@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Message-ID: <20230405060340-mutt-send-email-mst@kernel.org>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7>
 <87h6tulkae.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6tulkae.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Apr 05, 2023 at 11:00:34AM +0100, Alex Bennée wrote:
> 
> Viresh Kumar <viresh.kumar@linaro.org> writes:
> 
> > On 09-03-23, 14:20, Viresh Kumar wrote:
> >> Hello,
> >> 
> >> This patchset tries to update the vhost-user protocol to make it support special
> >> memory mapping required in case of Xen hypervisor.
> >> 
> >> The first patch is mostly cleanup and second one introduces a new xen specific
> >> feature.
> >
> > Can we apply this now ? I have developed code for rust-vmm crates
> > based on this and we need to get this merged/finalized first before
> > merging those changes.
> 
> 
> I've queued into my virtio/vhost-user-device series so I'll get merged
> with that series unless mst wants to take it now.

Well the patches are tagged and I was going to take these after the release.
Probably easier not to work on this in two trees.
Still if there's something in your tree being blocked
by these patches then
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Let me know.


> >
> > Thanks.
> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro


