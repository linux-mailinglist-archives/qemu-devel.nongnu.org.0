Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F9B446DA5
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 12:34:59 +0100 (CET)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjJyM-0006TR-0U
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 07:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjJx6-0005nD-PZ
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjJx3-0003bF-4T
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636198414;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RwAs16oJR9dUNJYNEOFBPsMCWWf4SuFhV6lXJbWHrqU=;
 b=VKAZzNtMfQf6+MmExLq4Jienv0PPCkoBvfKqx82ykjtMg9lCPMpF6VfyCV9M8brXE/dEoe
 BWrfBdMnpdUUtT77z8f5emHzH2yPXyVXWZbwgF74YQHWcRgLt3frAFUdq3Xj4dwo+n/boh
 TNFBEeW84nsAV06FMDV8VuSyvBlRXUw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-NhYOcrc8Np6YRzGutv_SnA-1; Sat, 06 Nov 2021 07:33:33 -0400
X-MC-Unique: NhYOcrc8Np6YRzGutv_SnA-1
Received: by mail-wm1-f70.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so4675919wmb.3
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 04:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RwAs16oJR9dUNJYNEOFBPsMCWWf4SuFhV6lXJbWHrqU=;
 b=6A57wF9blH4oulrYaT5ieP3XCeNjl+7SnYu+AtFi3ZLR7HiqKHo4Vt6XwFfxr9Sh8c
 BcBjCZe7jgmINHiH439GcaV6jH2J3eZpEDnOTEBQW6ewdXJrJ82Wp9SKb8DVFi769jOJ
 TblJFTvPJPitpEGgN9h2Sehf67a63PlC5oFJs1QrwsAhCipOBmahEBcjPnClBXbvCP7W
 bbmcSpT9QpVKrBCQVntnjI6XyfLLvbWtYWEIdAlmMVsbSfEEx7jPGMdW0f9u1YIL4s4z
 5zbYyNb6+YDQgPq2aG8V1RLFXS/HvG0+MxE4r4XS+RqjUHKYo+09XJKfzgzStXrGRzFP
 Sb+A==
X-Gm-Message-State: AOAM533QdC132DVWok+5GLbx96KeyEbFEVvwhB9S1/5nQsftDidHKaY1
 R+nCvS4bQd+W3xdD4iVEzn4RQOXnvOAcaqRCOLEyJ/aw+YxMtR3Wnj+TqVsMD20JhuM/RJz97bs
 9IdLwEDixfBxPAO0=
X-Received: by 2002:adf:fc88:: with SMTP id g8mr52721573wrr.334.1636198412072; 
 Sat, 06 Nov 2021 04:33:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE3N0ewK4rZJQHgy0XAu8ElJ7jhR9NLBArDmYFIAiu+VjIJpLr0tOn5udbDERwaHNhG4y8gA==
X-Received: by 2002:adf:fc88:: with SMTP id g8mr52721541wrr.334.1636198411845; 
 Sat, 06 Nov 2021 04:33:31 -0700 (PDT)
Received: from localhost ([178.139.230.94])
 by smtp.gmail.com with ESMTPSA id h22sm11629927wmq.14.2021.11.06.04.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 04:33:31 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH] docs: fix qemu incorrect tag
In-Reply-To: <2f6070f08d63fd2281d324c70bb5f8db3b4c803c.1636116975.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 5 Nov 2021 21:01:16 +0800")
References: <2f6070f08d63fd2281d324c70bb5f8db3b4c803c.1636116975.git.huangy81@chinatelecom.cn>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Sat, 06 Nov 2021 12:33:30 +0100
Message-ID: <87tugpfrhx.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> The last modification of the patchset may be 2 month before
> merging dirtyrate implementation, it used the wrong tag, so
> fix with 6.2.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


