Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF594AE046
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:01:52 +0100 (CET)
Received: from localhost ([::1]:56268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUoJ-0006L7-7P
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:01:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nHTtg-0004n2-L7
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:03:21 -0500
Received: from [2a00:1450:4864:20::52f] (port=33723
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nHTtT-0000Ch-Ou
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:03:20 -0500
Received: by mail-ed1-x52f.google.com with SMTP id b13so38796386edn.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 09:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EhT4tYE+dCTclvayzsfvuTdLEJke13Sy+eLSt++zwSw=;
 b=sawp2EIYvilKnSa6TGXuzHxNbVjv80bvCqh6W+bNZxkDbJTnEmDhVAk+n9NAgFzBVO
 RTfywZjJPUZL2OhNp65vZK68Fs8s3CnYbk4pYJhA6tCgqLPkJ9VyWUZaOSz1jAZ8wgZ2
 qSqYWPbpTndKXLDia5rE9446OHk6nLYXD4LI3KevWcFCzocFTLVK8gqHWBgsCV6y4hU3
 Ytmztmte0C4HQYqjlO3E/Wg3BePmUdbPeZYxK8oTA35bw3u+JhguZDYcKFmD2mZT0dUK
 S4a2FrFrfweIpM15jLEHlu8BGv61thR1LTU5jYobF2l4kL50MUXVcuPAIn64St1LVKfa
 JRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EhT4tYE+dCTclvayzsfvuTdLEJke13Sy+eLSt++zwSw=;
 b=FE6x+F+nb3EzDLyLNo3EjS5Wakkxd40c4sKBpC4oafQoPIJjegKY0+w4GwhbGgrpT3
 IqRAy+QmNZYNYCmZkkllliVIKn2LpqJNcAKw9Wr3snboEAquZXPZzRENbPqhtp5A09wX
 a3OaHPU/C+OCwTCvTROb1lKK3W0Oxn3jnyN5xqpg0ycowEWRidwX8F6sBfGwpju6PMwG
 Q8f40jqYvXWE98eB4asPwEZhCl7wdx+OJ5OjkkgcQMsZt5ZW9H/DnRY5ryuzRK3QPVaU
 C4hbyHXJ/Uj/lIxNSmtFSic9YhYTRdoqyb+r2YpwXqZj8C+bLcERdZZ7GNxo/mU6lCjw
 UGsQ==
X-Gm-Message-State: AOAM530aOdjERhet8aBRGGjAKnAdBakdahQcV9HZtvY13KXBYPHRFQX3
 5ASZ4UiwbtPO91Njj7XyXETPoQ==
X-Google-Smtp-Source: ABdhPJyYsISuNbbERRbILRmEJmKqH/eH7y6YYU4cFTGgsP698aGANWoyRzlGwUXo7h0CXqnRLGK3KQ==
X-Received: by 2002:a05:6402:26ce:: with SMTP id
 x14mr5423327edd.211.1644339781112; 
 Tue, 08 Feb 2022 09:03:01 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id bm4sm5478597edb.21.2022.02.08.09.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:03:00 -0800 (PST)
Date: Tue, 8 Feb 2022 17:02:37 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/4] virtio-iommu: Support bypass domain
Message-ID: <YgKiLU3VIbTiOtZL@myrica>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-4-jean-philippe@linaro.org>
 <bf447d9b-c039-ccdc-f24f-ab8b56c1b196@redhat.com>
 <YfffLBO47Sh3uq1b@work-vm>
 <140a23d7-d128-1273-6f07-0883e13c4600@redhat.com>
 <YgJiWMcPp5OlCUWY@myrica> <YgJrc5USsfszKrTw@work-vm>
 <ecfc42a0-15bf-3cde-2711-434fdb40f28d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecfc42a0-15bf-3cde-2711-434fdb40f28d@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 thuth@redhat.com, mst@redhat.com, cohuck@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, Juan Quintela <quintela@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 02:29:21PM +0100, Eric Auger wrote:
> Hi Jean,
> 
> On 2/8/22 2:09 PM, Dr. David Alan Gilbert wrote:
> > * Jean-Philippe Brucker (jean-philippe@linaro.org) wrote:
> >> On Wed, Feb 02, 2022 at 02:21:37PM +0100, Eric Auger wrote:
> >>>>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> >>>>>> index ec02029bb6..a112428c65 100644
> >>>>>> --- a/hw/virtio/virtio-iommu.c
> >>>>>> +++ b/hw/virtio/virtio-iommu.c
> >>>>>> @@ -43,6 +43,7 @@
> >>>>>>  
> >>>>>>  typedef struct VirtIOIOMMUDomain {
> >>>>>>      uint32_t id;
> >>>>>> +    bool bypass;
> >>>>> I am afraid this will break the migration if you don't change
> >>>>> vmstate_domain.
> >>>>>
> >>>>> See static const VMStateDescription vmstate_domain.
> >>>>> Also you need to migrate the new bypass field.
> >>>>>
> >>>>> Logically we should handle this with a vmstate subsection I think to
> >>>>> handle migration of older devices. However I doubt the device has been
> >>>>> used in production environment supporting migration so my guess is we
> >>>>> may skip that burden and just add the missing field. Adding Juan, Dave &
> >>>>> Peter for advices.
> >>>> I'm not sure about users of this; if no one has used it then yeh; you
> >>>> could bump up the version_id to make it a bit clearer.
> >>> Thank you for your input. Yes to me it sounds OK to only bump the
> >>> version_id while adding the new field.
> >> Ok. Just to make sure we're on the same page, this means we don't support
> >> migration from new->old or old->new instances, since the migration stream
> >> doesn't carry a version ID for the virtio-iommu-device and domain
> >> vmstates, as far as I understand. I also believe backward-incompatible
> >> changes are fine this time around, though I don't have much visibility in
> >> what's being used.
> > I think the stream only has it for top level devices; I've not dug into
> > this device.
> Not sure I get what you meant:
> 
> vmstate_virtio_iommu has a version_id. Also vmstate_domain has one.

These version numbers are not sent as part of the stream, unless I missed
it. On the incoming side, virtio_load() calls vmstate_load_state() for
vmstate_virtio_iommu_device and only looks at the internal version number
(dc->vmsd->version_id), it doesn't check version numbers from the stream.
So if the sender is old and the receiver is new, the stream doesn't have a
bypass field but the receiver will assume it does, and will consider the
stream corrupted.

Since we're not concerned about compatibility for the moment, I think we
could just add the bypass field without bumping the version number, the
behavior will be the same.

Thanks,
Jean

