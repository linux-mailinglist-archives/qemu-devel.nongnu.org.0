Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A450B08E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 08:27:22 +0200 (CEST)
Received: from localhost ([::1]:52442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhmlF-00059q-Lx
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 02:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nhmiZ-00048y-Ts
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 02:24:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nhmiV-0002mh-Ct
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 02:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650608669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HOWVYloVnA/85CBtJ89jOziVmvS8UQsGNH5BlnYU8O4=;
 b=Yn55ZKW9xZlEa/IJfqTuT2Onpy9ihfOJYBJ2NzWAd/i6cHl/NNRrdN615/oPtQRHzipubq
 jpKeZTaWhCiq9Wt2bxS3VGUbajAZrg5Kk38Qr53+GfQNOEIE2/FK7O8alp3xUV8Vuw2pXv
 ss9uDJOmmYOmd3JOQ8xG+N5M21nYKIE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-c2jea3jvPsGtbvbEv5x43Q-1; Fri, 22 Apr 2022 02:24:28 -0400
X-MC-Unique: c2jea3jvPsGtbvbEv5x43Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 x17-20020a19e011000000b004713b5759fcso2762365lfg.20
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 23:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HOWVYloVnA/85CBtJ89jOziVmvS8UQsGNH5BlnYU8O4=;
 b=K8mbxRCwr0wEbevPDI6lrDYMkODa/dofHifN3Cuxr6ZWZE9yUwSsFOXygupJt986pD
 5lU2A3cMnxfsT+klxSUyPV8ftNpncTUi4+IOr4dyI3+IBqJ4iRbGVBmuYW7JgBoClhBi
 r5kIpkdoVwEDzZEYDnzyQaBh/NJKgQjqN4XUt5D5LmdOMiZiy3VFUChwtMOnStpNvpTK
 WmDtfyMS51n1lowMQ4BwheJwFud5euXm+8p6VY8BM72KPvJfB167PLqOMpj0Wu/TOIaV
 x9v4WhhdZrA/46LrcZhChCK/A3ieK/mw8CQv8h18ydF0PujW6Enev5xPth01hwyAuJcO
 pfMw==
X-Gm-Message-State: AOAM532pTYN4AqliorX5W5Yod5t0A8YoT4SzKS9/5+uSXb4EsEK0k+MJ
 ZHj6BGEJgvX1aFzXAt0n5906xxxI+GLBElIEP+wnnVrgbHN8OyYWGQ8mJqHo4jr995eoDxtVLnt
 kTyLTGZeRTEbXc/a+PAuLtF61pkpzozw=
X-Received: by 2002:a2e:81c1:0:b0:24b:f44:3970 with SMTP id
 s1-20020a2e81c1000000b0024b0f443970mr1893119ljg.97.1650608666733; 
 Thu, 21 Apr 2022 23:24:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy58cK/vcVNZn7MyjvgsOPUgHUDEUgB1/xd7iQjXFEY0vjRU88YWmfSz76QEdY3P5IIH9cq1vnuYJPd5vgvPwI=
X-Received: by 2002:a2e:81c1:0:b0:24b:f44:3970 with SMTP id
 s1-20020a2e81c1000000b0024b0f443970mr1893106ljg.97.1650608666523; Thu, 21 Apr
 2022 23:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
 <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
 <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
 <BN9PR11MB5276C1513B8DD829CC87EE898C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEt9J6Jcy7+EmgFm-JTTqd82ONt_aOYRsxnTke2ZNSaA7A@mail.gmail.com>
 <YmHzG4/pAqD9MLE1@xz-m1.local>
In-Reply-To: <YmHzG4/pAqD9MLE1@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 22 Apr 2022 14:24:15 +0800
Message-ID: <CACGkMEtF1BpZoiC1ycoUiF7Y3m9ATkGjGrfU_6OimKLfyKh_+A@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 8:13 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Mar 30, 2022 at 04:36:36PM +0800, Jason Wang wrote:
> > > If not, do we want to apply this version scheme only when it
> > > reaches the production quality or also in the experimental phase?
> >
> > Yes. E.g if we think scalable mode is mature, we can enable 3.0.
>
> Sorry to come back to the discussion late..
>
> I'd say unless someone (or some organization) strongly ask for a stable
> interface for scalable mode (better with some developer looking after it
> along with the organization), until then we start with versioning.
>
> Otherwise I hope we can be free to break the interface assuming things are
> still evolving, just like the spec.

Right, according to the discussion, as long as we don't think it's
mature enough to be capable of version X. We won't introduce the
version.

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


