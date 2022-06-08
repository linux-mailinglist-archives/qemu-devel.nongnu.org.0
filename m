Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3762F543D96
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 22:28:58 +0200 (CEST)
Received: from localhost ([::1]:56646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2IS-0003UM-UT
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 16:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nz2Ft-0000AI-MY
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:26:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nz2Fq-0006zq-Ps
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654719974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eN6ESWXnx7fBwEiILywQZAqx+TxGJzNMdOy6d2qYTGM=;
 b=It+2GJh59yIiRHpYYfaCByueFfIJg5XnxAIGjb7FQPPf+Dgfearn6cVoo6r5W2XjoFzTY1
 gs/Ok5kQLXXxF+gBBY9gbtrv4h2Ng6QCs7UZqOR3Flh3bBbPsDFMYw7eNgfAWhwEhvI/h6
 cLacsmfPzG6uTMO2kwOHFShmrqZ+Sgs=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-kvEyzLFTPsq1SzpzYyWIYA-1; Wed, 08 Jun 2022 16:26:12 -0400
X-MC-Unique: kvEyzLFTPsq1SzpzYyWIYA-1
Received: by mail-il1-f199.google.com with SMTP id
 g8-20020a92cda8000000b002d15f63967eso16345684ild.21
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 13:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eN6ESWXnx7fBwEiILywQZAqx+TxGJzNMdOy6d2qYTGM=;
 b=a73ldlCJbhXUCY27s51nWpWyrPVXCuYhDpWoVnYzZ4YVFoQvoG7W3QWLna/tXs208N
 yUfwbi/wOYUdZeU4Hx8hut08P5fNIoMTJf0L70S9CRTB/ZhtQA56LXPd7mP2w6IY0OvD
 3lVlN4FAxUOCAFEZzNZuutOEtjyyxmKJGsYe5bCvvwkzv0h2p4ALuDRNcpDTYaBkKp7K
 sAMcGADON14UJ+nBfAWUp0LBcnOJnr2DuSTCA8mA86MvlJWTb4vTP1TOe2DNnDSayuEA
 S52RQ9SiWlYymgFbiGjdX+YOJGPUDYGvIFdkUtnsgbecyPHppG/2cGZgwk9DLd8lKX4w
 K+Mw==
X-Gm-Message-State: AOAM530/ja8K+1fTv5o5xlnJnt7yQSNlRyOC446i7KwElF97IjSLKAhj
 YkcIyttyQPBg7Xy/n+UKXUH0y/k9oVadb6gNMp/lB1hamRUvVAJdseH2DQoGsxieVtl9zHlgsfS
 6KYDFHvx8wxPgqA8=
X-Received: by 2002:a05:6602:2d90:b0:63d:b41e:e4e4 with SMTP id
 k16-20020a0566022d9000b0063db41ee4e4mr16643530iow.172.1654719972267; 
 Wed, 08 Jun 2022 13:26:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP/hSy54fFBJdenwanoziKGdEX08IbunCpXgefFSwcafsWPnZenHVY9WhQXhPCB0vxJLAnXA==
X-Received: by 2002:a05:6602:2d90:b0:63d:b41e:e4e4 with SMTP id
 k16-20020a0566022d9000b0063db41ee4e4mr16643518iow.172.1654719972035; 
 Wed, 08 Jun 2022 13:26:12 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a056e020b4500b002d39f548bdasm5624959ilu.55.2022.06.08.13.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 13:26:11 -0700 (PDT)
Date: Wed, 8 Jun 2022 16:26:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 1/1] QIOChannelSocket: Fix zero-copy send so socket
 flush works
Message-ID: <YqEF4ikvnsizTQGO@xz-m1.local>
References: <20220608181808.79364-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220608181808.79364-1-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 08, 2022 at 03:18:09PM -0300, Leonardo Bras wrote:
> Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
> part of the flushing mechanism got missing: incrementing zero_copy_queued.
> 
> Without that, the flushing interface becomes a no-op, and there is no
> garantee the buffer is really sent.
> 
> This can go as bad as causing a corruption in RAM during migration.
> 
> Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> Reported-by: 徐闯 <xuchuangxclwt@bytedance.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Copy Dave/Juan; Leo please remember to do so in the next posts, or no one
will be picking this up. :)

-- 
Peter Xu


