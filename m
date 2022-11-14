Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7AB628EF9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:14:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijq-0004Ny-7N; Mon, 14 Nov 2022 18:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ouiem-0001yn-R4
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oucga-0002GR-Kr
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668444710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y+MMUIvEeHUT7UgHWhTTfhsRefNtB2Pk5zbgknHjzcY=;
 b=N/tFVCJYnKOzT38pLrcca0vZXvOyOwasUfUg6+s97s74LZjc+NWYzvfXdzrdjPCmtGx913
 Z3nwRpsDjz8JUyNlSgfNNtueGOUMhJ0/8n8wAScAiHlI2Ou85wf1fMfTwKda1nauabsr0q
 p1v44CqL/TJxzEYFIc5SarLPBiDxuks=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-fjX2VqTOPBm6M_sWiA5w5w-1; Mon, 14 Nov 2022 11:51:49 -0500
X-MC-Unique: fjX2VqTOPBm6M_sWiA5w5w-1
Received: by mail-qk1-f200.google.com with SMTP id
 ay43-20020a05620a17ab00b006fa30ed61fdso11384788qkb.5
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 08:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+MMUIvEeHUT7UgHWhTTfhsRefNtB2Pk5zbgknHjzcY=;
 b=1niFQOF5d0bNkZz8te7IorhGYqbeyuPauHyWJo289D8Az8BmjiE4UliEl7I1i1pTRf
 sYlZfYaNp8+8VYj9GQgRbS53np3UQir3bY2us549uxYyrwPAmUF4DfeN4b27fyM6Mfvw
 NRxf2BGmAOD/RBeFE0+3nZRYgPdp4g2NbzQpsZin1IZ2pE4kvrqSzVO6kgFDnqprZLfq
 LKd9CyOKoOKFJ0LDkyyXBlCQJYHwsCy4ZDrnzuNAvy/1/i2+cpIFcOHQEUE5+PMRE9uH
 I3khZr5Uono3cDLX3lWVxOE4ITv2dIZ/ozUXwB1rJDQvMIY8HiqtVAwPbqX2wyT4dUbU
 hu4A==
X-Gm-Message-State: ANoB5pn70fVl+veSvju0f1PQa7qnrS7yDCzj8E+4VFbtZ4x8hPYB7kJb
 PZMKZd4lcih63RybULIF3qlDaiCfX5wwO2SKUSugc51cUx0eyyy6MSYxs0ej0ADRiAlhn1h8o7O
 VYUnmjfNj27rlDy4=
X-Received: by 2002:a05:622a:40cd:b0:39c:e98b:ea12 with SMTP id
 ch13-20020a05622a40cd00b0039ce98bea12mr12939551qtb.151.1668444709145; 
 Mon, 14 Nov 2022 08:51:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4fNyKB5do4kl0qNGt4TQnSJaZ5qLQnkY4v8DIcogj2/Rn5ME6l1rR9ugOb+9A+/+x/TCAVfQ==
X-Received: by 2002:a05:622a:40cd:b0:39c:e98b:ea12 with SMTP id
 ch13-20020a05622a40cd00b0039ce98bea12mr12939539qtb.151.1668444708882; 
 Mon, 14 Nov 2022 08:51:48 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 l19-20020a05620a28d300b006cfaee39ccesm6798085qkp.114.2022.11.14.08.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 08:51:48 -0800 (PST)
Date: Mon, 14 Nov 2022 11:51:42 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Prerna Saxena <prerna.saxena@nutanix.com>
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
Message-ID: <Y3JyHlemh9Jn9Lqq@x1n>
References: <Y2EyVkdLMln7CX15@redhat.com>
 <9faf2604-f0b9-f3c3-5ac8-e4deeeebc424@nutanix.com>
 <Y2E+/WZgWXQQgdY5@redhat.com>
 <e5f69a86-f625-3cdb-4a25-065a0612548e@nutanix.com>
 <Y2OKCel2FlMQw+bI@redhat.com>
 <cf399da1-8558-06f9-2865-98abe45ddcda@nutanix.com>
 <Y2P6FMs42GLzkKl/@redhat.com>
 <0ad51209-817e-4f7b-3f93-e0ee231aade4@nutanix.com>
 <Y2QA93CGE6tyD4vT@redhat.com>
 <1646041e-bf4b-8697-7450-43fd17fe0dd1@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1646041e-bf4b-8697-7450-43fd17fe0dd1@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Manish,

On Thu, Nov 03, 2022 at 11:47:51PM +0530, manish.mishra wrote:
> Yes, but if we try to read early on main channel with tls enabled case it is an issue. Sorry i may not have put above comment cleary. I will try to put scenario step wise.
> 1. main channel is created and tls handshake is done for main channel.
> 2. Destionation side tries to read magic early on main channel in migration_ioc_process_incoming but it is not yet sent by source.
> 3. Source has written magic to main channel file buffer but it is not yet flushed, it is flushed first time in ram_save_setup, i mean data is sent on channel only if qemu file buffer is full or explicitly flushed.
> 4. Source side blocks on multifd_send_sync_main in ram_save_setup before flushing qemu file. But multifd_send_sync_main is blocked for sem_sync until handshake is done for multiFD channels.
> 5. Destination side is still waiting for reading magic on main channel, so unless we return from migration_ioc_process_incoming we can not accept new channel, so handshake of multiFD channel is blocked.
> 6. So basically source is blocked on multiFD channels handshake before sending data on main channel, but destination is blocked waiting for data before it can acknowledge multiFD channels and do handshake, so it kind of creates a deadlock situation.

Why is this issue only happening with TLS?  It sounds like it'll happen as
long as multifd enabled.

I'm also thinking whether we should flush in qemu_savevm_state_header() so
at least upgraded src qemu will always flush the headers if it never hurts.

-- 
Peter Xu


