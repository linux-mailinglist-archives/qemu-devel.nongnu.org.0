Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C73680524
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMM1o-0001w3-0F; Sun, 29 Jan 2023 23:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM1m-0001vU-6D
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:44:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM1k-0005cm-TR
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675053860;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtK+hwV0BgY8e1Ahpp3J834IkiCp27zR1Cs06bJUyTo=;
 b=e8crRXpXPts4iXRTiSG3vBuWeRxzyDimpWt4OtJgWEAMQx8WZ4TXxBwDLQM48DWvtQLJnu
 qxc/apJhDM17Luw6fX7m6BRsxR214QjRrUlFZH66WiBCb5v7jd/jKjTpZBxPJ41zeY8Eyk
 pis3f2G7Yl0CBvdJyQZbCov9B8Uhk1Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-I6DL37YkMQG-Y0Ks7sUnAw-1; Sun, 29 Jan 2023 23:44:18 -0500
X-MC-Unique: I6DL37YkMQG-Y0Ks7sUnAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bd21-20020a05600c1f1500b003dc5cb10dcfso328900wmb.9
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:44:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UtK+hwV0BgY8e1Ahpp3J834IkiCp27zR1Cs06bJUyTo=;
 b=HupQui/ltVoq2/9eLm2vQ7/0DN0sw3RqDnS6EYFaMY2dT1tomSo6eGyVlfDOYaDIdu
 tff+L7iazytkDGnQOnrxcSd/O0dRSUdCs0MeKQaR6fugpf9eESYIXlndTVIABvPDlB1Y
 WhqToUnNO6GVziy7dsrzMd0SL8088v3rsuvGW4F/0uFmK5BfgrlfZu+2G13virJ7cDW9
 i6LMAeWJjPDnMRIZKSX4/TR0bz9PHzPgZ8zRhsZPf2TGtXB3YvfI1jrZNZ72quwTsTAv
 W3Y9hTRtP/k5MgUHUHJg7VBjhlC94AVM7qkSobc9RdPx+OpJvQxjQGfFdzCsIloZYGgl
 4Zew==
X-Gm-Message-State: AFqh2kpaAokH5+OTfhGjtp2jHupxxcUIRpuR6pJILoaXC+mh0ceiHd7M
 6PzVKjDTbFMRSbCjVQ/Lx5TbYgy1LztkKLiLTYCRdCj+aIM4FhMvMQ/LJQvNy6G7HyoEMpORlYb
 /+i+kkud7AN8Hd4Y=
X-Received: by 2002:a05:600c:3d16:b0:3cf:8b22:76b3 with SMTP id
 bh22-20020a05600c3d1600b003cf8b2276b3mr45685488wmb.0.1675053857339; 
 Sun, 29 Jan 2023 20:44:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMTARYB45WalKYfd7laTWdzyUH9BeyuxxAi5fReUOEYXj4KPdg3wC3iyNvczqFZV9fpmhvcA==
X-Received: by 2002:a05:600c:3d16:b0:3cf:8b22:76b3 with SMTP id
 bh22-20020a05600c3d1600b003cf8b2276b3mr45685481wmb.0.1675053857169; 
 Sun, 29 Jan 2023 20:44:17 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003dc1f466a25sm15411435wmq.25.2023.01.29.20.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:44:16 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 06/11] tests/qtest/migration-test: Reduce
 'cmd_source' string scope
In-Reply-To: <20230120082341.59913-7-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:36
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-7-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:44:15 +0100
Message-ID: <87a620my1s.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I am assuming that you will pull this patches through tests tree, not
migration tree.

Otherwise, let me know.


