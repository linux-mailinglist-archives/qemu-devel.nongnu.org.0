Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304E5B1EAD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:24:04 +0200 (CEST)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHVj-0006wr-Pd
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oWH4Z-0004IA-0q
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oWH4V-0005M8-4t
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662641754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g8BIGlv65Ywv49qpW6cme2tGnttrStxQsRYHKWACoqU=;
 b=ZU8O+5VARswTB8E89LwVtaEcVxBHYh2VgqM8fwioBnT9ku0aBcRp+k/g8tbWCc2TbLdTXV
 CXOqwah8z0PL40bU7admCvm4tCoX00qLvGT2ZdEtUFFccdI+IaiL4AhZyQRCKFI/pTsVvx
 s3lj8JDaSBnkXU2oA8ljiOju9urHhQA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-nINGTqGYNzu6Gq5bOkLhGA-1; Thu, 08 Sep 2022 08:55:53 -0400
X-MC-Unique: nINGTqGYNzu6Gq5bOkLhGA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d30-20020adfa41e000000b00228c0e80c49so3829495wra.21
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 05:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=g8BIGlv65Ywv49qpW6cme2tGnttrStxQsRYHKWACoqU=;
 b=K3f/ep87Q7a2z+qZgYsj8sVOPAAZCYOO2Jvjk/+z0dhTWKIDUxnio6djeJS4OTAvsC
 GRB+CxtH33CGAUNf2c0yoEOzWWScUEkDoO4Imds+mzR7ooKZ3VJDK8ptKA5ZAbi9bWrx
 m/5Q2HDdQI1D8ykG4tiym/xc+Gij5MHja359AHscbTau0OQvOw+XkXqHFP9S5lPMZhpL
 iVdpwjNMMSMDPYaNHXiG0hj3xVm0yQBWHhADEWN7w+WraOPeKkh5yYEvKnAl6au9wNpV
 ZVlA8fP19c4ooVvcH2orJwceeKCV2SSqsiHsl+c/8NVDfkTNjlTg1bjcU4zHw7nElx37
 RB1A==
X-Gm-Message-State: ACgBeo0LxJsgtdtSxgC0Ub0qbY79b8EWqOMSwQYabwEp5RUnSK5oUD2y
 QxAxOa2nppl4jHEPmWTqYNoV9xfD78L3c1C9os9xyhS1YI6bastMWxEapsHqm8l+0BZJd/GUdjt
 f5zazRHUuraU3wHQ=
X-Received: by 2002:a5d:55c1:0:b0:228:6b57:c60b with SMTP id
 i1-20020a5d55c1000000b002286b57c60bmr4914826wrw.68.1662641751986; 
 Thu, 08 Sep 2022 05:55:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7KAZX7ywVdSOfOWVXDBNuP9h5akQ7CFzhn6GNKwkL4gdkRwvmufiVvXTN8h7Y8fYZKMeuJiQ==
X-Received: by 2002:a5d:55c1:0:b0:228:6b57:c60b with SMTP id
 i1-20020a5d55c1000000b002286b57c60bmr4914810wrw.68.1662641751733; 
 Thu, 08 Sep 2022 05:55:51 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m10-20020a056000008a00b00228db6b9406sm12001287wrx.45.2022.09.08.05.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 05:55:51 -0700 (PDT)
Date: Thu, 8 Sep 2022 13:55:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: liuhaiwei9699 <liuhaiwei9699@126.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, eduardo@habkost.net, eblake@redhat.com,
 liuhaiwei <liuhaiwei@inspur.com>
Subject: Re: [PATCH] Use QMP command object-add instead of object_add for
 memory hotplugin
Message-ID: <YxnmVZma5mPQwbyM@work-vm>
References: <20220908095247.2582144-1-liuhaiwei9699@126.com>
 <877d2edrf6.fsf@pond.sub.org>
 <6185f50d.391f.1831cf22678.Coremail.liuhaiwei9699@126.com>
 <87r10m59jj.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r10m59jj.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

* Markus Armbruster (armbru@redhat.com) wrote:
> liuhaiwei9699  <liuhaiwei9699@126.com> writes:
> 
> > why the hmp using the object_add , qmp using the object-add command?
> > can't we use the same command ?
> 
> Command names differ between HMP and QMP for historical reasons.
> 
> QMP is a stable interface, and changing names there is no go.
> 
> HMP is not a stable interface, but changing names would still
> inconvenience users.  We don't do that without really compelling
> reasons.
> 
> I think HMP could fold '_' and '-' together in command names, so that
> both object_add and object-add work.  Best to check with the HMP
> maintainer before you start coding.

Yes, I'd be up for having folding on _/- - I never remember which I need
in any case.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


