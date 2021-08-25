Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB2D3F7D56
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 22:50:35 +0200 (CEST)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIzqv-0001Vp-IM
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 16:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIzoq-0007rD-Vo
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIzop-0002ZL-Jf
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629924498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxNrTtEJNTuMfz8ElIq3eSsDU7sWLpW5q3J1zQoQU3M=;
 b=cyhJQEYKSHMrA+AgQel2qJ6moIkImemX9oeR5QAG2y+YlYjBthKRm0Tfg+/llg8ihQ2G3P
 HQZvPowNJgw6IyqrPW6sbgBmDreDxCoTOnfnszm0FuE2/HS+ncyjKfFctRhsCM5rFfWOM1
 WgUtLjOTIvoHQ9MtGX33r4S22Xi8nCA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-xVKFu60EMBOHeHxvx5fUeQ-1; Wed, 25 Aug 2021 16:48:14 -0400
X-MC-Unique: xVKFu60EMBOHeHxvx5fUeQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 c4-20020a0ce7c4000000b00370a5bb605eso785091qvo.0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 13:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sxNrTtEJNTuMfz8ElIq3eSsDU7sWLpW5q3J1zQoQU3M=;
 b=U83H5D5J67TzRmDjoQByvO0GPdz8bxkKVubnGNn+ZJ/BeQ6i08fRR8qTnEgwNDtV0J
 EzcY+onsn8keivew7PziDS/8ccJm7FK/bk6LUk9gNl43l455b4Z1pjdiVCt5zHCxM4kl
 XxMIqvdif5rgnnucnSFeSVKsr3beiwxS/n5ZKdiUpQR2q1dv9pvjC5j1IcGfSbCqbs6e
 EJh0jl3QGjM6Cg55tD6K9nkcQDq7DcseHVW0Q4ZGUDfatZ4wNIp/mUnKn65jaVa6HXbd
 n3cH9BFwj8fAgUDV7Cls3AWJY0FtefVsjaSvetWtU4nyvUtRmnhID71YIt1tgc631Zgj
 gBdg==
X-Gm-Message-State: AOAM530+gqIf0Tb22JmiWVcbNYeMQE00v5wQnaSsQ0kA7Sp19exH6jJk
 UGphCIaGOQ8Jld/7HKJgs51T2trfqF2oIB1u3q2exspTAREnKsbjZ0Vhg4gILj8i1J8pdLs5zyh
 /d0c71duL/EI93q8=
X-Received: by 2002:ac8:7444:: with SMTP id h4mr128269qtr.337.1629924494493;
 Wed, 25 Aug 2021 13:48:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ8hBXw8KsFNOX9vyLqg3tnQDVGagu/B6bw2eCH/0JIJMfO3IXy2i6PcZaC8cAwq9jVIAHIQ==
X-Received: by 2002:ac8:7444:: with SMTP id h4mr128246qtr.337.1629924494270;
 Wed, 25 Aug 2021 13:48:14 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id s18sm879911qkj.87.2021.08.25.13.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 13:48:13 -0700 (PDT)
Date: Wed, 25 Aug 2021 16:48:12 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 2/2] dump-guest-memory: Block live migration
Message-ID: <YSasjN1IXkWihV0j@t490s>
References: <20210824152721.79747-1-peterx@redhat.com>
 <20210824152721.79747-3-peterx@redhat.com>
 <CAMxuvay2ftUEd7ZW3Wu-ekbkSmj-wpqy6+k2TnhBafSwpf0KPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvay2ftUEd7ZW3Wu-ekbkSmj-wpqy6+k2TnhBafSwpf0KPw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 11:36:08AM +0400, Marc-André Lureau wrote:
> Shouldn't this be placed earlier in the function, before
> runstate_is_running() and vm_stop() ?

Good point...  Will respin, thanks!

-- 
Peter Xu


