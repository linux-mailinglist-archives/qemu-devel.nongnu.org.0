Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1ED429414
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 18:01:50 +0200 (CEST)
Received: from localhost ([::1]:50910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZxkK-00089x-Ai
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 12:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mZxeh-0005Ih-Cl
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mZxed-0004iY-CH
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633967754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6kkGhvhYCg69b9tw4a7/BkigX/HW29v5oKQ14DewJwo=;
 b=dfPn6DchU7y5cZKYGBV9/SLs1vAquq3jQpg1eEoxrkh+dnMroMySyWGB389PYAubLL8S+2
 senc2WbCz/XMR2rCmbbBNI/AbQXRoYvrIE1aBBOAKV0j1ypQDTpRiPQfFJA+EESKpBB7Qb
 upvnB+BlW67+P9hmEBDlyB2+9iqvjUo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-6GURCbzTNTWU22-95WE3_w-1; Mon, 11 Oct 2021 11:55:53 -0400
X-MC-Unique: 6GURCbzTNTWU22-95WE3_w-1
Received: by mail-ed1-f70.google.com with SMTP id
 c30-20020a50f61e000000b003daf3955d5aso16317684edn.4
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 08:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6kkGhvhYCg69b9tw4a7/BkigX/HW29v5oKQ14DewJwo=;
 b=asFDpQOD9RLfPujiBXyVnhJj84opiReK5VOUcKRw2yfeS5MmJ5vLrH3J1ZjurB8kRe
 IgAzabC3MeBt2vZHxh71vch114iITQ6E0iST1oWXT47pGniE59wJOeWnoqIJVguBEOqG
 2qsCDynPHeeumdJcd5Xj3vG/8+k51g+aGdZ1n8ARuzcM8gku9ypWfouWJGK3PwOOvIhp
 4PU95mSaRqBmnPfk8i0RKem0G1G6nvr/pWAy82kaOrRhFx2pqHrT7xoxM6GXYyjwnGa2
 uEY+YIQdq831RpfvG63tVVLRZ5KcH3mhFqDt7heyt1QT96l/qpRuKGuK8Kq3jtadMi6Y
 sCSg==
X-Gm-Message-State: AOAM530fGCvOGH9p8lLiv3IJ1WTEHWJ8ZeGXzVkzJOJ9G7LLgu4IOrr+
 ClgFqTi5FGFoWMor8onzArAyaAld8D71T3NxIH4L4HwHEfNunxU8aY/Xg7qITeflt04ZmrFtmo6
 fXQPUgSkSDIJl9iM=
X-Received: by 2002:a50:d4cd:: with SMTP id e13mr41871216edj.29.1633967752058; 
 Mon, 11 Oct 2021 08:55:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkKhJ08fT/kV/cPCr3ZavDqEQST7PjF2BAS9Wn+lX9H/Tww92D7lknrxo793I2Gg+XezaPIg==
X-Received: by 2002:a50:d4cd:: with SMTP id e13mr41871195edj.29.1633967751896; 
 Mon, 11 Oct 2021 08:55:51 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
 by smtp.gmail.com with ESMTPSA id u6sm4372390edt.30.2021.10.11.08.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 08:55:51 -0700 (PDT)
Date: Mon, 11 Oct 2021 11:55:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: ACPI endianness
Message-ID: <20211011115521-mutt-send-email-mst@kernel.org>
References: <957db5ec-fc70-418-44d9-da4f81f5b98@eik.bme.hu>
 <612d2f0b-f312-073d-b796-c76357ba51a2@redhat.com>
 <d8284c4-c2e7-15e9-bec5-b2f619e1e6ad@eik.bme.hu>
 <20211011080528-mutt-send-email-mst@kernel.org>
 <327dd794-f698-3187-c17d-80b33db664b@eik.bme.hu>
 <20211011093206-mutt-send-email-mst@kernel.org>
 <f247499d-ced0-5b98-85ac-57a79b72816a@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <f247499d-ced0-5b98-85ac-57a79b72816a@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 03:51:01PM +0200, BALATON Zoltan wrote:
> > ... but given we did not previously do the read, maybe we should keep
> > it that way at least for the time being.
> 
> How do you know there was no read before this write? Did you check it? I've
> only added a printf in the write method and saw the value was swapped but
> did not check if there was a read before that. There are no traces in these
> methods so maybe I would not see it unless adding a printf there too.

All I am saying is that qemu did not convert a write into
a read+write.


