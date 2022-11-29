Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982463CA65
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 22:15:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p07vK-0004bd-Ng; Tue, 29 Nov 2022 16:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p07vI-0004b0-Ae
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 16:13:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p07vF-0005tW-Ul
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 16:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669756423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HuBv4pRnKF42CUd/J/CNovolTcn0Eoy2ZjiWr6cX5RE=;
 b=X+SFaQugZmwP0NRoBki89xr3ZF5haq+3xRU7e0lkcFEq5IORxRezSyjs4nbm4BPtK8RZeZ
 gb4QbUo4U2C5zGHmJ73i8CH7Ru7WGkUEbJBaq/l7GyoVef0oF39ZZhVvmta68dMGSOPS0Y
 YKq0c4fzPGXEm6K/uT9GKQ0a0yFLxvw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-lR_qqUxVOr6OTMc0VCYLiA-1; Tue, 29 Nov 2022 16:13:40 -0500
X-MC-Unique: lR_qqUxVOr6OTMc0VCYLiA-1
Received: by mail-wr1-f69.google.com with SMTP id
 e19-20020adfa453000000b0024209415034so2342605wra.18
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 13:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HuBv4pRnKF42CUd/J/CNovolTcn0Eoy2ZjiWr6cX5RE=;
 b=nqmwXEcL8J3cnANxDQNhOlJW9oYHfRDtJv8PVzQ8BDUG6zH86jUOyEK/ZAcV3YAKkS
 ISY+Mu7YsagRa6I4ll0Ndf3gIGoAF/LaiVQu8RdUkvM219bvAzcuViIxRTQbJEPFi7gM
 6BqLy4z1+Vf+doZ0/lMnMX6U8rBuJLVaUDiIY15Unkrq09lClef7/9xWVgzTLuoMm+YU
 GYM76PbSq+IDFloBIqPB1GTiVyBN8wOvuJoGryfFdNcyD0jytr+bZkxyadDMLKuqfp7x
 e9JmejLvJzVwyvTgvWU4cHX3LXTImOxUUPp3teI/vBMNCB7sy/gRugjWw8BVga/qRWKA
 +J/A==
X-Gm-Message-State: ANoB5plGIwviGEHqJDV0REwXbOJMfJi6EWVS2QqOPKRV9yxXu2VMX6eG
 ccEHNPpqz9zI3tbF/sLinMDRa1St80EVl4TKb59UEyvjiY97CqvMsWp5qb6BY0mTXjjcO7qCkyg
 Ks0DBraQ1KHGdfK0=
X-Received: by 2002:a7b:cb83:0:b0:3cf:96da:3846 with SMTP id
 m3-20020a7bcb83000000b003cf96da3846mr44897917wmi.10.1669756419486; 
 Tue, 29 Nov 2022 13:13:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5QLVg6JfFAePq9OxKWwZIRUUJS/CeHaUIUAEpwr+73mlrl/cn2FamRO9+aJljQZ9mtgdjZLA==
X-Received: by 2002:a7b:cb83:0:b0:3cf:96da:3846 with SMTP id
 m3-20020a7bcb83000000b003cf96da3846mr44897913wmi.10.1669756419244; 
 Tue, 29 Nov 2022 13:13:39 -0800 (PST)
Received: from redhat.com ([2.52.149.178]) by smtp.gmail.com with ESMTPSA id
 h10-20020a1ccc0a000000b003cfd42821dasm3260757wmb.3.2022.11.29.13.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 13:13:38 -0800 (PST)
Date: Tue, 29 Nov 2022 16:13:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, sgarzare@redhat.com
Subject: Re: [PATCH v3 4/7] hw/virtio: ensure a valid host_feature set for
 virtio-user-gpio
Message-ID: <20221129161306-mutt-send-email-mst@kernel.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-5-alex.bennee@linaro.org>
 <CAJSP0QX1R4Z+AC3591MpwzBAG1Tz3rDTe4+o2rbe0v-q6sSKMw@mail.gmail.com>
 <8735a2yigb.fsf@linaro.org>
 <CAJSP0QWxN2UxaNqST64G=tyUVLn8zbwzotLxHNQ6d6xPTeocgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QWxN2UxaNqST64G=tyUVLn8zbwzotLxHNQ6d6xPTeocgg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Nov 29, 2022 at 04:01:25PM -0500, Stefan Hajnoczi wrote:
> Hi Alex,
> I'm waiting for a v4 or a confirmation that you've retested and I can
> just drop this patch.
> 
> Thanks!
> 
> Stefan

Note things need to be reordered, patch 2 should come last.
So I'd really like to see v4 if possible.

-- 
MST


