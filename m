Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6A7699829
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:58:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfhl-0005wA-Ki; Thu, 16 Feb 2023 09:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSfhj-0005vn-Hr
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSfhi-00066c-4m
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676559465;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTZor+S6pQknQ2Ffe4N6t1TNlg3m4mdimUFITm8PuQ8=;
 b=CMbO7ZEjb8auXzMyN13OJqAxIdm56aUcxA4rHmEPbSbEziNRlaq4ax32rcxMn5UgTevqOj
 dd/reAhR8ET8GpCrF/CMWT/DdUwithMOM0SbxG8P8SVG1yctX3R4SVQUwBRb+18hhylp0g
 qDhLSTDUJcbjUYrseMDJ7Cgr76gHcBg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-xa2apqOoPmyHRSH-0OkeTw-1; Thu, 16 Feb 2023 09:57:44 -0500
X-MC-Unique: xa2apqOoPmyHRSH-0OkeTw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l25-20020adfb119000000b002c557db0e0fso286504wra.11
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HTZor+S6pQknQ2Ffe4N6t1TNlg3m4mdimUFITm8PuQ8=;
 b=WHf2Yi3R7nG16yvjkPUxf4kla9UmKoLc3eUVeoy5Rq6vf7Su0Wj4rHbUziPEXo0EWD
 wPbGE1A847u+AYG04f1hzV37WDIkAMwhoAFgXWg8lOoe2RPHBIN1F5o4KnfzCTeGhpuS
 h9YYD9Hfh9/iDTKRoT/qk2O/d2lHyd/3KSWyfKXd+M30PmKYWJRx8wd0NYIxyGv9LbJ0
 l6PNl3LGQyax3ON0YlSuMBHVAh8J8dl898PKgo+7JyvrXqft45D+WozMzjvkoIzkKKZP
 cENLOU6fTGGhNVaPGMDDpLKd5RT7TnxK1aUVPDn0gSjuo4+HrSr+T1JYeIKTMY+3YrKy
 iijA==
X-Gm-Message-State: AO0yUKWh10ZtQsT8BEoSBAOWWTqqyhzqIhH7/1pNOZNzPmRBqD0VdnEb
 Y8xiQ0cM0su1rWzwqcQii3vJsFqWePbLGANjrEIahyWPeAb15XB5JvxuEGJn8aIzKNwE4IcLlyw
 mhBeOvu47+h5SqxA=
X-Received: by 2002:a5d:4952:0:b0:2c5:4fb2:7c75 with SMTP id
 r18-20020a5d4952000000b002c54fb27c75mr4990159wrs.66.1676559463063; 
 Thu, 16 Feb 2023 06:57:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8LMwe4aEPPr0DczXhjzR7xsuASSqyYpkmlQ85kd33XdJzqmsuWsJ8Ra0cehq46pNk45MKf9w==
X-Received: by 2002:a5d:4952:0:b0:2c5:4fb2:7c75 with SMTP id
 r18-20020a5d4952000000b002c54fb27c75mr4990134wrs.66.1676559462752; 
 Thu, 16 Feb 2023 06:57:42 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a10-20020a5d456a000000b002c56179d39esm1719390wrc.44.2023.02.16.06.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:57:42 -0800 (PST)
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
Subject: Re: [PATCH v11 11/11] docs/devel: Align VFIO migration docs to v2
 protocol
In-Reply-To: <20230216143630.25610-12-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 16 Feb 2023 16:36:30 +0200")
References: <20230216143630.25610-1-avihaih@nvidia.com>
 <20230216143630.25610-12-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 15:57:41 +0100
Message-ID: <871qmpiroa.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Avihai Horon <avihaih@nvidia.com> wrote:
> Now that VFIO migration protocol v2 has been implemented and v1 protocol
> has been removed, update the documentation according to v2 protocol.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


