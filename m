Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155EC49D460
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:18:37 +0100 (CET)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpga-0002dq-7N
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpcc-0008Ab-HO
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:14:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpca-00067h-1Y
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643231667;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LUzHFV8+qR3/2qjCMm8hdsHgI/iNoSVXQL8xiLSncTw=;
 b=ZZLsCc/eVsnxo6oH5ovVnYgwrKNnHw2KlhZ4p2XIcXM/ajseuNJla5YkXoe0ePsVEjrvuH
 bA8132zSxKGzpcFOaXzAS4vOOmAUvf6IdTra/sWpMJ8PrijfyoCE+b32ZGs9EOjysstwbP
 REay6QHxGpI0XmLiz//Bz47Opy4et/M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-Lcwtfx5ANDG1SEwfxli2VQ-1; Wed, 26 Jan 2022 16:14:26 -0500
X-MC-Unique: Lcwtfx5ANDG1SEwfxli2VQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a1c7910000000b0034e4206ecb7so472033wme.7
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=LUzHFV8+qR3/2qjCMm8hdsHgI/iNoSVXQL8xiLSncTw=;
 b=tDF1EHgFURMxdaedybByiVl5Li/ucTUTcxRNJtfiQSqVgj+JOaaKT89uzHjnvcW1D9
 tMo+sGaYqzvkLhvb6R/zpqsKBiY7hwiw9afwkyu/lcJ9+gb1FFdeiFYBvKbA8Y8QxI+6
 V0xj2+lDHRXI1OOAymL+KkcSCadBdQL+P+1cLxp/Es47UY1y1FJ0TZ0q02ha/ZooPj5j
 Zj8RpFPgpnlJiSlHaGx05A1eqGh23sSxNq4J1OTROCbu3GoaieJ/jA09nREa9F/MDOm8
 F5PSI+zZm8kA85ZU7GLFKHHJs9cWJEl/rixwzUZfw1VBB/N/KOa8TfUEN5ATRZBA6HnX
 G9jw==
X-Gm-Message-State: AOAM530m73GlR2Z7823ovNtoo3I4QawdueQPt2fCWuaEfad+RFoQFkb7
 ugUSXIFHTmV691vVR5B+JPAKHcjKS0u399Wd7zBSV7b/kS8r1ZEQizPr6wxOFa+1ohuf9ZOz6zA
 uNtJRAdrKRAZ5l0E=
X-Received: by 2002:a05:6000:104e:: with SMTP id
 c14mr390372wrx.252.1643231665230; 
 Wed, 26 Jan 2022 13:14:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydR2rtXDX8IjA6O7s88b96tKzj//c8glt4C1C54Xf1nIG9ZmF8euAQi/ORqSYAXiugKzwAnw==
X-Received: by 2002:a05:6000:104e:: with SMTP id
 c14mr390359wrx.252.1643231665013; 
 Wed, 26 Jan 2022 13:14:25 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id m6sm387775wrw.54.2022.01.26.13.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:14:24 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 3/7] migration: Drop postcopy_chunk_hostpages()
In-Reply-To: <20211207115016.73195-4-peterx@redhat.com> (Peter Xu's message of
 "Tue, 7 Dec 2021 19:50:12 +0800")
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-4-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 22:14:23 +0100
Message-ID: <87y232mc7k.fsf@secure.mitica>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
> This function calls three functions:
>
>   - postcopy_discard_send_init(ms, block->idstr);
>   - postcopy_chunk_hostpages_pass(ms, block);
>   - postcopy_discard_send_finish(ms);
>
> However only the 2nd function call is meaningful.  It's major role is to make
> sure dirty bits are applied in host-page-size granule, so there will be no
> partial dirty bits set for a whole host page if huge pages are used.
>
> The 1st/3rd call are for latter when we want to send the disgard ranges.
> They're mostly no-op here besides some tracepoints (which are misleading!).
>
> Drop them, then we can directly drop postcopy_chunk_hostpages() as a whole
> because we can call postcopy_chunk_hostpages_pass() directly.
>
> There're still some nice comments above postcopy_chunk_hostpages() that explain
> what it does.  Copy it over to the caller's site.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


