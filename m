Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F66680567
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:07:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMNt-0004nS-Q4; Mon, 30 Jan 2023 00:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMNh-0004mi-9Q
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:07:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMNe-0000oE-Jh
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675055218;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/vmNaZd/guvcqld0T3snaGJ+Z6R6l5wgDHrw1Cq7rHQ=;
 b=KXXx3gHruYb+SVPRlsN80n7cw0OvgzwBfnC0mx4c5WOnHMiZKy+QGkzVLZfFshCVTF0b5G
 pxht6A6UXmUOgXTyq0sLD0cPbRBn3Azs0d8jRhQyhfDjq0l30j78eqkmP4jt0v+AiK3wH2
 gyx64Ox8ATJSZY0IjLFVTVvJ88ajuQM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-RLJTlU5PM1CqmumhIWRwlA-1; Mon, 30 Jan 2023 00:06:56 -0500
X-MC-Unique: RLJTlU5PM1CqmumhIWRwlA-1
Received: by mail-wm1-f71.google.com with SMTP id
 iv6-20020a05600c548600b003dc4b8ee42fso2978778wmb.1
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/vmNaZd/guvcqld0T3snaGJ+Z6R6l5wgDHrw1Cq7rHQ=;
 b=qSdfVKRRU5MAJmIqH2ywGZkj8T9qoDGmgH2E4j/eDbWPJRSahf8CQdcrreDMWI4N7L
 jLgGdcxmADCmUyGWN4JuDmgouYCK2Qk6LSrQABZD3Q1TadqewC3/SjtMmrM1V20uJ2/P
 0qRISaRi3pA9TXrc4lEGzikn5EsrselFQAd1Q3Cl9J7wP29GJJW1h6tS/9DVHhU54oLu
 zEFieTYRVYWsccaDFFKBUWLR/xdoaxlXhNWsDTx3wjUMC13nNptvb96ytdf04Soce3JX
 L0WbZoG4NpYNKVck8YibtlS6oUZ/aJpD4ghyoWEreuyKmNXrR3e7YHwWhxPJeT3kjGbT
 JIcA==
X-Gm-Message-State: AFqh2kqbki7+WLaJJwclVF/OqOO8vYqpII4fzQg+sY14xkU2f6c38jOc
 mZdRwAbnrmpYd0L26tgJDYtHnKFuIYQjuWLD2UhImO3nL/G/Kl+Ci5CR56M0jdmMcMCKv9BAJSJ
 63W+e/2C0Wv0Zuws=
X-Received: by 2002:adf:e9d2:0:b0:242:800:9a7f with SMTP id
 l18-20020adfe9d2000000b0024208009a7fmr42160971wrn.65.1675055215329; 
 Sun, 29 Jan 2023 21:06:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtpsODJELMI1XRNRD0C3JR7W5MUE4YvQiqdp7KI0qEZrwZGHbPsS3rZkDwdZS0eRAt/krP5Dg==
X-Received: by 2002:adf:e9d2:0:b0:242:800:9a7f with SMTP id
 l18-20020adfe9d2000000b0024208009a7fmr42160961wrn.65.1675055215095; 
 Sun, 29 Jan 2023 21:06:55 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 r7-20020a5d52c7000000b002bdf5832843sm10630112wrv.66.2023.01.29.21.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:06:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 09/21] ramblock: Add RAM_READONLY
In-Reply-To: <20230117220914.2062125-10-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:02 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-10-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:06:53 +0100
Message-ID: <874js8k3v6.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
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

Peter Xu <peterx@redhat.com> wrote:
> This allows us to have RAM_READONLY to be set in ram_flags to show that
> this ramblock can only be read not write.
>
> We used to pass in readonly boolean along the way for allocating the
> ramblock, now let it be together with the rest ramblock flags.
>
> The main purpose of this patch is not for clean up though, it's for caching
> mapping information of each ramblock so when we want to mmap() it again for
> whatever reason we can have all the information on hand.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


