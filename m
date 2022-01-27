Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30BF49DE5E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:47:07 +0100 (CET)
Received: from localhost ([::1]:50388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1Mw-0008Mt-UB
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:47:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1Gt-0002dE-4F
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:40:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1Gq-00014T-6D
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643276447;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=twYv+ghG2cd+0Acm+uJ2w9g/FGmQ76CIbBwxxJt/aoU=;
 b=Q+1f4wV3ixHxpagQyTpStvrA1kgwsdhX/7MDw5CmY0nn8oqnWBSTShCnRSki1yVpJVmw1g
 asgijafwat2ND+efsunAJJue4GE1r+AKTj2Rj4mht/DoIVpRNbkhiOOkGbZt6K18ENejFP
 daibHuao3lcX7R8SNc/dJKPSNHDB4Z4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-jHHF4cC3NYeoRW2ty5NNSQ-1; Thu, 27 Jan 2022 04:40:46 -0500
X-MC-Unique: jHHF4cC3NYeoRW2ty5NNSQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m189-20020a1c26c6000000b003508ba87dfbso453369wmm.7
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=twYv+ghG2cd+0Acm+uJ2w9g/FGmQ76CIbBwxxJt/aoU=;
 b=WIK3MrqYoKLxdSyUQ7TfT9F6ipONBS5FuqAcYG+yTv4oBs2MwmVcEwBlYYLOn/T5vm
 eZBYyB/5cu+s05rSMwOXc6ELO5fZU+Zb1DMJYLl+fjEaK0YT22MDPp1u+QjV76JrMxB+
 CoJ4mgGN7miT/9Pn3Qck4g2VHEcOEi6PZTezU+B81VHAKFivf7mxG+iv1f0rnZrh75gk
 GFfsVlfsYSjb4llQtWyofUXzGiLw/UurNRtDa8Dka3punMjweqvqoKFcMI33GuZDmUBs
 l6KcHADEGJgAoRP+hQEiyCeVsv8yEfkLpJy2iVTKiMKo0SLa0vYroYWweToKGiOVeO9H
 C1pQ==
X-Gm-Message-State: AOAM531EmkMp/JFP2LRSgiH1+sFG+CKR9loWti2Trsqcnj2fYd5EkofL
 5H4IbLHt6mwk9/eZtoAAhAkK6HbRJ8ylOIk15ngyIi7ofEnrSCFYGs6Mz45vX624qdaHpC1oJk2
 VA51mqefZBnekBPs=
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr788647wrp.412.1643276444902;
 Thu, 27 Jan 2022 01:40:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHYOKApK+PgPrUKnNI0lDWcRRZKz/3J2ML0HJOYgy5yyVr249HCaylQaYKVdlIXwCjSWB7aA==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr788637wrp.412.1643276444761;
 Thu, 27 Jan 2022 01:40:44 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id y14sm1926570wrd.91.2022.01.27.01.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:40:44 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 03/15] migration: Enable UFFD_FEATURE_THREAD_ID even
 without blocktime feat
In-Reply-To: <20220119080929.39485-4-peterx@redhat.com> (Peter Xu's message of
 "Wed, 19 Jan 2022 16:09:17 +0800")
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-4-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 27 Jan 2022 10:40:43 +0100
Message-ID: <87tudpldno.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> This patch allows us to read the tid even without blocktime feature enabled.
> It's useful when tracing postcopy fault thread on faulted pages to show thread
> id too with the address.
>
> Remove the comments - they're merely not helpful at all.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


