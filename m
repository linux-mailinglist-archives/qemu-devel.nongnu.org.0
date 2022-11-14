Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B506628E93
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:43:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouil7-0005av-7u; Mon, 14 Nov 2022 18:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifE-0001m0-Ac
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oua3O-0003O0-St
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 09:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668434594;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6djcBLeZHsAOT9OdfnJNXgJkHw2V1eJ7/lmfmBtxX3Q=;
 b=FLYZkRaDC0BKLt8/P/hEvp8ZvqjTZbkc7gG3917x0JYGU78jmSmBN1kR9rHedxTb5Zg3is
 KlOz630ywRuEKlBPd+Mqqqvt72bvnt8fMW5imVuGCw+1pukHaEeDrNaFU1QuikUE9jeWhe
 y1eg2/TGE9QqqpM8VDLHi9ekWpf1GkU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-462-qV_-gzrTPDWmXjo8LWRlMw-1; Mon, 14 Nov 2022 09:03:12 -0500
X-MC-Unique: qV_-gzrTPDWmXjo8LWRlMw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r4-20020adfbb04000000b00236639438e9so2048023wrg.11
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 06:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6djcBLeZHsAOT9OdfnJNXgJkHw2V1eJ7/lmfmBtxX3Q=;
 b=t4bkoQVaXaJPV5VyL7wrA7OEqnIjdBf0ZX1b+5CldxhWIdQYSVayWu1swTUNzK/FB5
 4Ed8ZTd5PgpHcZqv28z4+mH9X+hKZB863ikn79Q41zpbKkMQmm9KK9hudLBe9MZB4RUg
 iIUkfr2KOd9zu0VtYOYEyOaGakpyntRVZ9ZeEsL3+OzA2aWhvT8VBz7KUjPiHB9YANG4
 vZqbV4psI7VyPXL2dQBN6NMaxza4Huz+GYj4hwV05NUSFlKRSZIOeEWvS00X7eFstJvk
 0/bwNZcQpAIwwyaLTqtAdmCIAq5Bl3Mw+efUU0zwBbkm17pQ7j9PLDT0x7BsVPY8nFez
 i+rg==
X-Gm-Message-State: ANoB5pn+PMhI0sojwE0zC/YO/m3qFJS1sHJikvfNE+IeM3aq83GZzkWc
 8H+dqQTqlaQIfEAWE+QdOHEWy4S/ymJUTyaEgqAky/A2nOdyCMAIXvMIgyE1wfsWoIkPIXREQBn
 C3ZYoDbWiVQYlmdE=
X-Received: by 2002:a5d:4ed2:0:b0:230:f0d2:e36 with SMTP id
 s18-20020a5d4ed2000000b00230f0d20e36mr7551781wrv.191.1668434591376; 
 Mon, 14 Nov 2022 06:03:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4dge2JqgmgbadYlU2qGsFqqwZEokll84SIdAdLlH0WvyMmDcXEgGD9yR+uz0zKyIe/cU+tWQ==
X-Received: by 2002:a5d:4ed2:0:b0:230:f0d2:e36 with SMTP id
 s18-20020a5d4ed2000000b00230f0d20e36mr7551759wrv.191.1668434591166; 
 Mon, 14 Nov 2022 06:03:11 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 v9-20020a5d6109000000b0023655e51c33sm9710700wrt.4.2022.11.14.06.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 06:03:10 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,  "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 3/5] migration: Disallow postcopy preempt to be used
 with compress
In-Reply-To: <20221004182430.97638-4-peterx@redhat.com> (Peter Xu's message of
 "Tue, 4 Oct 2022 14:24:28 -0400")
References: <20221004182430.97638-1-peterx@redhat.com>
 <20221004182430.97638-4-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 15:03:09 +0100
Message-ID: <87r0y5bplu.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> The preempt mode requires the capability to assign channel for each of the
> page, while the compression logic will currently assign pages to different
> compress thread/local-channel so potentially they're incompatible.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


