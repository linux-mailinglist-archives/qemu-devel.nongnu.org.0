Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07084224F5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 13:24:53 +0200 (CEST)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXiZ2-00057k-M4
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 07:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXiMJ-0001kb-3Q
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:11:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXiMG-0006iG-Dn
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633432299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eeArBAcS9Q84SLX+oAxukLYME3k/d29Rm/s+++jGKPE=;
 b=ZcCuFqMVf7URhd8RcB7JNygzxhK70C+piChv456ImybACHPAUOrnnsuILbVvNeBBBjiugQ
 xcJTb33i7KpJZ5yza+lC6tWfyICx9Yiabvg2JH+b76RI8LX4mzT8C0zXYrYKfmzP+8er2q
 0MGLSwos/0eof98r/50QdY3QUzq10fw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-EhYB4OPjPOGkxnclLAWxAg-1; Tue, 05 Oct 2021 07:11:38 -0400
X-MC-Unique: EhYB4OPjPOGkxnclLAWxAg-1
Received: by mail-ed1-f71.google.com with SMTP id
 c7-20020a05640227c700b003d27f41f1d4so20244715ede.16
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 04:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eeArBAcS9Q84SLX+oAxukLYME3k/d29Rm/s+++jGKPE=;
 b=LGYfhkM4OSoZmpn//6YXN0Ymq6RYqxaUyBDdIk4llzCu4OLrG2RZak+3UtCzDFgKHM
 LwR03/csVIoOcPDBu7feyjnOx9i4hJOZFPOMhyg8FIIyp+zFSs2k0Am11/VbTZZ5I5Ka
 J/d+sR+ym9XpX8Z+9R3H1+tjD49fmXlSDDby5an+hnVfF2TkSR3gUMhqvIRf49KIUSV2
 4Pu0/2Xo9h7//Wyg+mQLtVUuAphUB4FCCXH1nR2H0bx85iex7vZgCM8bJTrXRpsXJvn5
 xif11li6HqnfmAq5nY35Rdh0qONuMHz+nWxJ6FlFivHwda+pAuCt8z9VSaN0OMH1Ez3k
 wA2w==
X-Gm-Message-State: AOAM532DKoVI4C0wRWtniA/w4CD9nsY5wa7AHNGm8uTE8C9xeKCwRWwH
 hUJlbyjWOMXKyEWL34GtuFeXfQNeKhjoqdGcmesGBSKpx9kHi6Z5OYR5jCzoH8q/sZyliv88Ivo
 tArGOKFKFEjKi0bo=
X-Received: by 2002:a17:906:81da:: with SMTP id
 e26mr23837031ejx.296.1633432297531; 
 Tue, 05 Oct 2021 04:11:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcsiNXEPQdBdUK3S2sCQgXB8aTeyms7C9ktkEXECdOiZs9AxXkmtcIiymlmiwW6qydZSPVfw==
X-Received: by 2002:a17:906:81da:: with SMTP id
 e26mr23837003ejx.296.1633432297372; 
 Tue, 05 Oct 2021 04:11:37 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id q6sm7451568ejm.106.2021.10.05.04.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:11:36 -0700 (PDT)
Date: Tue, 5 Oct 2021 07:11:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211005071128-mutt-send-email-mst@kernel.org>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
 <20211004090018-mutt-send-email-mst@kernel.org>
 <20211005092539.145c9cc4.pasic@linux.ibm.com>
 <20211005035014-mutt-send-email-mst@kernel.org>
 <20211005124634.2a774796.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211005124634.2a774796.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Xie Yongji <xieyongji@bytedance.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 virtualization@lists.linux-foundation.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 12:46:34PM +0200, Halil Pasic wrote:
> On Tue, 5 Oct 2021 03:53:17 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > > Wouldn't a call from transport code into virtio core
> > > be more handy? What I have in mind is stuff like vhost-user and vdpa. My
> > > understanding is, that for vhost setups where the config is outside qemu,
> > > we probably need a new  command that tells the vhost backend what
> > > endiannes to use for config. I don't think we can use
> > > VHOST_USER_SET_VRING_ENDIAN because  that one is on a virtqueue basis
> > > according to the doc. So for vhost-user and similar we would fire that
> > > command and probably also set the filed, while for devices for which
> > > control plane is handled by QEMU we would just set the field.
> > > 
> > > Does that sound about right?  
> > 
> > I'm fine either way, but when would you invoke this?
> > With my idea backends can check the field when get_config
> > is invoked.
> > 
> > As for using this in VHOST, can we maybe re-use SET_FEATURES?
> > 
> > Kind of hacky but nice in that it will actually make existing backends
> > work...
> 
> Basically the equivalent of this patch, just on the vhost interface,
> right? Could work I have to look into it :)

yep


