Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F26FDA1A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:55:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfbT-0002J4-CM; Wed, 10 May 2023 04:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfbO-0002Fm-0a
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfbL-0004bH-Le
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683708909;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vTAj7Zb1HpMi+IZiuMX+JvUF6rbzf/cjkK55IM6WMFk=;
 b=HRZXJxGH9TdvC4E0eM2olxZwwk4rsrdmNt0RnbcY6IvpKx7yqfmd9JD6xVVkNw8/iTOGEJ
 7UEWe6BWg2i1VoJxEw7WoK1DKihSbJQ3d5Sd3/U1ATnHJymAhu4/1K6H/dBjIkQrMVduTA
 SnWGIhRwEx/r1grBSXFQsUuDbFvBibA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-5q9OBbBgOg2mjoPoVXR94g-1; Wed, 10 May 2023 04:55:08 -0400
X-MC-Unique: 5q9OBbBgOg2mjoPoVXR94g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f33f8ffa05so42658805e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708907; x=1686300907;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vTAj7Zb1HpMi+IZiuMX+JvUF6rbzf/cjkK55IM6WMFk=;
 b=MO5skkUrtyBVnDhzeMcZ/W1e2TvCySreoVor7bB0O/xlO5MOyY2qiG1OkogoEWHtPY
 pWkg0jbSw/gWgWGBVseABt6alL0ahhQxvR+luLGKdEHFigaHm6cZtuv1zttAZnImhshW
 KPjNJZOdyEipcxKQUe6Nt1vVTkwCmahM+xu64XFHt1AzhhzVF5fztT+vB1GgLvTzAtQJ
 XCwSTeb/GHQweBk6CKIQ9sr0NJNbk/OFFlLlwBHUheZlZVqyEAoSmUHpidY+nzHecF5Q
 VAEsc3KtMCBm2oVWW+MUWm7hrxMmQKycbjDJLQzJnzEcmTN10fnpxxoekknum9050jNF
 utqw==
X-Gm-Message-State: AC+VfDwAeab799M7cX+DR5xHtNue2L3VRDHeIF1vI5I4ZmAagxEbvPLg
 Pt8HFVH0Iyu9tGJ9TOubK5IDpX0RUW3tLaspGXYFoor3Lh8C57pZdcDK84ESM0Yj9z5cbOkYz6Y
 W7FQ6ljDxpj4jHhs=
X-Received: by 2002:a05:600c:2047:b0:3f4:2452:9675 with SMTP id
 p7-20020a05600c204700b003f424529675mr6999331wmg.0.1683708906967; 
 Wed, 10 May 2023 01:55:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45EJBCBLqu7D7vvA8NbasRF5f0pSBaQ/cafdscnP+JdWeHyJLAUSkmqbLWLAZcgRKanUlIdQ==
X-Received: by 2002:a05:600c:2047:b0:3f4:2452:9675 with SMTP id
 p7-20020a05600c204700b003f424529675mr6999312wmg.0.1683708906641; 
 Wed, 10 May 2023 01:55:06 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 c15-20020a05600c0acf00b003f427687ba7sm7249073wmr.41.2023.05.10.01.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:55:06 -0700 (PDT)
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
Subject: Re: [PATCH 4/8] migration: Enable precopy initial data capability
In-Reply-To: <20230501140141.11743-5-avihaih@nvidia.com> (Avihai Horon's
 message of "Mon, 1 May 2023 17:01:37 +0300")
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-5-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 10:55:05 +0200
Message-ID: <878rdwa7me.fsf@secure.mitica>
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
> Now that precopy initial data logic has been implemented, enable the
> capability.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

For when the time comes O:-)


