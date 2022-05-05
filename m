Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E8051BFC5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 14:48:10 +0200 (CEST)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmatt-00058r-4L
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 08:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nmane-0000GZ-Bb
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:41:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:20131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nmanc-0006dB-KA
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651754499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kmkvSTNg6/igBtSj0Z5IeR7gBfm+ZQbSb+yReOENe2g=;
 b=jP5K5VXWfvBY+xcNoaV/7Tyf230gByGJ5z9Bc/mhASAPBUNHqf2dtKTdUWpRzlPL07VXRT
 9S3W330mBG7rwz+oRJ9jmJDXsBIFDimpeKoHkOu1vBYWXarDQZnuv1Xi87td5mzGq6mGq+
 N+LV0XdKYHDXdYfvazriAg3Eh2mAGdk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-k8JSU8QxMYC5FDIM8hpZpA-1; Thu, 05 May 2022 08:41:38 -0400
X-MC-Unique: k8JSU8QxMYC5FDIM8hpZpA-1
Received: by mail-il1-f200.google.com with SMTP id
 q9-20020a056e02106900b002cbc8d479eeso2306705ilj.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 05:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kmkvSTNg6/igBtSj0Z5IeR7gBfm+ZQbSb+yReOENe2g=;
 b=hhduCVkb5DAGjuFghVjTqGXfhsBFqlMhzSsPlv5Nz3my3KBY/XCiqMRlA7s8H5aKQZ
 pM5LcpPZDqe794TPL0pGmbI1LJ/g7KDprVlvMKqffg8K6XHo5VV7mSLXJAzapxKS/MpA
 Cc9GlRtWcBu5aEWWJKHXFxp6i23OBWfvl35o/7qZgTE/hqjgYSAlaVulrXVsS1kxJRdI
 elqtSRPkAIJKexu8xXv+Xfg2JsdH2G3tebjNAx9RBkkc2ZESJVwwsw7K9VFlscvKIcpD
 ai33fm+fRsjhy6LVtStSaSkkEsLGwyqV7Dx4cuEJCVcIOa0KC+gm0ik1c2rjCBLCdl50
 UrLg==
X-Gm-Message-State: AOAM533f/0WF/DzGGJrauOtRBAdUe0SY+MOFdFER3tAGXEIw7RnSCLn1
 35hloJ9y+gK3E7WxkabPtCB/f1k3JaCyykTwCcdSfrkmRtopw08qmy2Qc405OCDraKi77wr+6YW
 kYgoXAxSj2HH7Dqw=
X-Received: by 2002:a05:6602:3c2:b0:64f:ca2a:80a6 with SMTP id
 g2-20020a05660203c200b0064fca2a80a6mr9686013iov.36.1651754497968; 
 Thu, 05 May 2022 05:41:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGeALMRCmtSjtd3e+hahclv23CP97txbhgGJt9LkhCDTMD7BpcgBviBYx38Ml4GeVvQ02ujQ==
X-Received: by 2002:a05:6602:3c2:b0:64f:ca2a:80a6 with SMTP id
 g2-20020a05660203c200b0064fca2a80a6mr9685994iov.36.1651754497765; 
 Thu, 05 May 2022 05:41:37 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056638224a00b0032b3a78175esm471572jas.34.2022.05.05.05.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 05:41:37 -0700 (PDT)
Date: Thu, 5 May 2022 08:41:35 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Subject: Re: [PATCH v11 2/7] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YnPF/+IgRUHaztI+@xz-m1.local>
References: <20220504191835.791580-1-leobras@redhat.com>
 <20220504191835.791580-3-leobras@redhat.com>
 <YnLZovDd8YCj/QxF@xz-m1.local>
 <CAJ6HWG7A1sCgyH8+cPgxdGY_+eAuVe+sbr_1q+VYkKH-He97EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG7A1sCgyH8+cPgxdGY_+eAuVe+sbr_1q+VYkKH-He97EQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.74; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 05, 2022 at 01:20:04AM -0300, Leonardo Bras Soares Passos wrote:
> (2) is already implemented in v11, but I have no issue implementing
> (1) for v12 if it's ok to create this 'global' define.

Dan's suggestion in the other thread sounds good to me with current
approach, on having CONFIG_LINUX to wrap the defines.

But note that it's still prone to change in the future, e.g., when other
qemu modules start to use MSG_ZEROCOPY, we'll probably at least move the
defines into some other headers.  We could probably need to clean things up
when it happens.

But I won't strongly ask for that - we can leave that for later.

Thanks,

-- 
Peter Xu


