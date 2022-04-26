Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE75510CAA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:30:01 +0200 (CEST)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUd6-00021I-5B
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1njUa0-0007ct-P7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:26:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1njUZz-0003D9-6u
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651015606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dfZsKgUm68jPQPqnZtqfe+dv2C/iYcri2kgnyzyJiw0=;
 b=V0CWJBuxMfa+g06XsSxhKnfabinxlTy29IQe9Ll0ipZ/d3N1DTe8jqpAVel2fVFXox1VNN
 e9oiiev8K24BSCxTwE6W7El2Qgn7l3rv+YL9ojCL5C2ePCh2sO3vD+HOxVLkC9bWGle7+K
 pT9FTDwBBiHMp1o7D7r06DpJtkO+PKM=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-X-d4k60GO8GD6eEMq_I7_w-1; Tue, 26 Apr 2022 19:26:45 -0400
X-MC-Unique: X-d4k60GO8GD6eEMq_I7_w-1
Received: by mail-io1-f70.google.com with SMTP id
 h10-20020a05660224ca00b0064c77aa4477so387680ioe.17
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dfZsKgUm68jPQPqnZtqfe+dv2C/iYcri2kgnyzyJiw0=;
 b=atZPDvN6zIBAKy9KryaITZf2Fc455FgRhJKw+G6mJZa1Diw9btdjJzhAf7rvqruBCo
 mU1vIpD/PpQ2tHmoA1bztxAE2CDSIcgpLrRIKRZ1isEBRAaULGJiWcc/dkKRfungQhq+
 mpMzOq2nQS3/VW+JoX+DAvgDCYAVhecSapYdGIcDgjQk4Zgv4xYmKUUzvAK89v5ITchs
 KW/hpjp1pZMEembxWCXQ98WgutFwi0FyzEIcY4uqpJGgED2ri09byzT+MaMYXVbCDl5K
 G/2VGFsB82ZP8GaCSP1lpT6QZEb1SQd9yH6CBgCQdGkGY5HziYTGvnem6/J3oXrTqSOw
 K8RQ==
X-Gm-Message-State: AOAM531lp7sqPWnZt1kKRSn53fMqQiM2MNq1uQYgbLTyFjIz+w6jrfx5
 DVCaUN97+WkxyewHkSHU/huQjngH3wllKON498/XDw/ml0gL2JqTNRJ9SMoBVc2r0Hs3CR9eB+U
 Sjxvo7+SIevFP9Bg=
X-Received: by 2002:a05:6638:22c7:b0:323:9349:fc42 with SMTP id
 j7-20020a05663822c700b003239349fc42mr10744432jat.312.1651015604632; 
 Tue, 26 Apr 2022 16:26:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX3XgPvBgBNat3PX2OGUf20edDQka+aRYDmXthaaFfyiz9bzYW1PPGmYvEtV/wdJqCA1wp4Q==
X-Received: by 2002:a05:6638:22c7:b0:323:9349:fc42 with SMTP id
 j7-20020a05663822c700b003239349fc42mr10744425jat.312.1651015604457; 
 Tue, 26 Apr 2022 16:26:44 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a056602331500b006572790ed8dsm10459652ioz.40.2022.04.26.16.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:26:44 -0700 (PDT)
Date: Tue, 26 Apr 2022 19:26:42 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v10 7/7] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Message-ID: <Ymh/svJH+MLS8L7I@xz-m1.local>
References: <20220426230654.637939-1-leobras@redhat.com>
 <20220426230654.637939-8-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220426230654.637939-8-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 08:06:56PM -0300, Leonardo Bras wrote:
> Implement zero copy send on nocomp_send_write(), by making use of QIOChannel
> writev + flags & flush interface.
> 
> Change multifd_send_sync_main() so flush_zero_copy() can be called
> after each iteration in order to make sure all dirty pages are sent before
> a new iteration is started. It will also flush at the beginning and at the
> end of migration.
> 
> Also make it return -1 if flush_zero_copy() fails, in order to cancel
> the migration process, and avoid resuming the guest in the target host
> without receiving all current RAM.
> 
> This will work fine on RAM migration because the RAM pages are not usually freed,
> and there is no problem on changing the pages content between writev_zero_copy() and
> the actual sending of the buffer, because this change will dirty the page and
> cause it to be re-sent on a next iteration anyway.
> 
> A lot of locked memory may be needed in order to use multifd migration
> with zero-copy enabled, so disabling the feature should be necessary for
> low-privileged users trying to perform multifd migrations.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


