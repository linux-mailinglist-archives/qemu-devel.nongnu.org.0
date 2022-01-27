Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE5549DD7A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:13:41 +0100 (CET)
Received: from localhost ([::1]:48374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0qb-00032z-0a
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:13:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD0oz-00024x-PK
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD0ox-0004ns-Sb
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643274719;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPZNfhF2S6ZQJBUab7tuD7y2F9gGRYrxlx3fYBPuJVY=;
 b=WG9/Uwsdn5loI2arTQwq68DK+kDn0EYU73rpoSVn7+VZtf11CP2RDZ/lrRz02eLNqtR2Ma
 T2ANsNqerbcUTx/dpjzJ+jH1JFeAaMYyba0UZhWuY3ovYUYml1gfvWR7T+vrL0zBdwZ9P8
 l26PDLlD//BFPKcHP46/kJvEP2yVQ5k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-ySPbhWQMNQmaZiooahwtMw-1; Thu, 27 Jan 2022 04:11:58 -0500
X-MC-Unique: ySPbhWQMNQmaZiooahwtMw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c1d1400b0035153bf34c3so1142746wms.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPZNfhF2S6ZQJBUab7tuD7y2F9gGRYrxlx3fYBPuJVY=;
 b=ITH+BqfazRa7rj12AqkxLEVC/eZ7KuQMz2EcKTNX7rXz+oPyAsjeSCbLxRvSKpm9BA
 mHA7wEK9U5hVThzpDJ/U3PUiukfwRbsyth6CiocIDa7pkSHefKegcx7vAvYoGe5kkAfI
 WH3QqWeUNwSYoEtGtVt0/12Y//NNarIaN8nAfAtuKRsLdVCsmJZMhGqMzGim4H21MLNS
 79XFeHjZK2EwR5GepwyRvjratOGjc11aOWjq/cDhNb6ks1yZ0R7MPcGGssMBRY0sBtS2
 ku3l7tEyVrj7ulCJSpLd3VZHfnW7JRhJiipc1ZJ/T/2LHbWKnp3IFSqxuzXhWAGY93mb
 IO+A==
X-Gm-Message-State: AOAM532nSAg8kA5rkvAwFuDe+7sHqcxwBE6E6BVwTLv6/nOtxc260pzy
 I98mPjXXbMjWZ9zc/Zy/pWC5VjI8YwLbjvcohiRDRSXaKg10KW65pUjyF9nXIVCCSGMKcyCDs/E
 7rcSkTwtErAt2r5A=
X-Received: by 2002:adf:f045:: with SMTP id t5mr2167453wro.385.1643274716994; 
 Thu, 27 Jan 2022 01:11:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQ0B3afHkviTR4EJSDKcokms2a7X+aylGEwLKJrSFTlfywKic52uffXYFwSYc3dWHDbm2LoQ==
X-Received: by 2002:adf:f045:: with SMTP id t5mr2167434wro.385.1643274716710; 
 Thu, 27 Jan 2022 01:11:56 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id u15sm1591462wrn.48.2022.01.27.01.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:11:56 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v3 1/2] migration: Introduce ram_transferred_add()
In-Reply-To: <20211221093441.1445590-2-david.edmondson@oracle.com> (David
 Edmondson's message of "Tue, 21 Dec 2021 09:34:40 +0000")
References: <20211221093441.1445590-1-david.edmondson@oracle.com>
 <20211221093441.1445590-2-david.edmondson@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 27 Jan 2022 10:11:55 +0100
Message-ID: <878rv1mtk4.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Edmondson <david.edmondson@oracle.com> wrote:
> Replace direct manipulation of ram_counters.transferred with a
> function.
>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


