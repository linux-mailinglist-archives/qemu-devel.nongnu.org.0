Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33B6FD92F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:24:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwf7f-0007To-NV; Wed, 10 May 2023 04:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwf7T-0007PZ-W7
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:24:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwf7R-0007vg-Aq
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683707056;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gGNsuK8Nr0bGY0bTLQg76aBa4MuYy3qOQOmfr7qA3oM=;
 b=Msrtj3RjsDXFd178qfEHE1r/Fy8XWtPtYOLDPtMxYoGQ2JmnWHeLtrCi5UeItZadtKFN/d
 FrqByo+tCsNxVuq+2uHOtL/eLjdZMQhK4aP+vBp3XvkURtESI4YXAjBTyQs7AVAV8hKOHj
 xIMsCf6zl86NqJwqnIVxhzu9efrTat4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-TtvgPmICMHOh9vWw2ka-Ww-1; Wed, 10 May 2023 04:24:15 -0400
X-MC-Unique: TtvgPmICMHOh9vWw2ka-Ww-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30633990a69so2348742f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683707054; x=1686299054;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gGNsuK8Nr0bGY0bTLQg76aBa4MuYy3qOQOmfr7qA3oM=;
 b=Be8QJNJSmmAXmf4k6gyor8jiFVpr7Fbn+lUJjfrrXsHVt8Ae1Zjy8+agKwVTvARwUQ
 QDfBvEhYdLTQiVSC4re/mZ2vLc8moxaoT2f2ffY9v81dmpfcLp7W0Pp897RyY89lVlnk
 wL78G9i8DsJEE0RSY/JfLGIi9gDXOlFfz9zRaNc0OGobnYM4XwY5YB+lqIyBVOtgxmL1
 wiGmkXyneJFRARLCdtmk5QvZGSBuK9ruozxI14TtjQHAu3b7/N0OZpSM6dUWxBNsybQU
 651maUJuD1fTnhpWGJJy6FWrXwvUkfDFXHsUE1BRlb1NSlMg+vhlh/Pwhu27FYeYQCvp
 pcNg==
X-Gm-Message-State: AC+VfDzF6A9i+0fa7opqlBt8iPsGOiRtsFDyy+uGNAwNl9gDvN4oT5JV
 SDLxfpowM2/5pylIq3mxRpj0HAhlShY1oQxI/poKdWXBbNHpxZHGtyrN5Vmk5gnlaR1JmTKWSoy
 BRfBK6z4xc8E0hsM=
X-Received: by 2002:a05:6000:192:b0:306:489b:3c6 with SMTP id
 p18-20020a056000019200b00306489b03c6mr10834127wrx.58.1683707054322; 
 Wed, 10 May 2023 01:24:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Qh3EsX2Kn4cIHxDzD+OSFmAAh3jGhqLDWd6id/It4k9w3d71Hiyw3Bmn2gVaL3XqtQ30zXg==
X-Received: by 2002:a05:6000:192:b0:306:489b:3c6 with SMTP id
 p18-20020a056000019200b00306489b03c6mr10834098wrx.58.1683707053977; 
 Wed, 10 May 2023 01:24:13 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 b10-20020adfee8a000000b002f013fb708fsm16789975wro.4.2023.05.10.01.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:24:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,  Peter Xu
 <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Yishai Hadas <yishaih@nvidia.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Maor Gottlieb <maorg@nvidia.com>,  Kirti
 Wankhede <kwankhede@nvidia.com>,  Tarun Gupta <targupta@nvidia.com>,  Joao
 Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 1/8] migration: Add precopy initial data capability
In-Reply-To: <20230501140141.11743-2-avihaih@nvidia.com> (Avihai Horon's
 message of "Mon, 1 May 2023 17:01:34 +0300")
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-2-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 10:24:12 +0200
Message-ID: <87o7msa91v.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avihai Horon <avihaih@nvidia.com> wrote:
> Migration downtime estimation is calculated based on bandwidth and
> remaining migration data. This assumes that loading of migration data in
> the destination takes a negligible amount of time and that downtime
> depends only on network speed.
>
> While this may be true for RAM, it's not necessarily true for other
> migration users. For example, loading the data of a VFIO device in the
> destination might require from the device to allocate resources, prepare
> internal data structures and so on. These operations can take a
> significant amount of time which can increase migration downtime.
>
> This patch adds a new capability "precopy initial data" that allows the
> source to send initial precopy data and the destination to ACK that this
> data has been loaded. Migration will not attempt to stop the source VM
> and complete the migration until this ACK is received.
>
> This will allow migration users to send initial precopy data which can
> be used to reduce downtime (e.g., by pre-allocating resources), while
> making sure that the source will stop the VM and complete the migration
> only after this initial precopy data is sent and loaded in the
> destination so it will have full effect.
>
> This new capability relies on the return path capability to communicate
> from the destination back to the source.
>
> The actual implementation of the capability will be added in the
> following patches.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>


Capability definition is correct.
I am not given the review-by until the rest of the series is discussed,
but nothing else to do here.


