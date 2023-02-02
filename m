Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E41687CAD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:51:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNY7M-0007ie-Ff; Thu, 02 Feb 2023 06:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY7J-0007iP-Hn
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:51:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY7I-0003oc-53
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675338659;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2L7tCVdzELKtXMXuEruHXdtqqLvTj/KplsaBR9uvFVE=;
 b=WOwI1kEZZ/6EvupVsqnPT07kRukSOz9QtAMYMwjfALWZWcvx0PZwAU0aiP2gEQKNMGNKso
 dDs1804BHqgpszrSqxUtnWdkw/NziVQ89xvp2zPf9OOLKXavdy+kygm9O79U3eX1Xcqnsc
 Y6IiGx0aOfe9kbugeGQLu7Xoz74V1aI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-vDv4AbABNayAkm2NOE7yCg-1; Thu, 02 Feb 2023 06:50:58 -0500
X-MC-Unique: vDv4AbABNayAkm2NOE7yCg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o31-20020a05600c511f00b003dc53da325dso2693888wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2L7tCVdzELKtXMXuEruHXdtqqLvTj/KplsaBR9uvFVE=;
 b=GuzrpfPm0+EOn6RJceA04/MCB4wpEqtvdS8qY9YPT5RBjdibAuAwYuheSuC0wTdOEy
 Cc6EDBSSO6P1xAOOntJPMxoxfS/XsHMn2NUdvxBh0E+ksTidup1+0dGFz2zkHbi09xtI
 VQKyiIinC5l7bHhbKAfSR2Myc2SG/Dbi4nTjpv98R4pW3eTpo4dmFgUm6Kn/OxGf5QbD
 PfFVaUdun8srv5dTiQETwRPeoyI2LX3AARif/kr/QF43ejg+Ro0UZ+22L0t9SG6Wrpsm
 cEM+oSIM9/51TiXntweS68NR1d/PwdCrf/siJw9LPbVkd8DjR5zUVFRNCcyUggF0vmdO
 nEiw==
X-Gm-Message-State: AO0yUKUalHrIn9oYDzfqE15eMkLs/1cOMHuv+y3rL6xEnwc/5JXDfxTv
 8N/bd2RPHAcOkrRHG7HXXMHMxs0Q/+sYTiI9rlqQyj1f7mUNwqqXB4N9nKyoghKoq7gtqAQBaBG
 Et1ry2e0iv3NpSgQ=
X-Received: by 2002:a05:600c:5011:b0:3dc:555c:dd30 with SMTP id
 n17-20020a05600c501100b003dc555cdd30mr5488587wmr.27.1675338656921; 
 Thu, 02 Feb 2023 03:50:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8OyIxpQhpWK5N0NIndAK0zRnt3I45K6Vo9Si5Via0xOgIu8YjsyhK/mha1aY7zBhZy/dUtWQ==
X-Received: by 2002:a05:600c:5011:b0:3dc:555c:dd30 with SMTP id
 n17-20020a05600c501100b003dc555cdd30mr5488584wmr.27.1675338656776; 
 Thu, 02 Feb 2023 03:50:56 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c12ca00b003dc0cb5e3f1sm4497559wmd.46.2023.02.02.03.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:50:55 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v5 4/8] migration/vmstate: Introduce
 VMSTATE_WITH_TMP_TEST() and VMSTATE_BITMAP_TEST()
In-Reply-To: <20230117112249.244096-5-david@redhat.com> (David Hildenbrand's
 message of "Tue, 17 Jan 2023 12:22:45 +0100")
References: <20230117112249.244096-1-david@redhat.com>
 <20230117112249.244096-5-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:50:55 +0100
Message-ID: <87tu04nv4w.fsf@secure.mitica>
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
> We'll make use of both next in the context of virtio-mem.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


