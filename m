Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A65D6EFA99
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:06:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkSJ-0007jN-Br; Wed, 26 Apr 2023 15:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prkS7-0007ih-Pe
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prkS6-0002AV-5q
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682535914;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TOQ4HIIbaP9qZG9ev4xc6n2eqFMzdI+rLh9TueJWTf0=;
 b=hwUdDyIm5CfC44tcceyPN2TL8a9GrqgWJMDpeuaDskpWNMpHvJyQ2CVHyp1C3v4EiD+vPO
 dTmIW8bGEJFrIAJUmaUGcW1P+NjdfnN/AuOR+Sn0v/buagmOuIX+eiMn0dzmtpHrNWoRpl
 G1JLOeW64fLeET5GLKkgxTtCLgiV56s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-LWCJYbrGPOmc-Ly2NVhqwg-1; Wed, 26 Apr 2023 15:05:12 -0400
X-MC-Unique: LWCJYbrGPOmc-Ly2NVhqwg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f173bd0fc9so42137875e9.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 12:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682535911; x=1685127911;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TOQ4HIIbaP9qZG9ev4xc6n2eqFMzdI+rLh9TueJWTf0=;
 b=XyNQIFodC7T/He5mhfmiUgSIqhS4Mkwcv7cdfYe9X9RICTbOwzH/lmEU9nLy8k7s7P
 7yy/QZg3uHQ+9QUyyBMqLJrfsEAVHYGvZcn/4MU38ExXFBroPjIpoEbZWfQnjQDuXlRQ
 jKziGFHoTytBfCTgQdDPor8h6Fu8WKPy272h0ZDIfiDMdNTKKbT9NerOhhgNZM+W2BlM
 tAel7xaCCWzRgPN0HBvncYs0GfjHOIWdYgLynCxhTepwxODzv2SBvw9ZoqxIVeTF2UGN
 h7J9EAILm3MfP3+XNgV2rlFB2Fy3aS1/K82D8qF6mhJkQhVfVlqrOPKJIDGmHQw7ZZV7
 NgGQ==
X-Gm-Message-State: AC+VfDyc8716Cd8qn5rxM7rdsls/QSTQDqJFcV621dAoka+DuLyjHx5T
 LEJElVKtzA55wpLnERDDqOffQ3K11tUlmIme3bG17amW7oA5VIP++vJxZdpFsFrwRAY1pktIaX0
 IhIVav5KZ5to7Lho=
X-Received: by 2002:a1c:f613:0:b0:3f2:5a60:d626 with SMTP id
 w19-20020a1cf613000000b003f25a60d626mr4504565wmc.28.1682535911618; 
 Wed, 26 Apr 2023 12:05:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Of//BxbPHKU9ydPRyhUWANBDg9mhCWof2RWHb7B8JivkN3eZdzbJI9VZ3E140okU0eDU2wA==
X-Received: by 2002:a1c:f613:0:b0:3f2:5a60:d626 with SMTP id
 w19-20020a1cf613000000b003f25a60d626mr4504545wmc.28.1682535911319; 
 Wed, 26 Apr 2023 12:05:11 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 n12-20020a7bc5cc000000b003f17329f7f2sm18833968wmk.38.2023.04.26.12.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 12:05:10 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org,  Peter Xu <peterx@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 06/13] migration: Move
 migrate_set_block_incremental() to options.c
In-Reply-To: <9fb82b27-c438-3e37-15b7-2885bdc69a61@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 26 Apr 2023 21:45:46 +0300")
References: <20230424183236.74561-1-quintela@redhat.com>
 <20230424183236.74561-7-quintela@redhat.com>
 <9fb82b27-c438-3e37-15b7-2885bdc69a61@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 21:05:09 +0200
Message-ID: <87h6t2ea6y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 24.04.23 21:32, Juan Quintela wrote:
>> Once there, make it more regular and remove th eneed for
>
> some type here
Thanks, fixed.


>
>> MigrationState parameter.
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


