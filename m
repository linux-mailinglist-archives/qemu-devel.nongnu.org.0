Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E3686EB3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNIVF-00043Y-RL; Wed, 01 Feb 2023 14:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIVE-00043Q-FL
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:10:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIVA-0006SR-Mh
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675278635;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TnQKVyv5B/qfCuY0xL9Lq5/Qr0ej5vJyXfRxe0XypfM=;
 b=jKfHaBc7zAJng2sw4cHPXM8Q2mPRrlSeucBJt7LbxPbSPp0IFvyINUcvHAvyiwHuaRecCU
 edkfErbsIx7DMaOQNL7xBNhe4vEg1OPCeCtuT5HwT25hsy6jrykNr/s1UB2sx33K6R07R2
 nc3HRKmMocgtUQq9C5f44FK7806MSjI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-AmCjKcv5NwKP3pAFdvJdzQ-1; Wed, 01 Feb 2023 14:10:34 -0500
X-MC-Unique: AmCjKcv5NwKP3pAFdvJdzQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 h2-20020a1ccc02000000b003db1ded176dso1439598wmb.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:10:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TnQKVyv5B/qfCuY0xL9Lq5/Qr0ej5vJyXfRxe0XypfM=;
 b=wqreQMZLvbG38/dQlyTk4LArFrhByAdpHOw8VK+Z8E8abQToa9Nc5DqNuRo8Au/1Qw
 WaHKyiSNpOzdIBQnGZkunv8wlBlj2Q/SpBU7mJMFrzUCN6ekEVCw/qdeQULSqBqUSw7c
 i2T02YnzrvsZjGilvRJ1rO2lNrhSBQnLPshcIleP0legttFvamc6fFvvWKWsQAtJkOmk
 yRuAhpAOnVLdSccIcNyqgnF0EELhnE9hPR1Tc41YmEtx4QIC5zNr8bhUooWhck40Dscn
 O2GYSkZRYHccEiH/ukPsRzOe/HiUU/V37Zv3ql0a7whNATSWfRsLMgIrIRMc1gTbBPKW
 1Szw==
X-Gm-Message-State: AO0yUKVtXXnYKyvcOlUtVzXg+GjVjpI5wkupqsxxYUF8MMKpbLGrshOf
 dvKbEwP7ZzEjS3ydKAkUauZHFWwlRqqbpV6FHqFrF7al7uAcbccknufJ9L9in6DeWONCXZIcSzK
 xpcfJVeAmkdIdZQk=
X-Received: by 2002:a7b:cb07:0:b0:3db:25a0:ca5b with SMTP id
 u7-20020a7bcb07000000b003db25a0ca5bmr3260087wmj.37.1675278633606; 
 Wed, 01 Feb 2023 11:10:33 -0800 (PST)
X-Google-Smtp-Source: AK7set80IQeqWa/iH6VCpukMgcH3CfGDF0SMjqaq5YHgSwux2XNiTVXDsBD5aCfPpjZjOgpbs1Q2NA==
X-Received: by 2002:a7b:cb07:0:b0:3db:25a0:ca5b with SMTP id
 u7-20020a7bcb07000000b003db25a0ca5bmr3260072wmj.37.1675278633408; 
 Wed, 01 Feb 2023 11:10:33 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b003db01178b62sm3114336wmb.40.2023.02.01.11.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 11:10:31 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 19/21] migration: Add postcopy_mark_received()
In-Reply-To: <20230117220914.2062125-20-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:12 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-20-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 20:10:31 +0100
Message-ID: <87ilglw6ag.fsf@secure.mitica>
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
> We have a few maintainance work to do after we UFFDIO_[ZERO]COPY a page
> before, e.g. on requested list of pages or when measuring page latencies.
>
> Move those steps into a separate function so that it can be easily reused
> when we're going to support UFFDIO_CONTINUE.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


