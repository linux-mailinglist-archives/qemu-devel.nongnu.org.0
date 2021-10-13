Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C742B708
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:24:48 +0200 (CEST)
Received: from localhost ([::1]:44584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXh0-0003OX-T4
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maXgE-0002j1-CB
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:23:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maXgC-0000tD-Vb
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634106236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b82zddu3KGfiddhYibEM+gYv77Z++ILTEb4b5cXQ1Ho=;
 b=OKYmtJ0lT/p7Od3ozF2Y8EayxEx8VVEe659r9XDL2aXYsNfTJCw8qNEBm/12irKcWn8b70
 r9W52A6VIMezCVAMlbpX9MJhdUfFo92Ag54WXGxeE0O3KKJCkkf3ric5YVCH2LzxCntRFe
 YrZAiH594jq1iNS4DBgvpXkPQb/pcWA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-goBvsAIPOiWE8FOyt6fY2A-1; Wed, 13 Oct 2021 02:23:54 -0400
X-MC-Unique: goBvsAIPOiWE8FOyt6fY2A-1
Received: by mail-pg1-f197.google.com with SMTP id
 t9-20020a63b249000000b002993d73be40so929803pgo.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 23:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b82zddu3KGfiddhYibEM+gYv77Z++ILTEb4b5cXQ1Ho=;
 b=gpbOgAJAwXBh5wK02kJj0eqJEqqjQvR1JJkutnlFNHvm7Qvz0891vPpotfd1XK6DMk
 3BsESBAtL2ASD2xwHCQZmVGHEqDFVOMNFw003efkaCgSpjkn5TxfvVpyNzrgeblcqlYy
 zi2/DnWBM9ClN4DxNGAWbalH7XGF/MT3TBlu7S31w+BuK2W0DLCac+M1ABVPkIa/nEmD
 BFoDD5kAssTY3MpTjSxc/nOBtwuWKJujSDg6fs2Z0BVuZ8sFFfxmxYeAdDxjXgt4y0Zs
 tHuyQW1kmJJgbvs7cy2rRTv8a6J2IB0oHqQzNgeeeiYAs55a7dDfXU3eO6d48f2GUpjQ
 kaJw==
X-Gm-Message-State: AOAM533eXjbe1nbiLT0nRxaxznkbTLjU8mIyaIu5X9CRIC6NGW0M8EQt
 hDCwzyTGCKP4kiSRhJHT2jqDqkSckTwq4e0025TM+4ZmaGsSeq+7CXymvQqGRbS2OwQy3gdMHIr
 +mpd4rgjgPzb01qM=
X-Received: by 2002:a17:90a:8404:: with SMTP id
 j4mr11225204pjn.204.1634106233260; 
 Tue, 12 Oct 2021 23:23:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkLFFja3mhCmVCYBLmnfpgwWbkmoph08UGs8Ks/7yfnqD44V7Cn6udbVNkfA9S6VlCKQnL5A==
X-Received: by 2002:a17:90a:8404:: with SMTP id
 j4mr11225175pjn.204.1634106232942; 
 Tue, 12 Oct 2021 23:23:52 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z17sm13091740pfa.148.2021.10.12.23.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:23:52 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:23:46 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
Message-ID: <YWZ7coem6iklY0ZC@t490s>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009075612.230283-4-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 09, 2021 at 04:56:13AM -0300, Leonardo Bras wrote:
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88f07baedd..c4890cbb54 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -724,6 +724,11 @@
>  #                      will consume more CPU.
>  #                      Defaults to 1. (Since 5.0)
>  #
> +# @multifd-zerocopy: Controls behavior on sending memory pages on multifd migration.
> +#                    When true, enables a zerocopy mechanism for sending memory
> +#                    pages, if host does support it.
> +#                    Defaults to false. (Since 6.2)
> +#

Shall we keep it named "@zerocopy"?  Yes we have that dependency with multifd,
but it's fine to just fail the configuration if multifd not set. The thing is
we don't know whether that dependency will last forever, and we probably don't
want to introduce yet another feature bit when we can remove the dependency..
as we can't remove the old one to be compatible.

-- 
Peter Xu


