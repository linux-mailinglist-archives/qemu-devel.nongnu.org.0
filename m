Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354FA6FDA27
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:56:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfcF-0003OV-JJ; Wed, 10 May 2023 04:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfcD-0003OL-Tj
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:56:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfcC-0004iI-DO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683708963;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Vsh+EyQT2kDk9L25kUKBLfj7VWgH7dsBxPpFrwMgLK0=;
 b=h/A+PqtAl0BBCzNAK0veGKe0FEVandc1ZzJAzjemvQD59nAtOjeEkgtdiFRq/pDrkkpzuu
 V2o0yhVK7au3uGt87XcwTdv85jaZ/rsMqB4VO1Qu66ghKSf4M6ICggUulFELEOFUoHgRio
 xDgv1CZz2/2nRJBWLYpp4ZMsnEvDP4g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-si-PdLfrN9Od3snDGTkCNw-1; Wed, 10 May 2023 04:56:02 -0400
X-MC-Unique: si-PdLfrN9Od3snDGTkCNw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f420742d40so15313005e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708961; x=1686300961;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vsh+EyQT2kDk9L25kUKBLfj7VWgH7dsBxPpFrwMgLK0=;
 b=eUi6fB/V6MiOrTnHl9UJM4QLbz9AEWCrUXp1ynSjT8VpkyVZcF3oYGJmUiOWQbJyAI
 C74SoH/77MqFr32x5igv0wu7vT/0DF6ibNHno+zjlkKbbOXuMt1BSQF+d3McCmh8u6ut
 Nv9WSaBWBYQZnOe0rzWbNOepv2A+VexrfnVBPAed8kwNGuewko6WBPQlRR5QEjvxgqqN
 rcSdiYy9KIwzrVJcCIjqf+ZRye0ZPsF0B/OHCMm9Ech8MbB/7ULhYfWow8IaNFT81UUJ
 2ZZbTkR+nC4E1x8dGLrvIBZ5/5qF1mYVwgokb/43jJ+tai6l7Q2sL9oLSFPyq25vJqnA
 RiIg==
X-Gm-Message-State: AC+VfDyHocrAjZftOXO0uxUpPA5BvpLMLjqYksExs6vSr1pwn+gwE0q+
 +k6NR3Hho+3l++Puh+pgHccWq5m//V2dnYvc3VHNcRGwQgKw0miSC72K/nWBr0IFoKemxpP8VXI
 vWe3x07xJhPe3r20=
X-Received: by 2002:a1c:ed13:0:b0:3f1:7a57:45cd with SMTP id
 l19-20020a1ced13000000b003f17a5745cdmr11072615wmh.28.1683708961235; 
 Wed, 10 May 2023 01:56:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DDnS048JOLXlYCpvfKCGkLoPi5tAhDECWWMt2UuX9sO/djSZeT90AFwhgiT2+GZJtvCjfdw==
X-Received: by 2002:a1c:ed13:0:b0:3f1:7a57:45cd with SMTP id
 l19-20020a1ced13000000b003f17a5745cdmr11072597wmh.28.1683708960960; 
 Wed, 10 May 2023 01:56:00 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 f11-20020a7bc8cb000000b003f42413a12esm9297834wml.21.2023.05.10.01.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:56:00 -0700 (PDT)
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
Subject: Re: [PATCH 5/8] tests: Add migration precopy initial data
 capability test
In-Reply-To: <20230501140141.11743-6-avihaih@nvidia.com> (Avihai Horon's
 message of "Mon, 1 May 2023 17:01:38 +0300")
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-6-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 10:55:59 +0200
Message-ID: <874joka7kw.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Add migration precopy initial data capability test. The test runs
> without migration users that support this capability, but is still
> useful to make sure it didn't break anything.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


