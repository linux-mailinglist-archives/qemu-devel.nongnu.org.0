Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FEB63EDF3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:35:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0gts-0005TP-EK; Thu, 01 Dec 2022 05:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0gtl-0005Po-Id
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:34:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0gtj-0004GT-El
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669890870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ol33jv5wZs0CL9zaCjn/QHazZbNv55bbxaS1B82ASqQ=;
 b=b3NS+HYcww7tYYXyJVOvK/WAwBVzdkQji6Hg9ltJr4GvkUKlfwFnXTXnIpm7a7ik3LS4mJ
 HI6HK7pdtJfJfqLDA6W3SNxxzA+/s285BpZ+cyAg0jxlw4jnhVdPHZpcGcqNH/WOcDYR3L
 MZShJkiG2x+6FAQrKViObFSZvpT4VWo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-0Wrd_MFOO_mbsab1f9EknQ-1; Thu, 01 Dec 2022 05:34:29 -0500
X-MC-Unique: 0Wrd_MFOO_mbsab1f9EknQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 b47-20020a05600c4aaf00b003d031aeb1b6so2349604wmp.9
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 02:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ol33jv5wZs0CL9zaCjn/QHazZbNv55bbxaS1B82ASqQ=;
 b=c/0pVNs/zhaZstxhWvDfWBGb4zv4U6cqHGS+zyuXTdNgnV3u234OV1vKedvSQ2ZGWu
 SXPHPJaGnfVTZjXwI99OdkiX0ocJkFFWYHAM4ibr0ACfuZLjR5v6yGR3yNrQq5DinJUv
 BEDiGnglxO5MsJxcK72DkD/nfCsW5WcfyQ6WTeB0rdo2RHYBx5YOrX24OJ+axHYIGOai
 Aymq4dq05qOOOO268bKvmvkW1Ed3q46J5OzGQUsIs88+Nj1IS4SfwTbtJnAPq/3rB4iE
 /SdOQP5MNrgSQKv4KrryeMOcMhHpEsXOYx2Sbt9WlsGqcgYgrOoIgU/12ZJES1yVyVD3
 ZKNg==
X-Gm-Message-State: ANoB5pmPgZUTiysPu4Hz/HYI/WiY1nD2BYXV1dHdjniQMPfcDCfnpNHp
 dm0ntkkcHZtFDI4u1+bbW2pJmmH0XDouQcsvQTJMx0xUTCounNy5CyP8DbcU0HROiwxP3ndDZ2r
 IO1iHZ/jzbDaWUf0=
X-Received: by 2002:adf:eb0c:0:b0:236:6deb:4498 with SMTP id
 s12-20020adfeb0c000000b002366deb4498mr41318755wrn.52.1669890868182; 
 Thu, 01 Dec 2022 02:34:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf65UJsccyL0+8jYG3/BvmvSct7wIfSzFFrvtGCq/aNsLvfTZaPZffQnGpwBGWFigBVFTqd15Q==
X-Received: by 2002:adf:eb0c:0:b0:236:6deb:4498 with SMTP id
 s12-20020adfeb0c000000b002366deb4498mr41318720wrn.52.1669890867863; 
 Thu, 01 Dec 2022 02:34:27 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 h6-20020a05600016c600b0023655e51c33sm4222169wrf.4.2022.12.01.02.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 02:34:27 -0800 (PST)
Date: Thu, 1 Dec 2022 05:34:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, virtio-fs@redhat.com,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Fam Zheng <fam@euphon.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 German Maglione <gmaglione@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.2] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Message-ID: <20221201052647-mutt-send-email-mst@kernel.org>
References: <20221123131630.52020-1-sgarzare@redhat.com>
 <Y3+5rfnNmR7R/h6/@fedora>
 <20221125081243.a3q7ep32o6g4r2vd@sgarzare-redhat>
 <Y4fFICp5tBrEPud1@fedora>
 <20221201080250.s3cugnnkf5f4kqvo@sgarzare-redhat>
 <87k03bctrj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k03bctrj.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 01, 2022 at 10:14:39AM +0000, Alex Bennée wrote:
> Do you think rust-vmm's vhost crates have enough of the state
> management to manage vhost and vhost-user backends? Maybe it would be a
> good experiment in replacing a (small well defined) piece of
> functionality with rust?
> 
> That said there is a lot of deep magic in the vhost-net stuff which I
> think is down to the interaction with things like vdpk and other network
> optimisations that might be missing. For the rest of the devices most of
> the code is basically boiler plate which has grown variations due to
> code motion and change. This is the sort of thing that generics solves
> well.

Not sure what you want to replace with what though, libvhost-user or
vhost-user bits in qemu?

-- 
MST


