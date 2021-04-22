Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205CA367AB9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:13:46 +0200 (CEST)
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTWz-0006p2-7e
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZTVy-0006KY-Cq
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:12:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZTVw-0001dU-RZ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619075559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pqhzUjV6P6slJDL0gEDPTKrZHz3Jw77j6rF9OGmQH4I=;
 b=c2lQrGZc1nZ6tqi7IP8/fXsDw+kbiqN34idvQHmDemSu3ps2BqdN9GhtTD7MHLxMC2cWUJ
 x0RA+P8LsNIioEOK0eIB+6xgRCeCU5/BQHchbTwTTIcweu2pIJ8uTjKomIaNtWUiBJa41Q
 m2ro6Ej6HAqwXe8+UQdZu4q5Ka/XbnI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558--SsTP52hMAebAwox0alM8Q-1; Thu, 22 Apr 2021 03:12:35 -0400
X-MC-Unique: -SsTP52hMAebAwox0alM8Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 l22-20020a0564021256b0290384ebfba68cso12388386edw.2
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 00:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pqhzUjV6P6slJDL0gEDPTKrZHz3Jw77j6rF9OGmQH4I=;
 b=oWGSAt8ZZhzL2qdxg8LMPIhdLdtIiJNtCG7zJ6SYzlgeqlhebyYrGijU97yJyR8D9H
 BdUEtlgCEl5zjnoezTOYpjmIjG33DRFAFbzsTNp+3cXwHNAlvTUmWEbzybFpDZW1vAcf
 3/DKj379SAOCNF174UovGcjU1SBkFgxT2e5JycIR+a6W59GPUeKrQ2l4mn5SLGNnUxrQ
 S9oonCONIPjYcOzKBU43TYuBpH/e20Bvh8iJFzaj4z9LHi2t8TuSgp45sjsrwDxoZS7B
 qJtZxmjMAIGhXXpopoT/5khwZFCLXGZ8rIiXkYLczaZOV+zCitgw+89GcTR8/8fabqU1
 eMvg==
X-Gm-Message-State: AOAM531cE/HXO3oWI288qrbFFegyBwSAtVRRrtA2G+mwoEZqXSPvTfpo
 Vk1YibKw9uoD/SiS+uTUqiqnmQbNJ/br/Hp6cXzgB8xysscNrvNj01/ZMOVeaxeJ4MOXkO31ffc
 bHrfRHjaTrHtPnxI=
X-Received: by 2002:a17:906:a45a:: with SMTP id
 cb26mr1789263ejb.537.1619075554763; 
 Thu, 22 Apr 2021 00:12:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR7CnDQfjGZ28sFUzeqAWcAfeVMwmyGWtFkXdlvqHhGEvuJwtb4z/rlWp9KmV/gSa5ZbbKpw==
X-Received: by 2002:a17:906:a45a:: with SMTP id
 cb26mr1789247ejb.537.1619075554500; 
 Thu, 22 Apr 2021 00:12:34 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id z6sm1206472ejp.86.2021.04.22.00.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 00:12:34 -0700 (PDT)
Date: Thu, 22 Apr 2021 09:12:32 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH v4 2/2] block/rbd: Add an escape-aware strchr helper
Message-ID: <20210422071232.jdfobosiszxgg6pw@steredhat>
References: <20210421212343.85524-1-ckuehl@redhat.com>
 <20210421212343.85524-3-ckuehl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210421212343.85524-3-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 21, 2021 at 04:23:43PM -0500, Connor Kuehl wrote:
>Sometimes the parser needs to further split a token it has collected
>from the token input stream. Right now, it does a cursory check to see
>if the relevant characters appear in the token to determine if it should
>break it down further.
>
>However, qemu_rbd_next_tok() will escape characters as it removes tokens
>from the token stream and plain strchr() won't. This can make the
>initial strchr() check slightly misleading since it implies
>qemu_rbd_next_tok() will find the token and split on it, except the
>reality is that qemu_rbd_next_tok() will pass over it if it is escaped.
>
>Use a custom strchr to avoid mixing escaped and unescaped string
>operations. Furthermore, this code is identical to how
>qemu_rbd_next_tok() seeks its next token, so incorporate this custom
>strchr into the body of that function to reduce duplication.
>
>Reported-by: Han Han <hhan@redhat.com>
>Fixes: https://bugzilla.redhat.com/1873913
>Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
>---
>v3 -> v4:
>  * Replace qemu_rbd_next_tok() seek loop with qemu_rbd_strchr() since
>    they're identical
>
> block/rbd.c                | 32 +++++++++++++++++++++-----------
> tests/qemu-iotests/231     |  4 ++++
> tests/qemu-iotests/231.out |  3 +++
> 3 files changed, 28 insertions(+), 11 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


