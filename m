Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD48743FAD3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:35:53 +0200 (CEST)
Received: from localhost ([::1]:35152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgPEm-0002T2-EU
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgPBf-0007zB-2K
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 06:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgPBb-0004Nh-Eb
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 06:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635503554;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2cH9Xm62+dYOV7Qd24Qpdnj6K7GCfMhXHZ6/HWSf1lY=;
 b=Rd60CzU4GsECbD5ogFy1MIuGylnN4oIfu7e70R99+e59qciLWy74tyHd4jVB9KeYpt4dWT
 mpTpeZorjXbK1lJRdgj/BAqCf8yEaWA3uMU1SOjvqSBgWp+pG9WVLjIrvThAIRqd+Un2qh
 dCHHmufDNsSMwdPzxf85fpit5SW3YOg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-ZmtU0uk7MziGhvC31dWyzg-1; Fri, 29 Oct 2021 06:32:32 -0400
X-MC-Unique: ZmtU0uk7MziGhvC31dWyzg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r6-20020a1c4406000000b0033119c22fdbso599581wma.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 03:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=2cH9Xm62+dYOV7Qd24Qpdnj6K7GCfMhXHZ6/HWSf1lY=;
 b=YPprx0LI/vK+k8ngGX5KK+/2+OXfVLi/qSa9qxn/TGnq85Gl7cg5BTzUtWu56RVqd3
 uY+Q/h1A5b0oh/l3ov/zXE/X2ntrHhGKY2ac+/lXTurBizajn2ehozy8AtcoljffheXI
 tAB39t+y/cnyTo2TmtLYzmU8YJjDO2+2hY+yT6hyjIgtyWnoecTyqWiWWdS4h0E7hH34
 2w3ULaSbN9HEg82L7Guay8r0G6RijXp+T+bCDV8g+TAsVEy2smjTj5kq1X2L7bPtIvVl
 V/FhiXNKyK8HgJZXaXBhEYDIODQggTKCp1otXGfTzIBSes93eCJnD4ON9tD3jDrs8Sl/
 jKKQ==
X-Gm-Message-State: AOAM530fypgACaMJCMOfQucKVs+EW7AdXAX7qE1TOGelAuR1qxiyEPvC
 PfelTjyAlzGMxYBzk4qqRWL7BcDFklhClKWibjl8+YxxfZ9a2OhlgcdqRNzftpqGg3Jw8l5/jzv
 BhoVwEFxlnH2S+3A=
X-Received: by 2002:a05:6000:186c:: with SMTP id
 d12mr13488341wri.237.1635503551806; 
 Fri, 29 Oct 2021 03:32:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGF8lCnTRhgUguTIU+kfy0ndyWBs4RQIoKa3LMMB8nFEJNJRPNBK2iigai9MkKxgkO+Cui4g==
X-Received: by 2002:a05:6000:186c:: with SMTP id
 d12mr13488317wri.237.1635503551643; 
 Fri, 29 Oct 2021 03:32:31 -0700 (PDT)
Received: from localhost ([178.139.224.158])
 by smtp.gmail.com with ESMTPSA id f133sm2790718wmf.31.2021.10.29.03.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 03:32:31 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 4/9] qapi: Tools for sets of special feature flags in
 generated code
In-Reply-To: <20211028102520.747396-5-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 28 Oct 2021 12:25:15 +0200")
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-5-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 29 Oct 2021 12:32:30 +0200
Message-ID: <87y26ct935.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, philmd@redhat.com,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> wrote:
> New enum QapiSpecialFeature enumerates the special feature flags.
>
> New helper gen_special_features() returns code to represent a
> collection of special feature flags as a bitset.
>
> The next few commits will put them to use.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: John Snow <jsnow@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


