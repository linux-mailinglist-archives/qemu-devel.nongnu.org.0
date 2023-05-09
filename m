Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A27D6FC427
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:46:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKpq-0000lc-2t; Tue, 09 May 2023 06:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwKpn-0000kq-Bq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwKph-00073H-UC
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683629076;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LoO+PevnNrMzzfcn0J3pvRngvZoYu5CxW6KO/xCLEtI=;
 b=gqJuFcC1L4gGaEu44EFgKD0J2H0PcukB5PGK1atndibRp8Iz4wLTbaxj8aryLHCU32Z8zg
 kRjvG1w7Tvp6JBNmihCjwkNhK2K4vRfJmxlKpW2Gni5G7WdKrnjZI2jCUKCcThxbhjtqHv
 IvqDixFei1+6vv1ywF1PjrXrPh+BqLI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-CbuAVNF0Mqu14GYEMXVOpw-1; Tue, 09 May 2023 06:44:35 -0400
X-MC-Unique: CbuAVNF0Mqu14GYEMXVOpw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-306489b7585so1944348f8f.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 03:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683629074; x=1686221074;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LoO+PevnNrMzzfcn0J3pvRngvZoYu5CxW6KO/xCLEtI=;
 b=PpeZfSY28Y52sRkkqKLS6gCWAdww54hUvpZhlomCShXaUEVUSlxUrenArSg29EoSK4
 2nyL25r8+g5kdOeAzmW+MDGasxy7EY2DcpUq46DTONBBm9kE49yRNLrV570IgtTunsNY
 tXWMvcFTz2iUD8+inTLtRRr6BXog+Rdio5a864pM58LdlTR5ImqucNMrZMlaAKBVk6Z6
 QvKmfq+dplYzX65DRFuqEjsJT8plUKfVVOzwsFsvDJkpXZNrjItF5Ni/xUxqH/rD8gKD
 K+Yy0adxcPpgC4vU7OMajGZVKMnZ/KJcAuDgdzYpbjfK3CqrUBY16UU+nBWFB51ogLCx
 4yZQ==
X-Gm-Message-State: AC+VfDzHhMHSaADdMkfSibJTxuv/PZHgwZYPOr6Pe8macG+G5Z0RA0iA
 9ZcAbMq9jww6eZylUnBXsXTDDXLADF/gym2yE9AiqhJnZZi87ZtpkSq7KcTzOmQMQg1h3+BAt+Y
 TrWcHPeJjH3t5bPs=
X-Received: by 2002:a05:6000:48:b0:307:7c2d:dc79 with SMTP id
 k8-20020a056000004800b003077c2ddc79mr9589363wrx.16.1683629073862; 
 Tue, 09 May 2023 03:44:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5g0u7+UCVebaX1FFnym5XjychfKZoI/obG2vtsNCBzu8/MLtEWukXdVk8z/Swux2EBl6L7fg==
X-Received: by 2002:a05:6000:48:b0:307:7c2d:dc79 with SMTP id
 k8-20020a056000004800b003077c2ddc79mr9589346wrx.16.1683629073553; 
 Tue, 09 May 2023 03:44:33 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 i11-20020adff30b000000b0030644bdefd8sm14002775wro.52.2023.05.09.03.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 03:44:33 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v2 1/6] ram: Add public helper to set colo bitmap
In-Reply-To: <22d83cb428f37929563155531bfb69fd8953cc61.1683572883.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Mon, 8 May 2023 21:10:52 +0200")
References: <cover.1683572883.git.lukasstraub2@web.de>
 <22d83cb428f37929563155531bfb69fd8953cc61.1683572883.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 12:44:32 +0200
Message-ID: <87y1lxeqcv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lukas Straub <lukasstraub2@web.de> wrote:
> The overhead of the mutex in non-multifd mode is negligible,
> because in that case its just the single thread taking the mutex.
>
> This will be used in the next commits to add colo support to multifd.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


