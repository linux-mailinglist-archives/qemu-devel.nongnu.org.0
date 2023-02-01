Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AE4686971
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:01:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEbO-0004fi-I7; Wed, 01 Feb 2023 10:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEbG-0004cx-TT
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:00:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEbE-0001Mr-MR
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:00:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675263634;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2LmGql4t+OMleANUU8l7uD3UhdMAiTyTsOXZ13Cls7Q=;
 b=IQ7p5jLaf3NKOGN6XNfWvUgHIkoONFzufppwOwITffE5Hd/NKJ/Exnpo3Xb1W7KI+MJnZj
 Tc9+DdcRcIJrbio9aEEZN7k+qV16yCXEVEkZliMi072b1oM62eUUzHMDtPLczOPK2pfplH
 YpETzIANxRN8KBS/N8inxuOfcpJtBzI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32-69CG6rgUNl6vJdrqRiCk7A-1; Wed, 01 Feb 2023 10:00:32 -0500
X-MC-Unique: 69CG6rgUNl6vJdrqRiCk7A-1
Received: by mail-wr1-f69.google.com with SMTP id
 o24-20020a5d58d8000000b002bfe173775aso1959462wrf.3
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 07:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2LmGql4t+OMleANUU8l7uD3UhdMAiTyTsOXZ13Cls7Q=;
 b=azRUoMI8LxLadRtEGkCPv4Rsj8J50v3wyAaISD16f76eFVMGQ3gHhQsUMteen4EYNf
 /ytVOq421e1c2UzNaINGRMrfRFAPqGXHt9BekOXJNFY3KEA8NfWpxwaIex06URK4JUMz
 SwRRs2ZCXYkfWxSv+p5Qco/OCKX0FOVZMXIxw+QG+VnZtW9bV83zy4s9pYQG4LehGCDC
 Ky/gUG1gAEOflQl/T0SQ0VyX4ViNsWPwIScUN/2O9I+dR9LxEbcsN700sKY9csHULxIr
 cSGqXPl72OZsQ0aWzYbPMJM5ycZO81TrtH/jIQmrBrNwfk4XQBoINMB0B4jYg3qqgmCp
 6Iug==
X-Gm-Message-State: AO0yUKW4gDeCpyRXpVTtIY1XMbaoDmDENAPmOfnogpYrj79NNYaZZnbY
 rXnVVDnKGwcHYDq4vYaYQeEs+wDOpHoL8q04WUgRKFDPW8DYNC4RKn+Ee/RUhNB5BSO5KRDvvvb
 k0kZKsIlMfcj+5zA=
X-Received: by 2002:a05:600c:4688:b0:3dc:438a:c381 with SMTP id
 p8-20020a05600c468800b003dc438ac381mr2528516wmo.28.1675263631717; 
 Wed, 01 Feb 2023 07:00:31 -0800 (PST)
X-Google-Smtp-Source: AK7set8iLrVL2eh5glUmUAyu/2FNO0djwoW6Hhl3YBZLDivZcWMnRwTenlpWVy9TivwfXf7iWbAaQQ==
X-Received: by 2002:a05:600c:4688:b0:3dc:438a:c381 with SMTP id
 p8-20020a05600c468800b003dc438ac381mr2528497wmo.28.1675263631501; 
 Wed, 01 Feb 2023 07:00:31 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 t1-20020adfe441000000b002bfd524255esm14717791wrm.43.2023.02.01.07.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 07:00:30 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  lsoaresp@redhat.com
Subject: Re: [PATCH v6 0/2] check magic value for deciding the mapping of
 channels
In-Reply-To: <f1f1cd0f-a887-57f9-5762-7f7e638941eb@nutanix.com> (manish
 mishra's message of "Wed, 4 Jan 2023 16:22:10 +0530")
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
 <f1f1cd0f-a887-57f9-5762-7f7e638941eb@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 16:00:30 +0100
Message-ID: <87tu05zb01.fsf@secure.mitica>
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

"manish.mishra" <manish.mishra@nutanix.com> wrote:
> Hi Everyone,
>
> I was just checking if it was not missed in holidays and was received. :)

Queued.

Sorry for the delay.


