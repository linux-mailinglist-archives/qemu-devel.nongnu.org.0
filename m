Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C1F357DAF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 09:56:10 +0200 (CEST)
Received: from localhost ([::1]:37312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUPWL-0004BQ-1e
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 03:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lUPV7-0003iw-7s
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 03:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lUPV4-0003bs-TY
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 03:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617868490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMbR4bRL8enGsR81t+jYaZGq44eXz5MkNFDQWGxQf8A=;
 b=TcM+I0REth08Df3I0mdarQ2voZ8SkhlUt47XWNzowXvd9UHmn6aKCyxx8HX6gMhobYaoY/
 av94jv6+Ef6qJhLyw/wfDoFoCIYN/FgArCWd71vNH2NQtkCfI8Cx389BCA4WXqzH7qKndI
 S4qYaiuie1FvwIepfwmRWrsDncO9aQs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-2nAGBOtuNWalo0cKRK9K6A-1; Thu, 08 Apr 2021 03:54:46 -0400
X-MC-Unique: 2nAGBOtuNWalo0cKRK9K6A-1
Received: by mail-ed1-f72.google.com with SMTP id r6so625332edh.7
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 00:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xMbR4bRL8enGsR81t+jYaZGq44eXz5MkNFDQWGxQf8A=;
 b=XqrQuZiWLQn6iVHy4vnzMhiPPyVcCxC8B/FhCkglwatcBcuINe4Fth+bSX3Rs5gYGE
 LmzPV6Mx0ZrdN5yksUHiVlVvGdYV9KcksdA+I/fD3IXfMkH/8c6ep5+jg5/sXyIcYyN/
 Q9xoPl8SJNcPhmv4y9cDs/Xm1wC5sDXTjZrkPX2azbq0JxCimoPhEQdlqWZYwbEk/x6c
 g/e9tHvuOHx2cCtBA/TXfSOF77neMYZe6QspjMXjXiHNBixwJFrjUDIbWOfX1NMa7Kne
 81j6MUTuv3e0ADkojwdNv50MEmteogxl6PTJOQb+zTggEilxC6sb2VtOv4H8myuQ8BQI
 zziQ==
X-Gm-Message-State: AOAM533b8mFZ8iIhYG3q2bFoNJv1SABckYhB/jsPPc/BnAzpnybhpy3I
 /VXlu6Iks+0l1dF3lWUccu05UYlwdElvzNofl2wRHsNrsLCMOJPL4E33CbZrMKnfkCIBPwLTMeO
 uoGSPZ3Lh0DIb5ew=
X-Received: by 2002:a17:907:3e12:: with SMTP id
 hp18mr8600111ejc.366.1617868482809; 
 Thu, 08 Apr 2021 00:54:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXYZk9Tc/zAm4UdMqdBkIKtxCpXEBrG1ChwHFn1Cwt25sF1lABFHkf5rufSncwNWnwzeD52w==
X-Received: by 2002:a17:907:3e12:: with SMTP id
 hp18mr8600101ejc.366.1617868482668; 
 Thu, 08 Apr 2021 00:54:42 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id z4sm4163680edb.97.2021.04.08.00.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 00:54:42 -0700 (PDT)
Date: Thu, 8 Apr 2021 09:54:39 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/2] block/rbd: fix memory leaks
Message-ID: <20210408075439.qon4qf62542mrzoc@steredhat>
References: <20210329150129.121182-1-sgarzare@redhat.com>
 <b6c205ab-356a-ed3c-0442-105668db19d9@redhat.com>
 <87y2duzb7a.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y2duzb7a.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Florian Florensa <fflorensa@online.net>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 07, 2021 at 11:38:17AM +0200, Markus Armbruster wrote:
>Max Reitz <mreitz@redhat.com> writes:
>
>> On 29.03.21 17:01, Stefano Garzarella wrote:
>>> This series fixes two memory leaks, found through valgrind, in the
>>> rbd driver.
>>> Stefano Garzarella (2):
>>>    block/rbd: fix memory leak in qemu_rbd_connect()
>>>    block/rbd: fix memory leak in qemu_rbd_co_create_opts()
>>>   block/rbd.c | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>
>> I’m not quite sure whether this is fit for 6.0...  I think it’s too
>> late for rc2, so I don’t know.
>
>This the maintainers' call to make.
>
>* PATCH 1:
>
>  CON: Old bug, probably 2.9, i.e. four years
>
>  PRO: The fix is straightforward
>
>* PATCH 2:
>
>  NEUTRAL: Not recent from upstream's point of view (5.0), but
>  downstreams may have different ideas
>
>  PRO: The fix is trivial
>
>I encourage you to take at least PATCH 2.
>

Kevin queued them up, thank you both for the review,
Stefano


