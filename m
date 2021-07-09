Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE93C1FDA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:09:30 +0200 (CEST)
Received: from localhost ([::1]:33532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kde-0007O8-0e
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kcH-0006PA-ER
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kcF-0003z8-0H
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625814482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C1WClyXuk+DgK6b8s6iBfiXn7eLSHos+Q7vK2LUOH+o=;
 b=eFNjtWUsx+iTPbk144RONbWNpzySp3S8adioEnH7CkeIwZ3SLJQRczmbIktpERtrMSdRel
 kxdgxsVIlMZ89+iSETFre3XCVGfaR4wL33qvMf9Q1zehPqU6kkdqzFRgwjtioOCojZFRtO
 1MmCO8yIkYlxt1UvUk7oNVdgTCFjKM8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-_-gYZN79N9WcrhQ5opXqTg-1; Fri, 09 Jul 2021 03:08:01 -0400
X-MC-Unique: _-gYZN79N9WcrhQ5opXqTg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a13-20020a7bc1cd0000b02902104c012aa3so4564905wmj.9
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 00:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C1WClyXuk+DgK6b8s6iBfiXn7eLSHos+Q7vK2LUOH+o=;
 b=Pln2eSTyr6tkNW/FxuaGMUNYRVn54Akwi9eugvUjY3BCB7qr0U7Q8XPr06lzLxVrjS
 eRnOhCbuI6sgLG2fJguMJN0+N4qKZBTWJ5mgc1L+MTWMBLflf0YIKBpIcIPkM6e/ZFaa
 WTfV1XGSLrfCXc5lmNJgRKjRn75iXobNXy4Qsu7XpMiuOroaClCDYIUSEx2kTw62KOmT
 cWyUcV3jXWli6Bgsk3eSuGFCaQM8n577HoaigOnKjUz6+pw/lOSbn4+z0Rx6Kn/VA3rn
 qEN6hSfXLVuJ1EH2hJR3DIl67MgVBENb/Di8cDZoKi/WDm8wiR5aFh0uuAfQC6ISFqkb
 FCUA==
X-Gm-Message-State: AOAM5307JaoOWVKQx71VRTsre3TD//4gJSMYVSEaiDkLooCHU37UXVm1
 z7adETudIGcRVjoXDJoGU6citd/LMzN4Zpnu5SYgHCNMkXwSgooymR97DaOKqFIoyD3fEuCUPnA
 4sQqT8VPHnuvY9Yw=
X-Received: by 2002:a05:600c:4f8a:: with SMTP id
 n10mr9588855wmq.11.1625814480090; 
 Fri, 09 Jul 2021 00:08:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHdxaZZLgYUE54bj4MqT4TWL5117a0ZOcHezs1Lbd+xPRwH95dhd8vaSWWv1GaV7ZTqaTD2w==
X-Received: by 2002:a05:600c:4f8a:: with SMTP id
 n10mr9588824wmq.11.1625814479844; 
 Fri, 09 Jul 2021 00:07:59 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id s1sm11218520wmj.8.2021.07.09.00.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 00:07:58 -0700 (PDT)
Date: Fri, 9 Jul 2021 03:07:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2] docs: Add '-device intel-iommu' entry
Message-ID: <20210709030741-mutt-send-email-mst@kernel.org>
References: <20210707154114.197580-1-peterx@redhat.com>
 <a4006a17ddd5d2a4092c7b64b73ca69f62defb35.camel@redhat.com>
 <YOdf0YUIqNBmToQH@t490s>
MIME-Version: 1.0
In-Reply-To: <YOdf0YUIqNBmToQH@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yi Liu <yi.l.liu@intel.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jing Zhao <jinzhao@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 04:28:01PM -0400, Peter Xu wrote:
> On Thu, Jul 08, 2021 at 01:17:50AM +0300, Maxim Levitsky wrote:
> > As far as I know this looks very good.
> > Thanks for doing this!
> > 
> > Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> 
> Thanks!
> 
> Michael - I just saw a pull req sent, so I wanted to double check: should this
> patch go through your tree at last?  Thanks,

Sure. Will be in the next one.

> -- 
> Peter Xu


