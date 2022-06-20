Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9203E55219E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:53:37 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Jia-00067N-GG
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JgE-0004I1-49
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JgC-0007Ap-8K
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655740267;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8Pv5cgNETIx+m3dhXS8w6qP92pk6R4FOm2V4v5NOM9w=;
 b=aQmDnPBqy+hK+ZqE7Q5fuuCsziKvpap+i702aCbbHoow5BrHF3WVJxAvZL65Ow59dMhcbk
 U7eLk2uZpdZxlFS62l/aOv+RJMrBce+bo93mNiDfIPs9GYjl1iJLzIGlmKGh0bWGEZdO2x
 d8psxYMt/WGU+WspGynNUEr51oyT+nA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-JYz-3aIMPR6n3FgpR1bIaQ-1; Mon, 20 Jun 2022 11:51:05 -0400
X-MC-Unique: JYz-3aIMPR6n3FgpR1bIaQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so5879883wmb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=8Pv5cgNETIx+m3dhXS8w6qP92pk6R4FOm2V4v5NOM9w=;
 b=S2P21qAvGTHlu/mep2uxISOfzauQs8DXPfnUJzt2F4llqo0x/PA6j2REDf++I/Bag4
 OPSQhnBayJGzTgUtGeeTL6/mGgn23NN7iBaaWQxCcERXx16udh8TOg3oyLyYBT4+p+KD
 dIB0FprACHf56Po1xr+NxziVCK42SWIHQATRlmPIX6xirEJZVe53JJmjkIx5835Vo7oo
 rAwWWeoVr/MB3yq1BYWaHMxA1HNWhxvfZ+p8q6OKOU3tisRrI3gzx9xzqQDpYOElvqhG
 jUgPcDmu8sN8Mk81iN5ocJW/nuoZcMaBEbUPnYu6RCT30GozMQR4QHZGslYnS27q+qWw
 YHQw==
X-Gm-Message-State: AJIora86pFtB/m31mn79Ew7gz1Wtsir/9cGvsBJcyyBrTMn/NNTMNKDW
 FAfAvbrPnmw7rn+7IO0ExCNFB37BUkSuKKqmfv+BnZ3YECukC6Dh9Gg3OSYRsfHfhiaAYVSDoGz
 6DY5dHBu50hxeMlI=
X-Received: by 2002:a5d:5e81:0:b0:21a:3a74:6f36 with SMTP id
 ck1-20020a5d5e81000000b0021a3a746f36mr20273503wrb.316.1655740264639; 
 Mon, 20 Jun 2022 08:51:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZCL14NbNwBc70ulaklf6GKw9fxfq7usjzL6yi3Yvt+BTDpfaxwtR/ZyDkg7gF/NlCOXACDw==
X-Received: by 2002:a5d:5e81:0:b0:21a:3a74:6f36 with SMTP id
 ck1-20020a5d5e81000000b0021a3a746f36mr20273480wrb.316.1655740264399; 
 Mon, 20 Jun 2022 08:51:04 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b0039c96b97359sm15462724wme.37.2022.06.20.08.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:51:04 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v4 4/4] migration: Change zero_copy_send from migration
 parameter to migration capability
In-Reply-To: <YrCS7OTweyxcLmzE@xz-m1.local> (Peter Xu's message of "Mon, 20
 Jun 2022 11:31:56 -0400")
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-5-leobras@redhat.com>
 <YrCS7OTweyxcLmzE@xz-m1.local>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:51:03 +0200
Message-ID: <87sfnzz63c.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> On Mon, Jun 20, 2022 at 02:39:45AM -0300, Leonardo Bras wrote:
>> When originally implemented, zero_copy_send was designed as a Migration
>> paramenter.
>> 
>> But taking into account how is that supposed to work, and how
>> the difference between a capability and a parameter, it only makes sense
>> that zero-copy-send would work better as a capability.
>> 
>> Taking into account how recently the change got merged, it was decided
>> that it's still time to make it right, and convert zero_copy_send into
>> a Migration capability.
>> 
>> Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> I assume this is a request from Libvirt? We don't have a release yet so
> yeah probably we still have time..
>
> Acked-by: Peter Xu <peterx@redhat.com>

Livirt already have a concept of migration capabilities (bools) that
lets layered products to check/discover/etc.  Putting it there instead
of one parameter makes their life much easier (i.e. more common code).

As this code hasn't been in a stable release yet, I think it is ok.

Later, Juan.


