Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A309A50904D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:20:58 +0200 (CEST)
Received: from localhost ([::1]:44668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFsn-0006Gj-Pj
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhEvL-0001q1-TJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhEvK-00033x-6a
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650478769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HMiKGAKAunIPkP1NGGUai3eYe3eTxaz/AyFAXY5QNzs=;
 b=OXkriBYVw+hZbSgPKTyoHfe+o7xLN1X9/CryT3DFVUZlgP/+/BCLrJ7tQG9Czd6vU/tyPz
 FYFzrMtdngU/1B8Ijoq0lfLX/o6E7ckpSzpW/tygjQ21LfPGHaa4TY+P/TM4hlUg8yJIc2
 Mp2flwywRrPyxYzbQxpS+YmaUY0j3JQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-c1wxz_z_PgK1aQvksMAKqQ-1; Wed, 20 Apr 2022 14:19:28 -0400
X-MC-Unique: c1wxz_z_PgK1aQvksMAKqQ-1
Received: by mail-il1-f197.google.com with SMTP id
 v11-20020a056e0213cb00b002cbcd972206so1363961ilj.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HMiKGAKAunIPkP1NGGUai3eYe3eTxaz/AyFAXY5QNzs=;
 b=42Ka2D6bT3ArkjY5f9TPt6cahfPpsiO5tLwTZvX9z8VwowN9T7XeylUHmyiD0PBLyF
 FZOi0y8u1B+9SfROofVgmjH9kO3gUvtoiMMH6ZC9UBgDipkL4ZjZ5wHCUg8u8P/j40Px
 +cwLWPgOBsaSZv1DujlSLKLagQcrLNXUwyeCLN4g1rCF1zbeqdJOiohUUUDTJqsgPcSZ
 HbJ/4HzAgQE2PeGZWfZ/uAxHVVrKGOEuKlAuTspSyF82RGqC/8s4WnlBYT1mFGqIs1F+
 V0DyrfMpBbhfHQ/SpT1hSazeO5B6FVJBvcotxHu5UNOboLwlYlDG4l22rpvnM/hopejI
 L7dQ==
X-Gm-Message-State: AOAM533fNELctiRINxlwWMl8FQApRtv/zTaPTxlVohXfUtV1kfx5Attv
 gqNH9HqtxOpaz+Nn6xKcPx/y68mmN7mBDLVoBSZKuHG640tpcZrx9zXv8ndFFrGPJAYTKnF+LOf
 Svz6Vic1WC3g3HIA=
X-Received: by 2002:a05:6e02:160f:b0:2cd:5c76:817e with SMTP id
 t15-20020a056e02160f00b002cd5c76817emr869656ilu.133.1650478767470; 
 Wed, 20 Apr 2022 11:19:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrKlgjK2m3FI/+4qjhdln7CjAPTirsKYZ1LrolaWWsNhNmyZ+6zmjM6m9Q3T4Eud7r14/qfw==
X-Received: by 2002:a05:6e02:160f:b0:2cd:5c76:817e with SMTP id
 t15-20020a056e02160f00b002cd5c76817emr869650ilu.133.1650478767286; 
 Wed, 20 Apr 2022 11:19:27 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a056e02118d00b002cb2ceb6feasm10506745ili.81.2022.04.20.11.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:19:26 -0700 (PDT)
Date: Wed, 20 Apr 2022 14:19:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 01/19] migration: Postpone releasing
 MigrationState.hostname
Message-ID: <YmBOradLy1Uaz6la@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-2-peterx@redhat.com>
 <Yl/hqEu/t7WSEB0N@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/hqEu/t7WSEB0N@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 11:34:16AM +0100, Daniel P. Berrangé wrote:
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 695f0f2900..281d33326b 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -1809,6 +1809,11 @@ static void migrate_fd_cleanup(MigrationState *s)
> >      qemu_bh_delete(s->cleanup_bh);
> >      s->cleanup_bh = NULL;
> >  
> > +    if (s->hostname) {
> > +        g_free(s->hostname);
> > +        s->hostname = NULL;
> > +    }
> 
> FWIW there's a marginally more concise pattern:
> 
>   g_clear_pointer(&s->hostname, g_free)

Sounds good.

> 
> 
> Either way
> 
>    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks,

-- 
Peter Xu


