Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18AB69CA7C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 13:08:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4x4-0001BG-JI; Mon, 20 Feb 2023 07:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pU4wr-00018K-9Q
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 07:07:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pU4wn-0000PE-6D
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 07:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676894828;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7hHDUHUo1DIIqOL31Pwi+JqOpARTiROAqzPnGVXKSrI=;
 b=QIa82HeFijB3/dLwQM8v2z1xUEPicCJpJWWSdZ+eJvcep+PxdhDMPN+5fTEvMchbLMNPok
 Tb9Tci1cCMTSM5H78LJd5abYyb+PP84myCSe/vohvxCCTmT07V0Phd4uH/yVvasHxUv2BG
 JJ+70C/2Z3as6KWs41aVusO6CrIJFb4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-p1gdy4hgOO2GmjrheZCejQ-1; Mon, 20 Feb 2023 07:07:06 -0500
X-MC-Unique: p1gdy4hgOO2GmjrheZCejQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i11-20020a5d584b000000b002c5400f5c76so211352wrf.14
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 04:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7hHDUHUo1DIIqOL31Pwi+JqOpARTiROAqzPnGVXKSrI=;
 b=Sp+gEyEN2axUH17Wzvq045/Dbh7zQtVQUZU/7U7fNSjpyIh1do27LqRNNRKzHOQrZt
 JbaFxep8TYaO1IMgmIb5a4Dw4rYB8gvgNc9ZZJ0k4FXXXl27rU4JCk4E6imEHiDWheou
 feCiTRjHPW4iWXNWYLLa0qJguYTqKq4FgNezX5EZsFiDA70QV7G7AqLZCmBLMrc2cAAj
 J4KmgK4DRNuX1oc0FlzWexcznT5kvLm1JeC6jYbyg/BmjDhRYppW79xN9/s1eLAhlA8Y
 NYxZXvV5MwLSORLUTP5jty9FWTX5P8IPun7OEOQbIN6lDg4Mi7HUZ2wfKIyc2ORwImY1
 DArg==
X-Gm-Message-State: AO0yUKU32uI2lu5WQt91y3D9IRzgKEYxXo9+ziimdm2uCaw2V7liHeAs
 v0iTYFToGLwTPzWNwFWZKgxIEvvQfUXs+jDX7bbZb3R1DnlqvBWaRmE7Fz9LzwMjVteFMtJA9DM
 Ho0YlmAvoYd2h9CE=
X-Received: by 2002:a5d:58c1:0:b0:2c5:52ef:3ff8 with SMTP id
 o1-20020a5d58c1000000b002c552ef3ff8mr1579815wrf.31.1676894825509; 
 Mon, 20 Feb 2023 04:07:05 -0800 (PST)
X-Google-Smtp-Source: AK7set9KaIus/XV1OeJ4N4g9u+kFMqh1BH8IQsnYSws2KxC9z5lft4jb31YWXUCPBInl0GA9VczMYg==
X-Received: by 2002:a5d:58c1:0:b0:2c5:52ef:3ff8 with SMTP id
 o1-20020a5d58c1000000b002c552ef3ff8mr1579792wrf.31.1676894825233; 
 Mon, 20 Feb 2023 04:07:05 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o27-20020a05600c511b00b003e21dcccf9fsm683226wms.16.2023.02.20.04.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 04:07:02 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  pbonzini@redhat.com,
 peterx@redhat.com,  david@redhat.com,  philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
In-Reply-To: <fe9a4f13-5bca-f386-1eb5-d1a02a487c40@bytedance.com> (Chuang Xu's
 message of "Mon, 20 Feb 2023 17:53:06 +0800")
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <877cwizqvy.fsf@secure.mitica>
 <fe9a4f13-5bca-f386-1eb5-d1a02a487c40@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 20 Feb 2023 13:07:01 +0100
Message-ID: <87wn4czgka.fsf@secure.mitica>
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

Chuang Xu <xuchuangxclwt@bytedance.com> wrote:
> Hi, Juan

>> 	--target-list=x86_64-softmmu

Compile withouth this line, that will compile all system emulators.
If you pass "make check" there, I would think that you have done your
part.

Thanks, Juan.


