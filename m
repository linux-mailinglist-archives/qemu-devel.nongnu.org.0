Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3964E6E93A7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:06:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppT2c-0004ze-My; Thu, 20 Apr 2023 08:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppT2Y-0004xl-Q2
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppT2W-00029o-71
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681992327;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=BVLi0YGYkERbJUui4v/i1u7WP1QWxTZWzE7oi1ebmHs=;
 b=V6LUgCoxYFcAck3fqs1inQJliVyVcX+QLXSkhZFtnIeTm4rIx+UN4Rarlm2zQYiNjC9yHL
 z2ODlW0pxHBkw42Ucyxe9SWEDEDspfBUmeTd0wnJC1onaZ5LIYY074aZVYeaujtgPtiZJs
 H6OndCls/w5K9a3XEBOXZqTTTTBQtDQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-uvw1qlbvMbeC6VF61KEaug-1; Thu, 20 Apr 2023 08:05:23 -0400
X-MC-Unique: uvw1qlbvMbeC6VF61KEaug-1
Received: by mail-wm1-f69.google.com with SMTP id
 w9-20020a05600c474900b003f17365b888so1206350wmo.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 05:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681992322; x=1684584322;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BVLi0YGYkERbJUui4v/i1u7WP1QWxTZWzE7oi1ebmHs=;
 b=GPVYJr2ZaeWMAP3CVNv/QVON3wWVeV6UapXUm60XirUh3o4/YiUtxO3ldMi1sbIb8r
 uLHldzqDNI9k6/Uhm7T7aDC0GR6Q02QCdhwO+lqK6Q8pWHA98Eb1JzE0b9ajt/RiRrsH
 M6tz9D9Eq9rARUrPkubXXd/aikg4XmPxAd6b2xunhp9B2m22ZHcFqBcbk9SaYuBXvc5F
 VgftzROSuu17ICDbKdoqlYytMzbUt4vC7YHdMvuA4pF88KfsvNtPE980kiJp/3wJ6TJD
 TDwKnel5PONC05Gk54iPzgyZuaQ53QfBdtGpYkOaPiuixLwsmhHj9szsn4TdCJpawEva
 nINA==
X-Gm-Message-State: AAQBX9eWJGUV0r5skPNRstT78lvcLikWQ6f87N4drPpnUhJLUslZUJru
 HdmJQlH1zjGSo28+vhdBRvLDZo4xFyHzjBrOkU6G1K2KRMKxj43OZFEZstTNU4JIjGgAyt4u7OF
 75pKeSnXwiKZQO9c=
X-Received: by 2002:a05:600c:2183:b0:3f1:82ba:b03f with SMTP id
 e3-20020a05600c218300b003f182bab03fmr1078407wme.18.1681992322397; 
 Thu, 20 Apr 2023 05:05:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350aOJgEeA4jDC+lV0j+uEYBYTjFrPfFJWuNk1fi+frFwAJMPiygkJ9XhthXx8X16+oOK3cCIqA==
X-Received: by 2002:a05:600c:2183:b0:3f1:82ba:b03f with SMTP id
 e3-20020a05600c218300b003f182bab03fmr1078388wme.18.1681992322070; 
 Thu, 20 Apr 2023 05:05:22 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 y32-20020a05600c342000b003f173956a82sm5125605wmp.21.2023.04.20.05.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 05:05:21 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] migration: move migration_global_dump() to
 migration-hmp-cmds.c
In-Reply-To: <m2edq2hzmg.fsf@oracle.com> (David Edmondson's message of "Mon,
 06 Mar 2023 11:45:43 +0000")
References: <20230302162631.10250-1-quintela@redhat.com>
 <m2edq2hzmg.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 14:05:20 +0200
Message-ID: <87mt32yd1b.fsf@secure.mitica>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

David Edmondson <david.edmondson@oracle.com> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> It is only used there, so we can make it static.
>> Once there, remove spice.h that it is not used.
>
> The removal of ui/qemu-spice.h seems like an unrelated change - should
> be a different changeset?

You are right.

Thanks.


