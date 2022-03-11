Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B274D5814
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 03:23:00 +0100 (CET)
Received: from localhost ([::1]:55840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSUvj-0008Ab-8V
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 21:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUsu-0006nV-Iv
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 21:20:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUsq-0001kw-Tc
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 21:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646965200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TbxQEMQVzLEgUANHiODBk2sJKm4ffjXIEqTYDkedQgE=;
 b=YX3ahT70JvONFftr/6Uf5d1eDwv3irOIvUXLNRpgl04ffytKWQFWPE27bujcUsbA7Wu3sN
 nPqobLJ6CcxN9tsUqXnElOE3gtTi6+ytXl7RRrlq0thzWrVL+MxClv5+H/E2mn2WEcbEjN
 6jq6C3Q0xqnFqRsQVidxzyIdOJYkzEU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-r_M9_49pNk63yZvwlkjQag-1; Thu, 10 Mar 2022 21:19:59 -0500
X-MC-Unique: r_M9_49pNk63yZvwlkjQag-1
Received: by mail-pj1-f71.google.com with SMTP id
 cl16-20020a17090af69000b001beea61ada4so4413326pjb.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 18:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TbxQEMQVzLEgUANHiODBk2sJKm4ffjXIEqTYDkedQgE=;
 b=24u3Ncw1xxl/0y9NX58fPM8X6hUfXlTviH1WANvWK04yOPLg+CSm5r+CUwCpkM0Mer
 KB3e/GZT4ltffPyU8flBqfZm3bZpwIXZ5Z+DptdCk0zq2rbXAmDi6nOw7+kNoJhQAJmP
 y/nkFmUAhv9lVMx4z0B4nTbO908z7124RdsX1fHMY1AoZhnK1V4fOPvaPUwnCn5+el0C
 ARXA6uRbVqYfBkXBdGu+ejK/NwVQ9eCnY8PFpVsBe1hZXwu1GOkPJziiImvkJ9JDTyl8
 cqakPO511/cj902yPTSvm88hXeg+8X1aM8PNJc6erQSHiyAYHZqsoR1HyhaPoyYQ3z1e
 JDPw==
X-Gm-Message-State: AOAM5335JZVmBODqFJbcBXrzGFxHoAYa4CvnRR1S/sHd2a6k6V09q6Y1
 8ulODO+WMQeCqX/S7lwFT4PJeyPUvzcBBchsNNzQUdwWUlN9joOwDMFutYPO+TFwevh1zXfOkT6
 wELN3abyPdAQd/eo=
X-Received: by 2002:a63:91ca:0:b0:380:484:f2f0 with SMTP id
 l193-20020a6391ca000000b003800484f2f0mr6520867pge.297.1646965197916; 
 Thu, 10 Mar 2022 18:19:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLjyIeHIz+Z3DZHPv+VoRV865sR1karM23/cvNlXSdDmr3mJHXXBAnv8a7KYbjxHuTnrXOdw==
X-Received: by 2002:a63:91ca:0:b0:380:484:f2f0 with SMTP id
 l193-20020a6391ca000000b003800484f2f0mr6520848pge.297.1646965197633; 
 Thu, 10 Mar 2022 18:19:57 -0800 (PST)
Received: from xz-m1.local ([191.101.132.227])
 by smtp.gmail.com with ESMTPSA id
 hg1-20020a17090b300100b001bf70e72794sm10863067pjb.40.2022.03.10.18.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 18:19:57 -0800 (PST)
Date: Fri, 11 Mar 2022 10:19:52 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: QEMU device refcounting when device creates a container MR
Message-ID: <YiqxyCDw/76lTaNA@xz-m1.local>
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
 <c7f6ffef-8ce1-6ee1-9ad7-a90ed1b54122@gmail.com>
 <Yin67GyJWDn5N1ov@xz-m1.local>
 <CAFEAcA_tfxE2kRtbLraXS3+fW8D7UNNJ2QkGSSvLReqt2G=KjQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_tfxE2kRtbLraXS3+fW8D7UNNJ2QkGSSvLReqt2G=KjQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 01:45:31PM +0000, Peter Maydell wrote:
> The other theory I had was "maybe if you put an MR into another
> MR and they both have the same owner then don't bump the refcount"
> but I haven't thought that through at all.

Maybe it'll work, it just sounds a bit more tricky.

> 
> > That means, perhaps in object_init_with_type() we should make sure the
> > object refcount==1 after the ->instance_init() call?
> 
> That's probably a useful invariant, which I bet we don't
> currently get right for every object :-)

Yeah same feeling.. :)

We could have looped over each device and try creating them and fix one by
one?  But I think that doesn't cover all the cases, because instance_init()
could have some sub-regions conditionally added depending on the device
parameters and so on, so they may not be covered by the default values
being tested with.

-- 
Peter Xu


