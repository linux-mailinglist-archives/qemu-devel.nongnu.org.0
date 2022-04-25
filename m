Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B250DA8F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 09:53:36 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nitXL-0006t9-LN
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 03:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nitTd-00053j-76
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 03:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nitTV-0005FF-KF
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 03:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650872975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2ZLe05nnlOVT7ZTNmy+2T9Wi5s1XHGni3I3xc4Kd5E=;
 b=VPx/wTsUMz5dCcJNJJZ1o2K2oX3JbOlcW4C2CAGzDPUI5Md4D3ARDgyZ2fLorOM5zmo9Oz
 J8TO5EZdBQyFyf/7Nn5z0wC+iTMz4PVxU0d1kmJuCEFjo4YUN9CPwJO39r/uQ5qKFfBzH3
 XgsWstLZpLN2wgRqgXYVHpN7cLOf7cs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-KPMvHhlxMzumqgoHFKZTZw-1; Mon, 25 Apr 2022 03:49:34 -0400
X-MC-Unique: KPMvHhlxMzumqgoHFKZTZw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so3340225wme.5
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 00:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=D2ZLe05nnlOVT7ZTNmy+2T9Wi5s1XHGni3I3xc4Kd5E=;
 b=8RPapZb1osot6yfZ869D43+k93U/WhfU3GjHaENf8tPxFmQ0MshfsLleXbHH3qMLj1
 CPh8N5jrgLfUdSvigeoyuweby+EAFLJD7zsHlkrmkX0vWv4kRCc466tK2cEZHfvd/kru
 YomtgjgLoxv+vgU9xuSaxJJwRWNpeMTQNAQG3pU2a3Nipv6VXtWuVfs1lqL0mqkYpx01
 rVApRrD9fXmIfoU4x8ZtuCCBx9ZoQn4J003feXTWVGVoXO29mxHMFW5yNwnzkxpBKuXd
 c7lSwSPnbirtxlx6sa9y86UIgxB3Ft70iwOAdznu7IAQEBkrZc8t4Ayc47xyb/DAqTTS
 zU4w==
X-Gm-Message-State: AOAM530ClvKfsjxsftQCVg2r8+FT6J8LYMH9DkVMqxb0UZipVPNZJc/Q
 QQi7ZS9FbOwfpvBE8Tn7RzP1gaurkhLFDLQY9dudL9wkej4R27WaqH0wYA7gPq09VLvENq1Dam7
 JU/6r+LZ8qxBF3mE=
X-Received: by 2002:a05:600c:1c9c:b0:393:ed77:5b6e with SMTP id
 k28-20020a05600c1c9c00b00393ed775b6emr1681790wms.188.1650872972992; 
 Mon, 25 Apr 2022 00:49:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6iD7B3KBlWXsCiF0Mj29WO489vg00iB3rclw/JBRecRMrCLfbppLooBOPYsv8EPglIOvqQw==
X-Received: by 2002:a05:600c:1c9c:b0:393:ed77:5b6e with SMTP id
 k28-20020a05600c1c9c00b00393ed775b6emr1681767wms.188.1650872972753; 
 Mon, 25 Apr 2022 00:49:32 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92?
 ([2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b00393e80a7970sm3896034wmq.7.2022.04.25.00.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 00:49:32 -0700 (PDT)
Message-ID: <b739c1b70ea90892e561f4a2c3616a7b286c9640.camel@redhat.com>
Subject: Re: [PATCH v5 0/3] util/thread-pool: Expose minimun and maximum size
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Mon, 25 Apr 2022 09:49:31 +0200
In-Reply-To: <87ee1lrb3y.fsf@pond.sub.org>
References: <20220422163857.703111-1-nsaenzju@redhat.com>
 <87ee1lrb3y.fsf@pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, eduardo@habkost.net, hreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2022-04-25 at 07:22 +0200, Markus Armbruster wrote:
> Nicolas Saenz Julienne <nsaenzju@redhat.com> writes:
> 
> > As discussed on the previous RFC[1] the thread-pool's dynamic thread
> > management doesn't play well with real-time and latency sensitive
> > systems. This series introduces a set of controls that'll permit
> > achieving more deterministic behaviours, for example by fixing the
> > pool's size.
> > 
> > We first introduce a new common interface to event loop configuration by
> > moving iothread's already available properties into an abstract class
> > called 'EventLooopBackend' and have both 'IOThread' and the newly
> > created 'MainLoop' inherit the properties from that class.
> > 
> > With this new configuration interface in place it's relatively simple to
> > introduce new options to fix the even loop's thread pool sizes. The
> > resulting QAPI looks like this:
> > 
> >     -object main-loop,id=main-loop,thread-pool-min=1,thread-pool-max=1
> > 
> > Note that all patches are bisect friendly and pass all the tests.
> > 
> > [1] https://patchwork.ozlabs.org/project/qemu-devel/patch/20220202175234.656711-1-nsaenzju@redhat.com/
> > 
> > @Stefan I kept your Signed-off-by, since the changes trivial/not
> > thread-pool related
> 
> With the doc nit in PATCH 2 addressed, QAPI schema
> Acked-by: Markus Armbruster <armbru@redhat.com>

Thanks!

-- 
Nicolás Sáenz


