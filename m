Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D129D697CA5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:03:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHQv-00046H-ES; Wed, 15 Feb 2023 08:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSHQt-000411-1x
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:02:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSHQr-0004R6-8V
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676466164;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oURddhw7lVnafwXGArxFiQLMkItZNQ4itS6mTwfP+sQ=;
 b=MS9Lyt4UYuESmON7KgltrTVdF64/VRvz9gQYhIunGpB53WHKIhb/nX+A/UWmxo/o3WZrjS
 vmhOthk5DHDk8vclgmvrTA5HkfRzS68bQOYCHHNQWAXHoB9BVAFkfZwszFxrRADuDkpi79
 4nmXpZzd7dlsm3+8D7tQAYDSVYfsysI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-Z4oeBeq0MSapTQ-TD6kUIw-1; Wed, 15 Feb 2023 08:02:43 -0500
X-MC-Unique: Z4oeBeq0MSapTQ-TD6kUIw-1
Received: by mail-ed1-f69.google.com with SMTP id
 v8-20020a056402348800b004ad062fee5eso1158451edc.17
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oURddhw7lVnafwXGArxFiQLMkItZNQ4itS6mTwfP+sQ=;
 b=xRj6lMB8kQIAi+7HbNHct8O/hYF5AkNKO/VTfPDWVQahtYtRtSuaOEAoW0G3XbKwuy
 +yRAXOf3vzu6VsG1VAj5bt3PTB0+aXW2K1JiKLPuddpPGMeDXzvwij3Igv4ujd0hJm3i
 +gcqGK8GbszpYIvDzG7Rzh9qj/qhz5O9M3uOD0VZrzjRyHA/0N7cdZe5HSKVbsDuso07
 fxRzyii+bFBVGnS1lVXR5hLrZKB+mJZ1dOKNrNz5MP89E5SlLCaObSc1aw9zksAmiTeT
 6kpxmyyglzNGxMqAyxOOeKO1CkimxMZd0jSqjt7Ql6nwlTOSVjeVf39WqWYyvGJw1CiH
 lYZQ==
X-Gm-Message-State: AO0yUKVUfhncKS+a43JGIrEO8eqq/BxQ6y49e6xBb7ULLrQ/9aua2gJX
 dp+q1L2TDIVh8KgcNFxdzKCBdDKkLptodiLuJ3/2GBDNjrxvogt7VUNCSPNiCU27mI25NSb42Gu
 BzmnAt2M7I7a8/68=
X-Received: by 2002:aa7:ca55:0:b0:4ac:bce7:370e with SMTP id
 j21-20020aa7ca55000000b004acbce7370emr2086848edt.14.1676466161923; 
 Wed, 15 Feb 2023 05:02:41 -0800 (PST)
X-Google-Smtp-Source: AK7set+kPR8iUNVA9FBHtPS5hFUVqwHO2KRt8AX9YF7+rX40Ih+Mx125Mkc7jWgSGMcSstRl0vRGAA==
X-Received: by 2002:aa7:ca55:0:b0:4ac:bce7:370e with SMTP id
 j21-20020aa7ca55000000b004acbce7370emr2086820edt.14.1676466161697; 
 Wed, 15 Feb 2023 05:02:41 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 s9-20020a05600c45c900b003db06224953sm2217486wmo.41.2023.02.15.05.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:02:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,  Yishai
 Hadas <yishaih@nvidia.com>,  Jason Gunthorpe <jgg@nvidia.com>,  Maor
 Gottlieb <maorg@nvidia.com>,  Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>,  Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v10 10/12] vfio/migration: Remove VFIO migration
 protocol v1
In-Reply-To: <20230209192043.14885-11-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 9 Feb 2023 21:20:41 +0200")
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-11-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 14:02:39 +0100
Message-ID: <87lekz2ia8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Avihai Horon <avihaih@nvidia.com> wrote:
> Now that v2 protocol implementation has been added, remove the
> deprecated v1 implementation.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Yes, yes, yes O:-)


