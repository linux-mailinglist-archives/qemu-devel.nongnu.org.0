Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5267F6A6FEF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:41:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOZP-0006dW-9F; Wed, 01 Mar 2023 10:40:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXOZM-0006YT-WE
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:40:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXOZL-0005M2-D7
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677685238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=84d4GVepUj8AqRScUP9ba0COmsrc7aTgP5YHRi4DQbQ=;
 b=IcEuJPUuzIyqGuED4bdrFxDgcxPsfWbnAEoObmqhtrkEM1WosUQUttgc2mwnd1xP11a4N1
 DPbm+yXAbrcjzylBUoUFljW0Pr3OJXvwDzcdJ8ZzfvmRfruyyEOuM/ULY6DCKpHRcOn42V
 uR4WlkOJx357STGAVS4bL2HnGQF6oY4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-7W6hZyuaPTmEuiL3501Dtg-1; Wed, 01 Mar 2023 10:40:37 -0500
X-MC-Unique: 7W6hZyuaPTmEuiL3501Dtg-1
Received: by mail-wm1-f70.google.com with SMTP id
 az39-20020a05600c602700b003e97eb80524so8510427wmb.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677685236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=84d4GVepUj8AqRScUP9ba0COmsrc7aTgP5YHRi4DQbQ=;
 b=xW3WpWup13qUEuCTs25Ym42RZ+GdvIGa6rJ0oyu1BH36x7sh6jnN9HNlUWr/tX8Ou2
 IOY8yGtHpmHc8WnDx/b4Kjncn/hBVc0MQ0PhhC8s1VJFkm8o+gcSCJc2zoBWqbFCehfT
 LWCGkJ0ldp9/QaiWXXFnJb6ueNHPpCfRqiJiU2YDkpNvscyAA0V+MOZBOVbQXmVhts91
 P59urFHulZCtiDXVjQeoykSP7DpPMjHrr/i9xs4PLzC3oXt56RzhIntyV8StuvX0TwKv
 n037870KjYwXtD6DSuZJRBqnjZkbnYftlwawGew/2mFh71GTTPfhvM+GTAFWlosVXkOr
 kCRw==
X-Gm-Message-State: AO0yUKXmG453GoH/0SoWJYbCrg1Mv2vaotluhE9MVZazgPruhha+/N0Z
 qfMXKtvwmyW5dcbOfAj4f5jBIAhn7d2VcFR4KXx2KomiKXH+6Ker5rHBqNcTa1TZkgU0VlUTt+Z
 SNBJrLcEJa0ZSf2A=
X-Received: by 2002:adf:ef0c:0:b0:2c7:d56:777b with SMTP id
 e12-20020adfef0c000000b002c70d56777bmr4890548wro.64.1677685236035; 
 Wed, 01 Mar 2023 07:40:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+zkCqHFTSCuJwQYgYqX9Om9S3abHd5UrR6cnw85VmoyWZeiJtfaNVFTZBlskpM5nU6TLngFg==
X-Received: by 2002:adf:ef0c:0:b0:2c7:d56:777b with SMTP id
 e12-20020adfef0c000000b002c70d56777bmr4890534wro.64.1677685235671; 
 Wed, 01 Mar 2023 07:40:35 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 b10-20020adfee8a000000b002c54c8e70b1sm13610644wro.9.2023.03.01.07.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:40:35 -0800 (PST)
Date: Wed, 1 Mar 2023 10:40:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230301103618-mutt-send-email-mst@kernel.org>
References: <20230222074214-mutt-send-email-mst@kernel.org>
 <22fee9b6-1dc0-792c-13cf-54c9303556ab@yandex-team.ru>
 <8372550f-def7-4336-c597-d22155abf145@yandex-team.ru>
 <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
 <20230222115106-mutt-send-email-mst@kernel.org>
 <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <352dc254-f468-4214-413c-5da8ed4fcf8f@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <352dc254-f468-4214-413c-5da8ed4fcf8f@yandex-team.ru>
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

On Wed, Feb 22, 2023 at 10:50:02PM +0200, Anton Kuchin wrote:
> > Property on source does not satisfy both at the same time.
> > Property on destination does.
> 
> If destination QEMUs on local and remote hosts have same properties

I'd say just make an exception from this rule.



> how can
> we
> write check that passes on the same host and fails on remote?
> Sorry, I don't understand how qemu can help to handle this. It knows nothing
> about the hosts so this is responsibility of management to software to know
> where it can migrate and configure it appropriately.
> 
> Maybe I didn't understand your scenario or what you propose to check on
> destination. Could you explain a bit more?

Basically you would add "migration=external" to device before loading.
Pre load check fails migration of vhost-user-fs device if migration
has not been set.

-- 
MST


