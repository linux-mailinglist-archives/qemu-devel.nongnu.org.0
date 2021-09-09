Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A8F4045B0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:36:36 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mODfn-0000BN-Cf
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mODeF-0007qP-E8
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mODeA-0004Zk-Li
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631169293;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eq2isELlTwwH3DPB1tobdHy4kZMLoS2LgPkdBPMiZRY=;
 b=ig6F1/qprrYr4xPOs50w5x/Y1/aYedumiiDbJ6TQxVWRbyqjlmg1YJkIJcT4Yvyk+WPz9R
 l/cPjdxOqOb/qDbKl/s8RR8DzM7xNw5/ck4qFU2uvLD83AJKMgsyjBkm1QbPlphhFdy404
 cw75WAkfIA3nZJ4X8h71pxvOgmKdSpE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-OSv1ziS1M0OuDUYP4B5-dA-1; Thu, 09 Sep 2021 02:34:52 -0400
X-MC-Unique: OSv1ziS1M0OuDUYP4B5-dA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so433681wmj.8
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 23:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=eq2isELlTwwH3DPB1tobdHy4kZMLoS2LgPkdBPMiZRY=;
 b=zWC3iufQVe9EB/F3coVKvRvToRN5wu5LemirIg5qzn3mOFprLhAjVQjBF8wRitxya8
 Vis4mU+EVXR7esi3GMoHEMm6ViPTU6QOeeOeIYtlUk8eF1hebrcU1R2PhRF2cktGXDuE
 sN/guoZekowL28shdk4oXLfun1Woa2lUCoYX1qnUDuH43BT8jL+M9upw3ijLtO1XvxqZ
 8VaU3srswCQjahxSfe+dKBfAKLKoLgLu06vFytxR2rCiaqOyRXczCHB3GiWlrqBHmbse
 wPRu1ZsSELM8EH/D7zYk3wrmW6HjBmJ+VPIljJhs8RursJk009XHFNPOuPivG1YsynqP
 BNLQ==
X-Gm-Message-State: AOAM531/Xwam8JTRA0tMHhXoI3wSM7NKrQ3McpyvZAzYDVlq1QxD7dMi
 ziPSkdCKg/JFBRETFkJT31FQMiQfTX4syPAQzHLkNO7NJqGs+g3CoGEN/UeFLpK83GynMtCaL2u
 uF/25Wn/8NJg/bCk=
X-Received: by 2002:adf:d185:: with SMTP id v5mr1506775wrc.378.1631169291295; 
 Wed, 08 Sep 2021 23:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwos1/IRB3iQcXZit+2P/gdlB/EOK25A2hd6rOVnfE0lMn+Aq5ayGOqaAV2meHBDiu9Pa5y5Q==
X-Received: by 2002:adf:d185:: with SMTP id v5mr1506754wrc.378.1631169291121; 
 Wed, 08 Sep 2021 23:34:51 -0700 (PDT)
Received: from localhost (static-41-120-85-188.ipcom.comunitel.net.
 [188.85.120.41])
 by smtp.gmail.com with ESMTPSA id x9sm628449wmi.30.2021.09.08.23.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 23:34:50 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH for 6.1] multifd: Unconditionally unregister yank function
In-Reply-To: <20210804212632.77221bcf@gecko.fritz.box> (Lukas Straub's message
 of "Wed, 4 Aug 2021 21:26:32 +0200")
References: <20210804212632.77221bcf@gecko.fritz.box>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 09 Sep 2021 08:34:49 +0200
Message-ID: <87czpicl4m.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lukas Straub <lukasstraub2@web.de> wrote:
> Unconditionally unregister yank function in multifd_load_cleanup().
> If it is not unregistered here, it will leak and cause a crash
> in yank_unregister_instance(). Now if the ioc is still in use
> afterwards, it will only lead to qemu not being able to recover
> from a hang related to that ioc.
>
> After checking the code, i am pretty sure that ref is always 1
> when arriving here. So all this currently does is remove the
> unneeded check.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>


