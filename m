Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF28687CB0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:52:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNY8E-0008N1-0N; Thu, 02 Feb 2023 06:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY8B-0008M7-I6
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:51:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY89-0003sx-Oy
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675338713;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JisYGYJq8fQwrrCXBkBkDWlrBrqICjFT0yqV2SinDGU=;
 b=GoLApdaGeKV15Q72CO34jbnBDg8b73C7mb9JpvYXKQ3wr63qhigN3Vex8aYTht8nVqW4BU
 SSUE7TrMQdZDaibPJiR4b3qDUSTwu4ZRt4CX9RaPyHHw8rnEAHeH74gMsHa8nY1xDc4K1S
 9fKTc0WcPU2jT14OTgLLF32atmpyqN8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-543-whT0PUkOP9y86QpJPq_uWQ-1; Thu, 02 Feb 2023 06:51:49 -0500
X-MC-Unique: whT0PUkOP9y86QpJPq_uWQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o31-20020a05600c511f00b003dc53da325dso2695054wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JisYGYJq8fQwrrCXBkBkDWlrBrqICjFT0yqV2SinDGU=;
 b=SZxZnjxiQ2iCo1KD3GbvNsufS5y6Lg5vnoznBWn4HYxXp5kfwaikX6BzTWtkpHgUv4
 +mra42wBmDefNhCKvaGW9fkBZusvbrJ0PZOVSUJNCH2bfjeMokwzd9UViXdNJmtOmNhp
 KXJFrPILNVq/u5m14DcusctiL5YtkIsU3tt4hu2UMEbG629B5dR7nL27rP5mY+9L9IiS
 hHJP2u+uA4cdadOnGDzICVaoPuDj8D6XXrwoyy1fkab61yQ0ITDJxQlMYM3uRh6ekIAW
 5uSIBoqz6EP9rdfmArMIeIN3DOwf6iEki/1aMbrWs3y78bhrY2IBBjSiEUZX9lZmfKpj
 k2LA==
X-Gm-Message-State: AO0yUKVuuAPwSrmLrTQ5aJTzSNoCI7RRBKHYdi/h0wy3YNOonX5345Vj
 RmB6dHtDp5b8blXd3a8M0TNxH5k7seSB5dV/sj8SaAQmpmsI9/VkbHxP3FyF83KOcWMx8jrxZlu
 DGpiKfzKHosWc5ao=
X-Received: by 2002:a05:600c:4fc6:b0:3dd:caa8:3ad6 with SMTP id
 o6-20020a05600c4fc600b003ddcaa83ad6mr5461578wmq.38.1675338708897; 
 Thu, 02 Feb 2023 03:51:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+pCvMRPkWOuanMtWK+wVZ9m4doZ+OXNy264+SuwNKD6Sj89aWZ+syNEqC824+SOFUSPYI4Aw==
X-Received: by 2002:a05:600c:4fc6:b0:3dd:caa8:3ad6 with SMTP id
 o6-20020a05600c4fc600b003ddcaa83ad6mr5461565wmq.38.1675338708731; 
 Thu, 02 Feb 2023 03:51:48 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b003db1ca20170sm1710420wms.37.2023.02.02.03.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:51:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v5 5/8] migration/ram: Factor out check for advised
 postcopy
In-Reply-To: <20230117112249.244096-6-david@redhat.com> (David Hildenbrand's
 message of "Tue, 17 Jan 2023 12:22:46 +0100")
References: <20230117112249.244096-1-david@redhat.com>
 <20230117112249.244096-6-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:51:47 +0100
Message-ID: <87pmasnv3g.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

David Hildenbrand <david@redhat.com> wrote:
> Let's factor out this check, to be used in virtio-mem context next.
>
> While at it, fix a spelling error in a related comment.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


