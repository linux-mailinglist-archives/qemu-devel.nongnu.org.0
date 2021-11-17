Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC28545453A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 11:53:25 +0100 (CET)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnIZA-0005Fy-DI
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 05:53:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mnIX1-0003pu-JE
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:51:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mnIWy-0004Zs-NE
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637146267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPaQzMlCsvxnu+XcV66W2cUinRQPp/JPfP4KVM48p60=;
 b=P29dgR8mGBCOQfegEhM956g7XuEtxvLCClEmImcZMyy9Ep2iYjX7q+zBAUfPt3+wd7xht7
 OkaY4dov69BdrmnbviGC2hDv3ImQNGL47HKiaqVHPaBToqqB0dW0aJlHUk6NLCDPU8yIX8
 pAJD+lGMd9pzkeaC/rkHW9mGgwLiG+o=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-ucKEQVFpMde_rWG2frCByQ-1; Wed, 17 Nov 2021 05:51:06 -0500
X-MC-Unique: ucKEQVFpMde_rWG2frCByQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 184-20020a6217c1000000b0049f9aad0040so1430223pfx.21
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 02:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xPaQzMlCsvxnu+XcV66W2cUinRQPp/JPfP4KVM48p60=;
 b=5Ae7SEkbUiDgFOYs3QfS2KcJmbzlPnV2eLyyOE2NtSzEsCNZnEudlPD+R4MfaWNmIT
 kra7d6MSDs7NxceRJxC3DitAee0ra2p/vK7zVXoHANbyPAoUgo8QBy2FruIjg/AgGese
 BY8vpbUD44e4g41X9ihRlW+Ln/WwBgqwdFY5uHNs+WBrjAe3aVtO8VifCSeyjcVGOF42
 NybhtZdvupznX4ZOYG8GxirpAtZYTf+fabXveqCukZsRMtJWElcV0phUqkOuBzrBmihL
 LGt07Uax+gw1k8f36kamGFLPQp/MkvLkK/K/WrOZOqLbAFTc3LO48lx8CIra6skab4zU
 C1Ow==
X-Gm-Message-State: AOAM532AYlhaksxIrr9BE7xiEYRr532LlOEH7WTP1HfDg7k6H0h2tN3w
 KMSFLdznQqFOmFeMAUYbpPvfPrcOumI28Uj0T1mqzoPqC8UWAD5MoCXm9JZgvb0cznczPP5UYg2
 RWTtPyN5+3SX1zGM=
X-Received: by 2002:a17:902:db07:b0:141:ea12:218b with SMTP id
 m7-20020a170902db0700b00141ea12218bmr55193296plx.46.1637146265153; 
 Wed, 17 Nov 2021 02:51:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgdxbAERz0tTmGavx60fI9Ogpw5+QFk69ROGXCbKRmSO+q2ZrHlJwSVCrfexvMThfC6mkwTg==
X-Received: by 2002:a17:902:db07:b0:141:ea12:218b with SMTP id
 m7-20020a170902db0700b00141ea12218bmr55193253plx.46.1637146264824; 
 Wed, 17 Nov 2021 02:51:04 -0800 (PST)
Received: from xz-m1.local ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id f21sm25220696pfc.85.2021.11.17.02.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 02:51:03 -0800 (PST)
Date: Wed, 17 Nov 2021 18:50:59 +0800
From: Peter Xu <peterx@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH v2] dump-guest-memory: Use BQL to protect dump finalize
 process
Message-ID: <YZTekzP86lRBGclp@xz-m1.local>
References: <20211116135441.7711-1-peterx@redhat.com>
 <88ea78f1-7633-b8e0-d2f7-42be598e8a22@redhat.com>
MIME-Version: 1.0
In-Reply-To: <88ea78f1-7633-b8e0-d2f7-42be598e8a22@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 11:43:42AM +0100, Laszlo Ersek wrote:
> On 11/16/21 14:54, Peter Xu wrote:
> > When finalizing the dump-guest-memory with detached mode, we'll first set dump
> > status to either FAIL or COMPLETE before doing the cleanup, however right after
> > the dump status change it's possible that another dump-guest-memory qmp command
> > is sent so both the main thread and dump thread (which is during cleanup) could
> > be accessing dump state in parallel.  That's racy.
> > 
> > Fix it by protecting the finalizing phase of dump-guest-memory using BQL as
> > well, as qmp_dump_guest_memory() (which is the QEMU main thread) requires BQL.
> > To do that, we expand the BQL from dump_cleanup() into dump_process(), so we
> > will take the BQL longer than before.  The critical section must cover the
> > status switch from ACTIVE->{FAIL|COMPLETE} so as to make sure there's no race
> > any more.
> > 
> > We can also just introduce a specific mutex to serialize the dump process, but
> > BQL should be enough for now so far, not to mention vm_start() in dump_cleanup
> > will need BQL anyway, so maybe easier to just use the same mutex.
> > 
> > Reported-by: Laszlo Ersek <lersek@redhat.com>
> > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> > v2:
> > - Fix parallel spelling [Marc-Andre]
> > - Add r-b for Marc-Andre
> > - Mention that qmp_dump_guest_memory() is with BQL held [Laszlo]
> > ---
> >  dump/dump.c | 24 ++++++++++++++++++------
> >  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks (again) for the review (and spot/analyze the issue)!

-- 
Peter Xu


