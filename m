Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1A0402D46
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:56:55 +0200 (CEST)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNeP0-0002LB-Sb
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNeNQ-0001PQ-TN
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:55:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mNeNO-0003vr-W5
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631033713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wBw/EZJOvmhdz0SMqvw+zHswlLg9LpedATSQUVR3pLU=;
 b=VhoomMZNyiHxDsmSahpTLzYYSIf1U/VqBrAa9ZDHf+YAlJOLEg+5eMM467U9lBeLechweF
 DsEHmh66T0/kK+kNmXhv943kIn0UI4/hJp5pl5B1/GS3OJWQfLJgtP6jBSUE0ntzqE3Emi
 NPeogkvPY61/H9srabKW7MffO7ShvRY=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-DNfY1QMyNHm1LQJwI3m2Kg-1; Tue, 07 Sep 2021 12:55:12 -0400
X-MC-Unique: DNfY1QMyNHm1LQJwI3m2Kg-1
Received: by mail-io1-f71.google.com with SMTP id
 s22-20020a5e98160000b02905afde383110so7939143ioj.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 09:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wBw/EZJOvmhdz0SMqvw+zHswlLg9LpedATSQUVR3pLU=;
 b=T3avTRieGNM54u1+Tf8YN5tNw8NpNMmazpSw0dZQS2wIbzGpjNSey3WFMmAlJg9fm+
 gohCdnPuNrM/H19jHXijr+kiltumHVxnq4pkqbSwR2HdQ1duczXPw5tt4nH5MAs7jjyj
 3FUs+Rl7ABi3rE/EvzYaGmaeVyw6oDNE0WziK9m9QWlxEey/9KvSPvWWW6SMJnSAG4ZM
 u23qH5BmyT2deL1my7TWcickshrZ5s7Via5CuvokUhbTIhgUnZj5aJu4miSbRLzSD4C1
 l95u64Q019Z4U9Ph3pRJu4V/kct/+uBbuYlbiAw/HSsYGcU275+UnRI+Jso7K2Fi4CAL
 LhAg==
X-Gm-Message-State: AOAM530o41WenhpnzaJTWLJAqiNcNHX82dMJlR2I6FRR1bJrS8FXsTkb
 6kI1eEpp5bHv3BaXlNsWzPjUNjW/NtQiQO9/+xywhbe9JAOTZb0J5upDBWCIbuYjmBUpwvXFsjB
 ovoC1SVJJ6QXTFakHlfmWmtZHd8ilw9/6/m4wUXZVmt+eFWz2eRNAhBknGbsMKjwu
X-Received: by 2002:a02:8189:: with SMTP id n9mr16035559jag.107.1631033711840; 
 Tue, 07 Sep 2021 09:55:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/bMQW7wjJ32Zou+QcRdmzhCv01blLNaeAWzeRyrcZw679yq9sLfWavr1AlN0tBYeqK/KUhw==
X-Received: by 2002:a02:8189:: with SMTP id n9mr16035538jag.107.1631033711567; 
 Tue, 07 Sep 2021 09:55:11 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id r8sm7113091iov.39.2021.09.07.09.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 09:55:10 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:55:09 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/2] Makefile: A few fixes to tag generation
Message-ID: <YTeZbVXvYdXxlo8a@t490s>
References: <20210804132328.41353-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210804132328.41353-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 09:23:26AM -0400, Peter Xu wrote:
> I didn't squash patch 1 because they fix different things at different places
> (patch 1 removes the "meson" dir warning on master branch already for gtags).
> Patch 2 is the same as posted previous on the list.
> 
> Please have a look, thanks.
> 
> Peter Xu (2):
>   Makefile: Fix gtags generation
>   Makefile: Fix cscope issues on MacOS and soft links
> 
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Ping - Anyone would like to pick this up?   Even on linux I still see:

cscope: cannot find file subprojects/libvhost-user/include/atomic.h

Thanks,

-- 
Peter Xu


